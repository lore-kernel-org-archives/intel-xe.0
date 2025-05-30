Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC806C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 23:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C4110E8A7;
	Fri, 30 May 2025 23:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Je/yWz2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E34B10E8A7
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 23:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748646211; x=1780182211;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=EycIhPPWIAhjkM67sCS96ya/8Hc5qp5ky0Yqg2Btapg=;
 b=Je/yWz2fNpVAaGkvAS0EuyozPBalw5s5zVQm7xiF/ZYx8Vi3E6xYz/86
 /hzHCotWQJO/vlQJzy8hyrtNko2bF3AH1VhA/ZhW3HSBIbe2LQbxePvEY
 CB2nfVvH1oP0jLXa3FI1FkAO9MR8Vkvqy9bVFzygVeK09OCo5ZqLTUGdp
 ruVBeqYuy5UV7f3DU23IqhtObRa4I5gnNcdSD3+W98u0KwqX96/nMO+tx
 neQEUlCMzJGPHrdUBHmjC/63ARU9OFaFBIkQu9HMpc/jfwlMTWzjajOGI
 KoYvNsp52gnRYxOQftmEX4fTx6++RNleEflsLV48w/O9QKwOZcGv3MJEr g==;
X-CSE-ConnectionGUID: T5EJSM5vQLSoxyUKYRP5aA==
X-CSE-MsgGUID: CwRJ7mI1ROmVjCYCZ7Hi6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50665824"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208,217";a="50665824"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 16:03:28 -0700
X-CSE-ConnectionGUID: rR7898iAQRGx/lSd34CuIw==
X-CSE-MsgGUID: NlEaybIVT3mIOmRRT00/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
 d="scan'208,217";a="149149223"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 16:03:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 16:03:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 16:03:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 16:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5AYscdx2aY89jOT4s9f4YMeFAYm3zPO/kQQytGYHAUZqE7/bVAobdHbEKkVzwmHRUeZuVcIfIkwuoL5OQ3nzxzAgpMOdWX+KzpAWUxMttLV/j1sewGQJvTNaFiJ9ibR8r4IrcQGIGcfSZ+IfUWh0UIBVDlaju4j6TNweaVNRcN6ARTKWpbKcCPzN2zEdxvcf3CMLQqNuDU83hUAY7BrsW9AXDDeutZAiU4D7B30qDJoST5ks85E878pAbf8a6T48QRPgElJIKzHDNSleXZFtk/FcgAuUs2YTCYp2ivCSVB03V2td8P4S2douo0UsXCp0ax44be/URw+ZRux3VPing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzs4S8tNBusDMw9BTXyh/HsvWR8YmszsAtgyNCqu2xk=;
 b=QQJi524ATFT0wdT7CaSF+QIe9HMcc0AM4PPln1LYEKA4k6EQh82xUmcb4XqWAyynSS14qY2RPtew2KHs/xZ9VlLGrp5TDwmE39o/cgHEVJb+ik0LJdAOo02/H0LnrvLizF9wAONaY0Ur6z8WUEoapRm44IHcxK3Fa5BMcr8GixEAZf70qgdM9sYG0QMj73HZVhBhtdNbTXTBjX4fBaH9K1fq8THA6hTqxbfAAlfa+8nKAZO/aLZ37fTArig/mzBW4z3i9m795IIU6K04w2Lhf3dwhWsn2/l2FIS3A77wd91xnX5uDW/jRH0gFAMrtvpIJ/+5QcZnlR2OReU1N87DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 23:03:10 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 23:03:09 +0000
Content-Type: multipart/alternative;
 boundary="------------Y3vYKurSO0dUywNgeYYw8zOL"
Message-ID: <a41dc60c-7ee6-4583-af6f-d99c77639d5a@intel.com>
Date: Sat, 31 May 2025 01:03:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe/vf: Post migration, repopulate ring area
 for pending request
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-8-tomasz.lis@intel.com>
 <twcothnuc6agtazwjigkjpmpu4zuqa557lx7jbo23ohzm2ufaq@ecd7fu6tuopa>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <twcothnuc6agtazwjigkjpmpu4zuqa557lx7jbo23ohzm2ufaq@ecd7fu6tuopa>
