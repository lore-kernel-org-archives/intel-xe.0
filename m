Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B9FFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B728610E066;
	Tue,  5 May 2026 23:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtITeFyH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BE710E066
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778025263; x=1809561263;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SgNl0EGgbH3JYIFapCWhndKCy5SijyYbObFGo2FSKYc=;
 b=VtITeFyHcMB/K0L4nz71xlCp9EEYxehUeKxlJ5VvmeGw75OiFgkTE49d
 6+QVXuDIUOsOGtmUPhAdLKjHxolta3TH4pJqr3NDQtZeuKRMcHb2LRXZI
 i2rmbXKd1hj7gkV0NXppx//ks+XVwIjOjhnSbbWPABLzetRtFN8WHTEB/
 LlnFBD+qhUSX9dJ2AIdcpyTjeUvgnobQGy+RwB8La8g4orv2VXXg4DHVK
 3lRrU+8TH5bH2uB2Xaqa/CHGQTXlVDlmVjE1gDOCnVcPkK2wkOhNgMWsf
 LbPZUDLuXNxyB9u2vBt/IMTGIxR4+Zi4ohaMEPHMWQSf7UIRHHbyIFjJ+ A==;
X-CSE-ConnectionGUID: 37WID0dSTLmhQH2ghUzYRA==
X-CSE-MsgGUID: f0MYTojtRCup7eGmdGX7UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89218418"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="89218418"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:54:22 -0700
X-CSE-ConnectionGUID: FAVGdnMoRriJd9EAjVFyJg==
X-CSE-MsgGUID: 2ZyKxBKdSByWG7lJR6iV6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="274091043"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:54:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 16:54:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 16:54:21 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 16:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyHVFL40poGSoyGbrgJpkZ6ZquSvgXoNO/YvefZDP1NokSgVGBhXUtv0SQ7qmgLecVjtqfrgjc+BZFKIyF01WJLAq77ZO/cXs4Bsh/2l9JAg88E75bXOSvJJnMhwvWATNZI0jn9w90IiQe3lpyRnZVjVveIDra9GjZqUVAnn81P6XpYxVlZd427AlM5ntBEMaMP9VjetkiM/Nxt/rT1cWfgz5r7SLxrCUpawuHygqk9O4SW7ksOQ+07VGt9luUhmw5SQrkXJx65D1j1qeWfhXaFPlkB/JnyYyVKFDL461lpzNP3Ap2a0D+GuFwMFoCA/EhMH0FgvmvySdPvX9+wd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3ZJ2UwK6FuwfXqS320K88d4L8AamXz+Lkbw1ZoI+IE=;
 b=J0eNOxis1VBfsAq4tTrUHkjIpYJ2IDqtObjc/iyeQEHPr9u22BWBHKE4XBUwDmw/FpjQbiX3HgqhpqedCHWPgENR829/GRLLd506KRsiV7tfiZoNW/phMOqeEfvsFYIQvh66OyfZvZ1f5HD9y1Nzjg5YvFRyVNy90kQqKAvIyRqHZNNCFc4BinaflkXrnagI+cmP8d4ZXQdN7jAq61QJSHiHYFgSmlCQBaxJL0ECEVZRExjYL/fPGTjCJg+Zxlc8vKdfF2EaYY8Uda4JXLjhh2zOEjTE3dTSDj8saQavyVeqN/nKVxvAYLczMSXMXilEpDuB8QXzyGL7O1eL3nCT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 5 May
 2026 23:54:17 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 23:54:17 +0000
