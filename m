Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F218BD277CA
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 00:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79B510E07F;
	Sat, 10 Jan 2026 00:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhFQvAbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D504010E07F
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 00:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768003865; x=1799539865;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dCoN3jwBF4fM/xiJOZGaqxshTZsiBZ3nQHF65y7X9Y0=;
 b=OhFQvAbi0XpwSRvkPjC30NkNsnhPAaqX8HFeNSn7Zj5FED77Y95IzAUl
 ++QlwteCTK4E/0MjG+bcOOWIJd1GrtUZd8LDqWCl5aKq+F2tNEdfAbvXu
 oDTgQN248Dokdh7AXOCT+/MqF9xcytDmw3HOZ1HzRzloSZP4E7omkSkWB
 dxrXkTx7EKpLuc2f3RkK6AF0Q0you0hhYViFDSjUSP4wpn0TXAGk5Hg3+
 nzqYVvROJ009dlCal+2np4QRujusQRGrLARcTGZwg/q1V1OLiQ8tZ9Fh2
 +brtigRHo5Q/fdDdNfs+9tXmce/UaUfGWZEv+KOeh4Rh4D6QKCLeu03Lv A==;
X-CSE-ConnectionGUID: 86nJ9v8gRIupZG3gZiSOwA==
X-CSE-MsgGUID: cLhkSiH5SFODRAyy+8fNFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69315736"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69315736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:11:05 -0800
X-CSE-ConnectionGUID: VftHAVCbR7GEbxdo3dZi/g==
X-CSE-MsgGUID: aXfye9DJSy+GHYFfRqAZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="226942397"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:11:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:11:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 16:11:03 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:11:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqzWN+A14ZixLfG9tvIk5RsRi1o/dLvq5OBbF4P6triUsGBPobzsP4jO+p6awByafzmN+9fhFYLMO1CsDZH3WaZH3wC7uqveFwv/qTZIF5ykwMIi2nNNo1PPtJzH02FNnFdRiISVYy3jpaOXphAYp7wAAl9+NuCE60OPq7OmIC3jNlRKN6vz+XyCsCHRckn6HE6HBuvmvP7jI1mlepYcxYt3VMi8J3+ze0R3ry7DLYSvDF4CYB1Ir2vdzaUeG5HXO1EohFCQzHWkaPDHtoTnaMbk0pmdjpWSlaGlyUDbnBg8IpBIcRCra8fgQKgJ4V0YJQdaU5fS9frDF/K7HZdUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oj5SCFEwS/601g/tRq+vuBwm/izrYHzJnUUE5mWeww8=;
 b=AIfsCtM/dzivtvZAkTIDVcLgQiXFANKKbdpBYkuDjb17/R2mw8gw/EvNIVXANQv23gVaErIBdBXgYWlY5XgsJ9d9Glaz3GkXEufWk/5mqHUX8CalfRjfR0hMwcSlOR6jFitJlY01498/qUgqvJnSi54Y2sXIORxoD/DWxop0WNvm5FLsbO3IcGgEbO4pH1zNBtNH1BuabPoFuaUhbVdjyaUwacm8boJcLoEqR/ZJM9ORjtFDYhlm2FtBEycNZc+85x7RBAFRRet32AhdYh4uHcE8tLLJ9y1sRItnYSFkVus2IRfTV4jl5No3p+GB1Q2kffZ/l15c/WVIcD/6c7aDSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 00:11:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9499.003; Sat, 10 Jan 2026
 00:11:00 +0000