X-ClientProxiedBy: VE1PR03CA0008.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::20) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 956a1618-60ea-44b7-9095-08dd9fce2554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0I4eWlidU9BWm9WSlBkTGUzTnk4UWtDY0IrMkV2a2Z1cURxSW95elFPQkJ4?=
 =?utf-8?B?UVdCd1RPMmM1cFFZc1NiMUJ4NFJyejFBM2NlODdqOUVVVU0xNWdFTmV1OUkr?=
 =?utf-8?B?aWtmRTFxOXowdG82ekhuU3QvNU9naUFHUGpVMmJTOXBDMlc5alFhK1IrQmhB?=
 =?utf-8?B?Vk4rSm9VUXJBWURmOEZZMm9BcTlua1RsSlBrZ2poTmZibllIMVQrQ1lHRFBt?=
 =?utf-8?B?MUljV250SG5kUzkzZG5mZlU2Y25xaTNQSEU5Nit0c3RIeEFnbkxWb3dkRkF3?=
 =?utf-8?B?TTl6SnZQSklDQTNTZ1JzWGVpUlNlMUxiLzlmcnRaTTRsL3QvZTNQbGhXdGlF?=
 =?utf-8?B?MEsrczYyUDlVN1l6aG1wdXhIL3ViYk52V1pVUWZqeVJjWkNRZGhzT3YybGo1?=
 =?utf-8?B?TXJsSkk0RG1pUFZMajVRNTlBcExFT3hMUEhiNkg3UUZ2N2Y4ZG16azJhZHgx?=
 =?utf-8?B?UCs4N25kSmI4ZUVCajVPRmpjZG1Bb0ttdzJLUTZRdDVjWGRvNjlNZXVPL1Jr?=
 =?utf-8?B?WFBhMGROU013RWhZR1Bob0l5bk92Wk84TnkwajcvUE1Fd1VMbk9DQjJPY29u?=
 =?utf-8?B?MUVmZENvZjZkSGIzMTZWQ0lLVzFhcnVuWkR5c3o4RTFrY0tBNzJpR0k3OXYv?=
 =?utf-8?B?YVY5VzVLRmRLSmlORzJhUElhZThTbTNPYVFvVkNLbyt5VUNBazgyTzhBUU1R?=
 =?utf-8?B?REF6Mi90ays3SkhCUjdFS0xGQjA1UXJRQjZ0K2JFTzMxdE1JVENiOG1JUTIv?=
 =?utf-8?B?dHlzOHFqQlN5VnlnY2wrUmlPK1FsVUt4Qk8wQU5LWjVyeS9VN01Qbjc4encx?=
 =?utf-8?B?bm5KbFdFYnc4a3VuYTJ0VC9RYUFzdnRydDJ4cExna1dwY2IxMnRGa1lZQ2lG?=
 =?utf-8?B?YWVJWGxQUFF4YWdjbEJYbFJURE5wbkIxbnU1L1lCQ2JQb1BjVkZhcFYzOXlT?=
 =?utf-8?B?dE9jTk8zUFVlY05DTE9XRy8wRndWQkRFVnRncW4ySHFiaXVUU1hTcHRJWEFy?=
 =?utf-8?B?TW44SnFBTHpsR0FBcUtMWVZiSVM3TFhyMjNIOHQ0OXo4Vi9PWVEvNUg5dWEx?=
 =?utf-8?B?RmFXaWc2Z1l0c2RYZ1FvUkR0VFUyWlhJRlMxMmFNOENIazArSnViSkFQRWpT?=
 =?utf-8?B?SFdieFA5VUtnNTcybWtiN2lhWDcrUTA5elM5ek9mQlhvYm00dC9IMGhDbFVh?=
 =?utf-8?B?QUswZS9iRUdmNFhkL2hYRGRLYUlWbVhFSmhack5tOU1JRGw0LzI1Ulh6OHY2?=
 =?utf-8?B?K2xGWlpQUzBiZkdzNHVOV0lQZlJadGk2UEoxM3RHeVNoNEtZZ3BjZFBQK2Z3?=
 =?utf-8?B?NjNJdVIvRFRibkJLR2NycGJzU2JrQzlhcXdkeCt4UTFvS2dtYVIzZnNoR0dI?=
 =?utf-8?B?WHpUOUZKMVRZM3lCVENFUis4cVBzUUg3c0ZWdXBTNkFnU2hwYTh2NWNlN3hr?=
 =?utf-8?B?YUY3YlhlUGxna2pyMzNHN3dYZ2FIaDd2SEhZdHBpc3Viek4yOXJrd3hnZU85?=
 =?utf-8?B?QVZ5LzZkeEpCMk5GNm5PUzlPY0Y3UEloSGdGTmNuWStEdFVMWW5DYnNQQW1P?=
 =?utf-8?B?Z3IvcXk2a093cTBib2ZGQjZIeVBQVTJwMjVEaEV0TFNPN0FwWXdIdGZmaEdj?=
 =?utf-8?B?clBDNnF2N2JaN1BqQUE4ZjFmdHhPbVNrdS80MkpPMnpNVlp6YkNQNXZLMUUy?=
 =?utf-8?B?bTZOaDBFWlJIVFZ5WmxwL0FWclZHekFoYXJGZ1AzWnpMQlBLam1xVzZTSUUv?=
 =?utf-8?B?bEsrc0hoM0hVQXZjKzhNeHFEVVNIWUxIcnJId2RJenRrRUhGT21BQ0VPZWlh?=
 =?utf-8?B?RVhJSGxoMWRsM3IvRTh6aCtLR0R0QW5GM2xnQys1TzMzUmVYdzFUT3lRVjFh?=
 =?utf-8?B?UUZJWG1PdFZmUWZUVjU5N0F5bDJtVW9xQk9idFl1L1g3OWcrUGVEYzNPQmY0?=
 =?utf-8?Q?URASrMQI4Ss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmladThjMUY4dE1TUkZBT1paa3NkaTllU2xnVG83Q1BSdXdBSldITW1nWkp4?=
 =?utf-8?B?eXJsSHJrc2hGemVpSXBERmYvZUxFdGZHSmcxLzNMc0ZoRXQwMDdEMkFrTXNY?=
 =?utf-8?B?anY1RTh2OVIrcHRQS29HMDBYZ0VBNndFT3M1SGtzVlc4WTBIdzVxK29ReWJ2?=
 =?utf-8?B?NitPL1cvK0VqalRSZ0s4MzVyakN3anBLYW51UVpWWXhLWVQvOUZSQklKUUtm?=
 =?utf-8?B?bk00Q2t0cVFZcWIyZkRPK3ljRXBoOFIwc0NTc04yV2VsZFdaRG9mM2RjWmdM?=
 =?utf-8?B?R0l3YUVYUElYWlNTTU9aaUV4alZTWWtuZkwweC85dnduTW80bFAyenU3UG9h?=
 =?utf-8?B?ODgwdEI1WWlpenpNRFJ0eVBzbll6N1RleWxwdzJGclpkeG1Cd0UzQmNqY3NE?=
 =?utf-8?B?WitWSnEvVzlwaVVxTjN5cGV1bk1ZSlpvOFkzdEVIaTNyQXNMMGJDWDR1eHpR?=
 =?utf-8?B?NUo0VlZhSWdMY2J1dERrVTdzdUR4YnJvZGtzZ1BUbnhsYnVHRjJHSmxtVVRl?=
 =?utf-8?B?dzRHTmdneUNtODJiMzVTZ2EwZ2RYWlBzT0FvK2hJait5YzVXUmtKYUJNZFlt?=
 =?utf-8?B?bkNJWGl5T1VzSkFnQmlDMElHSVBVTlFmMUZRZDJwVXJ3M3djb0wvK2VTcUQw?=
 =?utf-8?B?VlFVQ2RneEN0L0V1V1VtbjZrWFE5TXJUT1ErWFFoN1FJRXVmYmRLVS9GN09w?=
 =?utf-8?B?RTJTN3VNMktSV2lRTDFhWlRvakZaUEJuckxXc0thYnlxaEREUThlUnNnN1NJ?=
 =?utf-8?B?aFAzWkRXNzhnK0NyU3FwUm0zaUhNOTFkVCtqcUJrcTU3UTkzaWpnaFo1SDdE?=
 =?utf-8?B?NDUxK01tSjIwaERpS3h6NXBwckg1Wm1TUjJscGFReG93azhBWXlmdllTQ1hT?=
 =?utf-8?B?UHRteGFyQzdqdmozOGtpN0d6cTk1SGdMSnhlamxjM0xnVWR3SGtIeHE3RjN3?=
 =?utf-8?B?Vk91VFQ4NW43cHN3NzRyTkxabEtNOGI3VFM1dGdYYzBlTVp2bzhoQjl2aUJY?=
 =?utf-8?B?NTlLaDJSN2dQcFBPTUpvUUVXdWtIbjlWd1lrQ0FtR1dWV0Myb0ZpVFdNYTFo?=
 =?utf-8?B?UVlTbXNqVG5nTlE1Y0hHZSs2RWFiYXl0QlNSZDVyV2FUTGdMbG5ZVmpZZXNm?=
 =?utf-8?B?WlZXaGJXd3pKVkNBVGpQS0t4UkUybVY3dFJSaEU0anorcG13QjN1VWVqQ2x4?=
 =?utf-8?B?S2x0SlNuUkRQY0Q3NGNEQmVRSmcwODlJOVR6YVd1MGVZZHNEYkxSSzNuOWk2?=
 =?utf-8?B?ZC83MC9yTmRrcG1TdDRUSG1YOHltQnUyQ3FUUURHSHlLdFVRcVlXQWo1b09Q?=
 =?utf-8?B?REwwOUI2Q2NqbGU3U2JlM1FxZ1ljbXA5dFRGcExCc2hVVEhYbER5OWZZMlNY?=
 =?utf-8?B?dXZ6WXlGeG1PNnZPRnRWQXA5T0tvMjR0NXFkeTdnSm1wakF2ZUllV3IxbHpa?=
 =?utf-8?B?THZzdGtJSzBjaGpKRkxZWWdBM00rS2pnb3NiV2tRZjdQdUY2eWUvZVMyQmNX?=
 =?utf-8?B?ZjQydXRQMVhtYXNiR3VDWnQ5SUloK1docFpuUGZCWC9oRlkza0cvUUlCYWNz?=
 =?utf-8?B?YmdNb1NmMWkwaWtyS1I0Q0t3RlZEeC9EQTdUMFp5b1AvWFpyYnhzbkNCUXFI?=
 =?utf-8?B?aEc1Z0YzeVBnSWx5RUlLWm51OEMwakt1YmN0U3ZyTzhOWnJRS1Z0YldpZ0wz?=
 =?utf-8?B?TzlrbGsyNlRNNjcwYXA5TzhBd1M2S0h4Z2l6cGhWZ2p6L0hneWF0aU5TaTVJ?=
 =?utf-8?B?d0FHcU9Zam9CMmd2aWpSeWRPWG1GeS8yVitlNUljNGtKeVpBY05GT1ZQZm5M?=
 =?utf-8?B?K1NBQ2xtaTRDSUpaUVBLVWdhcERjOGpPUkJqZlBsRm9hRC91cjhOeFVQVGM1?=
 =?utf-8?B?Y0U4UlF4TEVLMmdYRVR1bUprQVY4ckpRYlNoMG5FOWpoN2FjYWRydUNNbVZs?=
 =?utf-8?B?RjFTSDNzQlRsdUZCbWVJdTVVcTdwakJJUHlNZzZuWTY4TUdPSW5oSlp2NHdt?=
 =?utf-8?B?R3crcUo0L0hpSG5HQXNNeFc5Z0thZEJ2UkM3QTR0OTZCd0pFUC84YXNERTcx?=
 =?utf-8?B?T3hjMk8raUxhZzhRM281OUI4MFFQVnQxN3pxRDlLa1g5MkNMYXBZSkpOa2tJ?=
 =?utf-8?Q?wqMVKXAan2iU/vUwZQm3BjUtW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 956a1618-60ea-44b7-9095-08dd9fce2554
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 23:03:09.8450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGdgi1+JJH333Xt0jCHH5JY5IOJFa//cW9d5B3IbAWJjfbe4tAcBbrU13h2UInlcoVMjmH3lS+pvhdhv2/ZB6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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

