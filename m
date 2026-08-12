Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C29C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 13:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08D710EFC9;
	Wed, 12 Aug 2026 13:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQ3TVrwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48B10EFC9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786540223; x=1818076223;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZCORalyhu68zZ7rGBWPlWNUNs9xMrcTajo3vXXrqnFQ=;
 b=fQ3TVrwce1Qnbza/nnUSbrV7edyFCLsZsTrYyLIoD3Vpwfq+PBq+2saz
 SKkeHREy5XvDFqGkKMqgJOBRANSj4RyKxyylAOHt2WBtfkMF/IrVvd2Li
 QK/XrBVVLfcZkFD/qGOhoR5wGzr5FuGToYCxmIZ+JBMx7veo5Xi+NzEi9
 mZbd+omIedRgRDpQfvw7rPZ72OJh+FAqc4vtdPSD8f/1ZZoWNVKr9wft3
 TXOZ0shMKhKjM77WjqyisoUljqoYZl/qlN0nwPrXvYWiPun7nTR6wcJ2B
 SwqSykvAxoGRT1xOVHxZoeCVjh+HIJtTUKwfYI5clY1chbNbxq8D/aLZZ Q==;
X-CSE-ConnectionGUID: ktG8dS0rTviAHx55aumWfQ==
X-CSE-MsgGUID: sFsAb6LgTO6+L/b3tr1YjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104627322"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104627322"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:10:23 -0700
X-CSE-ConnectionGUID: O7qF6wszTCuhZjyezXFFJA==
X-CSE-MsgGUID: IcpMF6BJQl6rg1IlDvrrRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="257445464"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:10:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 06:10:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 06:10:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 06:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozCkOtYD0IM0x3HOHBM7nfdvYlqU+14h0L+xzlAZi3fzy/xVA02RlIsTNZq7SKt029v2qKJll9BdAoSW/paL+dpfc3zun9U4mxcoAcCIG7Pu41LC/xFKsskV997Wsf/zjBmmtCeWaOoWZb0/XFqxlSAEHUImn7EWiSE5PBUo8tWZa6mxLdlfwZ0MMIlMfZgzTSAWnliaPtd58nIsIXPk2R0w2DduvBTkRfGm12+m4FKNR8P7yCPSoq+fWSO46l+c/EEPyj3pFZvnxih06vLrnabhWYr8ttCyP8AkrM58Jppbrnni9yVLip8Rd+/03SwApWHcHmKYPLmv+FITiXgSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0gQo2xKjNTtoWp/hb1IRNr2GROUPfos2lQNmUXMuio=;
 b=hw7WkYUh/sL7ML163EgFkxlGlHJQH4Sgiq+Zet5urqAkl04hJNO0fLpvbnjX8s0M6zzNjfaCR4vhj11IjMgBRbqPWvlK7QDiPe47a5OIHzxxBk2CFpSnN1pu0xgj+JCmpRAEmupsM7BnC6xU6EqDM/VhIV5mVKorC032+QPtE4HcdYR93MSgOozd3GedKBUUtRvbjiaL/rYmiwwB3djdiCozBAi7+cHqEHdXB64DelLNERN+Kg6KwN9NeZchP3FozghDtr/sO0F3QkKpPMTQBFb1CekYfpP/pWQVXXOVaKypxUgkUJ72cn3+rolGDNy0w63rB/eoBvlUOfnWk+s6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 13:10:19 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 13:10:19 +0000
