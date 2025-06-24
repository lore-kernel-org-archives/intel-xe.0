Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF06C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 15:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E64710E5E1;
	Tue, 24 Jun 2025 15:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTzjbWab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FE210E5E7
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750780210; x=1782316210;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JQgFMN3flXfohrw3A0JS6h7guxUsbgij20OUh2rtlUU=;
 b=TTzjbWabSfU4NXy+pl3qtmC3hf+skcGi9t4KYzaxl5cM8pssHt+AMoy9
 HhInmaNo+lFY5RGYmV8ROYvv6SbEvU0norGHvYFThfE9bx9zjaTmfYqhr
 9z7TmucZQ/rLE70ujREq/OT06q1sY0+IQeZXBavTnCoyibwK2LNLPHMGk
 ASRdG8HaOEbj9mX5RrHyPfSbU3SBSU+nl2F/7vbbtFUx5ahlK/jOJhHzI
 4md4ZkBuoGJ1GtsFAsKLagyBHbPZpUka+IPPnq4b5dDEdKb2qe6KkJk0E
 5GnryrFBoFbIzvUZNvolpirSGtQUzL2eygQHmlooCxoZ6LWo20CFWTDOq g==;
X-CSE-ConnectionGUID: hoHZHZydR4eM3sLyFI8Vpw==
X-CSE-MsgGUID: 38ZLHvqnS8i4v7TeX64MNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64383588"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="64383588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:50:06 -0700
X-CSE-ConnectionGUID: NQ5xjSnFRkyEnJtvNphyxQ==
X-CSE-MsgGUID: rMcokpVOQOuihx06orhP3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="182838709"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:47:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 08:47:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 08:47:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 08:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/HlL1QpoReIbGhe2daPUQT78oKBRXJJcXwuXxtZic5GdnsGOMUn/P+jeKfAgg7RWn8PyAQBWQEYFu9e5AEJLCMeR8cJ5Pag3XPIx3lSxl+9mUPhiYXn7MzTDiUlvKBs4/RY8HPLitUZSZvEkR6OP9xqJFaJnDc8ttwaIt7VQ8P8Ujddlq9bc4BAprKampdKb8UFTJj80L1O8AWRDRNXnmdR6ERldkfPF3xHYsti64vKguYxkc1fKSRo9GlepCDNLmWQt/HKDsNotSn59NR40+vwdihlJuOIiWc8AjiiBaNqc8GhB3EiOAmu82yF3TFDt1Dhb4ExfEQtOTqWeEcMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JryLBXvOZ4qWH6QRbp5pUmIqDQUnG4403UgZ0AVI7g8=;
 b=uL3s/oPfEk1z+Nz+Ovp4kB76PNtC9h2gCxXSRNv2/4BXzUu9K0FuIITFB/yzb+u80NHcJSEh05tV1qijB718jqWc1kihW+xVGF9CbQs+iTXp7/2x8Tp5KznVa9PFAp1BuSwkkvkEUDWg6ZGkZZMfxghUVBhDmyz5rx1S1AaqXHqeK86zWT0xduV93pUEBcPmqTyp56cuCs+09Udn1SNQtKbaYBoT/hIigTnYeKa2lbs5+nhWkMp3fFMIN2h7emSP6x11RBmhxYGbCg6qmLPTm7E3RR9UlrKftfH395cY1VLk0E3c2SOK9c7faARCs42sjNRzI8zzcWx3PoiKwfypYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 24 Jun
 2025 15:46:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:46:54 +0000
Date: Tue, 24 Jun 2025 08:48:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Winiarski, Michal" <michal.winiarski@intel.com>,
 "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v8 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aFrI0ZISCyxQgTUj@lstrano-desk.jf.intel.com>
