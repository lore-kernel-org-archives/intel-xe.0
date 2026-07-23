Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD9AC531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7872010E5C7;
	Thu, 23 Jul 2026 16:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdjWMPDw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0BB10E5C2;
 Thu, 23 Jul 2026 16:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823392; x=1816359392;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V2Ck0EWndsmaKcTiekITGNlE/xZK1boiSr5xYgF2jHE=;
 b=kdjWMPDwGqUeH7BlhhYg8m+kjZfGTO/wKGjCy8oyJk/fetHOFP/rOuAG
 +/s1zxTuxdGkNVMYXL2+Iu9/D/dHsfY6wljKKlb0LCYChfNF3friHxd4M
 YhQUwgBBEeISZqToabYMBtmmDdCWTPOker2wU18VvrcybQw74PEkHbpay
 LbM9Kp5OiOpu3A5sj+hpxS4DU0doCGyKkwms88/BFySlZeWx3QFYfnzFs
 eZ8PfNXIz6osHyDSIv9kb0BDkPAmBUwj87HTP6STJCH5cyvmiHwHk0P0d
 F+Ob58TS8c0Ojxk0AGvJrcazriUV7XyNsUwH32FwaeTy44NQV/ZeLL6Xo A==;
X-CSE-ConnectionGUID: nK0GPFZySFq4A6LajKuRUg==
X-CSE-MsgGUID: HfPKcjjjSoq/jvBUB751Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85601950"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85601950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:16:32 -0700
X-CSE-ConnectionGUID: k7JTeW/vSEGRVIdbSuq6iw==
X-CSE-MsgGUID: ePMl8bENSJG3NyNIEebYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="282960308"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:16:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:16:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:16:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVuyZD6NZbcNIjcQ84AElV6ZZgZVosy8tDnbQFZDt2jz6YZmwlhnjm7lJ8keXNNa6kG0pA7EKp73aNju2Z4/XiOKmBIGRnlvfr9k2zunTlZMkBq0Lf3i01/w2NsMemn4acp451dSLPyVZgl2uTa4nWvgoljbRK3i7CJZI1XQBnnLy3hCBwL5Pcd7qMxogg/6Chmp57xIBdG/bppghaMfVkTybSfz0pWstcco1u12LycznS5Trwjxbx0LhW4Hu47WeytqGvcK2y2V2dcGcbu+RZMqDalRd+ELLi1BCEmEtqkcPoTDfu2wyAp4AyBNXgv+jEb3gqek1jfl4u1biJ5GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXhv/96dpj7sSbwcyPH3gFIUYyt4s8Je/3fEGudIAXs=;
 b=ptKkMDPDSjYqgi63/vW6cooUJZmd3SvGWjA5RzRGxQ6xDqJXOoyhsTNzxZHaKfQgejfAy4jbxtMJWo7ZAkBQU3ylQNm8nb7gb4vBj04w39XQ3H1f1muwoct4ycuQbUqPFHJ1BRJk1xYgMgJpITFcqSXNKnMrqUJDt2uhWnME/F/z1GEATtAcvUHv8+f5cyuCDZ5z4MvIx/KU0tUAxm4Tt5Xl29qNroGA9xA3fEmpvwaAXsWFnSsv6vrm6EvVB2o/q/iB3y2BzSGdjm5qRZv8SIlYuRjf9Ryscscn8WeiHx8MbN+/FLhBQsdxBS+/ChNmmoPcrct8m7angZBahaG82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:16:28 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:16:28 +0000