Message-ID: <f4196c9f-aec2-4fd0-9dc0-c53f8ffcd78a@intel.com>
Date: Wed, 12 Aug 2026 18:40:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log
 helper
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Kalvala, Haridhar"
 <haridhar.kalvala@intel.com>
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
 <20260812123449.239480-7-mallesh.koujalagi@intel.com>
 <BL1PR11MB5413209646E3B55EC26A146FE2DC2@BL1PR11MB5413.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <BL1PR11MB5413209646E3B55EC26A146FE2DC2@BL1PR11MB5413.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: f3615cfe-43f4-438f-7f85-08def8730f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 5otF1IQn6vIFDzejckjzbK26lI04WhyZVQdj1gFOpifqoHv7waP708oaCQFvkaFirtVlpgw6ZqHRIbNaDS4BzCuEZHHhsGeqr30Y1wdJ+AZynF0llf3+WfvPrpG3qvX6T/2Wn+O2x9OAvyOQ/maL5dVER7Rxk0XrfHrG9R55MoX6ihDMrCOh3+Y1hAVulwM7CQtMfvJ7OKp2S0XEYk3T9ev/1vueu6HAlrdpB61L2krIr3PnsTvYvc119WoPVogiw1hQDboFr2y3YMBCwgvRdLa1l1CLFoJ277QbA/NWXRQIS33TBZEj6gAnlwiAbyEIgIuGKUdCo5FrkoH1UM81LzviDGamxqwjGfcPLRZeofgvf3RubOn9lVdeBCA6qCiiGM2OKj+L2ATMS5U2A39HNJQBDjRFdlvEGi4Buzjsw5jD3gT7cRyBpHv8cJGldYMcEdEvCSuXzA22FcS4VdckZr2ifv9FQnUw+ZWZog0otDRKVx2biH2jwr3v5kYqER91zjY0VzeF5jGIx7A/vhZ2wGoz9KgdWdGYZj7PejKUyQv85SMJ7lhH2yWxkn/f23qaxkLCz3wSP/mIcEgYJYOYqMps4LHDXniGe27gzHdYYnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGNYaXFJbFIvcHBHS2c5MjZmeEtXOENlNjVYVEh5WWJodVYvbzBYY0tINjNC?=
 =?utf-8?B?QkE0YW16emRUQkM4VEpUSjJLelFIbHhRRFZLeHNNRXdkTzZ1M0dwV3VPb2FD?=
 =?utf-8?B?a08yc2JMbndDQ2xLcW1vYkdWWWxNVENxbUF0MzNDcVYwQ3graFQveEpWMys1?=
 =?utf-8?B?bE1pc3gzdnFsLzNRdkYvUU1vS1l2b3BzemdZUUhPaHlOQXRmWjNkNDZaaGEz?=
 =?utf-8?B?RWVJS0cvWHNxU1I3WHAvRXVnUXpneE1iVEJRUXNHaFdrYm0wSnFSY0NYWUJP?=
 =?utf-8?B?Z3F3M0h6ejR3VTU5MmwxMmJ5TndacDNXYzN1RklLa0ttY3p5eW4yblRlZEZx?=
 =?utf-8?B?VktlUmJ6NUlMcGFFTlBVMldwaE9QYW5jM1oxLy8vMlZRNWxmdVk3MjBib3h5?=
 =?utf-8?B?V21LWFpReEplQnVERmo4L25CanVNNzJZMFd6SDNYMmVteUdjc3FEUHVNYnk0?=
 =?utf-8?B?MEwwODNUT0dKZWQ0a1RXeHcySGVLczVHWHNGVXo2VWVtLzJlakhFSGo0S29r?=
 =?utf-8?B?YkErMHZ4dk9Ea0NuQnQrUFNGc3NickJSdzEzbTJEMzJEb3hwMU5kR1hXZmFX?=
 =?utf-8?B?eXg5V0hlR3JqMmdkLzcva25MZDUyZURRWWRzWXJpK1B6NTMrSndZTHNUcTUy?=
 =?utf-8?B?UHBwR0c5bitRNHFrUjYvSkVLVzI5RlFoSzdGR2NIUWdLUy80dmR2U05aSmRN?=
 =?utf-8?B?blpnTCtFbys5Y2tOU2FudnRmME1UQmJWbmdFUXFuSkFZbS9ZeVd2cS9tSFhE?=
 =?utf-8?B?N2taQ1pZS0J5ME50WDFSRWNTNEw0ZTJNbE50bEFUSG42clZCZHQ4cjZzOFRx?=
 =?utf-8?B?c2YvcS95SVZJS3M0cVZabGxHdW1XbWFsc1dERWJaWGJFbytVblkvbjlFOXpV?=
 =?utf-8?B?eTI3b0hmTVdPZ09jaEdGZ0R0WUQ3emcydXk3MjMydnB4MWRTSVI2WUhRcW90?=
 =?utf-8?B?a2hrL1piMmVBUjlHYWlNQm56dGlWME1NdCt4eEdYR3YwbENETWQrY3JiV3Jz?=
 =?utf-8?B?VDYzOFB6VlJQYVJ6d2pXd09FU09NMXVEUmFOZm5acTNtbUk2cDZaOGs4cGxl?=
 =?utf-8?B?Rms2QkdPcU5PS0ZlbVkySFRDQ2RMNjRmK2I3SUdHL3MvL1FyOXI0MjNlTjUr?=
 =?utf-8?B?eHhZTDRKc3l6c1ZwQWtKK2hnR2N1RmJnQ1NoRnVHUWk5NS81K2wyRVI2Mm5Q?=
 =?utf-8?B?Q0tJZU9GM29ERm10MlpVeHhIL1AzZmFFbEp2K3V3Y1dnRytVeVpHWGJCMHN2?=
 =?utf-8?B?T3FPSmFMUFRhNEVOMXlwaUYrZzVlcS9aVkg4TXVDUDZjWG1kcGNydlh2OElP?=
 =?utf-8?B?SEF2aGc2NGFoUHU1T0R1bFU3Zkx2RzAwRnBpZFFxZkVHTHplbDRBSGczOG9X?=
 =?utf-8?B?aVJRL3pqQ0d6bDVNL3VVMlpEQi9oRFZ5S1I4YXdSUy9LbkQyZldMZWI4VCtJ?=
 =?utf-8?B?UllCUkpVUjA1R0ppQ1ZiUzJpdTFRQmYwMzZZMHpVRDhZWWFLM0s3ZFl1R2g3?=
 =?utf-8?B?SzVzNmtNRWlJUDRXajVBTmNGck9UeDFpWWhxeENqNzRHejBxUm5iZ0JjeFJR?=
 =?utf-8?B?UG1nMzcwVEdGMVRGMTZJUklHL3BXQU9HSjM4b0JTYzNuOG1kL1JNUi9aV1Rq?=
 =?utf-8?B?MEova2VVOGtjdzZEUFEzNTh0ZUVxZGlzMGJubHM5YkdFUkNmOGMzdnh1WVZG?=
 =?utf-8?B?RWk5M0tvMkdaZHZZMkpWa0x6TE92TnJBYkQ0c05Xb0RCOHk2aFVNUVhyU1Bm?=
 =?utf-8?B?aFBNeEQ0Zk4xczV5Rmp0MzVYN1dzbmQ2ZTdSWjBKb1RDVnJkMklJOUdMczRS?=
 =?utf-8?B?L25FZjNVODRSeHNnMWZaN09uNWxWd2dvaWtON1M5WEh4dTBaUlFFSUVDclVx?=
 =?utf-8?B?cmFreFdlQXlpZ3lvcDZkUFpnMlVmNXJ6VGJZS0hHcUNvQUp5eVJRTm5yNy9y?=
 =?utf-8?B?SnpsWFRKeGFmRmN5ZmZNOGhuRXhvcTBWRVJ0WTRHMk5FTi9jZVd2K2RaRmJj?=
 =?utf-8?B?dXkvNGN2SDdOK1VFMktHeksvZmZCdUdQUlNxdnIzSW5MVlNzUkt2RllabjJH?=
 =?utf-8?B?a1A2TTV4Q0JjOVhmZTJBVTRZVWw0L2R4aEc1UGI4T1lLUGRsWExVRk9zdUcz?=
 =?utf-8?B?M25hTkFVMEYvOXlVMVhwcjJCcHBJc1kxTWx5aUtuNjVIcnQ1R0tsSysrUG5y?=
 =?utf-8?B?WmVuditMRWZrZy9iNm9Kei9lNlVDNGluckViQmxIYWNnbGtZQlNmMjVmOGpZ?=
 =?utf-8?B?WndKakl4Z1VEajRkSEl3S2E5S1FIRWpyUkxUNHAzTXprT0xNbVQrRjNMYyt2?=
 =?utf-8?B?RE55MGxob09pMWttdUlDWm9NZm1udWpkYXZQcHdvdXVnaDFNdnFoV3FjRG9z?=
 =?utf-8?Q?4E7VORWLZKImNOaU=3D?=