Date: Fri, 9 Jan 2026 16:10:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
Message-ID: <aWGZEgIDoilpOvng@soc-5CG1426VCC.clients.intel.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-11-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108120548.1015154-11-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:303:16d::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a085ce1-bd9f-439c-119c-08de4fdcbc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dStsVC9nOWtkLzQxK2wyTk1OQjdVR053OXhEdElqZkpXWVdldTVyMEFsbVEr?=
 =?utf-8?B?WW0vQWpNMlZjOUZjTFVhclpMK0lQa2UzWmgrM3NBWkFQZS9TRk9rbk1qZFE2?=
 =?utf-8?B?R01Cb2plNnN0MXE2MXlEcFQydi9NWktoMTRHKzgvdWZ6N0NQRnRqVnVFR2ZV?=
 =?utf-8?B?NEs3NXpHZmRFS2xHbEQwS05mMTk1NE9sUDdmV2NtaGl6ZFE2VjBMdm9hajBh?=
 =?utf-8?B?TUdhRktmUGZXMUR3d3RJZjlJYmpHVEszRXhoTnJpOENFeWtHS2F6ZTdiZ1pD?=
 =?utf-8?B?VnhPK1E4clA0V2FEZzY4RWVPR0wyWnk5YWJIbEZpZWNGTzU2bnR5U2JxM2dl?=
 =?utf-8?B?d0hpdHlnYjZybzlZemVqSUJnRmU4M21idm5PTk1taGJDSHJPd1RjajlkQWtZ?=
 =?utf-8?B?VkhUa0hJMXhRWFBZbzVwWG9MVDc1MUtIRUdxNXpPOFlyZy9IK3pENHo1cXVw?=
 =?utf-8?B?b2phVUk2SjA4SGZSdVZuY3F0dDNYT2VxK25wcDlnUzRxc3J4Wno2SVpNL2pw?=
 =?utf-8?B?TXpxMUMzQnB3b0ZISmt6QUwwbzE4cVVob1RscEVQZ1g4bW9MTjRoQVV4WWlj?=
 =?utf-8?B?ckFSWjJneFlvdnhReWF1RUZnTXlBNk82YkluQ0VzTTVZRE9MbGFpNFZzZFhB?=
 =?utf-8?B?RExDaG9WM0lFbWdhd1pCZHVnM2JwbUxJT0x4eVVaWnVnT0oxS3ZWeGpnVnZV?=
 =?utf-8?B?STRWd1NsTmk2cWNpc25IUGNqVG5YL1ljT3VhSmlzTEZIQjd2bjJDemFXYVc4?=
 =?utf-8?B?NmpyYmZpdysweUkxN3JKYjdxWnJBanR1WndnN2VQNzdjZkp6T1B0V1lEZ1lS?=
 =?utf-8?B?TUtzTFp3UnZYVjkwWE5sZVJyRTJsaEJjcENHTk8xcEhjandZTE5Od1pWRnU5?=
 =?utf-8?B?SkhqLzhPOFpaczJwZjFCSU5pTWRoU1l2VDNuVUdMeXNmRGMzYXVkc2d5S294?=
 =?utf-8?B?Zi9iaVhsbTM3NWdDNk9rRUJteW5sR1lqWnVvdW5GM3pkQmZHdVowWFkzRlFH?=
 =?utf-8?B?YmtZbGtCeVU5NzMrcDJVZ3FCa1pvU2IrVE53WnlkdHN3Y2hJZHQvWmNwcmZu?=
 =?utf-8?B?RDlRN1grTXgxaDQvVjBFcUFHZ05qSWtRKzVqTDhubFM4MG4wNUMwdXpQMUJ4?=
 =?utf-8?B?ZFV0c2E0dWZWc29xS3RKNnEySmZnaHpqMHJRTitHL21sQ0duTWw1TnhkT0Zx?=
 =?utf-8?B?Z3djRDNSVy9xTkNaZUN6UWk5NlRLNDk4cjdKRWhKWXJqakthQ1d5aVJWL1lw?=
 =?utf-8?B?WmxvOXVady93WjBkenVkT24zS2J2dEVVcDFyenJ2d1VPU1FwRkhXWTJSRjVE?=
 =?utf-8?B?aW02TTNIWVkxMFBuVDZ0RFFKWXIyNmV5eS9Ma3dyTmtxNGJFejh6ditaNlRO?=
 =?utf-8?B?T2dXWURqRjdpVG04TTJqbXlBSVo4MG1KUDJBUlNmUFhDaG53SE56VlgzSGU4?=
 =?utf-8?B?UlJXaForMHJTUVk3eCtyVlZOSWtWTVFYVndKdU4rRXg2aC9ZYyt0emxYS3pX?=
 =?utf-8?B?WEthK0Uzbnhwd0VoYmtrM2UrcEtLY0V4cjNObWU0Njg3UkNYdXZGeXVuRmtW?=
 =?utf-8?B?Z0thL3JLcU5YVWY1V1l2ZGRBNEkyVll5MnBxSlllUkVVYU9SNzEyTHJkUEY2?=
 =?utf-8?B?bFA3WEZ5Qk11UXA4L003M0t4QzJBaXhZaGpzV0hEMTg1cHpxR2lMWFVmT2Vt?=
 =?utf-8?B?SGgyYVJYY21Mb3JhTW1sVEpnK2pXVFZMeXlsWWRXZlNjczhyOEhpNkFlbUxM?=
 =?utf-8?B?TUtEblFvQndWMms1eFpySEtSQ3NUckVjMDdpR0YzbXFSbVpVMndtVjJualBV?=
 =?utf-8?B?bHNNelBRbkVjOWs3VWJEdG5Jd0F1N0UwazBSRDlBcFliRDFnSGFRYjRsV3FS?=
 =?utf-8?B?emFaaVpvLzFvZlE5b1E4SWdRTHVFNWhXM3oyRzBYMDNkS1I0eUozSXh4VGYy?=
 =?utf-8?Q?2uSRFJvYdjEhmBAWTPq23o23RYiDd3CE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTRrbXlIQTdESkZNSjF4RlZzZzRnaHl0MlA1aVlSVForc0d4bERveW9md2Ux?=
 =?utf-8?B?NFN1S0pheGgxOG15RW05Ui9NSm9HWlZCcmloUFdMQlRNeHdWdFNidjFySHNT?=
 =?utf-8?B?Nk9EWExOUDRNbEF6bjNvdFE5UmU1YjNaRWxkYW15VEpiUDY0RXByK3B0bzlI?=
 =?utf-8?B?L015UVB0K1RPUzY5djNlV0JQdVRNZ3hoWmNBR1ljWk1CU3VuazMxVUxZdkJV?=
 =?utf-8?B?dC9Vbk0vakw1TEJEeVpwN3ZKUEVYc0phNzhia01oV3ZrWWdvUkpjSTVjeUNr?=
 =?utf-8?B?QmJ4c3AwWll4OSs2Rnh2blNyb3kwL0liT3Q2S1NiaHRiYzNaRXNOVVhWMHFW?=
 =?utf-8?B?OU9BcnJhOUEwaUxzRkJFRng0Sy9XV04rMG1rYWNmdlJKZ3gyYzd3NXdrK2lL?=
 =?utf-8?B?Y0R0am1neTNDdGJkSmFNNE1RVWk2bmJoOFdOakhMdTMwWDlTYk15WS9jQUVn?=
 =?utf-8?B?ZWltcmZCeUJqRU82N05vdngvRDY4OFdDTFhsTVZrMWh3K2g4cUQ2aGtMR3p6?=
 =?utf-8?B?LzZNektITW9ZQ1V3QnJNQVZXZkc2U1RrWStZVEs4cVNvWVRjVmQvY1JqeEhJ?=
 =?utf-8?B?ZEtJR1VKM0JqY285RHRmdVNWMENvTkswQWVKVGFPZk4yRDVwb09QVnlwdDFa?=
 =?utf-8?B?a04vMWU1OU5HTkRjMnFYd3h2b1Z5VGg0QmNtTEFXVEIrWUVXZUo4eGZCc1Bs?=
 =?utf-8?B?VDVtMlBjaElZM1hsamFtUFVJdjZJYUVVNFQ4QTgzNmtmTlE5Y05ueHRoZnZ4?=
 =?utf-8?B?VlRsMnRDY2xNZlJjSnNYQUgyMzJ5WDdHbEtsWWpOYlpPUlBTRVVjM0N1Z2lF?=
 =?utf-8?B?eHdPbU55d2N3NlpTVnZpakM4aHdpaGY0S1pKZERKSjQ5b09WL0k0cW5ZRlI1?=
 =?utf-8?B?UUxjQWc5K2hpL1F6UXlrcFpXMlR0SGRXeFJwZThTazNpdnNMVFJWSlhmbVNG?=
 =?utf-8?B?eExvSlJxS3lqWDF6V2sxdWVNV2FLNmhlMDN1dGIzZmMyZ0FzMEZ2K1lXZGUw?=
 =?utf-8?B?REV5d1p3dXN1Y2NtMGZRRnFIUlRkam04UkYrNFNMS0xpVTA1MEplOUZXeURM?=
 =?utf-8?B?eW5WWktrUU4raUkwMFh2eFN0LzRtWFpCRnpxMXkyeGlOdnpvdEVoUUdaUzBi?=
 =?utf-8?B?QnhNL2VuTDVadmdoanpHTW1hT0FwN0JBRzgzejRhYzlzZXMvV3JBdm4wKzl2?=
 =?utf-8?B?aWlsbEJoUmt6S25wSW10SitEKzE3VUxGSnpyRm1iMDBKVnROL0o1WDgybHgr?=
 =?utf-8?B?dmRCSHdzQXZNWC9TRmNGQ1BVcGRZUmNxbWxuVUh2VUNkNzZPL0hRV2FkRmtH?=
 =?utf-8?B?TU5rZUpCaVFhSzJVUEc0Um9pMkFiZnlQMzZQcDdJL25yb3oyV2Q3N1BkY2k2?=
 =?utf-8?B?UUtma0NXZVI3Nk1ZVDRhQ014c0dkSHNZZE9WaVd0SVUrbzQ2ZzhiSWtSakpL?=
 =?utf-8?B?QlVLSmtEWE13UFAxd2NMVTgyckhaU2VLejhPVTdiMWtPaTBJWitITXFERFUx?=
 =?utf-8?B?UE8xdE1veC9ZVjI5V20zRlNEbm82eTNKbGY0bnFoNnBFSFBQdUJXRGROQnBH?=
 =?utf-8?B?YkdUVFl0dEQ5NjlOUlBOVnduTWxsamhQckIraHc5UFB5QUt3bHFSR1l2Wlc3?=
 =?utf-8?B?aE9NYW00RXY5TFFaN2s4eEk4R0pYamtxb0pWNnFtWnJ5WDJOMnNhZXNDL3lu?=
 =?utf-8?B?UHJvWi8xOG1tZnRXVDdmUEx4YUV6ZzNka3B6UHArdjkvcGtMM1FDREgrT0xV?=
 =?utf-8?B?dDR2QXNackhCbVJzcjhXUWx3R09SdW9aSEVoODhMT2VwMXJzVFlpK1RZd1RP?=
 =?utf-8?B?ekNFeFNRQXpScmUrM2NKM3dDdlg0UVdaZldCSWUvTGdiK243ZGFFQ2J5czFy?=
 =?utf-8?B?L1BESzB1Q21PM09XdGJxalZhcnoyZ3pSVDZTakpvL1lKZlNldjhrSXR5alI5?=
 =?utf-8?B?dXJUV1VtUTAxUTF5ekJUVDc3UEdiUC9YOHRKM2wvMXVEeml3NVBHRjhIWldP?=
 =?utf-8?B?ZDN6NXIzc2RSUnpFeWl6WWc4K1dDd0JZTDhnYXB1ZlBVVzBCTHNYVHJVblhk?=
 =?utf-8?B?QTc4OXd0M2d6cHB4bUQ4NUN6d1J5UlFqR0ZTaWRqTnZDRXAvYWVXZjVIcUgx?=
 =?utf-8?B?b3NnaVU3N3JRSmY1THlWWm5tWkk4akxwSUhOVkJSdTY1NzdJNU56dDIxd3VC?=
 =?utf-8?B?M0tvd2UvYzZjTHhqdUZNRVVKbzdvTFhTT3hJYldDUFh5UDFHM01xLzNONVFx?=
 =?utf-8?B?bXRBa3lpN3dIR0ZBNTZhRkV3bHVrL0ZTUGdLSFcxdjJoclF5bG93aUpZakVL?=
 =?utf-8?B?dm16S3NyTG1mdHNnTVZuNFNHVVhXL1NKMFRKdzhRR0RWQzZBSk8wOXpxNlVZ?=
 =?utf-8?Q?3LgFD7s+PUGwh6+DLmSpxeBAVJ1ygyXNp6Z3e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a085ce1-bd9f-439c-119c-08de4fdcbc89
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 00:11:00.9127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCGNS4mptfBN4dwTWZSuUBN8ZLdYmb2xw5snNpmMtZhe0Vz5lRF4wy5M7GWuFIfBSQHTQvUzRD3QNN1EIgcSn1QTJ2xcfNnKCcqTSoGTUYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Thu, Jan 08, 2026 at 04:05:51AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Implement the System Controller mailbox communication layer:
>- Low-level frame I/O operations
>- Mailbox busy/ready state polling
>- Command preparation and fragmentation
>- Multi-frame send/receive with phase bit handling
>- MKHI protocol header validation
>- Public API for sending commands to System Controller
>
>This provides the complete mailbox infrastructure for
>communicating with System Controller firmware on Xe3p
>dGPU platforms.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh

>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 429 ++++++++++++++++++++++++
> 1 file changed, 429 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>new file mode 100644
>index 000000000000..97fe3498fcc7
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -0,0 +1,429 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/container_of.h>
>+#include <linux/errno.h>
>+#include <linux/minmax.h>
>+#include <linux/mutex.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_device_types.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
>+#include "xe_sysctrl_types.h"
>+
>+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
>+#define MKHI_HDR_IS_RESPONSE		BIT(15)
>+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
>+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
>+
>+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
>+	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
>+	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
>+	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+
>+static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>+{
>+	return container_of(sc, struct xe_device, sc);
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_device *xe, u32 bit_mask,
>+					      unsigned int timeout_ms)
>+{
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	int ret;
>+
>+	ret = xe_mmio_wait32_not(mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+				 timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_device *xe, u32 bit_mask,
>+					    unsigned int timeout_ms)
>+{
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	int ret;
>+
>+	ret = xe_mmio_wait32(mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+			     timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static int xe_sysctrl_mailbox_write_frame(struct xe_device *xe, const void *frame,
>+					  size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	memcpy(val, frame, len);
>+
>+	for (i = 0; i < dw; i++)
>+		xe_mmio_write32(mmio, regs[i], val[i]);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_read_frame(struct xe_device *xe, void *frame,
>+					 size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	for (i = 0; i < dw; i++)
>+		val[i] = xe_mmio_read32(mmio, regs[i]);
>+
>+	memcpy(frame, val, len);
>+
>+	return 0;
>+}
>+
>+static void xe_sysctrl_mailbox_clear_response(struct xe_device *xe)
>+{
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+
>+	xe_mmio_rmw32(mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
>+}
>+
>+static int xe_sysctrl_mailbox_prepare_command(struct xe_device *xe,
>+					      u8 group_id, u8 command,
>+					      const void *data_in, size_t data_in_len,
>+					      u8 **mbox_cmd, size_t *cmd_size)
>+{
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t size;
>+	u8 *buffer;
>+
>+	size = sizeof(*mkhi_hdr) + data_in_len;
>+	if (size > SYSCTRL_MB_MAX_MESSAGE_SIZE) {
>+		xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
>+		return -EINVAL;
>+	}
>+
>+	buffer = kmalloc(size, GFP_KERNEL);
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
>+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
>+				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
>+
>+	if (data_in && data_in_len)
>+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>+
>+	*mbox_cmd = buffer;
>+	*cmd_size = size;
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_send_frames(struct xe_device *xe,
>+					  const u8 *mbox_cmd,
>+					  size_t cmd_size, unsigned int timeout_ms)
>+{
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 ctrl_reg, total_frames, frame;
>+	struct xe_sysctrl *sc = &xe->sc;
>+	size_t bytes_sent, frame_size;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, SYSCTRL_MB_FRAME_SIZE);
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_clear(xe, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+	bytes_sent = 0;
>+
>+	for (frame = 0; frame < total_frames; frame++) {
>+		frame_size = min(cmd_size - bytes_sent, (size_t)SYSCTRL_MB_FRAME_SIZE);
>+
>+		if (xe_sysctrl_mailbox_write_frame(xe, mbox_cmd + bytes_sent, frame_size)) {
>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			sc->phase_bit ^= 1;
>+			return -EIO;
>+		}
>+
>+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
>+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SYSCTRL_MKHI_COMMAND) |
>+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>+
>+		xe_mmio_write32(mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>+
>+		if (!xe_sysctrl_mailbox_wait_bit_clear(xe, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += frame_size;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_first_frame(struct xe_device *xe,
>+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+						  void *out,
>+						  size_t frame_size,
>+						  size_t *payload_bytes)
>+{
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
>+	size_t hdr_size = sizeof(*resp_hdr);
>+	size_t payload_size;
>+	u32 frame_data[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)];
>+	int ret;
>+
>+	ret = xe_sysctrl_mailbox_read_frame(xe, frame_data, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
>+
>+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
>+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
>+	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
>+		xe_err(xe, "SC: Response header mismatch\n");
>+		return -EPROTO;
>+	}
>+
>+	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
>+		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
>+		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
>+		return -EIO;
>+	}
>+
>+	payload_size = frame_size - hdr_size;
>+	if (payload_size > 0)
>+		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
>+
>+	*payload_bytes = payload_size;
>+
>+	xe_sysctrl_mailbox_clear_response(xe);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_frame(struct xe_device *xe,
>+					    void *out, size_t frame_size,
>+					    unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(xe, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ret = xe_sysctrl_mailbox_read_frame(xe, out, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_clear_response(xe);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_receive_frames(struct xe_device *xe,
>+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+					     void *data_out, size_t data_out_len,
>+					     size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	size_t hdr_size = sizeof(*mkhi_hdr);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t received = 0;
>+	u8 *out = data_out;
>+	size_t frame_size;
>+	int ret = 0;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(xe, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ctrl_reg = xe_mmio_read32(mmio, SYSCTRL_MB_CTRL);
>+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
>+
>+	if (total_frames == 1)
>+		frame_size = min(hdr_size + data_out_len, (size_t)SYSCTRL_MB_FRAME_SIZE);
>+	else
>+		frame_size = SYSCTRL_MB_FRAME_SIZE;
>+
>+	ret = xe_sysctrl_mailbox_process_first_frame(xe, req, out, frame_size, &received);
>+	if (ret)
>+		return ret;
>+
>+	out += received;
>+
>+	for (frame = 1; frame < total_frames; frame++) {
>+		size_t remaining = data_out_len - received;
>+
>+		frame_size = min_t(size_t, remaining, SYSCTRL_MB_FRAME_SIZE);
>+
>+		ret = xe_sysctrl_mailbox_process_frame(xe, out, frame_size, timeout_ms);
>+		if (ret)
>+			break;
>+
>+		received += frame_size;
>+		out += frame_size;
>+	}
>+
>+	*rdata_len = received;
>+
>+	return ret;
>+}
>+
>+static int xe_sysctrl_mailbox_send_command(struct xe_device *xe,
>+					   const u8 *mbox_cmd, size_t cmd_size,
>+					   void *data_out, size_t data_out_len,
>+					   size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t received;
>+	int ret;
>+
>+	ret = xe_sysctrl_mailbox_send_frames(xe, mbox_cmd, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out || !rdata_len)
>+		return 0;
>+
>+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
>+
>+	ret = xe_sysctrl_mailbox_receive_frames(xe, mkhi_hdr, data_out, data_out_len,
>+						&received, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	*rdata_len = received;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>+ * @sc: System controller structure
>+ *
>+ * Initialize system controller mailbox interface for communication.
>+ */
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(mmio, SYSCTRL_MB_CTRL);
>+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>+
>+	xe_mmio_rmw32(mmio, SYSCTRL_MB_CTRL, MKHI_FRAME_PHASE, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_send_command - Send command to System Controller via mailbox
>+ * @xe: XE device instance
>+ * @cmd: Pointer to xe_sysctrl_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sysctrl_send_command(struct xe_device *xe,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len)
>+{
>+	struct xe_sysctrl *sc = &xe->sc;
>+	u8 group_id, command_code;
>+	u8 *mbox_cmd = NULL;
>+	size_t cmd_size = 0;
>+	int ret = 0;
>+
>+	if (!xe) {
>+		pr_err("sysctrl: Invalid device handle\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!cmd) {
>+		xe_err(xe, "sysctrl: Invalid command buffer\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!xe->info.has_sysctrl)
>+		return -ENODEV;
>+
>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>+
>+	if (!cmd->data_in && cmd->data_in_len) {
>+		xe_err(xe, "sysctrl: Invalid input parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!cmd->data_out && cmd->data_out_len) {
>+		xe_err(xe, "sysctrl: Invalid output parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	might_sleep();
>+
>+	ret = xe_sysctrl_mailbox_prepare_command(xe, group_id, command_code,
>+						 cmd->data_in, cmd->data_in_len,
>+						 &mbox_cmd, &cmd_size);
>+	if (ret) {
>+		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
>+		return ret;
>+	}
>+
>+	guard(xe_pm_runtime)(xe);
>+
>+	guard(mutex)(&sc->cmd_lock);
>+
>+	ret = xe_sysctrl_mailbox_send_command(xe, mbox_cmd, cmd_size,
>+					      cmd->data_out, cmd->data_out_len, rdata_len,
>+					      SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
>+
>+	kfree(mbox_cmd);
>+
>+	return ret;
>+}
>-- 
>2.43.0
>