References: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
 <20250619080459.27731-3-satyanarayana.k.v.p@intel.com>
 <aFWLbiiMQ8ZnIL2x@lstrano-desk.jf.intel.com>
 <aFnKJ5HGBrSjz9x2@lstrano-desk.jf.intel.com>
 <LV3PR11MB8695FE036F1B93E821901DBEF978A@LV3PR11MB8695.namprd11.prod.outlook.com>
 <560c4e8f-0c0c-4045-a522-ac663d145984@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <560c4e8f-0c0c-4045-a522-ac663d145984@intel.com>
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbbd550-84ed-4aaa-8d44-08ddb33657b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDFBNXJ5alJORERRWnVSVmdpa3p2Yi9mVXl3aGUxaTJQc25ub2RMNjdkN1VJ?=
 =?utf-8?B?MktrMHJvVmdyeGdCNEl6WEhlSHpWZEVpaUxuWUhjbDArbTJhbWU4dlBRR2Z2?=
 =?utf-8?B?M1ZxM0FQUGM1d0tRb0RkYnRINHpHN0g1SVpvejJjOXJFckQ5K2VxdGYvNy8r?=
 =?utf-8?B?Wk96WUZHYk9tb200L3NxZm01d0dUd0dvckdFWTBYVEtFNWE0aUVPeVgwd2FQ?=
 =?utf-8?B?U2lSQ0JGQ2VKRGtSd1B0MnNGUVJVaS9heWNGekVuZmh6QXJwREgzWmZQeTR0?=
 =?utf-8?B?U2N3WDE3bDcvaWcxTktpQkwwYldRajFkaldvYXdoZlE5TzJITGZkSGlSOUJl?=
 =?utf-8?B?dEpaeVZ1Nng4SGdKKzZhVHB4K1lSeTRZbUpyaHlRK1dLVHFZUDN4bGpUbFhZ?=
 =?utf-8?B?NjNCbXpBOG9EL1BiSzF5dHNpUHJIREdWQUhLV3p4Q1dOenkrUDk4S3RUZjlM?=
 =?utf-8?B?ck1tbnBVUHFTZi9wUEJPZmZLZnpKU0JMeEp3bnFTYk8xV3pENjBoUGE3d3Jv?=
 =?utf-8?B?cXp2V2FLenJxekY4dGVxSVNRUUdFb2V1QmgzM0kxTitiODZnYWZTQUpVdDl6?=
 =?utf-8?B?ZjBiWXp1QmtLaUhyaDE2WjRNdDRMRHFVYSsraEhsOThFaW13RE5nLy9ZY3U1?=
 =?utf-8?B?dU9mNE4vTjFHNmlZWGhoVVpMYlIwRE9DQmsrQUFTQk5ON3NuUWd0QWl3ekty?=
 =?utf-8?B?anhNZlB0SVExdnhsSXdoNXNLMTRQUmM0OEQrTHU4bktCYkE5ZzNZVXZOcUxh?=
 =?utf-8?B?aElHejZ4VVhTaU13anMrVXY2YkE1QlFLMTBQd3pKUy8yMjNzelkzellpWXND?=
 =?utf-8?B?aVUxSzd1NFMxMEwzTW9HaENGWkt6UWRBckVzT1ZwU2RTeWp3NXQyTGd2VjRM?=
 =?utf-8?B?VXhpZndKZXowdXBLSlZTaTVBWVQrRnR1NE5haTc2YVRqcEV3Njhmc29yMExO?=
 =?utf-8?B?Z1BzUTNZSzZ3VjBWWFplc1JsVXFpMTUrRlAvVUprVEd1Slg5K3dNd0o5clUz?=
 =?utf-8?B?Z3FnSVREYVdjWFNiQ1ZMTi9nd0czS2Vzd0JSK1lPMktRUExCT0FKVG1MTjZm?=
 =?utf-8?B?VVU1cVhlZVJmdVAxUGRjL05jRVg3WFNYZVlzV21iM2NaZnBodEpnQzEwSTM2?=
 =?utf-8?B?Y3N6dHFnZlAvVGMwMklMK0FWbXFvMDhpQnNHS21vdndGYkQ1UjVicHl1Q2Ry?=
 =?utf-8?B?SEdITGh6M09INGlEemRXclpoTVdzNWtkaE5BUEZmSFIrcFhwaGY0R2NPUSt1?=
 =?utf-8?B?eTFabHdJdUptRnRPcUxYdEdVUmZtbTh0dXdCcmVTcjY2dWNpMWl2V1NKcWZZ?=
 =?utf-8?B?c3pTWktKR0IyR2NZdXRNTTVBdVhJU2sxZUdQR2RPbGw4MlJDeHJqbVZkVDFR?=
 =?utf-8?B?OVlldmtoZlN6OVpMZExSL2xPTXM5REtMb0daSnpUcUEwZzNBWC9GTEV4ZEhi?=
 =?utf-8?B?UG41UFp2NzdZQTY2RmwrbGJNZHNmTjNUUFYvNUxIMEovNnVkQzdIR0JJTlE4?=
 =?utf-8?B?MFdJbDZQYXVEL25iR1lyV21oME8xay9RaFpKR0E1SG5UKzNxY2FMS0N3V2J5?=
 =?utf-8?B?RkUvelhjTDRtYVMyRDJwL3J0TjZ2TFkyN3ZIek0wV0NhZEJKcm8va3VFaVor?=
 =?utf-8?B?RXJuUTZGZnF2bUJuNWFMd2pVaFRjcWlmMm00ODZrQ2FuL1VxK3N1Qlp0NGti?=
 =?utf-8?B?SUYyMi91MTBVMGlremhrc0owV2FrNUEwNHpDakpkK3RqNERYTkMzV1VZWE1S?=
 =?utf-8?B?bndsSFRCR2xjR05HdkltbkdGVk8vOTg2cXQ3a1lCc1NjWFpVTkV6UklPM3BG?=
 =?utf-8?B?UEhXaU1PTjltaUhUZ3FnaEE5YysyTG9xQ2lDNE1MUGZiTHY3TXlxdEl1T1FT?=
 =?utf-8?B?UGx0QUY3RitrdWt1VGkxMlEzbmpOQ0t1cytFVkZyQWtqQ0tRZTVvOVd4U29Q?=
 =?utf-8?Q?UQKr6CJ5w1c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zzlpa2duVkRDa0dUUHVKa0JIV3RpS3dmU3BPRTZ3UnhKVTI3QzBxYmxvTHJI?=
 =?utf-8?B?bWt4U2h6d25TenpRaUtSQnVad01tQWJpWE1qZGdwQm5ySFJ5NWs5ek9IN0Mw?=
 =?utf-8?B?dnY3aDNjMWlPSnFKQ0RBRHJrUkFVOUFsMEFCOFcrRSs4Ujl5a1RIb3FPYzNW?=
 =?utf-8?B?WFdBMlRQdk9EdmJXN0VSalR1TGQzbkdYRUNyMndXczBFS3lFNElmY0V2TlBj?=
 =?utf-8?B?cEVDbXNpVWNSdHJTV1pGL0Y1MEQzQ2RlSC9WcFhHd2JOUGhjMitYYm5NUWhV?=
 =?utf-8?B?M1JVSnpRc00yTG9pVEp4eEJVWVA3Wi9kZFROTEoyU2RWS3FRS1NNeHNmNXJS?=
 =?utf-8?B?VDU3NkE0N2NBU1o2T3VYNDBxRy9WZFBUZFkrTWIvdmlzY1phNlNydE5tdmNj?=
 =?utf-8?B?RTYyMzJFZWZ2aitaM2w5ZGRzRmo0MEZxWk9CQ3A4cXFaSnZ0d2gzNGk0b1Bl?=
 =?utf-8?B?TTdRWldaL2M5L3U4a00zbUFDTWo4L1UwWi9yazRBeVFZUCtvWkJ0WnlSaTZY?=
 =?utf-8?B?QnpHd2JXTmRFOW0ySWZ4LzQ2bS82Y2RlMVkxWDhpbEU4akltbCtNc0ZEdGh1?=
 =?utf-8?B?UTJaM1l2VGZuM1F3RHE4RkZadkhaUzJTTTkwbjcraC82K1QzS0RienA2T1Mw?=
 =?utf-8?B?ODd6UGFHUGx6V21neUFxSDg3UWZPcWlFcVM5WVNaM1RKcWxXd2RNVUJYV2hC?=
 =?utf-8?B?RFhLZzN1RlVheUwyRUw0M1FzVzA0cWhYblIrQlFYU2NucndWQ2xIbTZJeEtG?=
 =?utf-8?B?NkEwQlVhTHJhQjRpNENWMWdUSy9tZzRMSDE2dmNLblJUY1VKdXdpdlpwdXBE?=
 =?utf-8?B?cWZaWUhtTldHUGhpMk1pOThBZjZ3K3o5VzdtSzBraytkdGNxamkvMm1VaW5k?=
 =?utf-8?B?bUsySWprZ0tndW1KZTBwVzFVanhXVVRLU1o2OUg0ZHd4TURpQTBPUk9tYmhs?=
 =?utf-8?B?dHp4cXVUVnRWRWo2a3IxT2FSWWlOU1JiUU9WMy9PckhjdlRua2hMTmxYSFB1?=
 =?utf-8?B?eUIzUUhzMHBSMjlMVHhWaW1iUE9PTTdqRWcwU0RabWlpSzd4SUUxVHo4M1hv?=
 =?utf-8?B?WThhUUwwMzRvcGRxSFBGSW9ubmVOTmpYK3VJQmhpNUdSNllPN0IxaFdBQUtt?=
 =?utf-8?B?ME4waXgwbmhKUFgzaFBja0p6ZjVtMWNwN29tcXNTTWdDT2REbTN5V2ZUQzFl?=
 =?utf-8?B?dS9mN0dMdlJZUVpvbHZxVnlGak0rV2hHQzhuUnBiWnFPYWU0b2JzTUdKeUtn?=
 =?utf-8?B?QzEweWc3Mmg5Q3dza0x5TnF2RDZRSDRoRHN5NEx1cGc3OHo1V3dORW5FZmhI?=
 =?utf-8?B?cWN4UmY2SEVITkJsa0Rlbjk2dzEvSEVCckFmS2Rma0M3dk81ZjA4aTRFRlM5?=
 =?utf-8?B?WUpIR09Hc2FhVzVJekk4RXc3ZWNEWjljZTlVU2FyNjNOM2JsQ01WMXlDSm1O?=
 =?utf-8?B?WnpYVksvTFFFcW9UN1laSmE0bUpxdFJsQkE1TzdyUEFkdEE4SUp2Mnk2RDlQ?=
 =?utf-8?B?bXdHVHVxaUx3NEdsdXU1Smo0Nm91MzNDaFZHNWp4RWhkNFpaekMxZUE5YjNN?=
 =?utf-8?B?bk0xMzB6UGZUNGtBZDlUcloxUDJpYS95dmE4YVdFdjZ1U2RTY0ZlVEtpTU5r?=
 =?utf-8?B?OVpoLzIzY2x0U3NjdWxzbFZIRVIyYk5EYVU0dERsMUlDV2RmY2EwRE5ySFV6?=
 =?utf-8?B?NGRhMFQyNnUrZmZqaDdvejJlMTM2LzhVYnk5TUNoZXdxWDFxOWFPMGUrKzRz?=
 =?utf-8?B?SkhBZG1kTFNXYTVLQ2IxRkhZRlRNTUVRYTBRQUVXTGxsT3p3UWZLaVBGSVZ6?=
 =?utf-8?B?MWVHMUVRUkdIVFpYM3FZSmY2bmM4REc2Q0FmNVZmbXFqSjVsRDlBSlkySEpW?=
 =?utf-8?B?OVpCY0VhSHpFOUNZYWs5R2JwQzRzeWV6SzUxY21SWTZkMDY4Yk0vZmxKc3FX?=
 =?utf-8?B?M2RKejV3S2hUbWZrUzRRZ3VBKzQraGJRUmorY0pNTmo3SmV4UVgwUmRGQThK?=
 =?utf-8?B?T09oZnlYaVo0VVFCWG1VWGhkY3FqTDJ6eFpQRHB5YjBjNDJGbjZndWtEbWw0?=
 =?utf-8?B?N05scGRWdHlYU2o2MmovaTQ1QitFK1BvL2lkRDhRMERYVE1aS282aGViQjVR?=
 =?utf-8?B?SlA5cWN6VDQ5ZExzNEhyTk8rR2h0OGtuU3MvM0tQWnF0bjNWZHVoTER5ZVVj?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbbd550-84ed-4aaa-8d44-08ddb33657b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:46:54.0336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOTj9ytUgWPpztHTeVcvijruXWW8Izii7AOI+aZMVeMIbkbe40MKccQEQXewQTODxwdJkLg8CW8gr3Wt7sjY2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
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