X-Exchange-RoutingPolicyChecked: ihqXOuTVZ9Z/MwR5uaRyktTias8ZwSyXUoMTxbGsNP14e0L344wwPRkrDUzgO+AE69bld13SDnHWWH8wleivW6wd/qgdl4C6ac05kd2d5waHIz0GlGH3G2pY3gWbNO2t4YT8ZzuwdiZaMksB/RG6BMb0LqNNc7/5Pt72tHjD2Wtw35iA3vg1u8k//xuPq43NU4uYatAwjFUbpaQJU6SXy2HxItOo/PdcsMptdgSxFf6QYqxuQZvhNZaBc0n5lKt/VctfoXq1zIUpwS034ImQICjlf8XRQLolzLBrRmfvpQLOmuPManLIJcTROoata7QPIiCo6fF6U6X8y+27wbnVzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3615cfe-43f4-438f-7f85-08def8730f17
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:10:19.2875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XQIu5VyG0BPnIdnoFX95q1T0Mj772hR57l6cpgZqa8WEaLUUiugbm3iuUSX1R90+RbbuYF52FYdQmWHArBZYSyGOJu4Kl5VShOFZq0CTOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
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


On 12-08-2026 06:23 pm, Bhadane, Dnyaneshwar wrote:
>
>> -----Original Message-----
>> From: Koujalagi, Mallesh <mallesh.koujalagi@intel.com>
>> Sent: Wednesday, August 12, 2026 6:05 PM
>> To: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Brost,
>> Matthew <matthew.brost@intel.com>
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>;
>> Tauro, Riana <riana.tauro@intel.com>; Poosa, Karthik
>> <karthik.poosa@intel.com>; Anirban, Sk <sk.anirban@intel.com>; Jadav, Raag
>> <raag.jadav@intel.com>; Wajdeczko, Michal <michal.wajdeczko@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nerlige Ramappa, Umesh
>> <umesh.nerlige.ramappa@intel.com>; Bhadane, Dnyaneshwar
>> <dnyaneshwar.bhadane@intel.com>; Koujalagi, Mallesh
>> <mallesh.koujalagi@intel.com>
>> Subject: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log
>> helper
>>
>> Use xe_log helper for PCODE errors instead of drm_err(). This adds PCODE
>> component tag, making issues easier to detect and track with automated tools.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - s/pcode/PCODE. (Michal)
>> - Drop PCODE in xe_log_err.
>> ---
>>   drivers/gpu/drm/xe/xe_pcode.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index ccc3bdeed6bb..c69440ea477b 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -14,6 +14,7 @@
>>   #include "regs/xe_pmt.h"
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_log.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode_api.h"
>>   #include "xe_pm.h"
>> @@ -219,8 +220,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32
>> request,
>>   	 * requests, and for any quirks of the PCODE firmware that delays
>>   	 * the request completion.
>>   	 */
>> -	drm_err(&tile_to_xe(tile)->drm,
>> -		"PCODE timeout, retrying with preemption disabled\n");
>> +	xe_log_err(tile, PCODE, -ETIMEDOUT,
>> +		   "Timeout, retrying with preemption disabled\n");
>>   	preempt_disable();
>>   	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
>>   				true, 50 * 1000, true);
>> @@ -320,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>>   		mutex_unlock(&tile->pcode.lock);
>>
>>   	if (ret)
>> -		drm_err(&xe->drm,
>> -			"PCODE initialization timedout after: 3 min\n");
>> +		xe_log_err(xe, PCODE, ret,
>> +			   "Initialization timedout after: 3 min\n");
>>
>>   	return ret;
>>   }
> Hello Mallesh,
> This is one more place inside of the pcode_mailbox_status().
> Could you please include that as well to this patch ?

That already covered in SIGID the patch series: 
https://patchwork.freedesktop.org/patch/743325/?series=171022&rev=3

Thanks,

-/Mallesh


> Dnyaneshwar
>
>> --
>> 2.48.1
