Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE2AC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 11:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A5F10E7B6;
	Mon,  7 Sep 2026 11:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYUm/wwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26C110E7B6
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788782140; x=1820318140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qc3+gG+768R7HDS+1UZtNEcf49VJgCH2uQk+NZLdlqE=;
 b=FYUm/wwTXNjPZtvf996NhU7o6+f8POqlRpH8n32WOIJnmGPAlmWFcGoz
 eWn8BPinFm9O+EUkXIouEHLUF22J7dtHQSlllhcfSrBgsNcUFxkvLpRL9
 gvrNbsoYamfgoWIkbHPwH5GKh90jDUiUtTijMsFB+f+G/cPOcTxdN00F8
 hSeMT801XbPVrwOUXw9fXY6QQOzpM2YvqO533Qh2fqIgcYRQjbHl4Ut0E
 dB+dWETFa8+uYVdnfUPoMo0zDEeXsiwc/3EjXAhGJ06KDM1ShaHjrR2ud
 SMt7pZblTeAjksYe1nRRnEMh6t8eGKk9JkA7jjRSj9QJvsxAxwb4izoDT A==;
X-CSE-ConnectionGUID: dlpxoxPdT/yBkAtmx5F09w==
X-CSE-MsgGUID: tITTmpADRq+79ezxjLVqtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99517437"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99517437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:55:39 -0700
X-CSE-ConnectionGUID: hG+bJXMuToGHC7mKI2IUuw==
X-CSE-MsgGUID: VAT61+dHSmepKnVhdRURXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="264496063"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:55:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:55:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 04:55:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:55:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWMO8LTvkFY3v82caTutjMBulLyVq5T5Eah4EXIueBTkUln9e5x5CPmteVvvFLtfWoLN1PqfBsLnUIEY7ZxL31DB2jycyRxcOCP4w5lOwmF06cUeaj1+acSJru8QAovyLUSKKWegLp8lk3/84r66W2AHWU1ef0T1GqQmPj4Kc9G0W0mXFAckEOEfPL8VH+NeqZ8jFFJ1MHZsaMP4bW7qEdmJxCikEk3KTRrn1doCiaqGeTvP4drMmzbwWnF6oDkPluHH570k/xpvDOvjYZdX5BswReA2nUgYBJcE/Js6rhdN1RJ7uywLeTs0Nfc4sGMNC/knS99mH/dNZymFn64rAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0vzV2cL+oo9qkVtc1vag97ZUIDunXh77rB5xyVzOqk=;
 b=N0kTrtFSKyUwNhnJ8b6j4sU/XHaKfuhpLHuNex4Bfihe/WxX5iVRz80hRrfNbSl6bFn2NN3tO5DfRbf0PIR8DMcFftoMHXkPrfvTHp0Q4WGNDsazeQjfAI5Y2AGdV8yiVJT5KbMIaA6CqawMFk6JTTZ9o91P4eU8gbHZl27l9yFsQTYWd4mFJ4hG1/cfVf5ghDUXsXCflbo1pM0/sfDt4re0CjDX5H9HLBsRWeaMmQlmR2Wa7h9q0znoGtzviukCeI63kUhkaQf9JYioQz2vRtO4l+Iq6g5P9VmDCO5Jmt+qoC9kryNudxVvxmeWjQi2ju+iv7Vz2f2+BTsOJEQC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15)
 by DS6PR11MB065147.namprd11.prod.outlook.com (2603:10b6:8:52a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:55:36 +0000
Received: from DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52]) by DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:55:36 +0000
Message-ID: <01acf34a-3231-45c7-b8ce-e70ead34a44d@intel.com>
Date: Mon, 7 Sep 2026 13:55:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <heikki.krogerus@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
 <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
 <5ac64235-025a-48c9-ac18-893fcfd6db6a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <5ac64235-025a-48c9-ac18-893fcfd6db6a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::16) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7530:EE_|DS6PR11MB065147:EE_
