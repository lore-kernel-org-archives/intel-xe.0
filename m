Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8E7C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 16:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100C310E53D;
	Mon, 28 Jul 2025 16:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n82usV3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2222310E53D
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753720695; x=1785256695;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=qc8QWCc80csjZ0hzwH9v6BgialHjB3QiadEB+0hnOw0=;
 b=n82usV3BmUbWYqQUso0VYlzmlli+L4sgl3ZU/3jaLQSJDXQCVQn9NsTd
 u/s2STM068pI5lHUz9qr7WAcgsV2IO3KY2c6BH/Kra1kWMgZl07iNlUhR
 kIiNztH6gCRKXuMpst36W3YzArcp0iPAywCEjCsxYoc8gQCe4oJM7PJCb
 +IAMSSu8DN1q9VKmHS3syO6z/JIzq+DDhajDEod2inFpwKvMhJ2grVi6B
 kbHLAH4nqIiUZNmJrnCJtNwFIvVOqM4MZKeDeVUeIwbS/20RPY+pUOUj9
 B2NHrXyiWdtMzs8SFDcgMmBdffRjNZeWP+KvsQuJ8Js8Z8P724DEre5Im Q==;
X-CSE-ConnectionGUID: N8+JL0+OTC2o9q5LsV3h5g==
X-CSE-MsgGUID: b1ruAY3kQ+2EbxMpLxtUug==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56068859"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56068859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 09:38:14 -0700
X-CSE-ConnectionGUID: u+LGGGCySrWVe5i4uuAmHA==
X-CSE-MsgGUID: 9qG4irKxQX20ckD3kiEYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="163240161"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 09:38:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 09:38:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 09:38:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 09:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJ7mXr0rfToWNX+vGwjyeqztOwmuplVrRZX7Ze4mr15MASgYuVI7aabz4Ji7v/39KUBM94QCLh0P97K9KQRvNoYX1Z0x3muGvBXKNyMGKqGs6FW3ejsH7jDAg/kQ/C0XlJvE+Nf1kFqnquDL2OnN0Q6wbjJm6sAz5j9+GU9FCaYPCbN7RHUd1k7got8iWk17Ttcb5yo1Y+rxGtAZt+d7I/W3tfwCocTGAR972BVbU+xMdRxGdfrOh/KAoki4myW+D4QwCBisIah9ZlEc/PtRDQTXUOTOk4CltecLQNHOLAbn0JWwLH5l6DvaQ0vbS/ks467LimubcedrcCj7MmDsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etpQjHMlc8ZYoYZe5nlM2J8VzyF14OAIVJCSzEW5vOY=;
 b=lig2tG5ofDKTvO0v+h5QDLjmmP5gFMyOM5rfw9cS9F8d5pCZuzjxBhfWAgxSxbQhTa3aFzUP1ty0Xqh6WbuDQsSLjAnoxiEMImny88BoobhEUloRPm4QFEnrbnG7DympKPYltRsGzvkS7pyIls0IjCXK12kCni6kpHXWlz0J+g0SlMgOfjrO0WITxlHeQGxoOz/qS7qx92AXxAZb+/GZNqLfEK0oW8u+JQJ5qW6pHp7n5nYSLh27X6re3p7Ihn848EYxB3XfYpX98LaLGPz8HBH2bUUltkpCT2Hrzx8I/K+2th/JcsAb2GrnpveKFq6QvDKGjZuXFHFGei/i6eHQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ5PPF75B6D7B42.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::835) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 16:37:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 16:37:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175330238312.184315.1762254920811724615@1538d3639d33>
References: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
 <175330238312.184315.1762254920811724615@1538d3639d33>