--------------Y3vYKurSO0dUywNgeYYw8zOL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 28.05.2025 12:54, Michał Winiarski wrote:
> On Tue, May 20, 2025 at 01:19:25AM +0200, Tomasz Lis wrote:
>> The commands within ring area allocated for a request may contain
>> references to GGTT. These references require update after VF
>> migration, in order to continue any preempted LRCs, or jobs which
>> were emitted to the ring but not sent to GuC yet.
>>
>> This change calls the emit function again for all such jobs,
>> as part of post-migration recovery.
>>
>> v2: Moved few functions to better files
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 17 +++++++++++++++++
>>   drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++++-
>>   5 files changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 9c3e568400e0..0488d80d5b99 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1056,3 +1056,20 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>>   		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>>   	}
>>   }
>> +
>> +/**
>> + * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
>> + * @q: the &xe_exec_queue struct instance
>> + */
>> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
>> +{
>> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> +	struct xe_sched_job *job;
>> +
>> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
>> +		if (xe_sched_job_is_error(job))
>> +			continue;
>> +
>> +		q->ring_ops->emit_job(job);
>> +	}
> Shouldn't we take the lock that protects sched->base.pending_list?
> I know we're under guc->submission_state_lock, but that doesn't protect
> it, right?

Right, the lack of protection is problematic here. There are two 
solutions - either to switch to `list_for_each_entry_safe` or to take 
`sched->base.job_list_lock`.

