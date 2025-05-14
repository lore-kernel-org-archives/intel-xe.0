Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15824C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 22:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3E210E02F;
	Wed, 14 May 2025 22:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/BdQ3H/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD0A10E02F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747261818; x=1778797818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lSi4v8PkEtcVmbWAz5l/y5Iktk3NJYjiAmXHXq7x07U=;
 b=R/BdQ3H/K3e1I6/2RxAPvgrE2pVaU6QcMucC0xMCi0PflG5liAkZrt9k
 LBKupek9HOOhRcGG2FtfMlmWfsQu2aM1Xd6NrbRbj4/cQCbm66ynlqM2P
 9pAxNIEmXm2TELfLrJZf6cpcULah/+6x74an4CFRKLrBpKUjjhJmtZ7jF
 JTuERjWiT+8kSO/0IFtkVvxYasLdTQmJzaZxgzGFgXsF5qNApMdJEvftS
 +XvZwsrYnzj0dCoYPX2zfZLVNseL4IYSdwK5SaIeBjNVvRDljrbc37GZp
 HS7bQnfpQOtTVt9scNQkr4dqHgKtcwHkCLdUzgrHysmVunx2VioD+VoId g==;
X-CSE-ConnectionGUID: 3mSL9YAxRzKLjBwZc1Z0aQ==
X-CSE-MsgGUID: ftVZ6hfPT2icncFSCaRJ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60584640"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="60584640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:30:18 -0700
X-CSE-ConnectionGUID: nm2ml3+UTUCvkdVEUD745w==
X-CSE-MsgGUID: cH+1E6y5TB6bfF3FEP/0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="139082376"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:30:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:30:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:30:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bks33NQfQyTR72d/LJQ+v1gEER+AjRLoZS87ippKH8dEoHY5PQlpslohZd7kMt5ejwTHkgPtQIzajXYBNVMfNN4+hWr2eaUTtgOFzhyrvuwyZxHcL/6RIMUqQPt/jtSWu0NLLfIUZHmvNbmtcB6ECwe3Ef8jw6oibU/oqhmRxg7tlJcxW3yO06L8aB3EIVf/9aFlBpdehFgLuiNolQYJMf4gZloggrwymzE472CrSWJIomggf8XwWBBYovtNq2ZzHedxGEZjlM9TgDT4ffBMAW2X0HLxLy/5yZqOLp9MhdLVUViHBbSDbA2DFZvkrzQJHFTP0fKjIOfHX10PAsK8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GuSn8uvqpRCxCIO3E/ly5KQM2i4nrh96mkvTHLaKfc=;
 b=J7mLJQLZK0VqluRnmkp5M554QkFgVH2QPDnhd1BJxc+QLlT0EGQCsp/6lh9xQ+9UyJMApoQfONrxPt/QZ0HD/7NUQUIpqaNloxcuWUmRefqBP0FRWTNQC2cUTKcVFTGUO+49dvL6JpndHZwj7R2N9NFa/S1IXG6gYO9UleBJWeKELsJL0r24rRFMM6oWPTWnITTseYCbYoT2b3iEs+ShsYPyEnucWoRtmTt9/DkeOeyTQ6I6aTcpbvOBsZ0pfB3KMfjyr9Vaoq5lXQtx6eYZK2HrxHHVE1xyPLNwCWkjcKgh3DpWlKDl4HH8Q0V3BlhyO51l1LHvVjLpOyk/uqZJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 22:29:47 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:29:46 +0000