Subject: Re: =?utf-8?b?4pyX?= CI.KUnit: failure for Tile and GT counting
 improvements
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 28 Jul 2025 13:37:35 -0300
Message-ID: <175372065566.6473.8371112783145342413@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:303:b6::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ5PPF75B6D7B42:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d02ccee-21c8-495d-8129-08ddcdf51180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elJqZC9tZG1pR2tJbVg3S0hCV1RrZENKUklDZHZFTEpHdGtQa09xLzBZaDQy?=
 =?utf-8?B?TmJWVmlWdER4ZW01NjlmZERkbUk1bThDWXpjNkw1by9TVWM1OEwxbnRFZnlt?=
 =?utf-8?B?V0pneUxQOVR4ZkVuRnB4b0VLeEZHT0xZNlYvT1BuT25rZnBvc2o5djRPcmNW?=
 =?utf-8?B?QXg0b3dsV1RSczIvbGR5L01kZ2IyRU5HQzJiM3I5Z3hGL1p3NlBMVGxTV05L?=
 =?utf-8?B?UWZnZ2RYd254WUVZQkJNL0hpSmhRcFluN05XeUgrQm1GL2ZvV0hMQld5Y0Vv?=
 =?utf-8?B?UjQ1L3dKaDlYb0NRUDU2R2xvSGVGUlFMOC9QRVJDbzFJT2o2Q0JWcjFlT2dR?=
 =?utf-8?B?SHRLQ2UxRVErY1paOC9FYW5SNWk3TVloMjVkb1JJZEZQT3NLVllweTgvV1g3?=
 =?utf-8?B?Y0RpM1puQmFzcE94ck5jTHN3VGpZRUUvbzdTVEFZeHZHTi8vbWphREtscTJI?=
 =?utf-8?B?VDQ5UnZLLzBDUlBjUXp6bE56NUl0TWt4anVHcHd5cFk4U1RuQWlkc1M2YUcx?=
 =?utf-8?B?dDAvQWhhSVdjc0ZleFhkaUpjMVZGME1CQnZXVEhPYjdsV1F6L3Q3QkFoWG5Q?=
 =?utf-8?B?TXNRVGhTSHljdGFqb1h0RWhLWldBUUVyaFJQaU9WT0ZRd1dkdGp4aGxGbWp2?=
 =?utf-8?B?dVBqUCs5MnJYTkZPejQ0TUZRQU5mY2pzYngxSVpmTFZDNnFBckEwMHgwQ21W?=
 =?utf-8?B?bUJjSDRKWUtuSVBudHZvS09VZENwb2Npd1VTdmtBRHNYZDhvbjVVT3JhYlc4?=
 =?utf-8?B?a0J1d2oxWElZTnFoU2xvYThJOU5pc2tUdTJmSm9FMks3SFVvT1NHeXN4TDlH?=
 =?utf-8?B?MzlpV3l0STBrbFhGZnJKQ2Z6WHRINFdvRE1DcWRlTTJLajFGbXlLM0pRSmxZ?=
 =?utf-8?B?Nlp3K3R1MEkvc1FpcHF1RHliMDN5T3M3OGE0ZXJTM0s0RnhGbFNkMVE1cjMy?=
 =?utf-8?B?YVIrQ1V0RFZVcm56dFY3ZDNFRXFXeGd6S1A1ZDZGbmM1VDVtS0dmRkdLdWdX?=
 =?utf-8?B?ZWpvU0VGMUVqOVQ5dEtpL2lNYW9LSTNKWnlZOEg2WkRCVDE4ZzJsb1J1WnVK?=
 =?utf-8?B?MTBYWjQyNFpCaGQrOXdicHBacTdWYXdxYzI2Z1lJUG5JVXR0V1B4bXFmRzJG?=
 =?utf-8?B?dElXaEUvUnFLVzVNUlVTTzFrc0VYZzBpTEo2UWVPOFdidjBac1l1VGd6ZnNG?=
 =?utf-8?B?YUtBNmw0WldNaWRqUkh3OUY4WDZxTEdOU2w4cnBKSjBCVDJiejNHbVhNRVF5?=
 =?utf-8?B?NEdmeVlSTWxBTTJIaERnb1FnMmdKN1ZRc1dLbnJCTVJabW43RFIrR0JIUlp6?=
 =?utf-8?B?STN3ei9lMEI5Vmd6Tk1nb1BscWh1UnJ6L0RZbXJRenc1WXA5NWptWTdBbUdM?=
 =?utf-8?B?a1Vmbm9OWk5VUXdCeElKQWVxSm93YW8vblYvR2FiYXlxMVcwZTRhZkk2M3B2?=
 =?utf-8?B?NEpUcU0wWEhobHBSRmZQUDRlckNOWkxxMTBiQ0xuOXJQbCtMMG8yQ1E3aXdB?=
 =?utf-8?B?RVFObm9XQXkxNVg5V3RSZVVsT0tsZHJDUmxjRjJIM1lFWlJtL0dqRTdRU1ZI?=
 =?utf-8?B?TUdFUXpTUk9KMVYyNHI2T1RZRzZtT3B1aEV1aFJ4OVBidGpZUkh1eTk2ZTBM?=
 =?utf-8?B?dkhuM2F4YkZUSzJEcUNiRk9zMVNNRmtqekM3TFUzMGJ3eE02NHh5b0ttZ25s?=
 =?utf-8?B?VytGSTI2ODdIZy94Ky90dFkwN0dLYWlIdGdVVmhIWUxuQnJrbVhqL0pCTm1Z?=
 =?utf-8?B?ekwyT3owRys4QzVQZzVDSEpteTJudi9sOGx4TG9YeTQwWkdPZTBUNU5KY1hZ?=
 =?utf-8?Q?tctYi4gUXqM/jQ5ujltUAsO7mTre5XWoaxGUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTc4cWNOd3dxK2VJQXNjUmFuTEdDWVlhYUZzYXRIU2tydTQ2MEptckYzZE5G?=
 =?utf-8?B?ZzdVUjkvQWxOOFYxek04M0tMcmxGUlc4Y0o4R0J3VDZxRjkwQkNkYk5PNDFu?=
 =?utf-8?B?cUNmenpTOWZmSlhDa3hLcXFJSmZhb0h2RGk2QWtrSXUvYVJ2alFreTZjNVQz?=
 =?utf-8?B?emtTd2trcEV4MnZ0R0F6V0lObFlPeklWdDJZMEtVN3ZQZ1MrQTl4K2xsejZp?=
 =?utf-8?B?U3ZHNUtNaDNPblpjeC92RHhzbkFlczh1TEplR3RDamJxU1pNT3hOSWEvUVNJ?=
 =?utf-8?B?TE8wdUhmMC8zTmViaGhsczh4V0MyWmI2QkhNMGQ1QmV5aWdxeWdDMnBSQlAx?=
 =?utf-8?B?WW5VL2FiUEtJanhkM3BSYStWUzQ0ZFBNUWsyanNZbjkvSEdZUkxZdXlMUW9j?=
 =?utf-8?B?cWUxQ3dnZm5kTEp4V1NQUklScVZJRmIxcFV4akRWNmQ5WExwYUpiMzlMbGxx?=
 =?utf-8?B?R29HNU9XMmlPOTBvSzRLVzlTUHlJTURmNnRoNi85WkZGNE5MVFZHdUtONnR1?=
 =?utf-8?B?OTd1YUxQdkVOdDRrMU1zakVZL3dCb0hIcVM4RjNTb0RLc0VvWG1kRmpoS0g2?=
 =?utf-8?B?SnlGVWNLZENKQ0NPcUswMnV4blhCbFRsUG9rclI2ZE9nY3JNeXBld0NmQmp3?=
 =?utf-8?B?L0UyY2NLb0ZWUVVKODlqdUwwckhEekhPUnBlbDJFY3pBYUxQWU15d1VoaXRS?=
 =?utf-8?B?UXdRL1dBZ25wVjRhbC9YWk4wenlUaitJUndwTy9SelF3aHFzek5lak1raDNP?=
 =?utf-8?B?dnZlNndUN2loZG16andtNms2MkRYTEtuL1l0eU5rV1FEZTB2ZjA2QmsvS3Vq?=
 =?utf-8?B?SnJnUnMrRTF0aE1iMGZUNm9RbklZNjA0ZXJNaDJWSWpiQ3JyOU9UdGlZUlc2?=
 =?utf-8?B?UjZuT0hza2IyODVIdzYwL3h1cFArRkVPOVY4bkRRSlEwU2ppQWJDQ0JxVGJz?=
 =?utf-8?B?UDRoVFFEWWs2YU9GUE5UUFBxbmJtL3dXVHJicGpRQ0tJbTRhSTRvMXBPZThj?=
 =?utf-8?B?YUl1TE55VG9DQjE0WFVSRUlkLys2RXlFODlIVDh1L0dXam0zTTNiZjdOWE9Y?=
 =?utf-8?B?L2JsV1lwdlkyV0lyYmU5RGJBclhBSU5KWXNwRDJuYURNY0ovNVZ4dXhxSkkx?=
 =?utf-8?B?ekNWRE11TDdlUUFISW5LWjErYkRjMVA0SHQxSW5lL295Z0w0cjJHbzYvTGs2?=
 =?utf-8?B?ZzZHYjcySVduSFNPRUoybnhrMFlFSTVHejdFWHdYbnJxWjBiMnY3ZXIrK3lv?=
 =?utf-8?B?MWJCNFgxbnpoNnB2MWVRYXc3VlNTY2NlbEdBRXltL0dPVDNGeUZFTmh0TWZH?=
 =?utf-8?B?d01yRXNTcGlOekNzRzBtQnBHTlRYdFNvbGhBYllsRjBkS0RsakYzdlI0a2pp?=
 =?utf-8?B?c1NVekxyeEJMeXFjRHdKTmYzZkVBU05zUStVZ2xIaExVNEc5R0g2TG01RHdk?=
 =?utf-8?B?S3g5S01DRHVmMTlzQVdBbzV6cEVqeWl4d1plNXRqZjVmZHlNQXRuS2Ztbkl6?=
 =?utf-8?B?VnlJV3ovYzAxUExGOXlWMXFSVkoxbDIyMFhRcHZsVjFnSW9YOXlyMlg0dWtx?=
 =?utf-8?B?VXBNSnZmbDdFY3pZdHQ0UmxDazlSRVAzaUQ3eUcvZk9DL3d0cWRnb1h3cFVo?=
 =?utf-8?B?dHd4ek4yMWcxTUh3RStXdlkxMHJKbFdJOExZZEtLYWRDanJqL3BUVmtNR2M3?=
 =?utf-8?B?ODVkamFIOExYK25MdVhKQ0YyU3JtR2lYY2RSaFFvdW1Kb09oNDM0SFVVejVz?=
 =?utf-8?B?bXBGOEhqbmdoc2krYXIxL2ZUbXE5YjFteFJ4VFZYUm4vRURkR0pLMHVuazk3?=
 =?utf-8?B?clNoMzdNRlcxL2xFN0UzVFBaajdNZHBEMnZYVEdQYkxydlVIT1BNY2tsQnN0?=
 =?utf-8?B?ajVjVUZWU3Y0dHJWYzdhTkltVEJDSlQ4eWZEUURaQlJWU2N0UmxFSVFYdGNB?=
 =?utf-8?B?cVpPWnhDcTY5MFp0WWRUWGY0YzRUN1lTK0piQkdCS1V3eTkwSjlRYml5K2lq?=
 =?utf-8?B?WmNYZDcyV2dQd0kvQWtnR2NxQzlyTkczSkNiVjZEL09MUkxoQ0VCYWlEdHdB?=
 =?utf-8?B?eFBJM09WbWQvUDhFelpGVmdaWGJzMDc2YUQraDdVbUlTOEFLVUZEZ2RCcFpp?=
 =?utf-8?B?eVRrMnQwOC9QWit4cG94a3pvY2ZWbmV2TDRqblhlVVBwdnpmaWNuNmNsbTl6?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d02ccee-21c8-495d-8129-08ddcdf51180
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 16:37:40.2983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQ+wyMbeUTBgs6bnx5uguW8uOs1NZrY3VsjoVNIgV7CmKjb28zArkO/0/JY4OwbHjYn4RTdJPsu+oq8Yjy2Okg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75B6D7B42
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