X-MS-Office365-Filtering-Correlation-Id: c4119e6d-81fa-4e03-6e8f-08df0cd6edae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ldm81h7hWBygtQNAtw9sDlX9l9Dj77+U6aCKWas81VQturcaqZAahTZdPue80Qnlf0eiBZxwunh1gW5ApCiuFVwrBGjX9TtVMro5Fn/LvGgD6ybxy156EAMyNtuvtjjU0vrodelW5YM92T60G4KvcAgcHnutyvYiaUKKkryyEKlBJi2oAAf8SDPU21JewSpMLwy+LsT6+U3tGCEeYdO1DnVpz6ElxS5h1TS+K2Wv1wsNmr+eKowh0S+BGBBPJGifkQAj9E8Zf3Cx+moDezwB7Pc2kj0j36KsevaKGSKkE4DSi/OJl8hJCD7j1C1LuPcDGdwgILe/sIrv3+7+w1MGqKz/iLRED5cbIlc7b4x3aBnTURfUPVI/oksp1LVLlFDq5XRrOWa7wZiErhMn/iJ5rt3wOATdO440w4ifH2pKD93mwzxaSBmcjR/ux4JflykkETGGjiWrazTJvA7pRR93R4TV+KpRuw17v//lEnoaDhxMmki4LrL7MIHAgwQS7f/ipWcHz3BA9ARbwriWZgtEhbxYeCT2JZTRZ3AoGulktYLuvIzXCg8rSa/f6Zqn6yIGZeuRulnKdulwrrr/fJi0/MchAS7fKDjdNrhxiJesZBkVp4aEPY7/0VOAi9sN2SApsC3yx6ALPelvbPCw81neJ0M1NgcIJRXqvmAF8t3Mapo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk9meEFoMjdzaVdZRGE5Nzd3R0NtWEthbS82T21HT09GeUdFcTZxM2wyODhE?=
 =?utf-8?B?eTV6dGl3SVNpV0N3ZVc0ZXF1SXZKclJ3eEZRNGxQNGpTamtjQlBXVWhWUGlS?=
 =?utf-8?B?OEl6NUM1OWF0SmtkL25TWWYyL1FCZ3RJcG50ZHZGN3hyUXkra0dYK3N0TUN6?=
 =?utf-8?B?WCtXd2dzZzE3M1RIZVNGTnpKNUtHYytBY05kWDFZMU81Y0hnS3h2Y2JLZW1L?=
 =?utf-8?B?R3V4RUhLMW02aG54K0dZbTUzenI2SjkvRG93RkxFZndlTWlHSjdEY0F1MEZX?=
 =?utf-8?B?ODJCbzg0dk0yY1dUaGlYM1k5dXh2RnozbDhNUFhtekF1c2wyT21PNTZGcEhh?=
 =?utf-8?B?U05WV3J2T3ZhYzVpS0NxNTlnRXo2aUExSWFGRUdpZnpjSmRRNEE5am9IUW5i?=
 =?utf-8?B?UnZ4OE85VjVFaGFpRm9UcVBRdFJNVXI4MHNtRHFDeC8vaWZwc1E5bGN5OHBy?=
 =?utf-8?B?L0FZMDJMSE9vOTVEdytmdTJ3eE5xMzRLcGtxa002SE12QmJRTmFCYkpUTXRW?=
 =?utf-8?B?aVlaWHEyNWU1TStBQno2ZTZLc0dTZ2ZpNnJwakJhRzNDUU1QWU5oZGpheWpk?=
 =?utf-8?B?N1lTb0NMQnpSVmlQT2hyMTJzUHZqTGp4aGNkUGFBbUNqSDRJa2FWNkpORFpx?=
 =?utf-8?B?b2dveFJxbUhVcWlyZk5XNTBrejJqcUNkaDMveXZHd0NLZmM5M2RxTmR2Uk15?=
 =?utf-8?B?dEU4T1lvVzlGVVFzS3ZodmhXRzRIdDhNRVJuWFFzYXVBN25nMCtJVEgvenBL?=
 =?utf-8?B?bllOZllmdkVGdmVJMXQ0d1I5VnIyYUgvaUlpUXFGU3lvS1crVE0zL0R6S1ZK?=
 =?utf-8?B?Yi83dlVYMk9vRUErWGxxeFJ2MTRqSmw2R0gyVVVOZWUvYWFLenhlaGovMWVP?=
 =?utf-8?B?RzloTHA3Um90RWtsUjN4ZVVHRjBuWmtFR3RCTmhTc0czaE5vUjNCRElJMFFR?=
 =?utf-8?B?SndlZkdUVnlmOHZkT2lvOHdKSUxBcTZvZUxVOGlPWlRDT3A1YzVzbTJ4Zk1n?=
 =?utf-8?B?R2FGbjRxM3RXbkwrbjJSdklZblhleUJydHlKeTJaMjRxaDJYMVpIOGRuNUVC?=
 =?utf-8?B?S1FRS2hLVVBqMTZVUVluWlZ1aXhTTVdSRDZKZ0pYSTJOUmZKZWlCc0lnVGhL?=
 =?utf-8?B?Yy9BRHRsVGREVXdXTlNLRmY3VnhTY0EvejMyN202VFl0aU82eU90WWFVdXNK?=
 =?utf-8?B?YlovZk9yTjJ4RXpEc1M3cFYxeTRZcWU2bXBPcWRYeXVnRlgzOVpnalBRWVJz?=
 =?utf-8?B?anNEUVFXdENCbGw4M3dwNVJ3SmVNOVVyc3lTeEVwMWkwbytDZm43TFRPWXVo?=
 =?utf-8?B?NVoxRituMko4Wk1uY0d6NXZvZS9pcklwU3VPZ3kyZkYyMG5HSGtybGYzNUxV?=
 =?utf-8?B?M0dvRWpXUVFUaGhPUWU5aVFuVGx4VGtIMG43eHdGUVlUYkNvb1o2Q2hSZERZ?=
 =?utf-8?B?NnY5SThmS0t0OUtZd280L1ZJdGJYTlhyaU82N053YVhxT0VRcGpndE11NHBU?=
 =?utf-8?B?UTJzNERxYittYnBMQ0hhZDBrKzNiRDdlT2hmYk5VVjBFU05na2hiMlJSc3Bi?=
 =?utf-8?B?UnVWcnZvTmxFZEJkTjZ4c3ZCQUl2enpGUXFwVFNhUWtLcHdMTnBHTEVPemNi?=
 =?utf-8?B?U2xyQ2d3WTNaWTFaV0ZBZGdLaW5hT3JNYmYwYlFPUEhuYloveURZMUI2V3dI?=
 =?utf-8?B?ZW1oRUVRNDIvcVZvMUdDcHB6RGhZMXEwMXk0YWdvQjE4bGErL1orVlg5TTJF?=
 =?utf-8?B?ZWlUZDB5MXZXYWREWGM2Qk1SdFkrUkxlL2pKU1lLTGg1dStyZE1LYkVBMmY5?=
 =?utf-8?B?L0hRNkllN2p1M0toT1h6QlRXK1lrYWMydVJ0YVdPNFp4R1dleU9uRUtjRUEy?=
 =?utf-8?B?TnF2M2UxejZhRkZ4V1BGQjZCYTkxWG15Q0QrOWpFZEFQNWpRV0dWU3A3VHZZ?=
 =?utf-8?B?U1VzUFVVR0VTbTlaY2lqZHdaY1U0YWFZKzlzVU9CeTUxRW1ESUM0U0pEbnM3?=
 =?utf-8?B?UnpsdUd5Z3kvK1ZMc2krZUljTmIyMlBxZHRMZkR0UFp5eDNwQ3NpamQzL1lw?=
 =?utf-8?B?S1lKa2o3S1E0WUg4Mi9ZV0RwMFJOU3hlYXRvbTVyVnp6ekUweHdIT2tZNmFa?=
 =?utf-8?B?Z2lVNTRreEduMTNRU2dCdm8rdGlHdk0zeURYcUZTUHN3Qll0K2NsSUJUckRl?=
 =?utf-8?B?WkpCUGE3eHhPSkxRZ295djUzVmFvZ1ZMRUhpV3k0QWpQZTFYNk1sUXh2Um1B?=
 =?utf-8?B?NkROdCs5TmpQK21FT2R1TG1YWGM0WkRBK3p4bmkzdjIvb0FGS3NBRWd4ZVZL?=
 =?utf-8?B?dGRFZE1oUzVZSzVERm9WcmpIUVBDNDByRDBXV0tuMnVTMFpUMHVIL1E5WmtQ?=
 =?utf-8?Q?wOBpc63xPPlXL93k=3D?=
