Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0751CD4F52
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 08:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85910E283;
	Mon, 18 May 2026 08:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8mcihh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F99710E283
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779094391; x=1810630391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nqZ0YHhXCKPIr0V01yI/V+DZ6bvnNuzuSREXfPjlSQQ=;
 b=Z8mcihh9zj2dSrTLZZI02sq7vuxQ17qQJeTjjXrTHIkZY4Ji3IE1KwVF
 b4SI6UE12WfwNCPpe5u3jxnmFzCII0b1OputnK/jPZmRY9nU4ddOpU2n0
 +/bXLYKBAFFG0pOZRm9Jce78gVh72u0ayRLgrSevzTzy1KKZ8idX18Dhc
 6KUkkQUs8pUD6QRzjxohku1vYBLwwqtVP0CL505eOdB4BJo+BETyH98Ao
 pYj58Bm00aQt1UMhNZnhybdbYAsLwUhQ/5S+QmNA3mG4plvFXhyiI43Jk
 9NV9StBz9MdZCbnNlsOUY4XqP4SpePIpkOtKwjgJfw0BZi7bHod9Yna25 A==;
X-CSE-ConnectionGUID: tiigbzVsRSiP3T2VILAZ9Q==
X-CSE-MsgGUID: eyZd5nx0SemNIkYNEWbbHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79795171"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208,217";a="79795171"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:53:11 -0700
X-CSE-ConnectionGUID: TbZiOYTASuu/ychFGGjQiw==
X-CSE-MsgGUID: 5doYo1H1TKmgizUjJ5Le2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
 d="scan'208,217";a="263148644"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:53:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 01:53:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 01:53:10 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 01:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFy2m/7NFmV82V21Nkyf4PXc4gvmBUUPVCXHZ7ZmfEBWyWpkf3zOkZ38ZNy7P2JmWDtfhkwR3SxqwdJ9wZelvzV7y/xyCi9Hsr1JARlfYElTFb1Q4ucaT99U8EuIbW1PEUhLvKjGbkQmgxvtDPJSg1d2AhJBYum+ZwO4u93t/9fxw5cMzvbKpsXybyQ9FjegVcBOJhcUHHVwWuq1P46Q3M3JShfRJIRvdu0ASje50K3p8sSRRONz1PvZFsUONM3L7CDqNRUh+BgWPkVQiJX0HikOjoGz5JyphLs9KQRmWL2mB1mG/E0RzS8ypuH0Pl83TlD1RNdPDG/x67Dx3YulPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXJxqqnLjOKxl+YKsJ6q0/nGrj6Ud+tPpbUHh9+SzGg=;
 b=T85q8YdF6Y0KSRBat85wedB0SEMUcHK6L8T8z2qxHt0DWaC0Xl9534p1jRuf07HeUVRbMBH3fqvM9oLfSh1dTltxl0Juo23XKHDuN6AqExHrDWd1uAZRUevnxPNf18aOyjRZMfhbloL7FhAVF/BUOoaCEfXSrEF3pkhOIje7AibV52IT7Fbk7IU21ia8YuaYjq5bIFsgj+gDUEyeaKYXH193TcbQ7HZiJodc5KwbTMqB/ZWWLN8hL9qu6qUArVBTLNoQ/pgUYSgosuXqCrYDONxEPZ71vhu3rVuxqJSEGEPN5RTopGKDjL+CaKaV3aqTDpPAxmlFKxXvhK0MBMDsgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 08:53:07 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 08:53:06 +0000
Content-Type: multipart/alternative;
 boundary="------------FJY4yPtXzGUXaUwf1hU03JL5"