Quoting Patchwork (2025-07-23 17:26:23-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Tile and GT counting improvements
>URL   : https://patchwork.freedesktop.org/series/152026/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>+ trap cleanup EXIT
>+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/g=
pu/drm/xe/.kunitconfig
>stty: 'standard input': Inappropriate ioctl for device
>[20:25:32] Configuring KUnit Kernel ...
>Generating .config ...
>Populating config with:
>$ make ARCH=3Dum O=3D.kunit olddefconfig
>[20:25:36] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=3Dum O=3D.kunit olddefconfig
>Building with:
>$ make all compile_commands.json scripts_gdb ARCH=3Dum O=3D.kunit --jobs=
=3D25
>[20:26:10] Starting KUnit Kernel (1/1)...
>[20:26:10] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>Running tests with:
>$ .kunit/linux kunit.enable=3D1 mem=3D1G console=3Dtty kunit_shutdown=3Dha=
lt
>[20:26:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D guc_buf =
(11 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] stackdepot: allocating hash table of 65536 entries via kvcalloc
>[20:26:11]=20
>[20:26:11] Pid: 18, comm: kunit_try_catch Tainted: G        W        N  6.=
16.0-rc7-gd50fc838d671
>[20:26:11] RIP: 0033:mmio_flush_pending_writes+0x7/0x60
>[20:26:11] RSP: 00000000b988bda8  EFLAGS: 00010206
>[20:26:11] RAX: 0000000000000000 RBX: 000000007b45a3e0 RCX: 00000000000000=
00
>[20:26:11] RDX: 0000000000000000 RSI: 0000000000101800 RDI: 000000007b45a3=
e0
>[20:26:11] RBP: 0000000000101800 R08: 0000000000000002 R09: 00000000000000=
00
>[20:26:11] R10: 0000000000000000 R11: 0000000000000001 R12: 00000000001018=
00
>[20:26:11] R13: 0000000000000001 R14: 0000000060327060 R15: 00000000605a7c=
20
>[20:26:11] Kernel panic - not syncing: Segfault with no mm
>[20:26:11] [CRASHED]=20

Yeah. The issue comes from the fact that, with this patch, we are
probing tile count as part of xe_info_init(), which is used by the kunit
tests.

I'll fix this using the same approach taken for read_gmdid(), i.e., by
using a KUnit static stub.

--
Gustavo Sousa

>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: guc_buf: missing subtest result line!
>[20:26:11] # module: xe
>[20:26:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [C=
RASHED] guc_buf =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] [ERROR] Test: main: missing expected subtest!
>[20:26:11] [CRASHED]=20
>[20:26:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>[20:26:11] Testing complete. Ran 27 tests: crashed: 27, errors: 28
>The kernel seems to have crashed; you can decode the stack traces with:
>$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | t=
ee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
>[20:26:11] Elapsed time: 38.515s total, 4.248s configuring, 33.849s buildi=
ng, 0.418s running
>
>+ cleanup
>++ stat -c %u:%g /kernel
>+ chown -R 1003:1003 /kernel
>
>