On Tue, Jun 24, 2025 at 03:07:24PM +0530, K V P, Satyanarayana wrote:
> 
> On 24-06-2025 10:28, K V P, Satyanarayana wrote:
> > Hi.
> > > -----Original Message-----
> > > From: Brost, Matthew<matthew.brost@intel.com>
> > > Sent: Tuesday, June 24, 2025 3:12 AM
> > > To: K V P, Satyanarayana<satyanarayana.k.v.p@intel.com>
> > > Cc:intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> > > <Michal.Wajdeczko@intel.com>; Auld, Matthew<matthew.auld@intel.com>;
> > > Winiarski, Michal<michal.winiarski@intel.com>; Lis, Tomasz
> > > <tomasz.lis@intel.com>
> > > Subject: Re: [PATCH v8 2/3] drm/xe/vf: Attach and detach CCS copy
> > > commands with BO
> > > 
> > > On Fri, Jun 20, 2025 at 09:25:18AM -0700, Matthew Brost wrote:
> > > > On Thu, Jun 19, 2025 at 01:34:58PM +0530, Satyanarayana K V P wrote:
> > > > > Attach CCS read/write copy commands to BO for old and new mem types
> > > as
> > > > > NULL -> tt or system -> tt.
> > > > > Detach the CCS read/write copy commands from BO while deleting ttm bo
> > > > > from xe_ttm_bo_delete_mem_notify().
> > > > > 
> > > > > Signed-off-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> > > > > Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> > > > > Cc: Matthew Brost<matthew.brost@intel.com>
> > > > > Cc: Matthew Auld<matthew.auld@intel.com>
> > > > > Cc: Michał Winiarski<michal.winiarski@intel.com>
> > > > > ---
> > > > > Cc: Tomasz Lis<tomasz.lis@intel.com>
> > > > > 
> > > > > V7 -> V8:
> > > > > - Removed xe_bb_ccs_realloc() and created a single BB by calculating the
> > > > > BB size first and then emitting the commands. (Matthew Brost)
> > > > > - Added xe_assert() if BB is not NULL in xe_sriov_vf_ccs_attach_bo().
> > > > > 
> > > > > V6 -> V7:
> > > > > - Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
> > > > > a list. (Matthew Brost)
> > > > > 
> > > > > V5 -> V6:
> > > > > - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew
> > > Brost)
> > > > > V4 -> V5:
> > > > > - Create a list of BBs for the given BO and fixed memory leak while
> > > > > detaching BOs. (Matthew Brost).
> > > > > - Fixed review comments (Matthew Brost & Matthew Auld).
> > > > > - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> > > > > 
> > > > > V3 -> V4:
> > > > > - Fixed issues reported by patchworks.
> > > > > 
> > > > > V2 -> V3:
> > > > > - Attach and detach functions check for IS_VF_CCS_READY().
> > > > > 
> > > > > V1 -> V2:
> > > > > - Fixed review comments.
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_bb.c                 |  35 ++++++
> > > > >   drivers/gpu/drm/xe/xe_bb.h                 |   3 +
> > > > >   drivers/gpu/drm/xe/xe_bo.c                 |  23 ++++
> > > > >   drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
> > > > >   drivers/gpu/drm/xe/xe_migrate.c            | 130 +++++++++++++++++++++
> > > > >   drivers/gpu/drm/xe/xe_migrate.h            |   6 +
> > > > >   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  72 ++++++++++++
> > > > >   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 +
> > > > >   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 ++
> > > > >   9 files changed, 283 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > > > > index 9570672fce33..533352dc892f 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bb.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > > > > @@ -60,6 +60,41 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> > > dwords, bool usm)
> > > > >   	return ERR_PTR(err);
> > > > >   }
> > > > > 
> > > > > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > > > > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> > > > > +{
> > > > > +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > > > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > > > +	struct xe_sa_manager *bb_pool;
> > > > > +	int err;
> > > > > +
> > > > > +	if (!bb)
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +	/*
> > > > > +	 * We need to allocate space for the requested number of dwords &
> > > > > +	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> > > > > +	 * is submitted to HW, we need to make sure that the last instruction
> > > > > +	 * is not over written when the last chunk of SA is allocated for BB.
> > > > > +	 * So, this extra DW acts as a guard here.
> > > > > +	 */
> > > > > +
> > > > > +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> > > > > +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> > > > > +
> > > > > +	if (IS_ERR(bb->bo)) {
> > > > > +		err = PTR_ERR(bb->bo);
> > > > > +		goto err;
> > > > > +	}
> > > > > +
> > > > > +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> > > > > +	bb->len = 0;
> > > > > +
> > > > > +	return bb;
> > > > > +err:
> > > > > +	kfree(bb);
> > > > > +	return ERR_PTR(err);
> > > > > +}
> > > > > +
> > > > >   static struct xe_sched_job *
> > > > >   __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64
> > > *addr)
> > > > >   {
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> > > > > index fafacd73dcc3..32c9c4c5d2be 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bb.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_bb.h
> > > > > @@ -13,8 +13,11 @@ struct dma_fence;
> > > > >   struct xe_gt;
> > > > >   struct xe_exec_queue;
> > > > >   struct xe_sched_job;
> > > > > +enum xe_sriov_vf_ccs_rw_ctxs;
> > > > > 
> > > > >   struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> > > > > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > > > > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> > > > >   struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> > > > >   				      struct xe_bb *bb);
> > > > >   struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue
> > > *q,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > > index 4e39188a021a..beaf8544bf08 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -31,6 +31,7 @@
> > > > >   #include "xe_pxp.h"
> > > > >   #include "xe_res_cursor.h"
> > > > >   #include "xe_shrinker.h"
> > > > > +#include "xe_sriov_vf_ccs.h"
> > > > >   #include "xe_trace_bo.h"
> > > > >   #include "xe_ttm_stolen_mgr.h"
> > > > >   #include "xe_vm.h"
> > > > > @@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object
> > > *ttm_bo, bool evict,
> > > > >   	dma_fence_put(fence);
> > > > >   	xe_pm_runtime_put(xe);
> > > > > 
> > > > > +	/*
> > > > > +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> > > > > +	 * BBs from BO as it is no longer needed.
> > > > > +	 */
> > > > > +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> > > > > +	    new_mem->mem_type == XE_PL_SYSTEM)
> > > > > +		xe_sriov_vf_ccs_detach_bo(bo);
> > > > > +
> > > > > +	if (IS_SRIOV_VF(xe) &&
> > > > > +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> > > > > +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type ==
> > > XE_PL_TT)) &&
> > > > > +	    handle_system_ccs)
> > > > > +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> > > > > +
> > > > You don't check the 'ret' value of xe_sriov_vf_ccs_attach_bo. That seems be
> > > an oversight.
> 
> The error is returned to the caller after this. So, not checked explicitly.
> 