Message-ID: <c109d874-8b3f-4e22-bb8d-7c86c75ebb18@intel.com>
Date: Mon, 18 May 2026 14:22:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] drm/xe: Skip device access during PCI error
 recovery
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-21-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260511172908.1122252-21-riana.tauro@intel.com>
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 51542891-0b79-42cc-942f-08deb4bae0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799003|56012099003|22082099003|18002099003|4143699003|8096899003;
X-Microsoft-Antispam-Message-Info: ldmqUhD+RdmTU46u124n+kRcf0JzLJ2vu/zBm1gBlZCipZTj/KYgSAmBZqsUwKsZCl4GDSI65hPkzWmN6p1XZ/NiZoqbYZstxbQt34WszPL0Qy/7LdmeQqin8DSp3b9trFYrjCRiXM03lNj85EA1HWZJU0rtwoNBFtzuP4TJrp89DOo+gYjjlQ8U/C6Uz3jsw7ad1PMRf3zNHu+wK5tDQEL0GOrFZbbachmP2G/PI0iJksXAZVFtUfeG1sv1ODDWuelsUBZKiqfiEPTlD9gqtQOzcOcCm+zKFgRFtA3BrjbhzdcAwPgUnWpmLzoruG6O/e/mRCGlkeaAGh/GPEF+TOF+0uHRGCrkn1ijUKP8xaqHHQrjs9iJYbyGz4yuQAcDUpBPb32yR5Q8zCK4Pk5B3UtvSHOrPTWtfVSR6cMUmoPQypIXjKG8kBzfcfy/C0ptgxfG1ekU3hTmRvxNDck8aeuY3r7EID2DzSXCjtDH45pqg9qIsV5NRWBiFgmEyTsoOpZIgDqkrTDVh6iXKZM3hmKw0+la3Rv7V4Rf9uyQuZycMWeJE40s5Gs+bI+CcGDCS9QQRQLSL8WnVIAhoRB5s3VX9Yy8AtNao/4v/Ki/z/0H2P69nonTZIz3TOuF2itd5YoLxrlwZ3fkR3lPzu8PH7Hqo6TbdHGqDOhjtjLJ0T0QwUp1jp4PHckG5GQkIThx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(56012099003)(22082099003)(18002099003)(4143699003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVRUbE5qcDhBVW1GV3RJd0FvSWNySGdvS0Zmc25nZmVDajFSMDg0WVhwNE1T?=
 =?utf-8?B?YnBuNk1TT0lyRXVwS1NuNTd3cDdEcmkrdkoybGZEdnFsaTEyK2x1OUpXWTd6?=
 =?utf-8?B?aFZ1ZzhrTFdtbVYyaVlOaFdNSy91NmxVSFBVdCtsREdKTFBBNHhPQUlLYW9P?=
 =?utf-8?B?T3pNbm1ucDRxczlidkc0anMvVVFJbUtFY2NpMStOTVJLUGNaNndFSTV5VGds?=
 =?utf-8?B?V0J1a0wvbUdIckpLbkRUMUdQRy8vdXExekhFOGRGOXRiWnBINGhrTWIwNyto?=
 =?utf-8?B?eElCbnpmd0NCUkU3V2dtOFZsaWRrU2RYdi9JUXhaNElWMlZWSk5WL2Vsc0h1?=
 =?utf-8?B?REZCTHdFWU1JVFI0NWpBNTVzRGxZNmpnU2gybkc4Zm5FOWlMOXJBUHRDOHNG?=
 =?utf-8?B?b1NSK0s3dWN5aVllcGw3ZTVMaEZpNzNTN3k1RkVRMHB3MTNiTHgvMnVJWlc1?=
 =?utf-8?B?d1huMWFzcS9oL0l5OGdvZms0KzZSL2VERkoyZ1NCdFVIa3V5Wkt3aWVnTEUr?=
 =?utf-8?B?WW9ZUWV3UTlPR3FwUkVVUlhCT0xLMGlSQm4rSUQyQ0tjTkJ6UlhKcVZJTXlz?=
 =?utf-8?B?YkJxMjQ4YSt2aktNMXNoNE9lZk0wRTAxaER0ZzR5eHlBU1IwZ0lPdmtpN1FW?=
 =?utf-8?B?QkRqYVdHcHZPVFF4SXo0UnBNTUpHRkdrRGVPRjI2OTI4d2ZlbTBKaEJybi9E?=
 =?utf-8?B?NEZZeWt5VThKUytmTFRleHljUnlES1RnR2FQNHBiRWRzUXhVNVkvcCtYUENX?=
 =?utf-8?B?SE05OWZ4SWt6QWxuZmdXSXpCcFNNR2JZeVcvM0hWbVJRUTRGc21heGxTZnFF?=
 =?utf-8?B?UytVbU1RM21OdWtrejZvT2pDVU9NYkhkL1E2dDU0emtoQ0xLb0Z2bldMRDNu?=
 =?utf-8?B?OStoWjRDQ3ZnYWk3d3BKZnRvNTlPckZGSHp6eU5uWjZ2ekIwSTBod2RDL0pz?=
 =?utf-8?B?cy8vc1dTTjMvdGNKYlVXdWNCc0pIM3kycUpjZCtQMFp5dlBDZG12aXpIM3pn?=
 =?utf-8?B?ejFhZ1N6V2lqYWVZaVA2Q1Q0a3FpcThBWXAzWXM5NjQrMEJJYkJ4VjN3OEd3?=
 =?utf-8?B?WWdwM1RyQ1N1T3kxblBWQkJZQlNDMTR3RExhTnU4bUlNcmgvSFJ1Ym05UUF6?=
 =?utf-8?B?S1IvWHJnTWk2VHppeWZ1RE1VOXJ1eUhyUjFOZVh3OUFuS2gxQ3M2VkF0Zlo5?=
 =?utf-8?B?c2ZlWmhydHBmRmpReWhOVU1laGtUcHBCdWJoWkNzZUpNWVNPaEM2VHlkRmRh?=
 =?utf-8?B?QjBLY1FvQzg1Uyt5QW1pQmVyNEQvaENtSE5jL0dDbEFIVGZ2WEh2aWpjSDE2?=
 =?utf-8?B?N2k5VGhreWhSTi8vL3h0SWt4bWkyQXFXU2ZTQ0xzbDg5MFVYRXNSclBTSmtE?=
 =?utf-8?B?QllROXJmbkcwbWRXa01JbmN0M1dxZVQvazFmOVRUN2xHb1FJcndTRHhHZXZK?=
 =?utf-8?B?dDBnaVJRUGQzSGN3cVdwMGMraldDT0NTYTBWMWN0UFJGZGYxQ01WS0dXd0dl?=
 =?utf-8?B?UjFoMG1TbEJreERZSE03bGRZUDRCd3JCeHY4ODFlTENMWkN3Y3VXdmdOK1BX?=
 =?utf-8?B?Zm1LVXJ1d3NudTVad3lBeEloUmNHWE04M2dadWE5dkg2bmNhM0E5YVhna1hv?=
 =?utf-8?B?OUpHS2l0NWdDd1U4M0h4ZHhpRDFZRU81K0NLK1M4UG40T1NsYmY1c1IwejQr?=
 =?utf-8?B?Qk95Z04yaVNyem1zYnZzMURicnlkY2pFR1dhTnV0TGY4aHhqTDVpL2RTQ3ls?=
 =?utf-8?B?REl1emlmeS9mR05UN0RZZVBvbUswWlF2MWJEb0ZVNlpFRVBLTWhaSG5NY3Vi?=
 =?utf-8?B?Mm9vRHNncC9aUFZhQ1I2ZWY2YXJ5NS9VTmc0S01YbnF1THZXam1KT3dOMnV0?=
 =?utf-8?B?NHdrK3N2MHU0Z05MQTBzQWlCaE41MjJPZ2RRS21MZUVlb01sbjZyWC9QMWJ6?=
 =?utf-8?B?ek05MFhuT1JKN0ZNS2hIdGpNNDRjUFhxbjFETC9FUEdrUEcvc0hyS0ZGMkhj?=
 =?utf-8?B?QkdNQm9VUkE4QWdTVzY2UWRseUp2M1ZHbnpFbW5iV3VGSGVBZUFlRVErbUQr?=
 =?utf-8?B?RkdWYlgyYU5zc1FONkZCNkI2bVdNc3VvRHlIWWpMTTJCd213dGFFRWdiOHRU?=
 =?utf-8?B?TzAwU0dUODcxTnNyU2tiTk04a0Y4eTcyTUNvTUg0VE9jVUJRVG1hUVJYYVhX?=
 =?utf-8?B?b1ppNmlha1hrTk9jMVBpNVZKdFkrUTFJZTdkNlpkNFFKV3JSbmRnL21mYWFY?=
 =?utf-8?B?NzlieGhpV21TSnVtRzg2L0dsdVhWOURsVVkrdm9sQ1RnbFN3b1NDUXMyWVRr?=
 =?utf-8?B?Rzc2alN4RDgrOExVbWl2MGpKZUFDUU5PRU56TmxYMGlWZUpqMVlmL0pFZVM0?=
 =?utf-8?Q?L2yQ4NoieVQMReJA=3D?=
X-Exchange-RoutingPolicyChecked: NoqYjoHIUT0LgkH/TsQ0CMVam+iiL/bEwKFWa57j3ZnGZOhUOSNUFagSOenbMM1oR5ZCW/xT0m+iDxJN8ARSax1AZVIVmZafilvxs6CG7J66e9QPdcL+7rOavQtgfxUwAWUxnvFVx4wcbWNVMhc9bavu0A0ZiOI97xWU86UDPSOmdIM9q9tTl7mshxO7cbeARd44NlHIbnFleYXsuv5SH8wBXAeCZGEaWbH10Nhrqo1tCQTiEEKbqLbUZn7ssEpC0CRab1z2drBOCwAstlkhrBYQg+Lg415I72OnOxhjedYiZz6Ohm4KuY95+NOPUxuj7dv+Sru8i31O8HJ7dp7qew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51542891-0b79-42cc-942f-08deb4bae0f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 08:53:06.8705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQlQ2vfzeNfVsIL8Ut7rx9YpXsPJhDAFBcnZuj3djQC5UDrn438QaMP9lI0hY5I8M6BE+9pwxoiofiFLDuACPWnZ3yC5oGs+1DAK6kW6cj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

--------------FJY4yPtXzGUXaUwf1hU03JL5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Riana,

On 11-05-2026 10:59 pm, Riana Tauro wrote:
> When a fatal error occurs and the error_detected callback is
> invoked the device is inaccessible. The error_detected callback
> wedges the device causing the jobs to timeout.
>
> The timedout handler acquires forcewake to dump devcoredump and
> triggers a GT reset. Since the device is inacessible this causes
> errors. Skip all mmio accesses and gt reset when the device
> is in reset.
>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>

Please fix Typo in commit message (inaccessible)

> ---
> v2: add check in worker (Mallesh)
>
> v3: add in_reset calls (Raag)
>      rename in_recovery to in_reset
> ---
>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_gt.c           | 14 +++++++++++---
>   drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++++----
>   drivers/gpu/drm/xe/xe_pci_error.c    |  2 ++
>   5 files changed, 36 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 355d69dc8f54..765e90f4220f 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -181,6 +181,21 @@ static inline bool xe_device_has_mert(const struct xe_device *xe)
>   	return xe->info.has_mert;
>   }
>   
> +static inline bool xe_device_is_in_reset(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->in_reset);
> +}
> +
> +static inline void xe_device_set_in_reset(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_reset, 1);
> +}
> +
> +static inline void xe_device_clear_in_reset(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_reset, 0);
> +}
> +
>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>   
>   void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ff47d233e8e8..65006491c378 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -480,6 +480,9 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +	/** @in_reset: Indicates if device is in reset */
> +	atomic_t in_reset;
> +
>   	/** @wedged: Struct to control Wedged States and mode */
>   	struct {
>   		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cdc678d1ae1f..7b547cf7de52 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (xe_device_wedged(gt_to_xe(gt)))
>   		goto err_pm_put;
>   
> +	if (xe_device_is_in_reset(gt_to_xe(gt)))
> +		goto err_pm_put;
> +
>   	/* We only support GT resets with GuC submission */
>   	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>   		goto err_pm_put;
> @@ -977,18 +980,23 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   void xe_gt_reset_async(struct xe_gt *gt)
>   {
> -	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe_device_is_in_reset(xe))
> +		return;
>   
>   	/* Don't do a reset while one is already in flight */
>   	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
> +	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
> +
>   	xe_gt_info(gt, "reset queued\n");
Can you combine it.
>   
>   	/* Pair with put in gt_reset_worker() if work is enqueued */
> -	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> +	xe_pm_runtime_get_noresume(xe);
>   	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
> -		xe_pm_runtime_put(gt_to_xe(gt));
> +		xe_pm_runtime_put(xe);
>   }
>   
>   void xe_gt_suspend_prepare(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b1222b42174c..288ca26f31cf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1522,7 +1522,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * If devcoredump not captured and GuC capture for the job is not ready
>   	 * do manual capture first and decide later if we need to use it
>   	 */
> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> +	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
>   	    !xe_guc_capture_get_matching_and_lock(q)) {
>   		/* take force wake before engine register manual capture */
>   		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> @@ -1544,8 +1544,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	set_exec_queue_banned(q);
>   
>   	/* Kick job / queue off hardware */
> -	if (!wedged && (exec_queue_enabled(primary) ||
> -			exec_queue_pending_disable(primary))) {
> +	if (!xe_device_is_in_reset(xe) && !wedged &&
> +	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>   		int ret;
>   
>   		if (exec_queue_reset(primary))
> @@ -1613,7 +1613,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_timedout(job);
>   
> -	if (!exec_queue_killed(q))
> +	/* Do not access device if in reset */
> +	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q))
>   		xe_devcoredump(q, job,
>   			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index b392014ff1f6..7d8c36bec7ae 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -22,6 +22,7 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
>   	 * Wedge the device to prevent userspace access but don't send the event yet.
>   	 * Runtime PM ref is taken by PCI core for the duration of error handling.
>   	 */
> +	xe_device_set_in_reset(xe);
>   	atomic_set(&xe->wedged.flag, 1);
>   
>   	for_each_gt(gt, xe, id)
> @@ -84,6 +85,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   	 * TODO: optimize by re-initializing only the hardware state and re-creating
>   	 * kernel BOs.
>   	 */
> +	xe_device_clear_in_reset(xe);

Why we need to clear in_reset flag here? After probe it's set to zero right.

Thanks,

-/Mallesh

>   	pdev->driver->remove(pdev);
>   	devres_release_group(&pdev->dev, xe->devres_group_id);
>   
--------------FJY4yPtXzGUXaUwf1hU03JL5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class="moz-cite-prefix">On 11-05-2026 10:59 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260511172908.1122252-21-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">When a fatal error occurs and the error_detected callback is
invoked the device is inaccessible. The error_detected callback
wedges the device causing the jobs to timeout.

The timedout handler acquires forcewake to dump devcoredump and
triggers a GT reset. Since the device is inacessible this causes
errors. Skip all mmio accesses and gt reset when the device
is in reset.

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a></pre>
    </blockquote>
    <p>Please fix Typo in commit message (<span style="white-space: pre-wrap">inaccessible)</span></p>
    <blockquote type="cite" cite="mid:20260511172908.1122252-21-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
v2: add check in worker (Mallesh)

v3: add in_reset calls (Raag)
    rename in_recovery to in_reset
---
 drivers/gpu/drm/xe/xe_device.h       | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++++----
 drivers/gpu/drm/xe/xe_pci_error.c    |  2 ++
 5 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 355d69dc8f54..765e90f4220f 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -181,6 +181,21 @@ static inline bool xe_device_has_mert(const struct xe_device *xe)
 	return xe-&gt;info.has_mert;
 }
 
+static inline bool xe_device_is_in_reset(struct xe_device *xe)
+{
+	return atomic_read(&amp;xe-&gt;in_reset);
+}
+
+static inline void xe_device_set_in_reset(struct xe_device *xe)
+{
+	atomic_set(&amp;xe-&gt;in_reset, 1);
+}
+
+static inline void xe_device_clear_in_reset(struct xe_device *xe)
+{
+	atomic_set(&amp;xe-&gt;in_reset, 0);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ff47d233e8e8..65006491c378 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -480,6 +480,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @in_reset: Indicates if device is in reset */
+	atomic_t in_reset;
+
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cdc678d1ae1f..7b547cf7de52 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
 	if (xe_device_wedged(gt_to_xe(gt)))
 		goto err_pm_put;
 
+	if (xe_device_is_in_reset(gt_to_xe(gt)))
+		goto err_pm_put;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		goto err_pm_put;
@@ -977,18 +980,23 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
-	xe_gt_info(gt, &quot;trying reset from %ps\n&quot;, __builtin_return_address(0));
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_device_is_in_reset(xe))
+		return;
 
 	/* Don't do a reset while one is already in flight */
 	if (!xe_fault_inject_gt_reset() &amp;&amp; xe_uc_reset_prepare(&amp;gt-&gt;uc))
 		return;
 
+	xe_gt_info(gt, &quot;trying reset from %ps\n&quot;, __builtin_return_address(0));
+
 	xe_gt_info(gt, &quot;reset queued\n&quot;);</pre>
    </blockquote>
    Can you combine it.
    <blockquote type="cite" cite="mid:20260511172908.1122252-21-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	/* Pair with put in gt_reset_worker() if work is enqueued */
-	xe_pm_runtime_get_noresume(gt_to_xe(gt));
+	xe_pm_runtime_get_noresume(xe);
 	if (!queue_work(gt-&gt;ordered_wq, &amp;gt-&gt;reset.worker))
-		xe_pm_runtime_put(gt_to_xe(gt));
+		xe_pm_runtime_put(xe);
 }
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b1222b42174c..288ca26f31cf 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1522,7 +1522,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
 	 */
