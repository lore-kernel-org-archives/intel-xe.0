Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD20C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 17:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A096B10E9E4;
	Fri, 26 Jul 2024 17:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zvs5jlRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231F610E9E4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722014819; x=1753550819;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=wpVR607s1eoy7hZiGoDAIAmgSGY2ALT4MCEp/SeyAAE=;
 b=Zvs5jlRguXA4Ih02ZIvnjx0h7NZUHfCn2FvOf8tZCHneyQEJgcfoP3NO
 w54mvCRaVcUoJoT5/Nf4xIHVmL3pH9/fDUVBsBx+V+ItrPC8v0GHZg78z
 w5rf7oca2256Ga40pr++lVHrjzoVwdadQvcpq/FJS/fBmM/eZIOcAOCKQ
 uOQC5AC8ga2lCSVXchgW5HGW9z+t/JV/OiYbADthxTnoxWYyL4Cs8mIdT
 QLg3fBF1DiFXN3MeSVIUWwZjoviMTCd5dHBhNm30l4kdt808aPMZyxAX3
 cTasNx7bg7lfrR7H6p2MH9MURLlSi82gv6MrH9Be6lIavIBVUIaHM7my6 Q==;
X-CSE-ConnectionGUID: mkYA5iB/RFygaswSbhS5rQ==
X-CSE-MsgGUID: ZufEiw1yR7W0kNUfDeUGzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19960105"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208,217";a="19960105"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:26:08 -0700
X-CSE-ConnectionGUID: K+byxP8hQFWmj1IDuAW8vg==
X-CSE-MsgGUID: Q2jXztMnR3S2X0LCf1vDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208,217";a="57909539"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 10:26:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:26:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:26:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 10:26:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 10:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkHdAFWJcRxlt3lPSMgxQtkaek3WSwEfLh///joFShAiPQV5NpfaKNcGFkPCXYrHQqwQNG0doJnhnFixWNtXZt406SEEEHpUNYpyRdtGmeu1y22lUtzZk/V7gMipfakgUH9pehb51aG7xZP5823Domj4AYiQzOn4QkiSOgzBquVePoOs97y52l+YJqhiecKOu25TFhU/ckkQU6If0GyCZE1ExHeEWLdxTiL7mGitecuR09BI4Kux+62EqA9QoEhA5BjQ2ppqG2/M81NKmguU2Q3F0Lyz3y0x7dCkb1GhqhxUQEWgZa1RqyIZ9Lg2PlerCpwd8PeVXy8R8wnWQeW8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuezgY3sUoSjoauY4VVoYSdh16o5jRochZn2ZirjYsM=;
 b=b8Bh7tD53L+tdh2NfKwT/S8/J3mUguz7gQfBRcbhOfDl0FIU3ZGC4VPzGhcj9FjHBswT5+2CViBtMUZ/isBFRm+S/u/YjTurshvCZgEhMReCITVEij9jylY5BH0sMO6pqG7QHrNHMXhtZMYj+Dlahj5Mod6M0jobUMt13L/DDANU7ptkuWMzNObqXcTF0B+0lrEpIG4gkIQVjTcl693M/GkK4y25vKqS568ODHJDkQGme48alr9Yv4560swH1mVOyW90Vf7fhOdCD30uw4Sji2rB6jKED0TsufsDzmRPq6jDui4hnoiT4M1YyehgOVxqBM5mi1Ab1HWoXfWUHXdzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Fri, 26 Jul
 2024 17:26:03 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 17:26:03 +0000
Content-Type: multipart/alternative;
 boundary="------------Y4Io0Q0SPBE40gsMJUl7D0kS"