Right, this is directly above the 'out' label for handling errors.

Matt

> > > > >   out:
> > > > >   	if ((!ttm_bo->resource || ttm_bo->resource->mem_type ==
> > > XE_PL_SYSTEM) &&
> > > > >   	    ttm_bo->ttm) {
> > > > > @@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object
> > > *ttm_bo, bool evict,
> > > > >   		if (timeout < 0)
> > > > >   			ret = timeout;
> > > > > 
> > > > > +		if (IS_VF_CCS_BB_VALID(xe, bo))
> > > > > +			xe_sriov_vf_ccs_detach_bo(bo);
> > > > > +
> > > > >   		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> > > > >   	}
> > > > > 
> > > > > @@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct
> > > ttm_buffer_object *ttm_bo)
> > > > >   static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object
> > > *ttm_bo)
> > > > >   {
> > > > > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > > > > +
> > > > >   	if (!xe_bo_is_xe_bo(ttm_bo))
> > > > >   		return;
> > > > > 
> > > > > +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> > > > > +		xe_sriov_vf_ccs_detach_bo(bo);
> > > > > +
> > > > >   	/*
> > > > >   	 * Object is idle and about to be destroyed. Release the
> > > > >   	 * dma-buf attachment.
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > index eb5e83c5f233..642e519fcfd1 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > @@ -78,6 +78,9 @@ struct xe_bo {
> > > > >   	/** @ccs_cleared */
> > > > >   	bool ccs_cleared;
> > > > > 
> > > > > +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF
> > > */
> > > > > +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> > > > > +
> > > > >   	/**
> > > > >   	 * @cpu_caching: CPU caching mode. Currently only used for
> > > userspace
> > > > >   	 * objects. Exceptions are system memory on DGFX, which is always
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > index 8f8e9fdfb2a8..c730b34071ad 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > @@ -940,6 +940,136 @@ struct dma_fence *xe_migrate_copy(struct
> > > xe_migrate *m,
> > > > >   	return fence;
> > > > >   }
> > > > > 
> > > > > +/**
> > > > > + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> > > > > + * @m: The migration context.
> > > > > + * @src_bo: The buffer object @src is currently bound to.
> > > > > + * @read_write : Creates BB commands for CCS read/write.
> > > > > + *
> > > > > + * Creates batch buffer instructions to copy CCS metadata from CCS pool
> > > to
> > > > > + * memory and vice versa.
> > > > > + *
> > > > > + * This function should only be called for IGPU.
> > > > > + *
> > > > > + * Return: 0 if successful, negative error code on failure.
> > > > > + */
> > > > > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > > > > +			   struct xe_bo *src_bo,
> > > > > +			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
> > > > > +
> > > > > +{
> > > > > +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> > > > > +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> > > > > +	struct ttm_resource *src = src_bo->ttm.resource;
> > > > > +	struct xe_gt *gt = m->tile->primary_gt;
> > > > > +	u32 batch_size, batch_size_allocated;
> > > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > > +	struct xe_res_cursor src_it, ccs_it;
> > > > > +	u64 size = src_bo->size;
> > > > > +	struct xe_bb *bb = NULL;
> > > > > +	u64 src_L0, src_L0_ofs;
> > > > > +	u32 src_L0_pt;
> > > > > +	int err;
> > > > > +
> > > > > +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> > > > > +
> > > > > +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> > > > > +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> > > > > +			&ccs_it);
> > > > > +
> > > > > +	/* Calculate Batch buffer size */
> > > > > +	batch_size = 0;
> > > > > +	while (size) {
> > > > > +		batch_size += 6; /* Flush + 2 NOP */
> > > > > +		u64 ccs_ofs, ccs_size;
> > > > > +		u32 ccs_pt;
> > > > > +
> > > > > +		u32 avail_pts = max_mem_transfer_per_pass(xe) /
> > > LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > > > > +
> > > > > +		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
> > > > > +
> > > > > +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > > > > +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> > > > > +					      avail_pts);
> > > > > +
> > > > > +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > > > > +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
> > > &ccs_ofs,
> > > > > +					      &ccs_pt, 0, avail_pts, avail_pts);
> > > > > +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > > > > +
> > > > > +		/* Add copy commands size here */
> > > > > +		batch_size += EMIT_COPY_CCS_DW;
> > > > > +
> > > > > +		size -= src_L0;
> > > > > +	}
> > > > > +
> > > > > +	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> > > > > +	if (IS_ERR(bb)) {
> > > > > +		drm_err(&xe->drm, "BB allocation failed.\n");
> > > > > +		err = PTR_ERR(bb);
> > > > > +		goto err_ret;
> > > > > +	}
> > > > > +
> > > > > +	batch_size_allocated = batch_size;
> > > > > +	size = src_bo->size;
> > > > > +	batch_size = 0;
> > > > > +
> > > > > +	/*
> > > > > +	 * Emit PTE and copy commands here.
> > > > > +	 * The CCS copy command can only support limited size. If the size to
> > > be
> > > > > +	 * copied is more than the limit, divide copy into chunks. So, calculate
> > > > > +	 * sizes here again before copy command is emitted.
> > > > > +	 */
> > > > > +	while (size) {
> > > > > +		batch_size += 6; /* Flush + 2 NOP */
> > > > > +		u32 flush_flags = 0;
> > > > > +		u64 ccs_ofs, ccs_size;
> > > > > +		u32 ccs_pt;
> > > > > +
> > > > > +		u32 avail_pts = max_mem_transfer_per_pass(xe) /
> > > LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > > > > +
> > > > > +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> > > > > +
> > > > > +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > > > > +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> > > > > +					      avail_pts);
> > > > > +
> > > > > +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > > > > +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
> > > &ccs_ofs,
> > > > > +					      &ccs_pt, 0, avail_pts, avail_pts);
> > > > > +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > > > > +		batch_size += EMIT_COPY_CCS_DW;
> > > > > +
> > > > > +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> > > > > +
> > > > > +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > > +
> > > > > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
> > > MI_FLUSH_DW_OP_STOREDW |
> > > > > +					MI_FLUSH_IMM_DW;
> > > > > +		bb->cs[bb->len++] = MI_NOOP;
> > > > > +		bb->cs[bb->len++] = MI_NOOP;
> > > > > +
> > > > > +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> > > src_is_pltt,
> > > > > +						  src_L0_ofs, dst_is_pltt,
> > > > > +						  src_L0, ccs_ofs, true);
> > > > > +
> > > > > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
> > > MI_FLUSH_DW_OP_STOREDW |
> > > > > +					MI_FLUSH_IMM_DW | flush_flags;
> > > Missed this - you don't need MI_INVALIDATE_TLB here, just after emitting
> > > the PTEs. I believe that should speedup this copy a little too.
> > > 
> > This works out if we are using different VMs. Since we are using same VM for all BOs, I was suggested
> > To add MI_INVALIDATE_TLB after each BB to avoid any caching issues.
> > Correct me if I am wrong.
> > - Satya.
> > > This also looks wrong in emit_migration_job_gen12 too. Going to follow
> > > up on this now.
> > > 
> > > Matt
> 
> Removed MI_INVALIDATE_TLB after emitting PTEs and kept after copy command.
> 
> > > 
> > > > > +		bb->cs[bb->len++] = MI_NOOP;
> > > > > +		bb->cs[bb->len++] = MI_NOOP;
> > > > > +
> > > > > +		size -= src_L0;
> > > > > +	}
> > > > > +
> > > > > +	xe_assert(xe, (batch_size_allocated == bb->len));
> > > > > +	src_bo->bb_ccs[read_write] = bb;
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +err_ret:
> > > > > +	return err;
> > > > > +}
> > > > > +
> > > > >   static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64
> > > src_ofs,
> > > > >   				 u32 size, u32 pitch)
> > > > >   {
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > index fb9839c1bae0..96b0449e7edb 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > @@ -24,6 +24,8 @@ struct xe_vm;
> > > > >   struct xe_vm_pgtable_update;
> > > > >   struct xe_vma;
> > > > > 
> > > > > +enum xe_sriov_vf_ccs_rw_ctxs;
> > > > > +
> > > > >   /**
> > > > >    * struct xe_migrate_pt_update_ops - Callbacks for the
> > > > >    * xe_migrate_update_pgtables() function.
> > > > > @@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct
> > > xe_migrate *m,
> > > > >   				  struct ttm_resource *dst,
> > > > >   				  bool copy_only_ccs);
> > > > > 
> > > > > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > > > > +			   struct xe_bo *src_bo,
> > > > > +			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> > > > > +
> > > > >   int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> > > > >   			     unsigned long offset, void *buf, int len,
> > > > >   			     int write);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > > > index ff5ad472eb96..242a3da1ef27 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > > > @@ -5,6 +5,7 @@
> > > > > 
> > > > >   #include "instructions/xe_mi_commands.h"
> > > > >   #include "instructions/xe_gpu_commands.h"
> > > > > +#include "xe_bb.h"
> > > > >   #include "xe_bo.h"
> > > > >   #include "xe_device.h"
> > > > >   #include "xe_migrate.h"
> > > > > @@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> > > > >   err_ret:
> > > > >   	return err;
> > > > >   }
> > > > > +
> > > > > +/**
> > > > > + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> > > > > + * @bo: the &buffer object to which batch buffer commands will be
> > > added.
> > > > > + *
> > > > > + * This function shall be called only by VF. It inserts the PTEs and copy
> > > > > + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> > > > > + * function.
> > > > > + *
> > > > > + * Returns: 0 if successful, negative error code on failure.
> > > > > + */
> > > > > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> > > > > +{
> > > > > +	struct xe_device *xe = xe_bo_device(bo);
> > > > > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > > > > +	struct xe_migrate *migrate;
> > > > > +	struct xe_tile *tile;
> > > > > +	struct xe_bb *bb;
> > > > > +	int tile_id;
> > > > > +	int err = 0;
> > > > > +
> > > > > +	if (!IS_VF_CCS_READY(xe))
> > > > > +		return 0;
> > > > > +
> > > > > +	for_each_tile(tile, xe, tile_id) {
> > > > Same comment as patch 1, I'd avoid for_each_tile and rather use
> > > > xe_device_get_root_tile.
> > > > 
> > > > > +		for_each_ccs_rw_ctx(ctx_id) {
> > > > > +			bb = bo->bb_ccs[ctx_id];
> > > > > +			/* bb should be NULL here. Assert if not NULL */
> > > > > +			xe_assert(xe, !bb);
> > > > > +
> > > > > +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> > > > > +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> > > > > +		}
> > > > > +	}
> > > > > +	return err;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from
> > > the BO.
> > > > > + * @bo: the &buffer object from which batch buffer commands will be
> > > removed.
> > > > > + *
> > > > > + * This function shall be called only by VF. It removes the PTEs and copy
> > > > > + * command instructions from the BO. Make sure to update the BB with
> > > MI_NOOP
> > > > > + * before freeing.
> > > > > + *
> > > > > + * Returns: 0 if successful.
> > > > > + */
> > > > > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> > > > > +{
> > > > > +	struct xe_device *xe = xe_bo_device(bo);
> > > > > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > > > > +	struct xe_bb *bb;
> > > > > +	struct xe_tile *tile;
> > > > > +	int tile_id;
> > > > > +
> > > > > +	if (!IS_VF_CCS_READY(xe))
> > > > > +		return 0;
> > > > > +
> > > > > +	for_each_tile(tile, xe, tile_id) {
> > > > Same here.
> > > > 
> > > > Matt
> Fixed in new version.
> > > > > +		for_each_ccs_rw_ctx(ctx_id) {
> > > > > +			bb = bo->bb_ccs[ctx_id];
> > > > > +			if (!bb)
> > > > > +				continue;
> > > > > +
> > > > > +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> > > > > +			xe_bb_free(bb, NULL);
> > > > > +			bo->bb_ccs[ctx_id] = NULL;
> > > > > +		}
> > > > > +	}
> > > > > +	return 0;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > > > > index 5df9ba028d14..5d5e4bd25904 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > > > > @@ -7,7 +7,10 @@
> > > > >   #define _XE_SRIOV_VF_CCS_H_
> > > > > 
> > > > >   struct xe_device;
> > > > > +struct xe_bo;
> > > > > 
> > > > >   int xe_sriov_vf_ccs_init(struct xe_device *xe);
> > > > > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> > > > > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> > > > > 
> > > > >   #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > > > > index 6dc279d206ec..e240f3fd18af 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > > > > @@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
> > > > >   	XE_SRIOV_VF_CCS_CTX_COUNT
> > > > >   };
> > > > > 
> > > > > +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> > > > > +		struct xe_device *___xe = (xe); \
> > > > > +		struct xe_bo *___bo = (bo); \
> > > > > +		IS_SRIOV_VF(___xe) && \
> > > > > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> > > > > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> > > > > +		})
> > > > > +
> > > > >   struct xe_migrate;
> > > > >   struct xe_sa_manager;
> > > > > 
> > > > > --
> > > > > 2.43.0
> > > > > 
