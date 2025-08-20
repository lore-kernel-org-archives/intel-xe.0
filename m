Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6212CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 21:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3C210E800;
	Wed, 20 Aug 2025 21:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhUBSuvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E0810E7FF;
 Wed, 20 Aug 2025 21:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755726915; x=1787262915;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=VME7IAxRuXJ3UDahLN+N2kaf/RrhS1rPGj97sBrjaxg=;
 b=YhUBSuvx6sm+FjyD7cZZJlfDYzukrwIiTsuBGa8t6X2AFzPofHj78S7m
 jgN0RFGYdMx6JZiWWp2Kfe8e6nBnipyvl5jkErytLJs18yZ6DGQUMztLQ
 QL2vM9IrAF9mPxrWcE+83WPQn0BWMTZGYPaH8hH1GXc7Nu5/gucziW2FB
 8pyM5WvDoaPYd8IquglNtWOrFYFQEJxRviSX76a3RhUy6NctWbW4sfU8y
 rDU7OJv6t0dyOB+kP+83lGxY4mg6TLA6gTbJr5lSjpUMbdL0+55+jbGF9
 RiWBVnuR7nyZyEYHbsXwM1OYyvVdk+cqdG//EN5PCv97ePmI1TnTVPO5o Q==;
X-CSE-ConnectionGUID: HV4MJa+XQ8KpAvi6AmRS4A==
X-CSE-MsgGUID: 8yJuEiBvQwO3mqPSCcqzdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57210940"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57210940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 14:55:14 -0700
X-CSE-ConnectionGUID: 34HUpzPaQ6OUCMwM8F3doQ==
X-CSE-MsgGUID: 9sxmDIO+Q7WcWPbT8fS2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167459244"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 14:55:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 14:55:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 14:55:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 14:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEX3s1QqgNPbu2WLAZOPx25crOIcnwF1i2WEJutSvSDwWNsMc0VqxNV5sSFcNcFQbvo5ZPR74bFnOiRoKDxLtO04uYqB9e98UMXyOCUGF1aSdHLVJmtl2ts7joXF7r8Ww4UPtAJdVXjOhPHV8eTi1FNp3plOpMtywKh3kFdtt0KxoZgRJpFHA13Xi8d1shK9WTPAXZv1SKI5WMuWGgijYhP7x+uNR4sXUplYkcfolmPTghzkEwgWQs4sZn0V3wM1ZlhePc+Tqv/9kzmxIfjsOzu2+7xHf2tUFVmdHPdT0/drN99qI/UzXflJt4AI3aGEfoEcQDwnwfM94ujNmfZRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCxkF81KiOljHZJPOep8BYdzvDNA8LVYUbITUEniJd0=;
 b=A6eMpy5S0Cs56KsjOQuG9/W/VAv8g42muuJeeGxZ/S/gKMNvuP4ZJPkSzULmwMXDJAVgwCbv/okUx9NOyAfOqJAu77OGEOnIhKH+WR1f8xyLd3+8cFQr4ufnUnxA9j4uSgQWfBThoVnaa5i3xu2r8AdG2cMB3sRS3Kvz/4oI4Il15vRAVrE4A8DvpTLgKPArgKP1q3wy5T+7J4sOlES8H3klqyczqkMwE2gCSXVC4hJj7CHyda3OpZfNFTfE4E0H++sNBM0oDOZNUqgk0b5Tcl9P50ixea4no+sgAzbt3y95nWYW8rHU3jINBup1gGI/DyrDtxm4UinpjODK5f5j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 21:55:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8964.023; Wed, 20 Aug 2025
 21:55:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175562234293.248501.1977930331248589198@1538d3639d33>
References: <20250818-gt_count-improvements-v4-0-ee12870c6f57@intel.com>
 <175562234293.248501.1977930331248589198@1538d3639d33>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for Tile and GT counting
 improvements (rev4)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <intel-xe@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