X-Exchange-RoutingPolicyChecked: EmdwZeqv8Gxe94lFRgoMfUsomc+D9EuAxd1oSYJt7H71UEFIXvVKqbrkLJbSMa+EZ1mPHrmDzKd80LIaLLKIk32psxMdIIbE50XOB6Wi0UVRTYp6KWuToHuac1LRBqOopCFSI9hmm2resN4YqNOI66se1q8Z0n89Cb7zzT/FSyvK/f9oznwNtxtUTNUKbm9myTBDK7yFCMLRYVqgkrYObZsQMplzV7CjvItcr4WcOvuxm9M4IXN8VXOkmL37wCi+j7brA6epb/5ElYv0lEtNPcKoBmqSVnJ41yJKDrt14I68xOK3tXgCve3DzpHw/EPgp1e7vwpW0b1JtGZbtcrLyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4119e6d-81fa-4e03-6e8f-08df0cd6edae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:55:36.7559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYgukgXcFhmuDpHJEfz7QaBHVGtmx7JG0I6tvgC5mvHQHenpjks63yzKJtY84RaYZK0mFBYYoRua8o1wsVFVwt9OIbdW04n3NQf7rvpDIoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB065147
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



On 9/7/2026 11:13 AM, Nilawar, Badal wrote:
> 
> On 04-09-2026 22:07, Michal Wajdeczko wrote:
>>
>> On 9/4/2026 6:06 PM, Badal Nilawar wrote:
>>> Expose a read-only sysfs attribute, device_uuid, that reports the
>>> GPU's unique hardware identifier.
>>>
>> Bspec: 53048,53049
> Sure
>>
>>> Assisted-by: Claude:claude-opus-4.8
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>>>   drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>>>   drivers/gpu/drm/xe/xe_device.c                |  3 ++
>>>   drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
>>>   5 files changed, 54 insertions(+)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>> new file mode 100644
>>> index 000000000000..1a4bdfbad8d7
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>> @@ -0,0 +1,10 @@
>>> +What:        /sys/bus/pci/drivers/xe/.../device_uuid
>>> +Date:        September 2026
>>> +KernelVersion:    7.4
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:    RO. Unique 64-bit identifier of the device instance, read from
>>> +        the device's CRI_DEVICE_UUID register and printed as a
>> hmm, maybe in the user facing documentation we should refer to this register as
>>
>>     DEVICE_UUID(102008)
>>
>> instead of the meaningless macro name?
> I will drop "read from ..." statement.
>>
>>> +        zero-padded 16-digit hexadecimal string.
>> if this is UUID, shouldn't we print it in UUID format? see %pU
> I this is not UUID, i will rename the node as device_uid.
>>
>>> +
>>> +        This sysfs file is present only on Intel Xe platforms that
>>> +        provide a device UUID. It is available to all users.
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>>> index ef4746b7b5d3..68226fe0b659 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>>> @@ -30,6 +30,8 @@
>>>   #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
>>>   #define   TILE_COUNT                REG_GENMASK(15, 8)
>>>   +#define CRI_DEVICE_UUID                XE_REG(0x102008)
>>> +
>>>   #define GGC                    XE_REG(0x108040)
>>>   #define   GMS_MASK                REG_GENMASK(15, 8)
>>>   #define   GGMS_MASK                REG_GENMASK(7, 6)
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 8583b2e9ecf4..e8db8871990b 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
>>>       if (IS_SRIOV_VF(xe))
>>>           vf_update_device_info(xe);
>>>   +    if (xe->info.platform == XE_CRESCENTISLAND)
>>> +        xe->device_uuid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UUID);
>>> +
>>>       /*
>>>        * Check for pcode uncore_init status to confirm if the SoC
>>>        * initialization is complete. Until done, any MMIO or lmem access from
>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> index a73e0e957cb0..a4d326159dce 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> @@ -8,6 +8,7 @@
>>>   #include <linux/pci.h>
>>>   #include <linux/sysfs.h>
>>>   +#include "regs/xe_regs.h"
>>>   #include "xe_device.h"
>>>   #include "xe_device_sysfs.h"
>>>   #include "xe_mmio.h"
>>> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>>>       .attrs = auto_link_downgrade_attrs,
>>>   };
>>>   +/**
>>> + * DOC: device_uuid
>> do we need this?
>> you already described that in Documentation/ABI
> I think I will drop the Documentation/ABI and keep DOC: section.

hmm, but all other sysfs entries are defined in Documentation/ABI
(which IMO is the correct place, not a local DOC section)


>>
>>> + *
>>> + * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC.
>>> + * The value is read from the CRI_DEVICE_UUID register and can be
>>> + * read back through the ``device_uuid`` sysfs entry.
>>> + *
>>> + *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
>>> + */
>>> +
>>> +static ssize_t
>>> +device_uuid_show(struct device *dev, struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +
>>> +    return sysfs_emit(buf, "%016llx\n", xe->device_uuid);
>> %pU ?
> Not needed.
>>
>>> +}
>>> +static DEVICE_ATTR_RO(device_uuid);
>>> +
>>> +static struct attribute *device_uuid_attrs[] = {
>>> +    &dev_attr_device_uuid.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group device_uuid_attr_group = {
>>> +    .attrs = device_uuid_attrs,
>>> +};
>>> +
>>>   int xe_device_sysfs_init(struct xe_device *xe)
>>>   {
>>>       struct device *dev = xe->drm.dev;
>>> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>>               return ret;
>>>       }
>>>   +    if (xe->info.platform == XE_CRESCENTISLAND) {
>> use .is_visible instead
> 
> Will add has flag.

to be clear: my point was to move this check to the

	attribute_group.is_visible

and I don't care whether it will use .has_uid or .platform field


> 
> Thanks,
> Badal
> 
>>
>>> +        ret = devm_device_add_group(dev, &device_uuid_attr_group);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 180d450a6deb..6fdd16eac906 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -257,6 +257,9 @@ struct xe_device {
>>>           bool oob_initialized;
>>>       } wa_active;
>>>   +    /** @device_uuid: unique 64-bit identifier read from CRI_DEVICE_UUID */
>>> +    u64 device_uuid;
>>> +
>>>       /** @survivability: survivability information for device */
>>>       struct xe_survivability survivability;
>>>   