Message-ID: <4833432f-20cf-43cc-9f86-e80f406cd3fb@intel.com>
Date: Tue, 5 May 2026 16:54:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/xe/guc: Add configfs support for guc_log_level
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <shuicheng.lin@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-7-stuart.summers@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260504044348.209625-7-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d5c662-ca43-471d-fdfe-08deab019e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18092099006|56012099003|18002099003|10086099003;
X-Microsoft-Antispam-Message-Info: e9l8+dDmi76gCrg0KOJlFxo7cGUBpTaw8nON+oI6rZ4+SKInMM7HPWBKYfps0UKPEi4ihuZR94VCMYyanoJUhfS4zrEIRXK0jUgDGkrWuL6cBVSa5DWv+yp5x3lXvM0/c41tEfP3CFAMIrpB7+DWHBhix6NXbzZptXgU+sDvoJL4rrr216UmlDC7pSItDHRbK6keLS9cI40+2bLw6sgIzSTSVfcyZmYpisdAbl5k4BccorbHv0ZEkr25N6B3qTMIV106JXN32829bGMVoqfkcNpW0JCf5Y67iBt8M+bLZXYyT1VZBghc8VkSscMLurCOM0+fxsPGFY2ohzITpW0lyv7ennGIurp1CLvyjWl127DvhETNGG7HkBEJvccl53Czylf2j2k4Ow5YCv84HIdaHBfzAvQZzX1KeP1CsKqZjxs6ckExGB7yFkFWEghWH8Cx5MKMSmd5yXbq1CcZ4g/ythz9pYGBPZOAN6YhdQ1UwsyAphss5y8ULzk1O19QzQTS9HbF4QQs+4MUxFAw6twd/h99qxiQL6s/wRY1VgQusPCfyoqdVRhb+yI9BGBGrpauw20759PqeKR5Wf70KePi+4yNW4Ad3xrIzZxavwBkkuB9MHR4XcBvApTClDKvnxZQ0FSWy2VwZH9f41zzTY2/mokiJknp16yikeHPZRHF1C4LtFnSaoGKn726X7djz84B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18092099006)(56012099003)(18002099003)(10086099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3I2aWhFSUNZSi8xOXEwRkVrcWNkL3NMR1ZyZVpBOUFyQjdKS2ZHSFpDVVJO?=
 =?utf-8?B?bW1tMCtMbVlaOVNEUExBcjZYR1FyMWNMVnVYOEVHZTh6Yjh3c24vbnF5RXli?=
 =?utf-8?B?cDFybXVlUmlRWEVsbVk0QVNmQmNmdVBCWnpMNjFEL2tYSGZVdkVHQWRicnVM?=
 =?utf-8?B?YTVmSXRuRzM0L3FaQVlBM2FWUTNqMVhNU2VDcWovdll4SFFDR1hvNFZ2Lzg0?=
 =?utf-8?B?cXhiNG9HL3ZXN3laY01vSVZjNlpDcWJNdENLV2h5OVVkNEROeUFIZFRjSlpN?=
 =?utf-8?B?S25ZOXpCcEZCdVNNaEpoTExaWlM5MWZPKzBVcTFrN3lMRGhiaVdyVlZsUzZW?=
 =?utf-8?B?b3FWM3NFS3VXMldyZEQxcHh1YTRRbnhYajRlUkdrUUZFVWllYjIySklzYlNx?=
 =?utf-8?B?U2FxeEF4SFNMWlNPQ3RRcUQ5T0RMUDN4b1U4aW5IYnVkUWU0RldVcTFxRmFK?=
 =?utf-8?B?R0J4SkxuRWRXWmNKY2tYN1FpTG5YRTJVVkpWVHpMYjd4T2ltSDE1NTB0TjNk?=
 =?utf-8?B?ZHNOb3hwVU1KSU1wUUY0d1hnbEswUVM2YW5yd0NGWkRFMHliY0cyWDdCVVMr?=
 =?utf-8?B?blVsRFVVV3FPYUhjRDdRaDg3Ukl2TWt5cWxHalptbVNDMWVYRGNseS9SeWVW?=
 =?utf-8?B?RW02T0VyMGNuQzczZm83UE5sSjZNcFdteGpiRWV3UTlZMFkvVTVmNEFkWjJI?=
 =?utf-8?B?UzdpbjNKNHE0N2NtNTJxMFJSMUtXZExjbjgrRlo4LzRLci9HK0o4akEzWmFZ?=
 =?utf-8?B?dk85QmhFUUd6bzNRZUVoQ1lqNEJubVJwWmt5cGpFTzRmSFRMS2RiRzJGR2lZ?=
 =?utf-8?B?UTI2cUlwUlVZRTZZUUhrblZ2dWpVTE1PckwvVXV5d0RMN1FLZkhqczlPdS9O?=
 =?utf-8?B?V3JBOVc0ZEFoWXlBUXZYSDV2OTVVWTBnZi93NU14RlhhSHFhNktpWDFENk9B?=
 =?utf-8?B?TVZ3M3Z5cCtiLzJpL0pXVloxWU1iU1RqSFVZak44MnJhQzl4eGVWRjA3bC9m?=
 =?utf-8?B?bTYyTjIzNVNXYWU0c01nb2xwNWFkMUtjTXNoMUV5YjBsTUZySWU5cHBNdm1j?=
 =?utf-8?B?UGFyVU5uVGh6Y040Sk5PMG5zWC8yNFIyaDNINmtuazROVG12UmNqNkRwS2w3?=
 =?utf-8?B?YmFMSzlIaE0ra0kwRDI1b3VBZGtQN2NTaWRUNHJUZklma01FMWRIOFE2V1Qv?=
 =?utf-8?B?eFdQbVZnc2NiaVBuVjNLUGc3clpkM1psS3c0eFlTWGowTHMxWDdTSDdMRC91?=
 =?utf-8?B?QjlGVUNYWVA1OE84Z3ZpRGV0M21zOU9rdWl4SDE2NmRLMllZelBJODQxQTlm?=
 =?utf-8?B?MDhCaUpLT0VvM2ZqV2dSdDdCSnlRSHZmVkdGTVJBaXVtdzF2NTlQdXVrdzZt?=
 =?utf-8?B?dVVmR0hDNk8xZWp1N0NXTllXV09XWGFPRlpISXFNdG5FaVN4WkJNZmFPZGhN?=
 =?utf-8?B?TnBaalZJTFJaaEg1ZTR4OC9rWm9EbXFvZkFnZHZteWRGZkJNdEthZUxBOS9K?=
 =?utf-8?B?WGhSQ0N6NTJvaUJDaU9xT2JRSEkvaVFzcXErWjlqVjltY2k3SVo0ZHRSQXhN?=
 =?utf-8?B?bmcwajZUVEhsQkYwNVlNdTBpRytQcmc1VFpxaTBSQmlEdHRTVzQ1Tk5lNUkv?=
 =?utf-8?B?bFVyWFR3RGlHMWgvWEEyQWdQMU9KalMySC9GZ204RkVzZU9wQlhFNWc2eEhS?=
 =?utf-8?B?Q2pvOFVIclYxaGVGcGcyelRWdGtKOCtZVnRtcHAvU3JwZ01tcUxFMmtvOEtX?=
 =?utf-8?B?alhhem5IUEhNU3cvSGg0ZkF6dTEzNkUvWmp5QjV5L29kSzdZK2xSeTRFangr?=
 =?utf-8?B?S0JkblhGSURCdXhLU0NtU1VGNnUyRzZNRkh6TXdBTmV2WXBkNmo5S2d5emts?=
 =?utf-8?B?NlloRjNXcCtMU3ZBOVJSRk1aemdwbkJrRCswbnovQU9zWitrV0hzQ1didktq?=
 =?utf-8?B?MXJXWUpaWktLQlhNUjlLTnRsTHgxamovTkNvbmVZRVNjbzkvcC9mSU12Ulgr?=
 =?utf-8?B?c0hHbGRLaTl6d3p1RHhCVXNHbzBQWStRVmZ1UDlkNmozRFlEbndRaGFURnJ5?=
 =?utf-8?B?VHhWZ0xjOElBbDVCSHJEWHVsaXFGUm02K244V29ZMEF4elJlaFllcGF0dWlx?=
 =?utf-8?B?WGpOVHVsYWhnSkttcmE2RGNTMnVBc3JUcDJ0eUt5cHZ4Ym1yWHcxVjFCQ24r?=
 =?utf-8?B?ZEdyazYyMDE3SmRnQUR6RzFoVWphUVppbWQ5THRUeEQwSWVyZVR6RlJFNVF1?=
 =?utf-8?B?M1pGcTIxYmlyWi8rVDZvT20xeC9DejZoZGJXTW1DT3dEZ1BjVmlXSlZGdEsz?=
 =?utf-8?B?U0drRmc0dE9yZ3ZTeXc5MWVTMzNDQ2JMWHdnY2dsSjRmcUhIalRpbTFiK0o1?=
 =?utf-8?Q?BRMXJI3Jpvut/HAA=3D?=
X-Exchange-RoutingPolicyChecked: neswdNrnfefMMrhoQZAza3xqW1ZRwC+wYgNgAnye24GUrXMqj4oV1ah/1UrmUDFko0Ja09r7dcGnU6wcL91CWHXehJrcguPLxvFbBJAB5RxmrvLdoR65Ho7m86cn2KMjxp/QHWFQsjhNLdske6aC2wj+h8m4iNSCWDwBund6RK6NinVgxCDl5MFxiZFsfz1LQtUWx9QUgOGhKzU8EN9R1symbMAlQCPG96DYy1rYfcmP22sVwJIPP/RU4K19W8PVgN1LaT0IQ6xB5lCXHkkozH4bDUZRbM0F8rAGru7A5NDXbE1BLSaoUp/ROwPXSbotIewypE4DAaFugbjgMVRevA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d5c662-ca43-471d-fdfe-08deab019e21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 23:54:17.1774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIzl0sNqWpqHVTI0/2bV8VDK3zozlxg2L2Fo5yp9V/kHwdmhBxQCHtEGuHBmzAnIK/rXNbxoZaApmDIu6ZR8Eqijuh8xGELj4pv0syTJJvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
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



On 5/3/2026 9:43 PM, Stuart Summers wrote:
> Allow the GuC log level to be selected per-device via configfs in
> addition to the existing 'guc_log_level' module parameter. The configfs
> attribute lives under the new 'debug' configfs subdirectory:
>
>    /sys/kernel/config/xe/<bdf>/debug/guc_log_level
>
> When the configfs attribute is set to a valid level (0-5), it overrides
> the module parameter for that device. The default value is -1
> (XE_GUC_LOG_LEVEL_UNSET), which means 'unset' and falls back to the
> 'guc_log_level' module parameter, ensuring existing users that rely
> solely on the module parameter are unaffected by this change.
>
> The module parameter implementation itself is untouched.
>
> Note that the expectation is a user will only set the log level when
> CONFIG_DRM_XE_DEBUG is set. Otherwise the expectation is a user will
> always just use the default (1).

Why is this the expectation? if a customer is seeing a bug that we're 
not able to reproduce, it might be useful to ask them to repro with a 
higher GuC verbosity level without having to rebuild the kernel in debug 
mode.

Daniele

>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-opus-4.7
> ---
>   drivers/gpu/drm/xe/xe_configfs.c       |  2 +
>   drivers/gpu/drm/xe/xe_configfs_debug.c | 84 +++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_configfs_debug.h |  7 +++
>   drivers/gpu/drm/xe/xe_configfs_types.h |  1 +
>   drivers/gpu/drm/xe/xe_defaults.h       |  3 +
>   drivers/gpu/drm/xe/xe_guc_log.c        |  3 +-
>   6 files changed, 98 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 89e163ce56aa..babe33e84af2 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -106,6 +106,7 @@ const struct xe_config_device xe_configfs_device_defaults = {
>   		.enable_survivability_mode = false,
>   		.engines_allowed = U64_MAX,
>   		.gt_types_allowed = U64_MAX,
> +		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
>   	},
>   #endif
>   	.sriov = {
> @@ -429,6 +430,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   	PRI_CUSTOM_ATTR("%d", debug.enable_survivability_mode);
>   	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
>   	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
> +	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
>   #endif
>   	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>   
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
> index adf193d48a63..b5c06d1ec7c9 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_debug.c
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> @@ -15,6 +15,7 @@
>   #include "xe_configfs_debug.h"
>   #include "xe_configfs_types.h"
>   #include "xe_gt_types.h"
> +#include "xe_guc_log.h"
>   #include "xe_hw_engine_types.h"
>   #include "xe_pci_types.h"
>   
> @@ -43,7 +44,8 @@
>    *	        ├── enable_psmi
>    *	        ├── enable_survivability_mode
>    *	        ├── engines_allowed
> - *	        └── gt_types_allowed
> + *	        ├── gt_types_allowed
> + *	        └── guc_log_level
>    *
>    * Configure Attributes
>    * ====================
> @@ -186,6 +188,27 @@
>    *
>    *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
>    *
> + * GuC log level:
> + * --------------
> + *
> + * Set the GuC firmware logging verbosity for this device. Accepted values
> + * match the ``guc_log_level`` module parameter:
> + *
> + *   - 0: disable
> + *   - 1: normal (non-verbose)
> + *   - 2..%GUC_LOG_LEVEL_MAX: verbose levels
> + *
> + * Example::
> + *
> + *	# echo 3 > /sys/kernel/config/xe/0000:03:00.0/debug/guc_log_level
> + *
> + * The default value is %XE_GUC_LOG_LEVEL_UNSET (-1), which means the value
> + * of the ``guc_log_level`` module parameter is used. Any value greater
> + * than -1 written to this attribute overrides the module parameter for
> + * this device.
> + *
> + * This attribute can only be set before binding to the device.
> + *
>    */
>   
>   struct engine_info {
> @@ -325,6 +348,34 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>   	return ret;
>   }
>   
> +/**
> + * xe_configfs_get_guc_log_level - get configfs guc_log_level setting
> + * @pdev: pci device
> + *
> + * Returns the guc_log_level value configured via configfs. If the configfs
> + * value is negative (the default is %XE_GUC_LOG_LEVEL_UNSET, -1), the value
> + * of the ``guc_log_level`` module parameter is returned instead, allowing
> + * the configfs entry to override the module parameter without affecting
> + * users that rely solely on the module parameter.
> + *
> + * Return: GuC log level to use for this device.
> + */
> +int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
> +	int level = xe_modparam.guc_log_level;
> +
> +	if (!dev)
> +		goto out;
> +
> +	if (dev->config.debug.guc_log_level >= 0)
> +		level = dev->config.debug.guc_log_level;
> +
> +	config_group_put(&dev->group);
> +out:
> +	return level;
> +}
> +
>   /**
>    * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>    * @pdev: pci device
> @@ -596,6 +647,35 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
>   	return len;
>   }
>   
> +static ssize_t guc_log_level_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = debug_to_device(item);
> +
> +	return sprintf(page, "%d\n", dev->debug.guc_log_level);
> +}
> +
> +static ssize_t guc_log_level_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = debug_to_group_device(item);
> +	int val;
> +	int ret;
> +
> +	ret = kstrtoint(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > GUC_LOG_LEVEL_MAX)
> +		return -EINVAL;
> +
> +	guard(mutex)(&dev->lock);
> +	if (xe_configfs_is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.debug.guc_log_level = val;
> +
> +	return len;
> +}
> +
>   static bool wa_bb_read_advance(bool dereference, char **p,
>   			       const char *append, size_t len,
>   			       size_t *max_size)
> @@ -837,6 +917,7 @@ CONFIGFS_ATTR(, enable_psmi);
>   CONFIGFS_ATTR(, enable_survivability_mode);
>   CONFIGFS_ATTR(, engines_allowed);
>   CONFIGFS_ATTR(, gt_types_allowed);
> +CONFIGFS_ATTR(, guc_log_level);
>   
>   static bool xe_configfs_debug_is_visible(struct config_item *item,
>   					 struct configfs_attribute *attr,
> @@ -863,6 +944,7 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
>   	&attr_enable_survivability_mode,
>   	&attr_engines_allowed,
>   	&attr_gt_types_allowed,
> +	&attr_guc_log_level,
>   	NULL,
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
> index bfbfbda1073f..b29c739435c5 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_debug.h
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> @@ -7,7 +7,9 @@
>   
>   #include <linux/types.h>
>   
> +#include "xe_defaults.h"
>   #include "xe_hw_engine_types.h"
> +#include "xe_module.h"
>   
>   struct pci_dev;
>   
> @@ -17,6 +19,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>   bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>   bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +int xe_configfs_get_guc_log_level(struct pci_dev *pdev);
>   u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   				       enum xe_engine_class class,
>   				       const u32 **cs);
> @@ -33,6 +36,10 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
>   static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>   static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
> +{
> +	return xe_modparam.guc_log_level;
> +}
>   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   						     enum xe_engine_class class,
>   						     const u32 **cs) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
> index 02d5709bcfd3..ba920c37c44d 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> @@ -37,6 +37,7 @@ struct xe_config_group_device {
>   			bool enable_survivability_mode;
>   			u64 engines_allowed;
>   			u64 gt_types_allowed;
> +			int guc_log_level;
>   		} debug;
>   		struct {
>   			bool admin_only_pf;
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index c8ae1d5f3d60..df88078e84b8 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -13,6 +13,9 @@
>   #define XE_DEFAULT_GUC_LOG_LEVEL		1
>   #endif
>   
> +/* Sentinel value for guc_log_level configfs: not set, fall back to module param */
> +#define XE_GUC_LOG_LEVEL_UNSET			-1
> +
>   #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   #define XE_DEFAULT_VRAM_BAR_SIZE		0
>   #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 538d4df0f7aa..531b9759d520 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -13,6 +13,7 @@
>   #include "abi/guc_lfd_abi.h"
>   #include "regs/xe_guc_regs.h"
>   #include "xe_bo.h"
> +#include "xe_configfs_debug.h"
>   #include "xe_devcoredump.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_printk.h"
> @@ -637,7 +638,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>   
>   	xe_map_memset(xe, &bo->vmap, 0, 0, xe_bo_size(bo));
>   	log->bo = bo;
> -	log->level = xe_modparam.guc_log_level;
> +	log->level = xe_configfs_get_guc_log_level(to_pci_dev(xe->drm.dev));
>   
>   	return 0;
>   }