Date: Wed, 14 May 2025 15:29:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/guc_submit: Simplify and fix diff calculation
Message-ID: <aCUZWHWVF594j3fy@unerlige-desk.amr.corp.intel.com>
References: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
X-ClientProxiedBy: SJ0PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::24) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|PH7PR11MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd69e71-32be-47d7-7d01-08dd9336d4f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUlaNkhJaXpzSEhodFdCa0I1QlBPaFJGUlR2VkFWNGZuQjFZTFdlS251RUNL?=
 =?utf-8?B?ZjMvUHU2L2NYaEdsSWRsZkJPOURFSDNDT3drU3E5Vk5sNFdMVnc0cHpzS1d3?=
 =?utf-8?B?V1d3TnBEVVRvSDBQaEdHV0ZZam1UcDdYNXVkQmJRQ0NBVnZiZ1RST3VlTlR5?=
 =?utf-8?B?c3ZlOVNkMGVRVk5LVkgxRHdjdVNua2lxRjhNVHFWK2pzV3p4dTNZcGljUTJR?=
 =?utf-8?B?NUREVkkyZ2FYZ2JWUnozeGU1eC9oRitPSW11NlhTS1c2RHdwN2pVN2NyYURr?=
 =?utf-8?B?R3FkUk1lL1pXdGNRVFFpVVNsNWYvbFk1UklNQkFIL3U4bFNpVGlscEZHam4y?=
 =?utf-8?B?L01KMVdkZ3NlcGhCTDMxTGVrVlhGVEtIL093UDhSUVhuT3VpUFNjcnBUS2Uy?=
 =?utf-8?B?eHR4QkRvZEJRMU9NZjJsbFBGMVBSbHlqUG9RMEdZTEc3WjgyUDF2by9vTldP?=
 =?utf-8?B?MTJEd21QZi85azE0RkNyd2NVMTFYZTNvSUczbWcvc29wQ3lXdlJRTGozYU1l?=
 =?utf-8?B?bWtrazREaSt6ZXNOdUYyMHRsM2NDd2xQK2tLcGNmeGlRclkzY0c4QVlUOHk5?=
 =?utf-8?B?NXNVQ2dsZkxYM0xDWXBCNUFsREM2T2ZJL0JNbjFrWjJzQ1BFaFdCSEtvS0pX?=
 =?utf-8?B?MnN4ejJHYmZheDJCM3luNEx3Q3V3MXR0OTlxYVF6WTVDVDNPbWZId2kxYkFm?=
 =?utf-8?B?SkNKRXNSdGZjUGw5aUVDV3BvQjRpY0w1RlMxWU9vV3FnTHNWckhrMERwdlRm?=
 =?utf-8?B?QkJ1eHVSSUxYUmxiWUtlVkg2RXcreVNIZHovRlZWZXJYMnYvRENQZitZRXNQ?=
 =?utf-8?B?S3F6bTlteS9uaXdodjlFYm9IT0d3YytOWEoyU3hoMnhWWlBaNGVBTUhjaVQy?=
 =?utf-8?B?YXZuaTJ1NkRaYkRqbGRnbVd0Rk1jWXlaSi9GWU01bDY4alEyRmZPc1lkRmQ1?=
 =?utf-8?B?em1hTko0OE4rc2FCZnErMWJabnE2bzgvT25nRVNnelliVVRJZmN3YTROSTV4?=
 =?utf-8?B?S3h1L2gxQjJvN1FzUnUrNG04WE9ZOFo4cGg0UE0yYjg4WTBFVTJKZk1Palcr?=
 =?utf-8?B?cmNKeUxDTnFzdHpHZVA2TFR0cy9DR0YvbGlUbTdYUEUxd2dkMlQ2NTU4Rjlv?=
 =?utf-8?B?aDBlclNkNXJxTGN2TXRsVEUzMVdqOVRMRXF6dlhpSXBBUXRETnFTV3J5OVp0?=
 =?utf-8?B?V1RKaHU0R3VwZCtOMjIrVjc3cXZUZUYzWFczemsvS2VURjFlTVJqRzN6VU1R?=
 =?utf-8?B?YU1YTVJNUndaeU03NmhZRnp3L09NSFZwMVB6R01iTkNXTHJtZmhQZDVsTWNX?=
 =?utf-8?B?QXI5RU56eUtaeHhZQUsxZmZGdDN6VnlrbUdlUTlpNE03b2RGSWR0VlFLRjh0?=
 =?utf-8?B?eFpvV1hiakpvdkFDMUhFRXlVUm00MGxpTlFnbjVuNzd5bWNNQk40R3JjYVg4?=
 =?utf-8?B?QlU3SG1EZjNsVVpSNFZjdjN1TE8zVXVabFdaSzhRSkpCL1h1ejZwNS9uRVpz?=
 =?utf-8?B?bW41OXY3OEt6eXhVejFRbENSRGl2b3AwVUlTU09mdUFMOC9QelpNd2V5RlRV?=
 =?utf-8?B?YlRKMHpQVjltUWtNZERPZUplZjRkak1UYllMbytTZWRBa0Q0cWt4MmZnOUFD?=
 =?utf-8?B?M1NyODBFM3J5UXd3TW04ZUdLRFdKeXNYSnhhMGhhUTMvamZQc1JrNTlpRnFO?=
 =?utf-8?B?L3VUK2p4aThpeGoxM21MUlNZMGQxZFBqc1FvSFRLS0F6MXdZVGh4ZVFjOGI0?=
 =?utf-8?B?ekpuU2Q2cDlSWkd4VXc3OVZ2bktVNHhSbTBleGxYVnF6djlNelkxQVBoSVdH?=
 =?utf-8?B?K2I3Ui8xMDZkOTVwMnpldFBlNWNKcnl4RWpMbFFHYlZhSUgzNXZVbkJhMDRv?=
 =?utf-8?B?K2hMdGI0VHAyajE0bDVjakFFOXJzVXhlQjVKdDdLaHJkS0NuZ1hOYWhIWG11?=
 =?utf-8?Q?93iGHr1VtWI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R291dnVOaldGcUdiREFHck5ibmZBYVBwU1pPREpiekhzQnhSQStWeVNUamlX?=
 =?utf-8?B?QmpQdXdzcmdPSHU5Q2FlU25sVFY5ZndZK2E1TWRsdUlsUVk2Ynk1ZXFLeFBL?=
 =?utf-8?B?QlFqeDRLV0cxN1dQaHloNTJuUTQ1TlhKdERvVGx0M3lKbytXYStyVnRoYmhG?=
 =?utf-8?B?dFNpVGZPNklwSWZOSjd2TUozVTJxVXdaR3FyTUl4TmIvbFl4ekVYTzN2dUsr?=
 =?utf-8?B?WFpVSFMzdU8rRldqNnpHTmQ4ck9ZaTM5OVgwbTZiczRvbHFYcnlQVWxpbTRY?=
 =?utf-8?B?eXNySFgzenB2dkZSTi9aN243bm00d25BN0VyZFpHK1h5cm02ZjhtMHVPQjZO?=
 =?utf-8?B?R0tlWFJpdzA2THpzNllkR2tXeTVYbnJpWGp5SzZFQitxNTdTQkhvd0dtWjUr?=
 =?utf-8?B?L3pBU1AvazkyM0hOUlhxTkIzMkFWODVVN1kySE9zeVBCYnlNdW5FdkJWK3dn?=
 =?utf-8?B?aUQ3dkRYcHdPZFdFd3BoeWZRR2E0aUpmdmdqUjhTY0N6SjVXbVN1ZU5aZ2sy?=
 =?utf-8?B?MmJjNjFjSy9uaFp2VnNTSXpqdXE0WHg5ZnV0TTZ5emJvbXArZzI0cStGSFpV?=
 =?utf-8?B?VFdRVW00TTBJczAvQ0dTWDBWRjdqaTg1MU9sTEMxS0QwRTFYd09vY3A0c0VT?=
 =?utf-8?B?UERhZFhEWS8zZjcvQ3h5cmJuVUVZbFFsSmc2MjF4SFZ6OUkyT1dlT0luV1pC?=
 =?utf-8?B?WEtkSkdKMjRPbGZZM2NSUElpZ1dGOXhxTHJJa3Bpb3VES0syaG5zVCtxaW5t?=
 =?utf-8?B?eVJoWnhZNnByMkY1VCtZcTVzTTJNb01sb1FybWFDQTMwWXJJV1lCTzJLRE5l?=
 =?utf-8?B?c3ZadHhBZDV0YkRqcnh6SHdmRzNHQURuWS9FTFhBUWVWVmJtdW43TFhBVmUr?=
 =?utf-8?B?VE5oZDFZVUthTTBqaWxDTEV5VGlZVk11TDZhTkNPTlVmUCtVQ1NZTU9sNmZJ?=
 =?utf-8?B?akk1ZW05SlhicW4vMU5TQTlUVHpIVjIyZGlnamM0bEVQTVRnNEI3a3N6R1ho?=
 =?utf-8?B?eWR2My9sTlFxRDBERTJlWlBEWURRVXBibStueE1mejI2eGlyb1NxNEpPY2lR?=
 =?utf-8?B?TTcvVzZEaU9XWmFrb2F6MGcyWjJCR01POC9lRFFBTnBTMEhMVUNmNGx2TG44?=
 =?utf-8?B?VTh3Mys3NDlpdUo3S0xoekpKY3ZjQnlEUU9oaTdUYmh1WUh4dmNoVEwzNkdO?=
 =?utf-8?B?NC9ZditxNDBwYzV3K3RReENjbGphVHpYQU0xdGFLSVdlU2hoN3RubDZzZ3g5?=
 =?utf-8?B?MWRaeWxrYWJMMFJIU01CWjVySnN5aWM4cjhCU0xIdGN4NC9pRWNGMFg0MTJu?=
 =?utf-8?B?eUdBYmVDVE54NGlSd1REUlQ5c0VCTHNaakplcDh2YXk0UGx3NDJ3QjAvN2Zy?=
 =?utf-8?B?OGE4Vi9tK1VVOUJWY1hkMWN1M1lCLzVUTGhLWkJsQXpnckJPbmt1ZEFsdkdk?=
 =?utf-8?B?cWFOZG8xMDZIYVc2dlFmWnBRUzBZRHFLRmZTVlR4Rm5sQS9LZTVVWndOM2hV?=
 =?utf-8?B?QjVKYUgwT3RaaWo5ak9PdUJPczRzUjRVWDIweVk3dm1FZ1pNZ0ZsSG5ESkYy?=
 =?utf-8?B?QmE3ZEUzWHNPMFk3M1dkUUI2RlYxSHdYY09yUVpMYkZrc1M0cWtISWFBNTBp?=
 =?utf-8?B?RWFuc1RjSjdlS3RCbzVhRFpyY2xQdjVkMmRzbWRuVTdZSE42NWZqRllxK0s5?=
 =?utf-8?B?cnRINjJXQVB1ckRZWkdUZk1rN2V6RXl2WW1uKy9UY29sRjRvbmJuRFVrTVhT?=
 =?utf-8?B?T0ZEVWpHakdyNG1TclFIOGg0bXhFUy9mVllzejZEQU1aZTlyTTZGRitUQUxL?=
 =?utf-8?B?cWdMRUVZdk8wRDh0dm1PTGJJcUtld2IyclZab3NYMFpqU3crUTRlNmtDYnNV?=
 =?utf-8?B?cmg1ZWJSZzQ0cUNTNW5lL0pjOVhET2FhUUZJNk8zUlIybGRUS0NOcVo3cEFx?=
 =?utf-8?B?dHV5MlpXTUI4QnRLSEMvSithYVlhK3YzK1dXN1ZYcHFmRExNRnphTmxkaXUr?=
 =?utf-8?B?TzdHZkJOem9mVlN0QmxlR3ZPdnFDWldUZndwb1piNXBMeGxoUjJXY3NweGJr?=
 =?utf-8?B?aG5XVkdJM3ZRZGtLMGdqaHVkVEVqdEF0MkxDWm5YY2s5YmJ2ck91Tk1wS2c2?=
 =?utf-8?B?U3JFM2U4MUU0eldNbEtGU2VLeC9IOWdvVzcrSXVjMEdIUVVJWnFSVEwwQkJU?=
 =?utf-8?Q?5o3DPaxE3sEtNYI9oYw/rso=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd69e71-32be-47d7-7d01-08dd9336d4f4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:29:46.8958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z69t//CnDRt4TMtV/LAzPFHX88ch+I/xJtuBDp1f9nnCoMQj0ymBMcLQHgnVGN5n3FQgRNHsbOV0Bv4ZZELZJg7XxDM4mCzivOeM6sxwFJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
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

On Tue, May 13, 2025 at 07:25:49AM -0700, Lucas De Marchi wrote:
>With a u32 type, there's no need to check which one is greater: the
>current is always the latest and if it's less than the previous, it's
>because it wrapped: just do the unsigned calculation that will lead to
>the same result, or better the correct one. It fixes an off-by-one in
>the wrapped calculation, however that doesn't really matter for the
>timeout calculation.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index fb125f940de8f..80f748baad3f3 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -976,10 +976,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> 	 */
> 	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
>
>-	if (ctx_timestamp < ctx_job_timestamp)
>-		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
>-	else
>-		diff = ctx_timestamp - ctx_job_timestamp;
>+	diff = ctx_timestamp - ctx_job_timestamp;
>
> 	/*
> 	 * Ensure timeout is within 5% to account for an GuC scheduling latency
>
>
>