Normally I'd prefer the safe iterating, as this doesn't add to 
complexity. It is often the preferred solution if our iteration does not 
change the list.

But this spin lock is simple enough to not cause any problems if taken 
here, I think. The code within the lock never waits for HW, which is the 
main indicator on whether it can be used within the recovery.

I will alter the code to take the lock. Unless I'll discover some 
non-obvious dependencies which would make it problematic.

-Tomasz

> Other than that - LGTM.
>
> Thanks,
> -Michał
>
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index 1d399a33c5c0..67c2baa42c0f 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>>   
>>   void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
>>   
>> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 990f3265c7ad..a60e0575cc56 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -766,6 +766,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>   	return fence;
>>   }
>>   
>> +/**
>> + * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
>> + *   on all queues under a guc.
>> + * @guc: the &xe_guc struct instance
>> + */
>> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	mutex_lock(&guc->submission_state.lock);
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>> +		if (exec_queue_killed_or_banned_or_wedged(q))
>> +			continue;
>> +		xe_exec_queue_jobs_ring_restore(q);
>> +	}
>> +	mutex_unlock(&guc->submission_state.lock);
>> +}
>> +
>>   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>>   {
>>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 2cc44298465f..e31680a08dba 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -33,6 +33,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>   int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>   int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>   
>> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
>> +
>>   struct xe_guc_submit_exec_queue_snapshot *
>>   xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>>   void
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 0a9761b6ffb5..3e7eb365f2e9 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -8,6 +8,7 @@
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>>   #include "xe_exec_queue_types.h"
>> +#include "xe_guc_exec_queue_types.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> @@ -16,6 +17,7 @@
>>   #include "xe_irq.h"
>>   #include "xe_lrc.h"
>>   #include "xe_pm.h"
>> +#include "xe_sched_job_types.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>>   #include "xe_sriov_vf.h"
>> @@ -245,6 +247,15 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>>   	}
>>   }
>>   
>> +static void vf_post_migration_fixup_jobs(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_jobs_ring_rebase(&gt->uc.guc);
>> +}
>> +
>>   static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>> @@ -327,7 +338,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	if (need_fixups) {
>>   		vf_post_migration_fixup_contexts(xe);
>> -		/* FIXME: add the recovery steps */
>> +		vf_post_migration_fixup_jobs(xe);
>>   		vf_post_migration_fixup_ctb(xe);
>>   	}
>>   
>> -- 
>> 2.25.1
>>
--------------Y3vYKurSO0dUywNgeYYw8zOL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28.05.2025 12:54, Michał Winiarski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:twcothnuc6agtazwjigkjpmpu4zuqa557lx7jbo23ohzm2ufaq@ecd7fu6tuopa">
      <pre wrap="" class="moz-quote-pre">On Tue, May 20, 2025 at 01:19:25AM +0200, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The commands within ring area allocated for a request may contain
