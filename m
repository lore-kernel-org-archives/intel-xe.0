Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460CEC79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 19:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3AE10E081;
	Mon,  7 Sep 2026 19:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXU0PXOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C22310E081
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788808913; x=1820344913;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x7NNSNdDlSHtOzZAzdlUA5OlafqkoxbU57RsORbQkU0=;
 b=JXU0PXOQ/FxpuzRmEqlAbc96Oc0Cb8TaRKN78xfGF8mEmW094AorI4qI
 E4vzvpr1B088o1cHmB2i0E1PVt4fajWcqxgQfQxj4mG7AMZk+jU0cO3ex
 8q9/vHv8Uf/DdOXmBmCIrpQbvvwed8+o6VY+UCAzMbN+ccYj+SFgkzplM
 y1nzt/xSEEc2Qb45TIOjOCZ7ors1+gS5urClIL+w6JMrfJV6j8yub0BnJ
 HvwU/srbMsqtdMOvDSdRPxA42vWvuZzAFXa98T2AyJoUi57ReA6nnpMn3
 N14MxcbNwXsnL8EEMUMQhGlskcK88bwNlu6QaBAvotzxWujse8fwKEWSR Q==;
X-CSE-ConnectionGUID: 2wSX3jbMS+6vhGEa9Bjocg==
X-CSE-MsgGUID: 9ecDZKKIR/GrmwJtMf9Nmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99545978"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99545978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:21:53 -0700
X-CSE-ConnectionGUID: YLmMIYRVRJC9WBO6PuH9Xw==
X-CSE-MsgGUID: i1ODV/OwSWezcCs1S/bgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="294256798"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:21:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:21:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:21:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:21:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1rUrMGpr+k/mwprbF/bl4ElNEdWs8UTo45zxydcS5/b3eHyYNhwhh66CEgwT9K6oPCr4ypNDq+iN+XpXENEDvAmOjKRVPuW0mk3YS0bNWq/yF0r0oM54XJPKOrtq73NtOwdgYkji0sb6OdAUTJYK1ApiZqVgw6eNs3RTIYMYXTXLklQm1IYAStPHbxfXM4gKQ9S+0vpB5HWxsMJQ3d2U4M60DTThiym22sIThrLbtAizttOpEthU6xAmbMPu9EbSwnv3RhA4dRQ5KHdvisxoqbJXaVBTfSiiiGovIROzW4frjeeiD2iOYS+tNVA2P6sTYBGDNlnl6qrz9MKQME5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVxp1SRNhXubUnRRCWoeQKmPLaOXosfVRZAQwvMICXw=;
 b=ApboDT3YfuL4ARi/B+rfrphXXtuMT0MY9pXg1pMGNrAtr3kBMN4tichXNDWyAKCMjkkeLpghzyWzlHwZJLJmG6S6Fzpb5fMzPdrP5Ae9hM7Rl8cfBWBPs+67TTeRQEPLnlKcnC1gu6PekGPds614NPzMPcbcJoM4KZ3IFciIcI8KhR9aheehIRSbx3ZNmKN9UlR9FJeez4K/GMOSQr37zFFiik/Jyw8bZUJLLCxFrht9iEDOmkBfgv0UcUT+bX0H0S05trotzLabkVyvX1ZvJzufOE7ocVtUwpAjRtN2D/YbRXyX8FKFq9KDsJzxsmsnr7brfd74YQrGkFCSXiCYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6454.namprd11.prod.outlook.com
 (2603:10b6:8:b8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:21:49 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:21:49 +0000
Message-ID: <3981a84a-dd6f-44c6-9a8e-858fb3202a99@intel.com>
Date: Tue, 8 Sep 2026 00:51:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/xe: Separate drm-ras netlink data from device
 and firmware RAS state
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-11-riana.tauro@intel.com>
 <c6b2e25b-ced3-41a7-b2a0-2029877bf351@intel.com>
Content-Language: en-US
In-Reply-To: <c6b2e25b-ced3-41a7-b2a0-2029877bf351@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0314.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 53585573-ad27-424f-5045-08df0d154386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: apXiVJvPhnPdEOJvVOJxW2/EQIoDt6lnFm/E9Zuce7R4B3IIrEst/wX/1GRLHYG0qxKlxEcNxgUw1uZNGE/KuBO00UqRCEVxZQfv0h670no3vyfozDiQDzc0vPyfejbRX/ppvaEs1X7d0/Y+5JoDynEEX2Am+xrciFPBftjicBnMnP37tPdfQX1RVS8l2OOdSVI5s9BkNeOSW7yIDHZB2GP6JUp/KzQaf7Z7i1sIMFS7FMoTCt9wnGd/qPmyCxSC3GTJgyJxQeGHO+y3aSAtK1GUYa+Og33uggGJjT57K8sIfYCGO6yrySLFiBIcEVjKTh3LDI+FdcSKTUIqanFTbuzXSm0/Lj9btr4XwwpvzBWWseElda1A4GBtduhyBQICX0K/mrWUg9NnZlwObFCJWCSMpR3zAoEwmnHHH1QWV/lZe6OA725w7HZPT5wk/aMSphA2NgYPyupkxvbwyDhu2F+YnNQQNS2NLDZfOXGkLdk9vj5JczhE0bvT9lJg0bhlm/rRAwSgK0Rqi9uKKuqO4n1PrmUxT4xEibfWR462fR/epKscoXGPbpJpLcfEWr3fa2Fo2P+XG6EwZjoOBK6xTI2XEovbldoGTwygRTaY5PkEGMcICVpL4uzbdojWXYAHg11dFeMfDj1JmRB+fjZyYdComailuiZSd9KEckLnJaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0M4dkh2MGxqaDBjYnFFVTZ3UElYT2JrQXdCaVE1WTJ0RGpwQVlHUVB5ZURr?=
 =?utf-8?B?RXRDMC85SzZzdlllWGd5QWxmeERXTEJIZ25zQzZxVFZ6NmdMMVU1YmxFUGVa?=
 =?utf-8?B?bFNQeUZDRmowaERSbmliK0RMVFY3NFJIVHFEczIvQit6dU1TaWpDUm4rdFRT?=
 =?utf-8?B?cmRJdUZxTm4ySVB1U1E2Y0FLbThmdjRiSTk1T24xb2hSWjFuMFZCd1J1R09h?=
 =?utf-8?B?SG1xN3Q2N2ZRalBTdmVHM0ZsRkFEZHNIU3JaS1BTM0xXbW1UYUZkR3AyNGsr?=
 =?utf-8?B?d0s1d1VyVnlCRjJtU3hyRGo1U0ExYWwrWkZaTUVtTkZYR2NyS1lWaHQ2aGJx?=
 =?utf-8?B?K1MrN1VEaEJ2VW1NcVRvRDdHU3VRenNKNDM2SmVaS2M5S2srcXpWcUJoK2I1?=
 =?utf-8?B?aXlCa05NUmU1N0VHVXl1SERJS2h1aWhyL1hycGNWQlBMTEhTRk54aWNaZ2dz?=
 =?utf-8?B?bTNPWWxrMllpdWwyTSs4akQzYUUvZFpPYjdDdmxibnVKMUhkSWFuVGZtbjNK?=
 =?utf-8?B?NFVaNXdhQjhSUHFrOFR5Mi80SXl3OW1ENy9OUEE2ZEpFY0hHNkhYa0c1Yk9h?=
 =?utf-8?B?UTJxWmxGV0tRQS9TeUZJa3FaQUc4aGlSUzRXUUJBeExrcjgzK3lLRFplRWNS?=
 =?utf-8?B?RVBBanJMblVuOExmaWk2Q21paFpQM1Zqc2ZhUzN5Qmhra1J5a1ZieEVTdnRX?=
 =?utf-8?B?cGY2dkxkR2N0dUlCV25jbkdIc1crK1hIeGtqRHR6RmFPTTByQVBkRUpoU1Yz?=
 =?utf-8?B?VDkxTUlra2JOQnJzNzJ5TTVLUUpJckt3QVlFM0d3Q2JjZ1VjTFhTSnFkMjFX?=
 =?utf-8?B?emtzc01YVWZ5aUpvMGdacEJVcnE4TDVVUWhBQjR1ZG9tTzRKN1JUT25meElJ?=
 =?utf-8?B?TTAzdXZHSnF3K1IrOVJINkZQN2tOU0pWR0lhaG1aWFYwd0ZRcHhqZ1Y0dWJx?=
 =?utf-8?B?cnFqYnlPeU1oOU5OMkFGNmlqOUhqMitKQjdJNjNBY0Y3dWZiRzdBdFR1RlpC?=
 =?utf-8?B?a3pBUzJmaUg2TE40VFVTVEIvY1BIWjg1ZlNaR0hlb2I0a1ZDN241SXVKcGZY?=
 =?utf-8?B?YTRteUhOWHFmbHl1ZTd5TW9sWWwxOXF6R0RnUFB4SFZJaVZYRk1raUZSTlFm?=
 =?utf-8?B?cGhRdXJGU1QyK0RXS2c3UWkvNjBLRkRUUlZlbU5tYUxjUWcxNUwxSHhVWk1W?=
 =?utf-8?B?U3o2Vzl6Ui9NYnA1Z01jOEJhZXdBa0JUbDN0UFZRczVadlVqeGVMZTNpUFZ3?=
 =?utf-8?B?cWRjREM4LytIbTY0czdRTFlIMHc2UzNRcm80UlcvYVpmMFFRVWovRzQ2eTlL?=
 =?utf-8?B?WDRkeXNSbVF6aDBBb25DS296RXVPV0VIN2hHL0pDd1ltZkJjVzh2YWVjSHZh?=
 =?utf-8?B?UmcwTUw0QUVEZWd2bDByTXZGUDY5c0YrQ3d2RXJrUmVZT1U4OS9QV1VLWEZS?=
 =?utf-8?B?QlJmRWNjMnZyaXQrb2lhWEd2SE85UnMzcldZandnWVBkUWhhTEZvS3luU3Va?=
 =?utf-8?B?ZXVvSEM3WTJ3RlFuT2Z1Z0VXY1ZYOVFXTkVPUWlzYjZicWEybk5OY1k4bHJJ?=
 =?utf-8?B?RUtjOTQ0N1d6ZW9hUnkrWWx2aXE4MU1jMnpTb1BMcWhHc0FobU43QlBaQndl?=
 =?utf-8?B?T3BFOGlZV0Z1M0FodVlWS0hhUWtWYTBRZDdxakNWUnExY3N5YVN5NUNVQVdX?=
 =?utf-8?B?T0ZySjgrbC80c21HRXhpRXFTTHhmNFlLK1ZVc2ZRd3liT3UwWHFQYWxwVkNn?=
 =?utf-8?B?WVR4OERlOXRsemNNS21YcFB4NGE3cHFVWXRKb25WcVdHamc5anRES2NnNmY3?=
 =?utf-8?B?NkhaYVNXNkc0L093RWJSMlQxTlNxSHRPQlNla0hoNDF3a3l3NHJGaWhsbEp6?=
 =?utf-8?B?UitybmF3UXlGTHk3dUxyb2FQQlMrcTQ3Sk00aG5IeFVab0hqVFg5VW1xMHNx?=
 =?utf-8?B?UWpjN0pyS2RZYzVrZ0dhcEx2aGNvc0NQelpQTE1DYlZPMXZPZUY2OFdiNmZs?=
 =?utf-8?B?UXJoM2ZlVElxZE5TSEJ2c1ZXSnZFMEMxZXFEVjA5Z3FuK1lHYmo4SEY2aDZh?=
 =?utf-8?B?MkdkajJyOVZLM25BY251dFlWM3ljZHhsUDJSY2Q3NjNucXZXK1JhZkNrNWZm?=
 =?utf-8?B?K0JGOThZU0ZaSk1pbEdKTGlic2g0QkEyLzB6K2ZZYnRpK1F4ZG5WdWZsc3Nn?=
 =?utf-8?B?ZWhQMW9nTHc0eS94TTQ0K2tuZCtrbVBNVlRTelNNdmZqM1gvbHdlZmVJQ3FD?=
 =?utf-8?B?QnNkcjBzWldLdHpGTThRZlNlOURxUnFUUDBJZjFtQXpiTkpRUnVQdnJvT01R?=
 =?utf-8?B?cm9HaWJrZXRhbHM4RFcrSDZSRktrSFFieW0ydWM5ZE1xOWpDNFlVRVJsU1c3?=
 =?utf-8?Q?pG9Et3Gt77kr+fn0=3D?=
X-Exchange-RoutingPolicyChecked: HZQ5i6Yap2YVP3Fb+L6iqFOyvj/FLUsD9SGGdBKg0xNYwoA3XUgWdEs4mEXOujszWq5TvzMOBErXbNaw3eIJ7TvKzFEDuItJWfuArCjTQNKbGv2GpzOR3BvgTjcL8FyN74g0QTjCKeAV08VPE24Tg2s3I+dLuKmZw9N4MVVHiqL2HKNtwM7HOAVJCvj+kpK3VqABnNMXltv4UEzTdafWJcUBpwfscVtXrnyirxa3FoCyL1j6b+6Lizj/ktLiii0mINtuutQhHYXvrh2DAsbO8hE5BERfUihH7jAtrV0CVkW1aYcJv0h6tXLekAQMuJks2eumBPBv+payVlXVZV2D/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53585573-ad27-424f-5045-08df0d154386
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:21:49.1547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/nRutcg7D3miwxHngvfL+f9HdeDdVTbyPko0G88XHiqT5BUX9qUHkcrLS6Hb+8BuBKzi7npfefeNGOO+AtsfCf2mLJ2eH8eiHn7K6bsVM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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



On 08-09-2026 00:34, Ghimiray, Himal Prasad wrote:
> 
> 
> On 07-09-2026 15:17, Riana Tauro wrote:
>> Keep the DRM RAS data used for netlink reporting separate from the
>> device and firmware RAS state in xe_device.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h  | 11 +++++++++--
>>   drivers/gpu/drm/xe/xe_drm_ras.c       | 16 ++++++++--------
>>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 ---
>>   drivers/gpu/drm/xe/xe_hw_error.c      |  6 +++---
>>   drivers/gpu/drm/xe/xe_ras.c           | 15 +++++++--------
>>   drivers/gpu/drm/xe/xe_ras.h           |  6 ++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h     | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  3 ++-
>>   8 files changed, 45 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index 180d450a6deb..f9dd65d94417 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -21,6 +21,7 @@
>>   #include "xe_platform_types.h"
>>   #include "xe_pmu_types.h"
>>   #include "xe_pt_types.h"
>> +#include "xe_ras_types.h"
>>   #include "xe_sriov_pf_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_sriov_vf_types.h"
>> @@ -550,8 +551,14 @@ struct xe_device {
>>       /** @pmu: performance monitoring unit */
>>       struct xe_pmu pmu;
>> -    /** @ras: RAS structure for device */
>> -    struct xe_drm_ras ras;
>> +    /** @ras: RAS (Reliability, Availability, Serviceability) 
>> structures */
>> +    struct {
>> +        /** @ras.nl_data: drm-ras netlink data */
>> +        struct xe_drm_ras nl_data;
>> +
>> +        /** @ras.state: RAS device and firmware state */
>> +        struct xe_ras_state state;
>> +    } ras;
> 
> +1 for this separation. Looks much cleaner
> 
>>       /** @i2c: I2C host controller */
>>       struct xe_i2c *i2c;
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/ 
>> xe_drm_ras.c
>> index 7f3695707611..38d77561facf 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
>>                      enum drm_xe_ras_error_severity severity,
>>                      u32 error_id, const char **name, u32 *val)
>>   {
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>       if (!info || !info[error_id].name)
>> @@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
>>                      enum drm_xe_ras_error_severity severity,
>>                      u32 error_id)
>>   {
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>       if (!info || !info[error_id].name)
>> @@ -90,7 +90,7 @@ static int query_correctable_error_threshold(struct 
>> drm_ras_node *ep, u32 error_
>>                            const char **name, u32 *threshold)
>>   {
>>       struct xe_device *xe = ep->priv;
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras- 
>> >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>       if (!info || !info[error_id].name)
>> @@ -106,7 +106,7 @@ static int 
>> query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>>   static int set_correctable_error_threshold(struct drm_ras_node *ep, 
>> u32 error_id, u32 threshold)
>>   {
>>       struct xe_device *xe = ep->priv;
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras- 
>> >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>       if (!info || !info[error_id].name)
>> @@ -142,7 +142,7 @@ static int assign_node_params(struct xe_device 
>> *xe, struct drm_ras_node *node,
>>                     const enum drm_xe_ras_error_severity severity)
>>   {
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       const char *device_name;
>>       device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>> @@ -190,7 +190,7 @@ static void cleanup_node(struct drm_device *drm, 
>> void *node)
>>   static int register_nodes(struct xe_device *xe)
>>   {
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct drm_ras_node *node;
>>       int i, ret;
>> @@ -230,7 +230,7 @@ static int register_nodes(struct xe_device *xe)
>>    */
>>   void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 
>> severity, u32 value)
>>   {
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>       struct drm_ras_node *node;
>>       int ret;
>> @@ -260,7 +260,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 
>> component, u32 severity, u32 val
>>    */
>>   int xe_drm_ras_init(struct xe_device *xe)
>>   {
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct drm_ras_node *node;
>>       int err;
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/ 
>> xe/xe_drm_ras_types.h
>> index 0be218ba2db7..8d729ad6a264 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> @@ -43,9 +43,6 @@ struct xe_drm_ras {
>>       /** @info: info array for all types of errors */
>>       struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
>> -
>> -    /** @disable_vram_page_offline: cached configfs policy, immutable 
>> after init */
>> -    bool disable_vram_page_offline;
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/ 
>> xe_hw_error.c
>> index 5f2abc9485ff..f53a6b3055de 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, 
>> const char * const *reg_info,
>>   {
>>       const char *severity_str = error_severity[severity];
>>       struct xe_device *xe = tile_to_xe(tile);
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>       const char *name;
>> @@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile 
>> *tile, const enum hardware_error
>>   {
>>       const enum drm_xe_ras_error_severity severity = 
>> hw_err_to_severity(hw_err);
>>       struct xe_device *xe = tile_to_xe(tile);
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>       struct xe_mmio *mmio = &tile->mmio;
>>       unsigned long err_stat = 0;
>> @@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile 
>> *tile, const enum hardware_er
>>       const enum drm_xe_ras_error_severity severity = 
>> hw_err_to_severity(hw_err);
>>       const char *severity_str = error_severity[severity];
>>       struct xe_device *xe = tile_to_xe(tile);
>> -    struct xe_drm_ras *ras = &xe->ras;
>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>       unsigned long flags, err_src;
>>       u32 err_bit;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 648e46df831d..b5b0c1a3a663 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -1126,19 +1126,18 @@ void xe_ras_init(struct xe_device *xe)
>>   {
>>       int ret;
>> -    /*
>> -     * TODO: Replace platform check with xe- 
>> >info.has_disable_vram_page_offline
>> -     * once the feature flag is plumbed through device info.
>> -     */
>> -    if (xe->info.platform == XE_CRESCENTISLAND)
>> -        xe->ras.disable_vram_page_offline =
>> -            xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe- 
>> >drm.dev));
>> -
>>       xe_drm_ras_init(xe);
>>       if (!xe->info.has_sysctrl)
>>           return;
> 
> I believe has_sysctrl is currently enabled only for CRI. Is it possible 
> that future platforms will support sysctrl but not VRAM page offlining? 
> If so, it would be better to have a separate device-info flag for that, 
> or at least keep a TODO here.
> 
>> +    /*
>> +     * TODO: Replace platform check with xe- 
>> >info.has_disable_vram_page_offline
>> +     * once the feature flag is plumbed through device info.
>> +     */
>> +    xe->ras.state.disable_page_offline =
>> +        xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe- 
>> >drm.dev));
>> +
>>       if (IS_ENABLED(CONFIG_PCIEAER))
>>           ras_usp_aer_init(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 0b8669f28d56..6e65443cd262 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_RAS_H_
>>   #include <linux/types.h>
>> +#include "xe_device_types.h"
> 
> No, please. Let's not bring this dependency here. Move the function 
> definition to xe_ras.c.

Seems next patch also adding xe_ras_get_max_pages as inlined. I am Ok 
with #include "xe_device_types.h".

> 
>>   #include "xe_ras_types.h"
>>   struct xe_device;
>> @@ -21,4 +22,9 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 
>> severity, u8 component, u32 th
>>   void xe_ras_init(struct xe_device *xe);
>>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device 
>> *xe);
>> +static inline bool xe_ras_get_disable_page_offline(struct xe_device *xe)
>> +{
>> +    return xe->ras.state.disable_page_offline;
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>> xe_ras_types.h
>> index 7bfd86c9d135..ca459e785add 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -414,4 +414,14 @@ struct xe_ras_set_health_response {
>>       /** @reserved1: Reserved for future use */
>>       u32 reserved1[2];
>>   } __packed;
>> +
>> +/* Device structures */
>> +
>> +/**
>> + * struct xe_ras_state - RAS device and firmware state
>> + */
>> +struct xe_ras_state {
>> +    /** @disable_page_offline: cached configfs policy, immutable 
>> after init */
>> +    bool disable_page_offline;
>> +};
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/ 
>> xe/xe_ttm_vram_mgr.c
>> index 9a514d983e90..2c4722a956a0 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -24,6 +24,7 @@
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>> +#include "xe_ras.h"
>>   #include "xe_res_cursor.h"
>>   #include "xe_ttm_stolen_mgr.h"
>>   #include "xe_ttm_vram_mgr.h"
>> @@ -933,7 +934,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device 
>> *xe, u64 addr)
>>       vram_mgr = &vr->ttm;
>>       mm = &vram_mgr->mm;
>> -    if (xe->ras.disable_vram_page_offline) {
>> +    if (xe_ras_get_disable_page_offline(xe)) {
>>           xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
>>                  addr);
>>           return -EOPNOTSUPP;
> 