-	if (!exec_queue_killed(q) &amp;&amp; !xe-&gt;devcoredump.captured &amp;&amp;
+	if (!xe_device_is_in_reset(xe) &amp;&amp; !exec_queue_killed(q) &amp;&amp; !xe-&gt;devcoredump.captured &amp;&amp;
 	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q-&gt;gt), XE_FORCEWAKE_ALL);
@@ -1544,8 +1544,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
-	if (!wedged &amp;&amp; (exec_queue_enabled(primary) ||
-			exec_queue_pending_disable(primary))) {
+	if (!xe_device_is_in_reset(xe) &amp;&amp; !wedged &amp;&amp;
+	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
 		int ret;
 
 		if (exec_queue_reset(primary))
@@ -1613,7 +1613,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!exec_queue_killed(q))
+	/* Do not access device if in reset */
+	if (!xe_device_is_in_reset(xe) &amp;&amp; !exec_queue_killed(q))
 		xe_devcoredump(q, job,
 			       &quot;Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx&quot;,
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index b392014ff1f6..7d8c36bec7ae 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -22,6 +22,7 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
 	 * Wedge the device to prevent userspace access but don't send the event yet.
 	 * Runtime PM ref is taken by PCI core for the duration of error handling.
 	 */
+	xe_device_set_in_reset(xe);
 	atomic_set(&amp;xe-&gt;wedged.flag, 1);
 
 	for_each_gt(gt, xe, id)
@@ -84,6 +85,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * TODO: optimize by re-initializing only the hardware state and re-creating
 	 * kernel BOs.
 	 */
+	xe_device_clear_in_reset(xe);</pre>
    </blockquote>
    <p>Why we need to clear in_reset flag here? After probe it's set to
      zero right.</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260511172908.1122252-21-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	pdev-&gt;driver-&gt;remove(pdev);
 	devres_release_group(&amp;pdev-&gt;dev, xe-&gt;devres_group_id);
 
</pre>
    </blockquote>
  </body>
</html>

--------------FJY4yPtXzGUXaUwf1hU03JL5--
