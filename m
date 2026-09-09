Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01E4C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24D710E553;
	Wed,  9 Sep 2026 13:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSqCLA2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D2410F151
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788958870; x=1820494870;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xSBPT4EMR+LxmmV4uI0QsUTeru3vyz0h8r0TXUDdckY=;
 b=PSqCLA2BxvRnYL9iRFlxUSWZRsKDNvOQLybpNhysBdIZzImtdWpCf0K8
 UfC2XrvygtyTjigX9PwJLrWzjev2xonOLgC2hfq+3LllrEW+LjBKwoEb0
 Fz8ltjUbKZ0+32xRuCEGuwPONrFQV+O+TSDtzfxMNb/CFQglmWoM1ocV7
 10krs5ayoZE2ModWJ8D7XdZwUBcmDkefpGCGAgrXLpFosO16eMi2kSWJd
 jffKSUsTEigPES4LU7pH3WwR7BXHVuh0H3YP6DnfeoQmqsjMCSZke6X+M
 nZFcBh5orv5qiK4GGxGRtqmIjvhT6qGYbLqq0diszNPXqM2vBWr6ldYb4 A==;
X-CSE-ConnectionGUID: /Mpt1CqZR92Fqh1eZCrVvQ==
X-CSE-MsgGUID: hqyljHKJRT2bIGKFo3ZU+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89144366"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89144366"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 06:01:10 -0700
X-CSE-ConnectionGUID: QIGjDashRQKSX6nCwDtreg==
X-CSE-MsgGUID: YKxFKn8yRHeRw0l56i/cSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273286047"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 06:01:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 06:01:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 06:01:08 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 06:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbxAWzFTaMHHKHmhJATFfT8w3++yzZCzPRUcB8tQBVZuFa8NkcFnG2NRgW0U73ldI7Lt2jceN3BEczHeEr0nyilHmbVC3G9kTJ2OOrush7zzeBERUWgO34YiIlBS2CFswrcBzIoeRr4APplxEhp9mTJnrIfBqUK1AFsHmfyTB6d50P8gO/BeC2YGVm4b4bGYlhizaZM8q+izi7/anDR0Vsg3RkKwHDDuUiIEQQBNkQAP1gnaJ29A7Sg5MLBHXGEDgMtRsTNV3g8i6Q4a5ZN1QakSepSqqqYPIZD+MV5w8wuBUxI9mCYENzEHBMtTOvyCevKwcEv9rKYfLPULKMiGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIdDwy+DDPiep/egtRsNyo2nknAu7DQyXfNNJvZxEtk=;
 b=nudQ+GO6j8hEo9RNxOOH2dWnb5J2SvfURA1wceIdZTUI5RLx8YPwaEvK1UFnRhA7KJdS92UB1ytRd0Jki+D5nJ5Cg0LdBDdJpnJ3BYgHSVcou1vupcokb8m5H25M7elAC0m5kzW5k1WgVuSvcOrilmOpjDskLpT71Dfm8OQUdatU9dG4+UvlXTsNIs/PFZ4WoH+x3v41aD9DwpBfw/hWLCbkAoJtGxJ/ujFcQa2dVjUKst+eK0z10nY9abm0dWvNmSWUS9VxiVX19MR+lSgAs9FFx9p0VrMhk++8AhIyJ5djVGVXrNSNTpXHgZOkPFv5cU56x31rmFPNoxMbxjNPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SN4PR11MB9942.namprd11.prod.outlook.com (2603:10b6:806:4ff::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:01:06 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 13:01:06 +0000
Message-ID: <1ee53911-e0e1-4957-b575-f94000af6250@intel.com>
Date: Wed, 9 Sep 2026 15:01:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/xe/log: Relax location ID recognition
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-7-michal.wajdeczko@intel.com>
 <f0f7e21a-6d90-498c-92bc-e8227a393d8d@intel.com>
 <37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com>
 <e54e1f08-a16d-4acf-82bc-8b73ccc794ea@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <e54e1f08-a16d-4acf-82bc-8b73ccc794ea@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0185.eurprd05.prod.outlook.com
 (2603:10a6:20b:495::7) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SN4PR11MB9942:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d1cd35-17a7-4dc1-19ca-08df0e726951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|11063799006|56012099006|3023799007|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KZR9jNiKZBvXqBQqbbu7WvNybpM+VqTKFKZSd8Q+R1/jFWOq4hBI9nb7S6PS+WvEjI3lN2IrLVtR0Z96Q2ImidDRxAszc7J+vifYYqrXDP+97n2M6pMzH7q+nNuvIu/YtTA60RgZ9P/6M7GKd7PSmZRh3vuJ27rmjvNQvJdmQLIPr1rO6uSTzFw1iMrlovHqXmJnfUgceXeESmC8kfgcGkyikfziBkh6b872BZC5218S3NFRgrQNr8lIGx8rVK/Hlqt33ROQdwanzIoqdsrHsbuBayiK0itISpEX0mfgyb6uHPE/ZZ4nR39tTNeymt6Gu16t5QprU20e0rycnJjqNAtTdQFSZJE4NL/5y7m/aCyzhAsBfs1GE5nmSrjFd5KLrLDGhtZ4KEpaJC6JaCqIxfejrdNkSgMyRRORVyiMpw0+/sYLeWF/wjeyRTttyk/ExyqbAJguJIFZPnQSzOm59CpYV3aBwbITGayEEtQCT3iQQaGBesnKwNVT3v60ulc9I0r2+Ed+jHk0bnZRyIKCf/iO3IRd4A3yr5pStkT63QvjiE4yXOcVVxhz6hH60Og3CPWyQzc+40wI6UmBi0ub47NrPItKmP4/oeRNIvi0cNKrmzgZxnqzQoCUHucq39JD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0hpbldZQVkyL3dmUUlPcDFEQ0R6bEZsSzg3Z1M2MDR6eEpLZzZOMmludzF4?=
 =?utf-8?B?cU5vcWVjME9aV21lc1NsRDJuVDl3R0FLdlRNUlM3K2tOUmdRQ1Qxcis3c1hB?=
 =?utf-8?B?c2RJTkJzcDJYemdpa3pIRHViVUZDbjIzNStUV2ZCZTZySEJQNnlJa0pYdlNl?=
 =?utf-8?B?V2x5eHdNYURyTGRVN3VqTFYzNnZscDFpanZmUW1kMzdBMkRVZERzcEVvMTJ3?=
 =?utf-8?B?NWJpMXFMUkd2SlJQQ3VIaHNJVENVVjFCa2prdWZMN0MvVEhEamtSaHdpRXQr?=
 =?utf-8?B?U1lpWEVjQ2RQZEVKT3llQzlXTUUyYVRXZ2ZBVDlFQkgxb01nY0UwekpxYnhS?=
 =?utf-8?B?cFE5WGtSVEhQTzUyS3dCL3pBZXMxSkNFWjB3NENXeVViVWRqTUVOZmR2Yi9u?=
 =?utf-8?B?S0htZU5hd3FMWS82ODhWMEMwYUFLbFJia2tlY0FoVktCNUIyWVpoWGhUZ040?=
 =?utf-8?B?WFJkNE9kQjJkUXpheWJYMXRXYklDd0d2RWpobkRvNm4rdXk5SGZiZndEOURS?=
 =?utf-8?B?Vlk1M1FuV0VqTy9qUEFlVnEzbTgxRGJnZlVPdGZkazErZUFTTFg1VkhaWFBG?=
 =?utf-8?B?VmkzTjUxNDY1MjNlR05mQ3M5bHlVSFhIc05pREFocjkrdmtPWWdEMktLS1U5?=
 =?utf-8?B?WldWNXNMMWgwV3VOTDlMWWtpSlJZWDFxdjY3azlxZWtSK01vUWFhVWF4c0Ju?=
 =?utf-8?B?UkhvbzJvQlN0aDRGclUvU0xncjNCWkx4V2UyOEMwM2tpVFpnOUJVcUZFd2k5?=
 =?utf-8?B?OWdjUGVNNFdORzE1ZUN3SklsaGI4MytTUlArY1IvWmRXTnhQV01DV3k5L0Zw?=
 =?utf-8?B?Q0ZLdTBHeTJOOGpaa0hCRDVwdnZtT0NMejR6d1UrQ2h1QzlJaVp0bFBpQ0c3?=
 =?utf-8?B?K0g3cUxlK2ZTVkVMY1F6dHMzWnp4WmlJQjJCSDlPbm1JR013Zk5qNUxRQi9Y?=
 =?utf-8?B?eHMxTmxUbnVPUC9RVzFCTlJqTUk5WWhXeXJTa2t2V2lpRGlnV0FiN3hmdk14?=
 =?utf-8?B?SEVGZUpEbUNNV3FFbXlHL1BGVFM1eVRRYThmVlVFdzJHQTBqT2VMM2VaanBL?=
 =?utf-8?B?V0ovNmpBeGxxU0x5NXNUbnhMdjduQWk5cFNzckhQSFl1cGxqenA2OHVaRzNh?=
 =?utf-8?B?NFZjK1QrUlVHbXhwNU1Eb2JpU25TRDRTSk0yLzNyZVN3aGgrcW1TaVBhYk5D?=
 =?utf-8?B?UkswditwTDdhYlNTMnNjeVkydnU5WE92eEVKQkVxcFhxaDBNRGd6b09QaFRV?=
 =?utf-8?B?bGlpM24zSHhWLzd1REFZRjlQTWZtZllnOXFjaWxGTW9vSGQvOW9FdkZKSlk5?=
 =?utf-8?B?YlJIcHhqRytuTU1VV3l4NURFRVhBZWlTQm1wL0M2M1VDblA5UkhTMjZJYjZS?=
 =?utf-8?B?WGRUSkNyWS81V0h0UFplcERuRHQyTGZGZklPenFDTHgwOHFKMThJYjNDc2hq?=
 =?utf-8?B?R21td29pWEdjSENBbzJWcjdpclhkME5XRU9MOWU4Z2ZhOHdEMnovZ0FOTHdD?=
 =?utf-8?B?MXdyejlpNmwxbWhCK2d5Ky9MSUdRMHR5anNXaDl4T01iQ21kcjVsSjFORWdM?=
 =?utf-8?B?T3pjSTVjendGeWEwblRhWStYY2s4SVJSeGV2ZHlZcHNLMkU1eDlRTllBNGxi?=
 =?utf-8?B?dmtNYjlUY213TlRsa0NFZU1xMnlPTGtiNEhmL3FId1pYdXdJL3FYNDFlQ0U3?=
 =?utf-8?B?VzJrYzNkWUpjNlpzSmhrVmxqeEovZUZEMmxIZnE5SzJxTENLZURBb0hET1By?=
 =?utf-8?B?ZlBIMzFObkpXRkdZb1JlNjVqSmYvNkRjUEpoYkdQcnp5dUZxT2NPSUM5OW0r?=
 =?utf-8?B?VFdkTVhhMEdLYXd3Mm80ZHlkc2RTVzltMmJ4WEtkNTRWalo1Vkl0d0FnOVZM?=
 =?utf-8?B?cWJ3d1BXSFZHa1ZheCtJdWUyTzg1elJDY2N5aTZWbkJwa3R4SmsxWnZseU54?=
 =?utf-8?B?UzJqR2RlWnVwWEhHYUEwRU1ZT0krVGp6K2xNUlFrei9jL0NFTWt0a0pMNkF5?=
 =?utf-8?B?RkJLM1FBb21OeGFlNlg2ZVl6cTdEUVlpUklvQUxxVHh6Ykd0LzlKaGVnYjh6?=
 =?utf-8?B?OG1aSm9KM3RUZkp0UVMvaHJRNm1LRVl5dWJ1cXFBTW1qS1YwNHAzWEtCUEFm?=
 =?utf-8?B?NXh6cTBlUHhQUUlMbEpBVEw5VWFhZ2xXNC9EREdzeFVuMUc5cjAycVh1cXJN?=
 =?utf-8?B?TmZlb01YeG9COWdhdENHL1k5eEJiVXRBYld0cTZSZXFVb1Fxb1BhSXRBa2Fh?=
 =?utf-8?B?Mm5YenpSZ3BpdGx0T1ZjdzFVSDJzakNDWTdwSkRXQlpLRFd4V1YwV1hROGEz?=
 =?utf-8?B?N1F2T1lndWs2SG4wQmtLWmsyUzdNRUcyWXYvWTBhR3BKRnQ4eHlueEVWay9O?=
 =?utf-8?Q?45apTQX1UoemZKFg=3D?=
X-Exchange-RoutingPolicyChecked: vNsDEPkMJ/kIkDgxW9KHPr3U+x3D84vRtn2s/GjfITFY10U7YtV7ThEdzB8yo9n8EbmkeadGIlYwDjYO0mw1u4GaQHLFI3bLC3spkAaYAC7qPR+Gi9UkiAQxZi0qAy455n5dvdUWmLVUvCAcCwaq0CLHq00O65QZ1I2LrPAJEsxhBUSDTLlKjtGj1idVGmr/Tf84o+A8EfqXjq8XhpzURKGRDx5hjC2hTqIGJw3jq0WQiPD6oIJ11V4lDFdzdW6iOV8XqUqWHX/zFKvV1PiqkcjPr7JxR/pgGaCKtQyEnF+qO01PES+ELX5dXxC2mKREMctwe1nqn2Bu/cwlrUxYww==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d1cd35-17a7-4dc1-19ca-08df0e726951
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 13:01:06.7848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eZBXw0c5lw+uy6mMgdeOXB7mc9QBNilK+UXbVdC647LLYUmQBSfUDgx2nVyW5xOOBtSsGS/6GG2sHXu8pwZoZ4HlmfpEbxJZOwXptha1kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9942
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



On 9/9/2026 1:02 PM, Mallesh, Koujalagi wrote:
> 
> On 09-09-2026 03:12 pm, Michal Wajdeczko wrote:
>> On 9/9/2026 11:00 AM, Mallesh, Koujalagi wrote:
>>> On 04-09-2026 10:35 pm, Michal Wajdeczko wrote:
>>>> It turned out that during early probe phase, VFs use detached from
>>>> the xe_device, temporary xe_gt objects, which when used as location
>>>> in xe_log() macros, will be treated by the dmesg decoration code as
>>>> bogus, possibly triggering a WARN, and the output will look like:
>>>>
>>>>  [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...
>>                                          ^^^^^^^
>> [here] ----------------------------------^^^^^^^
>>
>>>> instead of expected:
>>>>
>>>>  [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...
>>>>
>>>> Relax the tile/GT id validation and instead of looking for the real
>>>> objects, only check if encoded id is within the range of possible
>>>> tiles or GTs on the current xe device, using data from the device
>>>> descriptor rather then the object list.
>>> nit: 'rather than'
>>>
>>> Please mention invalid id case, how it's going to render like 
>>>
>>> Warn + Tile3?  GT9? now.
>> invalid ID it is shown [here] and in the cover letter
>>
>> regarding a WARN, it will not show up in production builds,
>> but it would look like:
>>
>>  [ ] xe 0000:00:02.1: LOG: unrecognized location 3.0
>>  [ ] WARNING: drivers/gpu/drm/xe/xe_log.c:97 at __xe_log_emit+0x3ba/0xaa0 [xe], CPU#9: sh/5268
>>  [ ] Tainted: [W]=WARN
>>  [ ] RIP: 0010:__xe_log_emit+0x3ce/0xaa0 [xe]
>>  [ ] Call Trace:
>>  [ ]  <TASK>
>>  [ ]  ? mark_held_locks+0x46/0x90
>>  [ ]  ? __xe_mmio_wait32+0x87/0x170 [xe]
>>  [ ]  xe_guc_mmio_send_recv+0x354/0xc10 [xe]
>>  [ ]  ? dev_printk_emit+0xa0/0xe0
>>  [ ]  xe_guc_mmio_send+0x10/0x20 [xe]
>>  [ ]  vf_reset_guc_state+0x47/0x100 [xe]
>>  [ ]  ? rcu_read_unlock+0x1c/0x80
>>  [ ]  xe_gt_sriov_vf_bootstrap+0x2f/0xcb0 [xe]
>>  [ ]  ? xe_gt_mmio_init+0x30/0x1e0 [xe]
>>  [ ]  ? __drm_dev_dbg+0xa9/0xe0
>>  [ ]  ? __kmalloc_large_noprof+0x115/0x130
>>  [ ]  read_gmdid+0xf3/0x310 [xe]
>>  [ ]  ? xe_device_probe_early+0x143/0x710 [xe]
>>  [ ]  ? xe_pci_rebar_resize+0x17e/0x2e0 [xe]
>>  [ ]  ? __pci_set_master+0x61/0x100
>>  [ ]  xe_pci_probe+0x554/0xac0 [xe]
>>  [ ]  ? mark_held_locks+0x46/0x90
>>  [ ]  ? __pm_runtime_resume+0x5b/0x90
>>  [ ]  ? _raw_spin_unlock_irqrestore+0x67/0x90
>>
> I was looking:
> 
> *Valid case:*
> 
> [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...
> 
> * Invalid case now:*
> 
> *xe 0000:03:00.0: LOG: invalid GT identifier: 5*
> 
> :
> 
> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile5? GT5? GUC: MMIO request ...
> 
> right?

more/less yes, in dmesg there will be "?" instead of ":" after Tile/GT
and the WARN will be triggered on debug build only (it's like our xe_assert)

and please note that such invalid identifiers should never be seen unless
someone will generate such ID on purpose by hand, which is unlikely

IMO showing how the bad output will look like is not so important

> 
>>>> Fixes: 1151b9f6f465 ("drm/xe/log: Add component/location decorations to dmesg")
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
>>>>  1 file changed, 26 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>>>> index 5549ef6966fd..29eb16db3320 100644
>>>> --- a/drivers/gpu/drm/xe/xe_log.c
>>>> +++ b/drivers/gpu/drm/xe/xe_log.c
>>>> @@ -10,6 +10,7 @@
>>>>  
>>>>  #include "xe_device.h"
>>>>  #include "xe_log.h"
>>>> +#include "xe_pci_types.h"
>>>>  #include "xe_printk.h"
>>>>  
>>>>  static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>>> @@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
>>>>  	return component ? log_unknown_component_prefix(component) : "";
>>>>  }
>>>>  
>>>> -static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
>>>> +static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
>>>>  {
>>>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +	return tile_id < 1 + xe->desc->max_remote_tiles;
>>>> +}
>>>>  
>>>> -	return xe ? xe_device_get_gt(xe, id) : NULL;
>>>> +static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
>>>> +{
>>>> +	return gt_id < (1 + xe->desc->max_remote_tiles) * xe->desc->max_gt_per_tile;
>>>>  }
>>>>  
>>>> -static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
>>>> +static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
>>>>  {
>>>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +	return gt_id / xe->desc->max_gt_per_tile;
>>> hmm, we need to check max_gt_per_tile should not be zero to avoid hard Oops. I know in real scenario, max_gt_per_tile
>>>
>>> value is greater than 0 and less than equal to XE_MAX_GT_PER_TILE, however rogue user can write kunit test case and manipulate it, to avoid such scenario, we need to handle it.
>> desc->max_gt_per_tile are const and are defined in xe_pci.c, so ordinary user can't change that
> Agreed!
>> we also have a test check_platform_desc [2] to make sure no developer will define max_gt_per_tile as 0
>>
>> and we can't really control rouge user that will prepare and use invalid descriptor for kunit,
>> but even then, it will crash just that kunit, so who cares?
> 
> I know we can't control rogue user, his intention might be different. IMO, at least we can alert it right?  Upto you, how are u going to take rogue user case.
> 
>> [2] https://elixir.bootlin.com/linux/v7.3-rc1/source/drivers/gpu/drm/xe/tests/xe_pci_test.c#L63
> 
> I saw max_gt_per_tile, kunit check where it's should be greater than 0 and less than equal to XE_MAX_GT_PER_TILE to avoid such scenario.
> 
> Thanks,
> 
> -/Mallesh
> 
>>> Thanks,
>>>
>>> -/Mallesh
>>>
>>>> +}
>>>>  
>>>> -	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
>>>> +static const char *location_suffix(bool valid)
>>>> +{
>>>> +	return valid ? ":" : "?";
>>>>  }
>>>>  
>>>>  static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
>>>> @@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>>>>  			goto unrecognized;
>>>>  		strscpy(buf, "", size);
>>>>  	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
>>>> -		struct xe_tile *tile = get_tile_safe(pdev, id);
>>>> +		struct xe_device *xe = xe_any_to_xe(pdev);
>>>> +		bool valid = xe ? allowed_tile_id(xe, id) : false;
>>>> +		const char *pad = location_suffix(valid);
>>>>  
>>>> -		if (!tile)
>>>> -			goto unrecognized;
>>>> -		snprintf(buf, size, "Tile%u: ", id);
>>>> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>>> +			 "LOG: invalid tile identifier: %u\n", id);
>>>> +		snprintf(buf, size, "Tile%u%s ", id, pad);
>>>>  	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
>>>> -		struct xe_gt *gt = get_gt_safe(pdev, id);
>>>> +		struct xe_device *xe = xe_any_to_xe(pdev);
>>>> +		bool valid = xe ? allowed_gt_id(xe, id) : false;
>>>> +		const char *pad = location_suffix(valid);
>>>> +		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
>>>>  
>>>> -		if (!gt)
>>>> -			goto unrecognized;
>>>> -		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
>>>> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>>> +			 "LOG: invalid GT identifier: %u\n", id);
>>>> +		snprintf(buf, size, "Tile%u%s GT%u%s ", tile_id, pad, id, pad);
>>>>  	} else {
>>>>  		goto unrecognized;
>>>>  	}