Message-ID: <871e6e40-37b0-4ae3-822d-b6aaf6587def@intel.com>
Date: Fri, 26 Jul 2024 10:26:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Future-proof compressed PAT check
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240726171757.2728819-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240726171757.2728819-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:a03:117::26) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH7PR11MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 23074183-561f-4f2f-fcf8-08dcad980674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blNQQ211RWpRN1kwYVhDWnR3bTVEcEg5eDVDeGttYVBVeWhlSHdKNmtvWlpm?=
 =?utf-8?B?MDhBQ2tXUUFLZHI5aGN2R1E3T2tsQ1FwWm1LTXlqQ0dOWm1OR2VZRHNhRU9Q?=
 =?utf-8?B?d21VaGZ0eXZIekt4VGxyWDJpWlhsWklNdmdOTnhxWG9xT3MycmRad205M2lE?=
 =?utf-8?B?Nmd6MkcyalY2aXdZQzdHdUJLaVJ5NklQUDNyRW5XNEY1cHY5cHdQN2hUR2xk?=
 =?utf-8?B?RkxOTEtXSFRySkErcEhlU0prTXZIbkEyTVBsUHRRZy80WXpHaVZ5bHk2c2RV?=
 =?utf-8?B?b2tpNGF0b01mUVZlYlNzckVod1Y4a21aN3JYbTRGRUtITkFHYUpEQWtqR09M?=
 =?utf-8?B?NVBvV1E3MG5GVUtNcEo5ak1kcTlhMnFSa3BFRXJiYmwxRnlXcGZLZFptZFJT?=
 =?utf-8?B?L1hFZmhLSU92anErT1FSa2xyVms4eUhpUUhkM3ZLcExNdGsra0xIaUZwcXpJ?=
 =?utf-8?B?ZG5iNTZod2d3QmxNaWtaZDBnamN2SWVzZHQxbllocHVUUTBmNU9hRDcxMHBy?=
 =?utf-8?B?Nk1LbmRxcjRvaUg2OW9ITzR5L0ZweFZhVWh3Y05sVTUxeitpekh1dVNhN0li?=
 =?utf-8?B?bk16eENid1NPWGhiQXJOQ0RBQ2Z2d0NjNkphSDlhbzcwK0N0ZWdGTlBRV0Zv?=
 =?utf-8?B?a2NRVlN2enAyblVXZmVVRXNhTjZMVzZ6dTFhOHJaK2R2ZFFuMU1sVlZCQXR5?=
 =?utf-8?B?Tkh2SjFoTXg2WjhkdGFVSjNGcnBkVjc2OHBUbEtpZHRaZ2xSeTQwWm02eWlD?=
 =?utf-8?B?UFozNFRYRXZFaTZjOGRBano5SS9PeEJwUTRNSnBJRVArUE14ZzE2NVFUakh2?=
 =?utf-8?B?UWVGaUN5OGIyV05qcGtpYTFXL2JOYUxxZVN0NkZPZlp4Mi8wYkE5ay9QdE5j?=
 =?utf-8?B?ajV2amNONGp1dyt2VnpsRER0eEtXVHRNNjhVbmxkWHcvUTNMTmtRWW15S1Zp?=
 =?utf-8?B?WlU5azh0ZDFLc0JSSDB2T1U1c09QYlF6b3R0a1BXT1N4SGU0a0VwRnhvZEQy?=
 =?utf-8?B?TDcrWDlQblloNzVzbUJoSDB4MC9EbzVuVzFLNHdVUHhMNjEvcDEvR3QwVTFy?=
 =?utf-8?B?SlVOREwxMmg5b3UzSk9XbDR3a1pHTXVUZjFqdTJiNStDOW1rOURTdUxWOUl5?=
 =?utf-8?B?VVh6ZldFbm0yWTBISVQ1NnpvNHI3MjJPcWVPcG1DUERQYjJ4K0JWVlNrZVF0?=
 =?utf-8?B?SUM0blRLQzMrKzRmeTdNSWlvRGhkMTk4M3ZzRkxJZlMrUU5uN1RQTzFDb2lt?=
 =?utf-8?B?RkdlNm9UMnk0Y0I5Tm4zVHpaR0FqQ1J4Zk1ua1dTWlFvTzg3dHRLN0YvZkg3?=
 =?utf-8?B?V0ZwY1Y5ZVUzWi9zVkVCd3luNm1EZ01mbW9Ua2VIcUZKWm4vR3M5STh5d0hG?=
 =?utf-8?B?TXhvOE1KYzgyWnlHVHdJSFZUWm5IN2NVSW51bW43S09YdDVvSEhHOXR6Qy9H?=
 =?utf-8?B?N2EzSExDZCtadEFIcW9tS0tzUkI0Q080NlBCNm15dXErZmJDWDVQMEJnU0VF?=
 =?utf-8?B?SlB2d01QVUx1U1JvUmtMTi95UXF0ZzlmalQ3VDA0bmZsdU5XMExGNHF1anJI?=
 =?utf-8?B?TmVGMXlpUFRQbXRocVZETHlITy9Pbkx2UXltSVJKUXVjTW9WYk04OGdWbHho?=
 =?utf-8?B?eC82TDZHZnFwNWdjLyttelR6a0szT3Z3UkRxN2FMSGUyRWZmeUs5SXZ1Vkg5?=
 =?utf-8?B?ZjhDQ3cybzVUelB6alNSWHAzWTBhb0tpNERBUHJQVnJybE1oUE9kQUhOSWxR?=
 =?utf-8?B?MldwMWtXVmdiWW1oL2VtejRRVTh0b2VLSXQzMU1NRndBN1N6Q3pJQVJCQUR5?=
 =?utf-8?B?ckgzWlM1UlJiMjZRTmxSdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVJOUkdDWUIyYzR2eU5GVVBsZDhoTjZBT0xXUFAzMGlBUGp3NnJqMUpBSGlD?=
 =?utf-8?B?OFg3b3c5Y0pHWUhxa3d3SFBmWGVHUW84djFCRVc4VEU1OHBEQkNjMnhINmZk?=
 =?utf-8?B?U2c5UnplK1dyY1lzc2JQdndWWmlUQk41WENSamsyRHhKb3Nuc1NyYkVwZyt1?=
 =?utf-8?B?ZENsM0RwK0MxUjMvMDI3QlZ4WE0zRW1LallsY2dONGpvZVhkYWlKTms1Vk9q?=
 =?utf-8?B?cEdVYVJtZDQ2K3daS1ljaVIvUG9rTmRhOEhlR0RjNnpGOUxoU0JtZXdQSFA1?=
 =?utf-8?B?RnRIS3pVVzkrUTJPaTlWU3dZTHl2Vldkd1pTNUN1OHBmVWVpTC9xNWk4T2M4?=
 =?utf-8?B?eTRtSE4wckJDRldhZitOcFptZ1l0ZFhxM01qTWhYelUwT0VJUjNxRS8xTGxC?=
 =?utf-8?B?UWV2U3lvUVVmME40OFE4UDA5VlpzdEY0dzVhWm1YME1ZdEJSbytCS3l4YmNw?=
 =?utf-8?B?ODlxeDRqRSswY3FoczhOUnNVQ2ZpNnJxQ1RnSjlWN1VxV1Vra2ZIODJsUWtO?=
 =?utf-8?B?RDVqNHVseDRVdkZ3VG15bFhXUE9WMVJ2WmxkaFJTUUdGeCtCR1NXV3U2bzZw?=
 =?utf-8?B?UmQ4OElDd01iMXJva0VMQ3I4dURJZXBmd3k5N1drdURpbTJXbE5DMXowakpJ?=
 =?utf-8?B?U1FNazhOOVBRemQwTyszTUk1a2hiYTJNRGJzZmJwaHhINlhLNVA2ZWZPcjBO?=
 =?utf-8?B?NjNiK0JjS3BEQWxpSXN3eXhKWjB0SDRtTURDeElkM1c3YzJSTm95NzFjWTJy?=
 =?utf-8?B?bXpkWlMwUzc3d243cnUzZEQ1VEhKTHFHTjZVNkdpVHpDYVFZL2cwa2pBSzRD?=
 =?utf-8?B?Qjg2MnduUFhOeHAvVHhYZDhhZmJCZk1LS3JjYWEzQUhFZkZMZ2FmaTR6SWdk?=
 =?utf-8?B?TE9nT2hiU05oOGx3LzBnekdFOG9YQTNxQ3dNcFJIdkNPSTRMclVpZlNjeUJs?=
 =?utf-8?B?UUM0MFFuSWNXSmxNZHBpUFpMcTJBeUo3bHF6VnF1U1dYbTFEUnNQWjRtVFZQ?=
 =?utf-8?B?aWp6ZWpRcHNLRUQwL2VBc3I2c3Z4N2xjZjdWUTRaUVdiajY3SU9NWmd1aGNI?=
 =?utf-8?B?RWxhRTB4bzRGOXUvdmdYVUwya0pNVUFJZ1VsMnlnSE1NNk9mZEtlMlJvbXc4?=
 =?utf-8?B?NFJUQm52eTBCSENUOGJ3UEs4S2duQmJMdjZtSkF4SGM3YXkzbkRvc1VGYjJs?=
 =?utf-8?B?ZEpOdTduSzJkU0xXYU5iaEFpcTZ3cHlYSXNxa0V3ZThoWlg4YXRmSk9BWnll?=
 =?utf-8?B?dzVKN0hDL25MdldXN1VQQkIwMWdWSExocno2cjlMVGgwdDk4Zk1zWVE5NW54?=
 =?utf-8?B?Zk9kOWgvVVV6NEpyYWlmeTk2c1d4MnlHeVczTEFKUSsrUEpDT29YU2tnSmgv?=
 =?utf-8?B?TER6N3d2REFwWWxabUdueDdYTmlhYU4zY0lmK3JZNGhmYnNwYVNqd1VGcjhG?=
 =?utf-8?B?THcrOFRVeVNMTkxYOGR0Rngzb3FxRHdTdE11V0h1Q0NQWlp2eHhlU0U4UUF6?=
 =?utf-8?B?UFcxUituWEZyRG9GeE1lNTFyL0o3Z1gvemhVN0NGTHdiQUZEZjROY1lLR3J2?=
 =?utf-8?B?VDZoNVR2c09HOXJOL09hd093Y2Q3Q0ZpVXRPM3RFeHpQNVRleUdrVW5sVnhu?=
 =?utf-8?B?WGYwNldFb2I0MXRESkdrUEltUnNLdU9uYlpVRE1UM213MXFiMzNkVTgwZGVW?=
 =?utf-8?B?ek5xRHFsSE1TWGhHdGd2bUNOaCtmNm1XOUhxWXoxeVpKTy9rcHhjVW1kcGla?=
 =?utf-8?B?a3F5eGMvU2w4b3hmOWk5RWJQb01oWWM0UW1IcmtaK2w4UlhIMFRnTmcvQmF0?=
 =?utf-8?B?eGovbVJtcWdwMGVmRkNQQytHUUJSWTlvS3h3RGdXcVRZNFJldGloN3dWOElw?=
 =?utf-8?B?N21nRGcyaVhsZ01WeUhESFRYSm5ZUjlBNlVoK25nT0ZZQmpBakFtdjVlRitF?=
 =?utf-8?B?ODVkWWQ3ODhzVERabkppMlA2K2tWQnJaQWdYcC9zWEpUVnFMQ1lnNkhlV2oy?=
 =?utf-8?B?dDVIVTFhNGVBVWpMbnNEM3NDSzI0UVBqOTJkbDMxZTUyUVU5OE1vdlJiL05M?=
 =?utf-8?B?enc4eVRIb25UNDNmTjhYT0hmbmZBVHp1S0hKekZ3dXdqSW1zUHFKMW5QNXJI?=
 =?utf-8?B?TW5xcFBKUmc4NCtoQWtIL2doYmZEL3MxVTIyVjhwMDRkOUtuZ2V0TWJ3SDhM?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23074183-561f-4f2f-fcf8-08dcad980674
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 17:26:03.6478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GknC7KRj4GPlK6HlcOdDYa6aaKDAIQLfVEz00mTLq6vtKltc/q6czJE7ZXimKYwHcgmeDnjf6/0iT4oAw5aMm9y/Aik+mBdjSb/ygtlcVEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
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