Message-ID: <b7b7c054-1682-48f4-b911-2450a816939d@intel.com>
Date: Thu, 23 Jul 2026 21:46:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] drm/i915/vrr: Restrict CMRR enable condition to
 VRR-TG-default platforms
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 267e5ef3-4acf-46be-95d5-08dee8d5bfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7N3lskLnKaKup9U7ylf0UDzZEwCAqLzOQ6nUf3LHLVPWrva3vudwjdSk2WfjaASj1vmwZD59OQ9iyqVNdiyIAGGt2GUjL5DGHJTQfFFwNe/v+v1mEU5LpZ1LGbKzqxzcY5q18u7AfT5VotHbuLS5R+xbpN6PlHtICvg6MMq+tJFHAIqaXcsaMiiBVwMRutYGBmh1zgefnPESrMk9N78MgnqQPRTAhGCMza5JhLm4GEk+OEYEz+1WavWd1I5+PT1VTXqGxPwhGRc8zYyHUpwV6Za2vSBX/MK79SIDECVn424l4S3tXV7nRUdEdXsVMGZpxQ7CKND33d0useNJOUprP4ZyxSS8O5jozKmRbsTNq1G2wClwfxJaxe/SRZYdgCoitSISt1oJTVjV+VfsudDxibGsaQnkBnEbktWz3GYKtjX9wvEKVdAz143XUYXfqn+S3eg7tZmDxzgbq9CMQ24/85rqB5pTrIJGct9McwaHpW9yXFOlKf0Z5dujtsu5vguVkLpsnl5n0lF1qOrQvtxg+OvpO/mnfju9MYNDMrXJzvMwHcIglx2G4SN/Ux8CDN3WnpM45a2mLq0nXfoI5lNcNvv/yvOEFxMnJEbrKdAJ4nw4MsccpUVo0rZZ/3NplrSZBIob2Wosc6T/k1JpklonqBh9Pq7WF+EHiaVcZNoGzl4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE5UcjJ2RTU2amVQOTB3SFEzM2kwSC9SQ0Z3OGtmU3dtdWJucW8xZzYyMkp5?=
 =?utf-8?B?K1dkMExjRXA3alRrdXBqYUFGVUw3TU9JMDI0RWFWZ1pyRVVENXRIRlJlYy94?=
 =?utf-8?B?SGdiaUV5akZtaXAzK3pVY0tXR2gvZGhqdE1SaGxIc2dyd3JYU1QzMys1M01v?=
 =?utf-8?B?NU15MlpSUms1T3NnQkNCTXZacjBrTWw4K3h4b2J0eFlxeHJ1UnpxWEQrZGEx?=
 =?utf-8?B?NUgxejlDU3hUcGNHSU11Zi9CRTcvR0hwRHhIck9hbkdadGQ1cXhPVitKMVQy?=
 =?utf-8?B?QkN3Y2g1RHE0TVQ5d3FmOERTQkNqQkx6Y2FqZ2NCeFQ0RkM2ekdVZ1NGclQ0?=
 =?utf-8?B?V1pUSjduTm1RM2JxNXUwRllYUUhMYUZWZFlIZzlCZnV3YytLNGdJaFQ1cWp5?=
 =?utf-8?B?ekt0Y0c2K0VDM0cvY3pHQk9pODlibzJtT2w5WXM3RndvQzFmdmhxS1ZTWEFH?=
 =?utf-8?B?VHlWQTltckZzWnp1aGJ0NGpPSkt1QlZZY0RLU1pweEVuNFZpQXZkb2NHanB6?=
 =?utf-8?B?N3QxbkEreFNWMXJTTE5TMkNxSHhUR0xwLzY4SUtRQ2V3UWxFVU5qMDVSVmw1?=
 =?utf-8?B?MFFqck1vLzA0TGFNdUxqdzZvRnRMcUljcGdOWHBSZU4xbUUwZ0d4dkJPaDN4?=
 =?utf-8?B?QU1lcE1UZnpHWkR6Q29UbnZhOHhGaUtRMWNUZlpPeVduU1ZvdnQzaCtvaFB1?=
 =?utf-8?B?NXV2QVQyeExMSXBDeHdLVnJLNEpWWVY0MVRreTdUR2lWQXFQRkx5RlNvak44?=
 =?utf-8?B?MXNxOU5keHovVk9QeWhmV0ZESmRKSFlQOFdWZGc0WEZiWi8vU3MzbTVlUzA4?=
 =?utf-8?B?K0dLdUVtNElROHZSUEM5NEVwaTZkdW9jZWdxNVdySmJYS2FIQ0dQTVhJZjJI?=
 =?utf-8?B?WHl2ekRpckdvTXA4VGFnbXBwSW15a1JLUUpQVVFKSE1qS25yYlpXZXRrVjdH?=
 =?utf-8?B?c3drWDZYcUtCMmlyNFNKYzB3bXh3Y05wL0ovUFJoMG1aYy9abTFlcGJWYjRN?=
 =?utf-8?B?VGE3aFVlQmZLa2V6c21FQnROeTN2OVozVDNMZmpHanE3b3o4VXhNU2UzQVVT?=
 =?utf-8?B?NmZEa0ZwSngzZnJDcitqOGpNN0lJTXJWQlB1RXpXUHVyVUNrV1h6NG50WFZh?=
 =?utf-8?B?NlpyU29jdmo1QXVQcTRsY3gxYkIyZGREdmZWazl5blZrQVpGQmdZbDMyMmNo?=
 =?utf-8?B?VzFWTy9XU1ZVaU1OS3BTTlZVaEZJYUdhWmgzU29Ea0Zjc3NrTzFIdE4yWVRx?=
 =?utf-8?B?cVo4TkdtS3dvaGZOM0ZjdlhSVWo2Z05LK0tiWnEwWnZCcUFkMFIwekNDSjdL?=
 =?utf-8?B?STZwZEt1N1hMWHlPYVdLK2tXcEhsMHlVYUJXZnlWa3BYQWR1WjgzNTJLUWVs?=
 =?utf-8?B?U29FUmN1WjR5T3p0MGFnOUdPTEFvdmcxRmlsckdGYnB1TEFIN1grWkN0WE5W?=
 =?utf-8?B?ZGRad1ltckwrSGlBMmovWTR5U1A2Y3FvOGpobG5TZGdEMU91RjgxUEUxQ290?=
 =?utf-8?B?VHhYOUkxNXFPYWZoWUZvR2NqcWd3VUExdHNuakpIWjhMYmhRZXZDWTVRSUZ1?=
 =?utf-8?B?TEFlMWh5ZFFTaTJ5WHRSeTN4VVo4T013MEk1TDZ2VTBPOFNPNXorMWdYRGxv?=
 =?utf-8?B?aFJHbjR2YWJrd3F5YXlEN0lBQTJMU2VCWXpMNVZqMGU4d3dtT05WNXk2d01x?=
 =?utf-8?B?c1ozc1FFRjBOUHVmTlUyR0dqL3dSUE53bUFjNGtTa0FnRHV2M3pTdmdJRS9k?=
 =?utf-8?B?aFJpcGJDcmJxb0FwWW40eG1iY3RJaXlZOHlZRlduRDBBNHZxSTJFenVkeERD?=
 =?utf-8?B?UnlSbU03Q1BvaTBiOEF6Q1BkSGRDVjl1OUZEdFhEWisyUDNrejFHOFdsM0g2?=
 =?utf-8?B?SUV3RjlkQXFaYWI3akkrdXdVenNFSGVzWkE3SUJXMW83Zi91MXZONk1uUTBt?=
 =?utf-8?B?WUJEUFBVRmVJTmQxMlZXd0Q0QnlUakE1TUQ2TEVJUmVGdWRNQXFhSi9EMUNi?=
 =?utf-8?B?U1FUalhjMXB2SEdYUkQrU0VPbVlCeHh4VmJIRXJHMmtCZW45N21TTmV2TWVC?=
 =?utf-8?B?TXRMbTNkMGhSYnFvK0k4MkwrRFpCK3dxZzkvREc1U3pzUmNtTGE3bUxTeHYr?=
 =?utf-8?B?bXJ2aC9pUi9wY3ZNNHhhbVl5ZG5TTDlYNjRURkMvQ2xDMEl4VXdIZE1Odkpm?=
 =?utf-8?B?M3lxWWNRTG5IUXlMc1B5TWRzWkVUcHBkdXN2TkFCUkVFb1Z5UHBRQk5NRkZs?=
 =?utf-8?B?SXFSOXJtdi9xM1BwUlBob3EzQW1TM0ZERXNveGt5dGFUOVBhZVB4ZEtvcnFR?=
 =?utf-8?B?eVg5MThETGNjMGJEdDN4YXhPZWFsSlRzLzRxb01vZERyeWFrZjNLa1Z3SnNF?=
 =?utf-8?Q?uDdu+a0MqRtdRy+w=3D?=
