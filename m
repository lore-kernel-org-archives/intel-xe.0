Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899C9C3600C
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 05:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E58910E972;
	Fri, 28 Mar 2025 05:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5GdbLUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BD210E972
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 05:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743139626; x=1774675626;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s6998U+oGXJ5Y12ycP9CkF1qwmYMT9v7ycoRncKKiUY=;
 b=L5GdbLUIfq9NqTRLmFChRSvytbwTsqCCoQxc0UQ1SbSdwG8YVD2ig3hS
 OwD7yXVj2uaH87UiKniGXFxuCcSIUfOI6mvxI/HEpxXoo/XoSqOQmIu9o
 CiWjQ7gwQ7E9xRycmmxlj64FgNcvRtcllssH0g9+jJFyan8W4428jw2QM
 PZ+3uU7JdYiMvn+by+wNbbYkmYua0mciQQUuid1IkLBCkXTlNjirerfTx
 c7j+9l+TDKSWfgDosKwrfVK9qhAR3n8woFnlXeape3+d6UkCG7B1Ox0Ap
 PexyY+neatylGYsrwaSx8Ut2UatyIfmNdvMf24a9CH4wXR63yU15RrsTi Q==;
X-CSE-ConnectionGUID: xk4u/4u+QXicnKK23rw6TQ==
X-CSE-MsgGUID: G+IK9LGySou+rp/IeBO7Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55493146"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="55493146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 22:26:59 -0700
X-CSE-ConnectionGUID: rkkVxfyIRRyPrCMW3rDUjQ==
X-CSE-MsgGUID: nVlQuL3/TAex7LtGYBVeqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130566219"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 22:26:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 22:26:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 22:26:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 22:26:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsGb3pLDwbieUi28zg6vOtnQLbkMvZ67kim4+ECypF1vyzR7bxQ3sUOFwBnMQEOJhri1cfa7l6w3gdjPmgEkvxhjy0TcEgoMboZKCvQO95RS4nOLhDX9/m9/tzPUsTNOdnwCX6KaF9yuaS4J7pGQTg5e/ZNWz2kFViETyzBrwBxBFX1RBbH3srOfFBzAoXA1qplV6ySSKimBeYrY3vYt3I5ROaX1DjZbmyFNrR7dZGcP4tW4K4n449EFd0pdO89p/uyd+FTduZEE4SEBCC12bafwEPyY9xOCILFEuz5TLJRqkMXQM+PwizOLjMuWDy3DS30njZusiCf9AthVROSIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImenX/d+dPVVMadRzH0o0wGAN0FwgotCnzHDS5Z7Ox8=;
 b=FrKwuwmrtfI55st7sJzdXcs81Lg09ozSNCnRNvCBf4a8ChowzrLYyzPQ8uy4sNuUTUVWwvUC5jdLFEUCKTnUqz/PKMZ2W+VnR8rPu7CEfML/fHtGgvq70hINp+n3hpscb+W51WrWwpRImJugWd3rzWkm76SKbPy9lus1t2wY36GnPJMoQQBsyaX0VBM6fU4YIKbfrh0ju/CR8yWvlYhFB+Tz0Kh3Ma6DE8TATkySOHEkETEMDi+ErJGgNUh3g+8O0BVP91Y2MzA9rcwwQ4oD5L6diiP6iBSSe9+RyM75QCSbpERIsDXnvJ1xCRfdxIWgk1Sx6e0t1GH/KQKqQ3VR+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA4PR11MB9250.namprd11.prod.outlook.com (2603:10b6:208:56e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 05:26:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 05:26:50 +0000
Message-ID: <f57a62cc-dee0-4935-87c6-aebbdbc2d3d8@intel.com>
Date: Fri, 28 Mar 2025 10:56:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/xe/hw_engine: define sysfs_ops on all directories
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20250327122647.886637-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250327122647.886637-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA4PR11MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: de1fd8f0-b082-4991-32a2-08dd6db92487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0xjaEVGdU9UdDJtcEN5dXo5VzU3RENMcXBNM3R4MjNxQVhjcU5WekpzVERL?=
 =?utf-8?B?RUtiaSs2bk5vcXhyaTZPbEFjS1NwNS9iaG1GODNjeHRoekIzRWFjRGVTd29n?=
 =?utf-8?B?TW8va3JhUUVYY0J3dklLZkQzZ2h3cFlNYlAweG9hcTJoT013c0hyaTVtYytM?=
 =?utf-8?B?eHM1dUNSWWFFWjBnZ3ZxbGVXUVBvYTBKRU1hQ3FZSDlrclB4eWNOWGYxRzYz?=
 =?utf-8?B?UTVlUWxjTlkrTVUwUU9XY1JYSGQwUDZVdjRiODVqMUN5Zkl4WUR1U1RmM2Fx?=
 =?utf-8?B?SFRnem1WVzdZQlFqSjRWaWNweThyWGIwQ05DWFQ3K1hZNkNFWGdkS3pvaXEz?=
 =?utf-8?B?Qytrc2NaaDc4THFaTUM5ZVhWQVNDUDRZd1NhZ2g1U1N6TGFndTZhVVM1aEhK?=
 =?utf-8?B?TWVQZ29Cd2ZWUWt2Q1g2YWZpSk5aS2kwdkF6Y1lVeEU1QjhZcjNpaEx4eXpx?=
 =?utf-8?B?MzNxblBITjBQME02MmZIcVJKMDV3TlhTM0pkV0o0bzYwdVdrZnQ2aEZnaGNp?=
 =?utf-8?B?ek41VDB5ZUp6N25UVi9oSWxGSGNxcjFtK1l5RzBSZ0pkRHoyY01VUERiVEw4?=
 =?utf-8?B?SHZBempVZkpIRkxlZk1ZYnBUQ0RLOTgzanhteVVYOEliT1kvWE50YklraDFO?=
 =?utf-8?B?VnREcndxUGJwNTRtRWtCZmpCbXlaaldjSHd6N0U0MFlkVGZ5SnhZaWdlR1pM?=
 =?utf-8?B?OGtvbERFSE9jVk9mckJ1QlRkOXN2NFdYNFBVRWwrS2RnQmNZWEZKMDdTRm5x?=
 =?utf-8?B?VDZSMXdMTGVEVC96b2w2MWpPeVRUbEI0aWNQMUdGbklCRlJMbFFIZ0NhY2sw?=
 =?utf-8?B?YzF3aTFodFZ1Z0xveG5QQ3d4c2xTSFJteHRDZUZKeFNuYVczU0hzMC9IQWtr?=
 =?utf-8?B?dlBRQ25LZzllK1ZqRjhEM1lUUDdsMnVFVGNqbFdCejB1SmJMWXV3c0U1bVVs?=
 =?utf-8?B?TG95UW1hRlZrZ1NEdjZEQ0xFeWd6WUlkeHM5OWh3aUNJMXJpTkUrdk1XRU50?=
 =?utf-8?B?OUdWL3lRMmNkUGo1SHNFUS9pWk1iZjhVa0tVTkNkRy9vdVlCdnF1Z1dVUjg1?=
 =?utf-8?B?VmViTHRzQjN1SC9oMC9EQXF6NXJ3WEhaWlV6OWlwSmNaNlVNVDRzc2pXOWhE?=
 =?utf-8?B?aG9QdFNOVGxtaGxxMnRyN3dwRUdabnV6Z0E5eSswSWQxQmdua0UvSWw5NjF0?=
 =?utf-8?B?NGhTS0I5TEpnRlVaRVJYc2sxSjB5a2kzNGZJMnByTGF4d3lrMGFjN2xONnFO?=
 =?utf-8?B?dmdnTk1ES0xrNEF6S2FrNjBvSWIxc1FHamNCRGVNK0E5amlNa3dyL2tnMzFV?=
 =?utf-8?B?bElOSEdhem9tVDh4QUY1TWpVUDlkZWxYSWVxeEZOY2dPOHRIeFRnZ2JaWDlT?=
 =?utf-8?B?SlQ5VXFnWWNLMlkxSkM2QkhmYk9KZC9LWlpEU244d3lRMlphbUpodjRmenlu?=
 =?utf-8?B?ZXFFZ0lSeFhXRG9IcG1ZdlNZVS9YNjg4RzFoQzVWQXk4dWZLV2pGQUxVcGtT?=
 =?utf-8?B?aTIzUElhVVZqSEhuOUJDSUNrWUFuOVVJR3pBU203RytXR1laaVo3d3l3ZHFT?=
 =?utf-8?B?dlRacTUxZE5sZGZpWXA2aDMwWHJWbmVXRi9RWVlITkZXaTB4c1g0dmdydlly?=
 =?utf-8?B?dlRIYmFhZWdlV2dVN0VjcjFrTHpBY0VhcGt1UlVJbnJhQVhWb1ZlOXVRODlT?=
 =?utf-8?B?Wis5ZDVDeHhDM0o1ZHJLOEVna0J1UHNtWGxRWXlaNEVYL3ZSMVRQKzRjaXk2?=
 =?utf-8?B?bjBLWHYrNW5INWNwMXl4S1BQMk15akw3eXh6bWRRWUZtL1hQM2NOZm9PTWNx?=
 =?utf-8?B?YlhkRFRla1FlN3lMekJHTk1IQTI3amE1WFZkUUI1VU5kMDJuTlZqZEpzZnV2?=
 =?utf-8?Q?bzhtQ0JgMrKIc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZqcWxBalUrT3k4eWpKNXllaWpqelZIM1h6T0pCbGcxT0k2R2VUVXBSL055?=
 =?utf-8?B?bXdkRVNlaHp2YkE1UE5neXZmQW9QNmpLRGxDQXhyRTViYlpIcVhyNXFyUVBB?=
 =?utf-8?B?aTJ3bktqNEpjSUJUcEN6RFdlOGkvNTNmK3VDVnRETlBuMEZVZmU0d2M2WE5p?=
 =?utf-8?B?QWliS0w3emxGTGFyNlg1T0tMUGlmdXNIM0piZzJuSXZwMkRObHZ4U3JGQURX?=
 =?utf-8?B?K0w1cFdyVmc3SWhNcXlhZnFDdGdSdzRCczBVdHJpYXQ1VmlMUUVoSGhwZzM3?=
 =?utf-8?B?MllHRGlaSEZScUdxVDJrNUpWK3poYmdjckxKOXF0R0JvaldtaEhMTVU5SERi?=
 =?utf-8?B?WFlCanY5RVpXTi9LYm9oS1JiTzd2bE05N1JKYUpWT1lhWE4xRmZqODluaTk1?=
 =?utf-8?B?aUdmaHVMVWlOV09vaERjdVEwdHRTc1ZXdFF2OWN5YnRxb0JXWG1IR3Jsb1RO?=
 =?utf-8?B?b0dtelNQRFpUSmRyZFQ4WjhNMUNtbng1MnFQb0g3N0NKMWpQdE9LMGpBK2o4?=
 =?utf-8?B?ekttSU02YWUyQzRHUU5ha21jRHpVYUs5SWM2aTVhdlFzeEZiMWFDYmlRUFNv?=
 =?utf-8?B?YUIyR3VnWG1VcHZWaEcwaU9lT0c0SFdBZWlZQnc2ZmpLaUFvZU1aZHorYW9V?=
 =?utf-8?B?R3o5NTVSWk4yb1BiQzhBT2gzem9vbDBkNjdqZXpFeXlXaU1LeDVPN1d6QThD?=
 =?utf-8?B?WHExOU5RcmorNGpvZ2lqUWVyTmJrV3FvNmVoUXZ4TmpJdi8xeGE2TlhMc3c3?=
 =?utf-8?B?dUs1bVh0bmlyRk5Rd1BncW8vTWROS05HNjZpRVJ0MElocWU3ZmNLVXExbXdq?=
 =?utf-8?B?WDgyYkZmL3hHR2JKN3h2REp6bHVYQkppZFRVb3dObUpuOUV6YVFIOHNvTkxD?=
 =?utf-8?B?SGNXY2lTUEFWQnV6UitOYmJhVzBKdWRuODNCa1dCYXcvUXdvSW8wVzlFd29C?=
 =?utf-8?B?bFhhWTFiWEpjRGpBRkZVcG51dnBTM1hpcytBWXk1VURmYjE3V05EamtuM0g1?=
 =?utf-8?B?SDIzUjhmb1JNS2xOa3dWcC9pZ2wrVkpHNEIxRk1GdnRjdS9UVE15cGVaNU1F?=
 =?utf-8?B?d0JQN3JtTHlYNWg1cTcvMmg4RlRkYncvdlZYTTcwNjhjQ3NRNUM1L2djSWxK?=
 =?utf-8?B?U0NOME5WNDM0cEdPUG42WnJYM3l5SDhUZ0RPOWVTaVQrdlhKejA5UVBIYkFi?=
 =?utf-8?B?MnlqMjgyT2FPVjRicnZuSUhJVWZQS1ZyUnpwZVhyS2pXMXErUGJjUlR4SkpY?=
 =?utf-8?B?THY2bVZlbzdFbGZTOXNzSUt5K0ZudStVMkZjSmlFMEZyK3BvdEJkdHQ1eDlF?=
 =?utf-8?B?bkdmaGtsYWNaTUNIUXZvaUlDdTh6SGQyUXBZL1N3VlpPaGxMSjJZWEU5S2xP?=
 =?utf-8?B?UmJzdllnTU9lcjl3YVNJNUJFeGxoa2FWRU4xdEZjMklqQUxCeUdtYmhZMFhz?=
 =?utf-8?B?NEtQNVRURC80VVBkUHUrSHdTQ3VGTlJUbWJWUDh1Z0Yxbng2U3ZlbkFGc2Ez?=
 =?utf-8?B?cWI5VjFQdjBNNE03T0Z6NWtqTEVGT25zRkhFWjIrM2x3UHZyQTlGSlo4V2N1?=
 =?utf-8?B?bk4xeko3cWdXUmcwRWhzSHE5Q0ovWkNuZ2lXNU81TThwT1NENUgwWDIrK2NN?=
 =?utf-8?B?Q0tQa1o3YlNBQTgyTXdiMHluSktVUWZXVU9UNDdIanJCWXpCK2xsMXdRWFoy?=
 =?utf-8?B?S0U4VUp6VmNqNDk4bmJWTEJqcmpCeDFwa3AyWlJ6a2RYQzlnSDdPRURleFFT?=
 =?utf-8?B?Z092MkNnNUlraGNlS0FXeGN0bFZXc0Jxd2x4cmJYUUNTMjhkTHFSTytxcEMx?=
 =?utf-8?B?MlQ5aVhBRXZhcEd6dzRSRFZDc09UMkZqa2xia1FwQ3JSK25EQndkL2FUQUNj?=
 =?utf-8?B?bnNnVmpJTG5hZVJhVTQ0VENCNFBUL2kwLzZvL21hN1IydGxRK0pPUWMwMHRw?=
 =?utf-8?B?dmpWdmljclZlTUFxek5PRGtSTEM5NnJiOWl5LzY1d1UvTlBQVk44OGY2N1Yr?=
 =?utf-8?B?L0hoSytxbnQ3SHZ3VW5CMUtxSUZuRldSMFNNUjJhVURCS3ZWVnBLeld4TWVU?=
 =?utf-8?B?RndMWTAxZFYzSmxkZmFVNWJXT0YzcGNqbEh1eC9oSjBQOGhNVHhUM0lNeFpv?=
 =?utf-8?B?VGVudUlXZnhYam1WQldFV1MvcG96K2lpZFRMeDJhNXZUQnN0L0p2UVhxZGRu?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de1fd8f0-b082-4991-32a2-08dd6db92487
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 05:26:50.8882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vINCGwxyn0CsnZrQadrM0zNJDg+XjNrFEl070e+tVB/YQr/TQWFk1FPsXnLfWX/sxoMg1ooERKr0v2eMAHByMAmUu7o7Y2Ozu0rOI75RHzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9250
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



On 27-03-2025 17:56, Tejas Upadhyay wrote:
> Sysfs_ops needs to be defined on all directories which
> can have attr files with set/get method. Add sysfs_ops
> to even those directories which is currently empty but
> would have attr files with set/get method in future.
> Leave .default with default sysfs_ops as it will never
> have setter method.
> 
> V2(Himal/Rodrigo):
>   - use single sysfs_ops for all dir and attr with set/get
>   - add default ops as ./default does not need runtime pm at all
> 
> Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 108 +++++++++---------
>   1 file changed, 52 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index e238c0e9fdd0..640950172088 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -32,14 +32,61 @@ bool xe_hw_engine_timeout_in_range(u64 timeout, u64 min, u64 max)
>   	return timeout >= min && timeout <= max;
>   }
>   
> -static void kobj_xe_hw_engine_release(struct kobject *kobj)
> +static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
>   {
>   	kfree(kobj);
>   }
>   
> +static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
> +						  struct attribute *attr,
> +						  char *buf)
> +{
> +	struct xe_device *xe = kobj_to_xe(kobj);
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->show) {
> +		xe_pm_runtime_get(xe);
> +		ret = kattr->show(kobj, kattr, buf);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
> +						   struct attribute *attr,
> +						   const char *buf,
> +						   size_t count)
> +{
> +	struct xe_device *xe = kobj_to_xe(kobj);
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->store) {
> +		xe_pm_runtime_get(xe);
> +		ret = kattr->store(kobj, kattr, buf, count);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
> +	.show = xe_hw_engine_class_sysfs_attr_show,
> +	.store = xe_hw_engine_class_sysfs_attr_store,
> +};
> +
>   static const struct kobj_type kobj_xe_hw_engine_type = {
> -	.release = kobj_xe_hw_engine_release,
> -	.sysfs_ops = &kobj_sysfs_ops
> +	.release = xe_hw_engine_sysfs_kobj_release,
> +	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
> +};
> +
> +static const struct kobj_type kobj_xe_hw_engine_type_def = {
> +	.release = xe_hw_engine_sysfs_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
>   };
>   
>   static ssize_t job_timeout_max_store(struct kobject *kobj,
> @@ -543,7 +590,7 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
>   	if (!kobj)
>   		return -ENOMEM;
>   
> -	kobject_init(kobj, &kobj_xe_hw_engine_type);
> +	kobject_init(kobj, &kobj_xe_hw_engine_type_def);
>   	err = kobject_add(kobj, parent, "%s", ".defaults");
>   	if (err)
>   		goto err_object;
> @@ -560,57 +607,6 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
>   }
>   ALLOW_ERROR_INJECTION(xe_add_hw_engine_class_defaults, ERRNO); /* See xe_pci_probe() */
>   
> -static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
> -{
> -	kfree(kobj);
> -}
> -
> -static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
> -						  struct attribute *attr,
> -						  char *buf)
> -{
> -	struct xe_device *xe = kobj_to_xe(kobj);
> -	struct kobj_attribute *kattr;
> -	ssize_t ret = -EIO;
> -
> -	kattr = container_of(attr, struct kobj_attribute, attr);
> -	if (kattr->show) {
> -		xe_pm_runtime_get(xe);
> -		ret = kattr->show(kobj, kattr, buf);
> -		xe_pm_runtime_put(xe);
> -	}
> -
> -	return ret;
> -}
> -
> -static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
> -						   struct attribute *attr,
> -						   const char *buf,
> -						   size_t count)
> -{
> -	struct xe_device *xe = kobj_to_xe(kobj);
> -	struct kobj_attribute *kattr;
> -	ssize_t ret = -EIO;
> -
> -	kattr = container_of(attr, struct kobj_attribute, attr);
> -	if (kattr->store) {
> -		xe_pm_runtime_get(xe);
> -		ret = kattr->store(kobj, kattr, buf, count);
> -		xe_pm_runtime_put(xe);
> -	}
> -
> -	return ret;
> -}
> -
> -static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
> -	.show = xe_hw_engine_class_sysfs_attr_show,
> -	.store = xe_hw_engine_class_sysfs_attr_store,
> -};
> -
> -static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
> -	.release = xe_hw_engine_sysfs_kobj_release,
> -	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
> -};
>   
>   static void hw_engine_class_sysfs_fini(void *arg)
>   {
> @@ -641,7 +637,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>   	if (!kobj)
>   		return -ENOMEM;
>   
> -	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> +	kobject_init(kobj, &kobj_xe_hw_engine_type);
>   
>   	err = kobject_add(kobj, gt->sysfs, "engines");
>   	if (err)