--------------Y4Io0Q0SPBE40gsMJUl7D0kS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 7/26/2024 10:17 AM, Matt Roper wrote:
> Although all current Xe2 platforms support FlatCCS, we probably
> shouldn't assume that will be universally true forever.  In the past
> we've had platforms like PVC that didn't support compression, and the
> same could show up again at some point in the future.  Future-proof the
> migration code by adding an explicit check for FlatCCS support to the
> condition that decides whether to use a compressed PAT index for
> migration.
>
> While we're at it, we can drop the IS_DGFX check since it's redundant
> with the src_is_vram check (only dGPUs have VRAM).
>
> Cc: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c007f68503d4..6f24aaf58252 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -781,7 +781,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>   		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>   	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> -	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
> +	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
> +		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
>   
LGTM.

Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

>   	/* Copying CCS between two different BOs is not supported yet. */
>   	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
--------------Y4Io0Q0SPBE40gsMJUl7D0kS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/26/2024 10:17 AM, Matt Roper
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240726171757.2728819-2-matthew.d.roper@intel.com">
      <pre class="moz-quote-pre" wrap="">Although all current Xe2 platforms support FlatCCS, we probably
shouldn't assume that will be universally true forever.  In the past
we've had platforms like PVC that didn't support compression, and the
same could show up again at some point in the future.  Future-proof the
migration code by adding an explicit check for FlatCCS support to the
condition that decides whether to use a compressed PAT index for
migration.

While we're at it, we can drop the IS_DGFX check since it's redundant
with the src_is_vram check (only dGPUs have VRAM).

Cc: Akshata Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Signed-off-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c007f68503d4..6f24aaf58252 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -781,7 +781,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &amp;&amp;
 		xe_bo_needs_ccs_pages(src_bo) &amp;&amp; xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs &amp;&amp; (!src_is_vram || !dst_is_vram);
-	bool use_comp_pat = GRAPHICS_VER(xe) &gt;= 20 &amp;&amp; IS_DGFX(xe) &amp;&amp; src_is_vram &amp;&amp; !dst_is_vram;
+	bool use_comp_pat = xe_device_has_flat_ccs(xe) &amp;&amp;
+		GRAPHICS_VER(xe) &gt;= 20 &amp;&amp; src_is_vram &amp;&amp; !dst_is_vram;
 </pre>
    </blockquote>
    LGTM.<br>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Reviewed-by:
      Akshata
      Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20240726171757.2728819-2-matthew.d.roper@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs &amp;&amp; src_bo != dst_bo))
</pre>
    </blockquote>
  </body>
</html>

--------------Y4Io0Q0SPBE40gsMJUl7D0kS--