X-Exchange-RoutingPolicyChecked: Q0LRkN58eiKzIUlMi/CC4M1UZ4YizocmwoA1xpoLn95Vt03Dl5v42wjSE7ZsGRq5+NRF20qjRO8T73shWrrK76c7eZGIKiHtVul1kydHloewv5iMnNJEwwXEVcPo+y+zMCdws6IiP3GfYFGG/aF1gIKU8Wa2MuOifk/IpY/f42npP9J5+sowBgNAbcKDd7DezCgkKJe7SS9awqHg1fFCRkThgk61MWrHoXAEKRyY/o3G5Oani/Avbvmbd9lswPSFhqRHdyeFfgNdRRkp11xN7DF+Uni208J4GttzkZShSCCzyhU3z7pAfIoVvh7RXWxbLOpTDpOFTEeO/sweL2saAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 267e5ef3-4acf-46be-95d5-08dee8d5bfd8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:16:28.0607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9J/uVlPNhAjcOab/a2RMt/QjkdgAKWpr44FymfrZkv2KgDBdjCpG0D2p/qNvjQzSYBWmcYYXe0AZe10ic6rftB3CcT0CYwjAwa01kIB8MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> CMRR is reported as supported from DISPLAY_VER >= 20 (HAS_CMRR), but it
> is built on top of the VRR timing generator running as the default
> timing generator, for now this only happens from DISPLAY_VER >= 30.
> Gate the CMRR enable condition (and its readout) on both,
> so CMRR is only ever enabled on platforms where the VRR timing
> generator is the default.
> 
> This is a preparation patch for the upcoming CMRR enable sequence: CMRR
> remains disabled for now (the "avoid CMRR" short-circuit above is kept),
> and this only refines the condition so that when the enable sequence
> lands, CMRR is correctly restricted to VRR-TG-default platforms. This is
> in line with the comment above, which keeps CMRR disabled until VRR with
> fixed timings is working.
> 
> No functional change.

nit: commit message is quite of obfuscated, can be simpler.

> 
> --v2:
> - Create a separate function to check if CMRR possible
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 51e4f3309b8b..14f8ac07c911 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -187,15 +187,21 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
>   	return intel_vrr_vmax_vtotal(crtc_state) - crtc_state->vrr.guardband;
>   }
>   
> +static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	return (HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display));

redundant outer parenthesis.

With these,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +}
> +
>   static bool
>   is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
>   {
> -	struct intel_display *display = to_intel_display(crtc_state);
>   	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   
>   	/* Avoid CMRR for now till we have VRR with fixed timings working */
> -	if (!HAS_CMRR(display) || true)
> +	if (!intel_vrr_cmrr_possible(crtc_state) || true)
>   		return false;
>   
>   	actual_refresh_k =
> @@ -1066,7 +1072,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   	trans_vrr_ctl = intel_de_read(display,
>   				      TRANS_VRR_CTL(display, cpu_transcoder));
>   
> -	if (HAS_CMRR(display))
> +	if (intel_vrr_cmrr_possible(crtc_state))
>   		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
>   
>   	if (crtc_state->cmrr.enable) {