Date: Wed, 20 Aug 2025 18:55:04 -0300
Message-ID: <175572690485.2175.3252231001352799722@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:303:85::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 587c74c8-54ab-4df6-378b-08dde0343bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGZqYW1RQmhRcC82Vk5oM09PeGFwM09xZHdiQWRIVWhSdVFQRlQwSDRrYkFn?=
 =?utf-8?B?cmlScm12Ym4rY2ZSZXhqakVQL21tYjlaMkJ3UGxCQ0hscU00VDJ1S01RZFps?=
 =?utf-8?B?UEVHaFlCSlRSNmVEdDZqZG9KQU5Gd3hrNXdUbnBKdXpIRHRDdmNBQlUra3dw?=
 =?utf-8?B?RWtTVUk4RTFwVXFRZVF5dnZuTnhmSDM1UWdYRWJqTndXc09YRmp4eEMwa25a?=
 =?utf-8?B?a1BsSTB2MTdBcEpnZWJHamR0eUJ2TnVTVVUzd2swVURjWkRqVXBDOWtRYjdx?=
 =?utf-8?B?TGdkdEVSVHBXN0lUZnIrSWV5dHM5b1YydGphWGFpY01ibDhRaEp6dUw0Z3Nq?=
 =?utf-8?B?WmNramw4V2Y5anNyQXdIOUJMQVFTL0xIWitLY2dQbytjaFF1QTRLWmt0aCt3?=
 =?utf-8?B?RkNxemhPZHFJdFhUM2pJTVVlQWtHQzdIZXVHcXI1YXJ1WW1BSWZXYXhqNXdy?=
 =?utf-8?B?bXJDRmRHQmJGWjF2NnNWbm9oMnpDc05pcHFBaCt1b3hmemkvalp2bnVyaXpy?=
 =?utf-8?B?OEU2NHZPTnQrLzJoeHVZbkphdFY3TUYzQXduWnVrKy9yUU5wMjVSVklMY1RC?=
 =?utf-8?B?U1Vya1dHRm1ZeHYvNm9SMDFPWmxiV1BxWWNQQ05JbjNZeUV6VmtKdkhvaXNr?=
 =?utf-8?B?ays1UWNzU21jeHFXTENmclFPVzJzek84N08zYVRDYWsxSmorbklXWFNINHJQ?=
 =?utf-8?B?VkZCdzFtbEFkdlRDaVJuVW5OZ0lwKzB0ZEZjaDIxR2dNdkhNRllIUEpZVk5s?=
 =?utf-8?B?UW85cVlnTXR5TWs2eThtTFI3WXFQdUM0UVMyZ1NwMEZ5cW9Nd1AwRk5aa0Z5?=
 =?utf-8?B?L3QvZW9LSVNkdm5MVDBxNTVFemhUVUNkeHhNRklubWN5Sm8zNXBiU3Y3aTls?=
 =?utf-8?B?Q2ZFTTFua3NLSm5wdHJWWmYzSGNSa1VqaTdxUmlmdHMzd1pqbkx1SWNxSE8y?=
 =?utf-8?B?Vlo1WGJxWEJnVEFTU053OStYQlp4SkI0RE9YcERVeEZ1SUV2ODlVbHpDaWtU?=
 =?utf-8?B?TnFFdWV6MWFuT2p2bktTeENxRGlYUEhzcWhQVWZhbkljd2ZCeUFtRXRSSHM0?=
 =?utf-8?B?dnF2T3BYaEhXR0l2QlBORE1EbmJlS0J5U0hvREVNNEtaSUN0bk1ZTDNFanRy?=
 =?utf-8?B?OHRNRTQ2N2tsM0dxb2lQNDRKQkNRMmtBY3V6SlNEdUJZbElhaWJIaEpiR2l5?=
 =?utf-8?B?RVlRTWJmYkZIRlRaY05MY2hWUldnVWcrWldvY0RxVldsT2J2QkFmdklaNlZY?=
 =?utf-8?B?VitKSVE1Zk9hVnhqU1NnRWhBYmMyWVNIQjVyLzYxRVU5dTEvTHpzeUJNSnZ3?=
 =?utf-8?B?V0NsOU5VZnNTOXJoN3dRNDQ0T3E5eElnYkc5ZysramIvcHlTSWxvRVYrS2xV?=
 =?utf-8?B?V1JSSE1tbHp4TENnc3hCdGF3WlNEeG9WY1VmZ3Nmb21WSm8yaG4yckJFVTUx?=
 =?utf-8?B?Q0dUYnltaEJGMS80M0k1VS81bWtnWllENDBHZElTTG1pZTJJQ1htaWw1djJ0?=
 =?utf-8?B?cEplRmdhdDV1ZTdEZWU3LzlVSExTL1F4YjNORDNBQ3hCaDFzYzkwU1FnUFls?=
 =?utf-8?B?RVV0Mm1QS0VHc2M5RFBrRTJHWUtZKyt5dkxNTHpTbUlGb1RWc0FoRThFYVFM?=
 =?utf-8?B?c2J4WEVOMzAzTG1aSjRDODMxNkljUk1IbUNhWS9uSVBOZEVXTXBNdVBPUEFI?=
 =?utf-8?B?R0N4SmhKVmRRdDRaaUxLd2N3N0dwSktTeHdyM1p3K1I0Q3lXa2dKdDJVdGdJ?=
 =?utf-8?B?alN6dXc5ZGsycmpxaTlVaDZxamoxM3p6Y042S0x0VmR2TjlPTEJLN1ZzYUUv?=
 =?utf-8?B?SFAxZ2Y5dm5JTjBrL3FCK1U0dVlRd2ZuUWcwMDliemlZMUZPS2ZuVWhmL0k0?=
 =?utf-8?Q?4shc95TGil+I/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ljeDViZjBmR0lmaWtMUGM4MHN1UWMwM3Z1QStZK2lSN0dLS3FsUGQ5V0xY?=
 =?utf-8?B?QktVVUMrNHlGazVwT1pjRTcwbG5LV1YrVlBpYW1SeVJjRkV5ak43d25HcWtV?=
 =?utf-8?B?WndnaStDT1VXb3JUUTVDWGsyN2REdW51MENOcDBvNlNacTd5S3cwOUlXb0xp?=
 =?utf-8?B?UVd2ci8rb3haUGg5T0E0bjd0MHEvYmpyb2RvSjBua2lMN0VuSktQZjZWVlN6?=
 =?utf-8?B?aVgyck1KMG1ZKzBiSmNpcmdwNTNqWk9WWStoOVppWTAyQnlmRElmNk96Nkk0?=
 =?utf-8?B?ZWhYSmlsSURFbVdSSlJlbFRxOGFvUU1GNVZ0SVBNY2JidzZQc1NnRVVndkhr?=
 =?utf-8?B?NW5hbXRKREZXNVZmaFNIcGJ6TUdiRi9lTVJMU25xT1NXbEFxTUdXRnIwbGlQ?=
 =?utf-8?B?bVpDV0R4RFIvM29MNXNHeWtVZXVZaC9XTXpxYmVIQXBIL0xUVnIrTVBqZnk1?=
 =?utf-8?B?YU1BOS9IdWptbStIeFkrZTV4NHUxdU9vZjJ0NDNxc0lLQjNRcTZDKzd6S3Bo?=
 =?utf-8?B?ajQ5OTZaMm5XaHlCZk1veFA5WldIY2c0ekhhOG12NWtnVlVFU29jVENkOGhT?=
 =?utf-8?B?SjNnV1A2RjZtcFpjU3NSTlY4ellzc3gyaVdHS3VkbnZRWm5YV3RvSHgrVjhj?=
 =?utf-8?B?WXFvRGc2a1p4VFVLZmx1MStwSnFkci9nQ00xbHBBTDVNSXZFaC9JK3VFd3Jq?=
 =?utf-8?B?Zk96TStHMmNzN2k0YUM1ZnUrbUd4c2xwNHBqWEFqYTc5RHdFdG5ta0QwczRE?=
 =?utf-8?B?VjlTTTRXNm9xYy9SMjJvZ0k1akhjL3BiZ25FcVJnNmRRUXNhR3JKNEt2TGRi?=
 =?utf-8?B?YnZWV2ZyWHBwYWJtdWRLemhxc1IrdmFMN29BTlJHbFc0ZjNMMEhkY3pZVlJt?=
 =?utf-8?B?dWEzSW9LdnJ6SFhPUXdram5iTXM5MUZ3a1BWTXp3ZEdsZlhaa3BSZ01xNm5M?=
 =?utf-8?B?QTR0ci9GK1U1T1hKeWxIanBlbmorZVIzenNTeGJIZWF6aUxISExrckFBcWpM?=
 =?utf-8?B?UnlEVDRVREFCMU9KMGNYeFZaT1h0Z1l1a1BlVE94MlRiRFpzcmpZczBySG1K?=
 =?utf-8?B?MDZZMjdvOG5nRmJsUkxXM3RuWExtZzRORzVRUUd3OXpzaDFESWpEWjBwM3k0?=
 =?utf-8?B?NlhQcmRYR1h6eHZkVkxUYTduM01mUXprLzRnbHN1cWtTd3lCSkNuc0JSbG94?=
 =?utf-8?B?UjNxTDY1NWdxQUtJOVZTcUsremErR2gzVVE2YnpFL2RaWVJ6Mmwwd2FPd1g3?=
 =?utf-8?B?diszMSsxYnJaWStBNjlPaExCRE0xdktwMXIyeHROWU1QUzZwc1VLNktEUDB1?=
 =?utf-8?B?T05oZHMzQ1Zzdm9vYTM5YS9kdnhFVWljdzJXNVRZWE93YkNBblZxN2FhUkdJ?=
 =?utf-8?B?QnlyaE8xd0NzTy9HajBvT29vVDFOcDVqcTc1Q21UMjFuSi9SemhvZlRsaXRj?=
 =?utf-8?B?YlJvSE9GWGJwSGl5UXVEekJkZzZ1ODBKMHBIbys0VEloRXNmOEZmTm9KL2ky?=
 =?utf-8?B?dFJiZi9VTHZid0ZaMTlMRDZ3Wmo3NUd0a05xZ1dYbFp4T2NUeU05STRycEtF?=
 =?utf-8?B?WVd2cVc4UWRvQzdZTlNaWk44NVc0WmNXUWd3NmJyMG5mVXU0WXVWQUJTRVBm?=
 =?utf-8?B?blhSRy9ESW05UnF2eXRzS3FIK21EczBWYkRkT2V6amVIVFNpdHlEZnkxbzYr?=
 =?utf-8?B?a3VlZ0dUOHVoT0pvWVd0c0k0eUxxczN0bVZ1ZHdmTEpPd3RUN3c5bHpaU0I3?=
 =?utf-8?B?Q2VYTlBCM1JxOVIxN2lLT3pjYnpvRTlUQVVyTzg5cFVjVDExbUR4ZjROQjRB?=
 =?utf-8?B?ckdpWTVIODV0WmJhZkdJcFVJWDVWMWIrVEdDQUVwYm56ZXhsZ1lNdnNzcTNV?=
 =?utf-8?B?cWIzeHU2TGV3OVRNcmtRd05JSjllUGF2MVgzL3pTN0l5eEtZSnFBNmNxaUxF?=
 =?utf-8?B?cUJyWlRyd1NGUmVUbVJ3eXp6SWpRTlpuclo3THhBVXpGYjNCRGpYSlE1OXVC?=
 =?utf-8?B?QVc5c3pvL09VY28vT0NvcUdXQTRudjcxVlJNaytGWWVPa0YrM1FCUDJSMHQ3?=
 =?utf-8?B?TDJIZjlpeElGd05uSEN4aEJpbXM2ZC9xYWYzbDYyWS80QXdiMVdwY0F3Syta?=
 =?utf-8?B?TjJBcU1yOG9oK0JBN0xaK3RlOXVRamlIZ1JPZzV0QUk2ZjZ5YlVPUGZmc01G?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 587c74c8-54ab-4df6-378b-08dde0343bbc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 21:55:10.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+7ycO90GbvZ210rzOxophsij580Xo2W9Z43e9JANOJGrOqAYz7uQ088zNEnMRr8weHiw0bjWmDM2J3ea8dUWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
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

Quoting Patchwork (2025-08-19 13:52:22-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Tile and GT counting improvements (rev4)
>URL   : https://patchwork.freedesktop.org/series/152026/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-3572-c3cf4289245819615518b536cd16ebe6612694f9=
_FULL -> xe-pw-152026v4_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-152026v4_FULL absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-152026v4_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1520=
26v4_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:
>    - shard-bmg:          [PASS][1] -> [FAIL][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3572-c3cf428924581961=
5518b536cd16ebe6612694f9/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqu=
eue-rebind-prefetch.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v4/shard-bmg=
-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html

The failure above appears to be related to this series, but actually to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536 .

--
Gustavo Sousa