references to GGTT. These references require update after VF
migration, in order to continue any preempted LRCs, or jobs which
were emitted to the ring but not sent to GuC yet.

This change calls the emit function again for all such jobs,
as part of post-migration recovery.

v2: Moved few functions to better files

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++++-
 5 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9c3e568400e0..0488d80d5b99 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1056,3 +1056,20 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
 		xe_lrc_update_hwctx_regs_with_address(q-&gt;lrc[i]);
 	}
 }
+
+/**
+ * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
+ * @q: the &amp;xe_exec_queue struct instance
+ */
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
+	struct xe_sched_job *job;
+
+	list_for_each_entry(job, &amp;sched-&gt;base.pending_list, drm.list) {
+		if (xe_sched_job_is_error(job))
+			continue;
+
+		q-&gt;ring_ops-&gt;emit_job(job);
+	}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't we take the lock that protects sched-&gt;base.pending_list?
I know we're under guc-&gt;submission_state_lock, but that doesn't protect
it, right?</pre>
    </blockquote>
    <p>Right, the lack of protection is problematic here. There are two
      solutions - either to switch to `<span style="white-space: pre-wrap">list_for_each_entry_safe` or to take `sched-&gt;base.job_list_lock`.</span></p>
    <p><span style="white-space: pre-wrap">Normally I'd prefer the safe iterating, as this doesn't add to complexity. It is often the preferred solution if our iteration does not change the list.
</span></p>
    <p><span style="white-space: pre-wrap">But this spin lock is simple enough to not cause any problems if taken here, I think. The code within the lock never waits for HW, which is the main indicator on whether it can be used within the recovery.</span></p>
    <p><span style="white-space: pre-wrap">I will alter the code to take the lock. Unless I'll discover some non-obvious dependencies which would make it problematic.</span></p>
    <p><span style="white-space: pre-wrap">-Tomasz
</span></p>
    <blockquote type="cite" cite="mid:twcothnuc6agtazwjigkjpmpu4zuqa557lx7jbo23ohzm2ufaq@ecd7fu6tuopa">
      <pre wrap="" class="moz-quote-pre">Other than that - LGTM.

Thanks,
-Michał

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 1d399a33c5c0..67c2baa42c0f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
 
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 990f3265c7ad..a60e0575cc56 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -766,6 +766,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	return fence;
 }
 
+/**
+ * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
+ *   on all queues under a guc.
+ * @guc: the &amp;xe_guc struct instance
+ */
+void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&amp;guc-&gt;submission_state.lock);
+	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q) {
+		if (exec_queue_killed_or_banned_or_wedged(q))
+			continue;
+		xe_exec_queue_jobs_ring_restore(q);
+	}
+	mutex_unlock(&amp;guc-&gt;submission_state.lock);
+}
+
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 2cc44298465f..e31680a08dba 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -33,6 +33,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
+
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
 void
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 0a9761b6ffb5..3e7eb365f2e9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -8,6 +8,7 @@
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_exec_queue_types.h&quot;
+#include &quot;xe_guc_exec_queue_types.h&quot;
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
@@ -16,6 +17,7 @@
 #include &quot;xe_irq.h&quot;
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_pm.h&quot;
+#include &quot;xe_sched_job_types.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_sriov_printk.h&quot;
 #include &quot;xe_sriov_vf.h&quot;
@@ -245,6 +247,15 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
 	}
 }
 
+static void vf_post_migration_fixup_jobs(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		xe_guc_jobs_ring_rebase(&amp;gt-&gt;uc.guc);
+}
+
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -327,7 +338,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	if (need_fixups) {
 		vf_post_migration_fixup_contexts(xe);
-		/* FIXME: add the recovery steps */
+		vf_post_migration_fixup_jobs(xe);
 		vf_post_migration_fixup_ctb(xe);
 	}
 
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Y3vYKurSO0dUywNgeYYw8zOL--
