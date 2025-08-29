Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDCACA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9266710EBEA;
	Fri, 29 Aug 2025 14:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CagMA7ON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F2610EBEA
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756479380; x=1788015380;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ls3ULmIoYJMeWPhGFn9Yq45bs3IrZAyrMHhcKGZaoBI=;
 b=CagMA7ONyudPf7zPnQyS/H2hm+nmcuxB5HXS6v2pW3OqYT2hYphI/BO/
 EOHIiBR4tqypj7TqRhfT3giYzZ9cFdYDbpQtWWih32uU8GADu0oaExkSB
 /gToyJM4SOwNas8ZttNxyWxjYduW9VqoMZerzqO1YEVVh+y6svNCojVk9
 MWE8HiWO32QK+hq7ZHCm257xRN+NaybDuSp7uLUXKepub1RsLQC23Oe0f
 gcY9U0JtOVXzn6g9kFfbchrxroq6o2bsmSLhR+zWewo3D8mWq7yqqMf37
 Yzw+mXIvaCTRTwO8P2lboNyc6vouO/HGh/xm2VgiOeqVERzEkdwJNlcVa w==;
X-CSE-ConnectionGUID: SKemKciVT5aYW+2mSiLBPQ==
X-CSE-MsgGUID: 7T51gsJkTte2bC3pkpZiIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57959086"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="57959086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:56:20 -0700
X-CSE-ConnectionGUID: +t8h1b4kRTaHAjiTuFPslQ==
X-CSE-MsgGUID: fjokMvKIS8uqQ9eE3HEdfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174569953"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:56:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:56:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:56:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqC36/a4hHTcoFXCJwy03mAhUwzrCAEDrAZpbZ+UMCtGve17Ei8z+u5C0iSGsoZftCc9TYMRQ5fMKy7oh1nK4pA8gagHfW0YBf+0fszVsp772mRENz3DTwRzX+Zatmy0e3axqvFiLQg17udqbtNZEOVpKmg+ng9ZcnZbkVtdndbi2D7EDn427oHoaPUIsOIc4wJEBCcJJ2Ut+sAE8MHMqXUHR5LoUojuDwjPq8bKCAnEpbH+qW2giM1CeFo3X8/thYtAic2gA4PKlH1K3sw0yl6KDurtYON2aNtBPNFgNFFB6dffszBqv9npsodKaZCoPihX7rOub09hMjjBMj3P0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsmhuG3saNbpCXmI8TwgqkegPfFa5SA+M/yHY+wlvQA=;
 b=oeqVj9RdnHuyHaeZ1znoVCIrqm5chhrxTqBAbeza4WxBUe1ljzW/aEm3UTBxUgJ2q4F5YMkvR0OMmJ8UZIYh43NviEwaQBhAZO08G4Hxwg+Ii9lQwVejkFWO7GlLUnA2UwCiuQCGxX1rLVQp/8PpV0IKThUFXtFXpRt/5cc5sCsUY+7BdnGjGyD0AQRCoIzBR18UhwMsRaDrLNYsxn+eSl9sOI8CbB+BSCIXEX1mDa42F8EcFtxzKiIjXsHo3Pa80M9A4f44PUNqJHPwrCxlJ9oam7yQNOjNBDSOk4OSnp8ZX2sAV0V0MfraMOag8m95VYKAyeu8WbtA9BhqkVu4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 14:56:09 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 14:56:09 +0000
Message-ID: <f61ba388-cefe-4d85-8f13-d8686fd3050f@intel.com>
Date: Fri, 29 Aug 2025 16:56:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/guc: Track pending-enable source in
 submission state
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250827211010.308372-1-matthew.brost@intel.com>
 <20250827211010.308372-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250827211010.308372-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6852bc-79aa-4de6-d8da-08dde70c302e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SElGbHhJVjJwVTZVb0xsSnQzQjc4MmVUZGxjMG4yVjhDcVdlSzc1UWxSczhw?=
 =?utf-8?B?djJ4UzZjdGtnWmo2Tlg0WEdERzdwMGdZT3pDVjdXU21GdDFJdUozZFl1NDU5?=
 =?utf-8?B?QzE2MkZxdkR4ZnVBMzUrdmJ1c005Ukhjbll0VjVvQ3RqU0RHaWVMaEI0TG8x?=
 =?utf-8?B?TlExSUdDcUhZL2cwbU9iejNNL21kdTFzZWd2QkJ0QjVkYmJyTWRFQ1lsdytO?=
 =?utf-8?B?K2FwU0FwejdaQmtDZXdrRU5Nd0NEUFNneWRldW0zMENOYTc1UzZYcWs5aWFO?=
 =?utf-8?B?NVh1MUU0L3VFaldGS3ZxNVh1ajQ1SXEvcUc4amJ3V0VDR2JuZ1daZnFGaW5S?=
 =?utf-8?B?bk0xdEVwSThPWWxKWVFJbWpmR01KYlpHZWV3OG05b0gxSXpOcFNDbXY4ODJN?=
 =?utf-8?B?dmJ2VWRKZFh3SzRSTnJjamRSbS9MdWJBTlN5eGluVWQ4VVNCNWNyYU1aa084?=
 =?utf-8?B?NVJnSDRPRUpTSlprSHcxbDZSQmRjVlV4N0c4bDN0cGlwZFlVRHAvdUxrMGJh?=
 =?utf-8?B?UCtUQW4yZzJ6NkRldENteFFRUCtGT2prSi92bDd2RVdHQWw3anl3NUxnN3JZ?=
 =?utf-8?B?S0VXQTFsSHBOMFV5RFpzeTJWdnNQVEFqbUZadE04MXVtMXhXV2loS3N2Kzgv?=
 =?utf-8?B?YVBKSVRjWkhZRFNHU1hNRFp2TGRhd0FlUkFqMmYrQ1hCUTBlaHozeG0xaFlI?=
 =?utf-8?B?R0pIVHhOUjRPeDBLbko5a1Y1a0srTjloaVNDMzhjVnpaeXpaS3NYbmRwTGRE?=
 =?utf-8?B?THNKZ3NOaGlyVEV5cjZ4ZUE0QWVsQUFYS3ZRcXhIcUFHWjJUOU1idk5xcmdi?=
 =?utf-8?B?VEZqdGRBNXQxb09DSWtCOGpQZy9pUGxNbXRScGdKdWVWaHN0Q2RnaXVNLzMz?=
 =?utf-8?B?Q2J4eHNsYmNTV3c5TnNKQmdELzl3c3ZsVHpKMlVYV2diODFxOTJZbXJwQ0Zj?=
 =?utf-8?B?Z0JzZGxxRWl6ZE5aSnRCeEVuUHZDbzhSNnl0L1dyOVh5R1BYQzMrNlF4ZUpJ?=
 =?utf-8?B?YWVwTTV4OGtFZGErSjA2dXNueEJwb0RmWWdvYS9ubkZwODg2NkRFd21XRkV5?=
 =?utf-8?B?blc3SnM0TmJhTFVTajI2ck5BRzBMN2FlbG1FeVprMElGVHFaZW5aRWFrTEx1?=
 =?utf-8?B?WitpQTBWNHJVa3dzWkhORE43bG40b1RyMEo2ZTNXR3ZnZ3JlTFJ5RitYNkx0?=
 =?utf-8?B?VG5YU3VoVGJMcWFFaDhidGRlcyttYkE3eHR1aDRwYWw2NnIvVGU2THBLRUZS?=
 =?utf-8?B?WVZXNXNaRExmZHpzelFrZE1Rc2pXblU0WmM0UGVZMVRZVGVTdWhiUmM4anQ5?=
 =?utf-8?B?TWc3eGVkRXNCajBTYVFZdElqUlZtZTVubGZyejFKYk1vRlQ3eXFFMmRwN2FP?=
 =?utf-8?B?WU44Uyt0MnE0V1AvTUZzWUJjTkE3N01vMHVrWkxUMjR0SXU3RmpBTk9RMmFP?=
 =?utf-8?B?NTZlMmVQY1ZYTzd4Nk0zL3AyZlBsS0hJc3o1SUowMnhVV2ZIWC9ISElNTlRH?=
 =?utf-8?B?WUpHWXFVcE9NTm1BMTFKVm9ZcVVpcFduSHgwNk1KZjBCYVp5aTdRMmJ0WlZi?=
 =?utf-8?B?Q1BsRTdncmZLR1BtcnB5YVEzVnpRRGtxdjFIQUkrZjR6QmFaamRlTFR4M3lV?=
 =?utf-8?B?d1ppWlhXdjdJRC9ocHpWY3VMTlZVTXd2QlZjamQ1RFZ2SEJHRmdJYy93TWMx?=
 =?utf-8?B?cFlUd1hnblhOTmVVR2V6OWVaczYydlBOdkZWVXdET1hJT2xhN0FHcEtxZ1F4?=
 =?utf-8?B?bms5dm1PdTBudFNEb2E2aDRHOUVqR1EvanNsUVd6aFZCTjBtYlhBK0dmaE1t?=
 =?utf-8?B?SnQ1VlkrdlRvTDhxMitIa2UwQkJNV3NINktOdk9zRHRGVlpEcERmZmZxQkF0?=
 =?utf-8?B?MEQ1SU5XejdDVHVnbTRMaGpBQlBtVzVETHk5TlE0STJYbUNhOVdTMFF2TW9u?=
 =?utf-8?Q?mxlwp/u+btQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFBvMVExODg0dEhkWjhtS1pvRkR5b3ZkZDdBdnErZjlYejBqaGlkK3llUEZT?=
 =?utf-8?B?T0FWRnBFcDFlRDg2MEtrdXpMNXpTeUszbGVDZlJ0MDNlVnVXL2Q3akM1aHVp?=
 =?utf-8?B?dGlxWXYrRGx5dHhESTdrZXpNbER3aSt4VzR5SUFUTWVNVXllcnAwUXl3SVZp?=
 =?utf-8?B?aWdNc1Y5WUx3cm45NDdhRW5OdlZoaFFEU2UzWGZIU1pPN1BWNUtaUlN6dTVx?=
 =?utf-8?B?Uk1qRVZRWkZxUXFNcjZoSzhBKytnaXU2Y0VwK1RrUzFQWFlPN3BnWmNGUzZP?=
 =?utf-8?B?K3lZZzR5OCs2d001b1p3NXIydHpTOVZGbXZRdERSUlJCMGZZL1BDc3NUcUpR?=
 =?utf-8?B?OHJ3YTFJeTZEWHpKaE5YRWNKcTlsV1hKOFRLT2Z4ZDk4K1pSR3FNdXEvOUNy?=
 =?utf-8?B?WWJvZG82eS9kakRjdkM4QTJ2dWN2cVpOMklFL2hjZ1A0Q1ZjUS81TFNncmRt?=
 =?utf-8?B?SGtKcnl4MU80bTROUWRtblVsZWEzTkRLN3pkY01lVXEzc0QrTW9xbTZqTXZH?=
 =?utf-8?B?amlaTGhTMUhyQi81eDRVbW84MWVEUjdMSXlRVVJKNE9MVVFNT2c4STU3ekJB?=
 =?utf-8?B?alNaMk1NUFE2LzlYZmxVMjJUa1k3ZU9ZcUU5N1ZDQk14WloyKzNsRjY1VjVV?=
 =?utf-8?B?QzhWUEhSMmpLdnVSN2RtMDBwOFVMUzVZa1FLRnlHRnJVb2k0RWo4NThWR1Nu?=
 =?utf-8?B?bFFJUE03Qng4ckRIb2lxWjNmRVgya09xcUY2RUd3WFM5aCs0OUxZdER5V2RE?=
 =?utf-8?B?R1FFQWVJVUxNV0JiM3hNb0pPenhhOUVnMVBGaWJJREJhMXBscFJwclMwTnY4?=
 =?utf-8?B?MGIrbVBDU3d5WEdKRnZSL253aitUb1lRWksvSVd1YStycmZkUzB0T1NXUHNZ?=
 =?utf-8?B?MnRYbU1OS0N3cnhZUGNHc3RyV0Z5WnFvb3Q2dE9obStnSnNRTmZQNk1OVFJV?=
 =?utf-8?B?YW9NaHhSeit0S3d2clhJRXREd2pKaWs2RTQ3UEJQd3Uxc2lMaDR5dGxoN0RD?=
 =?utf-8?B?ZkRLaGhMaEcxUmRRYTdTUG5WVU45S3ZFemRmd25iWDRDWEVsbWlBbHFOdVhw?=
 =?utf-8?B?dUttb1FRZXdLUEJvcjNHUGhKTWJiUVFMRXI3N1VxTGFZVGdqdGE0LzRwQmt4?=
 =?utf-8?B?L0RGdVExU25MWHk1S2xwSGR3QmMyMVZzRUJuU2tBUnVvV3FLaC9pYzZiY0Yw?=
 =?utf-8?B?U1pJbWpkRUIxYzRwY1czVktsM0w2ZGUySGsreWVaSlhCaVR1MmlmWkxQc2lt?=
 =?utf-8?B?TjlyV2xIa05WNnViQ0VLdmErVlk2VWlwWEpxTGQrdlV6LzZMeG94M2VlSlEz?=
 =?utf-8?B?eE5lcklGS0trdnhXQ2lzUTVwUWJOcWZ6aE5pbE9RSW9iNDJJTnA4dnZQcEh2?=
 =?utf-8?B?bEEvTUZkZ3orS2JabGRwdDI0b0c2WlB4TEdzeVVVMDV6MENyN3FpWXBxOG4x?=
 =?utf-8?B?MzJSWkFJcWhwa2puT3NTR3Bvd216cmR5QTRBUHZWOUNnaVd2a2VBek9RMUg4?=
 =?utf-8?B?d1JrM3hYaVc3a0U2akpwck4ybXNZT2pOTExKU2ozSWJjTzhRV0JtcDliT2Ew?=
 =?utf-8?B?aHRVUkZUYlFtWndXQzVZdlZ6M1ZtektneFlMQzNmL0FMbUYyWndLV3NyNHZB?=
 =?utf-8?B?bmRqWDFDZVlPVlloT1JGNlJZQnZLUTB6cldUMHRVV255ZWo4VnFsZm5NRFc2?=
 =?utf-8?B?WHRRakM1K3FNandabVl0aHBTdDBoZ1puTi9OVDhydFBMOE9lWnBWdUMrWFRI?=
 =?utf-8?B?ZHFlWURpZGF6QllYVHJZZWdPWUlBdi81TncwY3U3SEsvK3d3aVl4WTdIZUFL?=
 =?utf-8?B?RHI1T2xrcU1MczUwRlp4WHE5VCsvVVQ3amdtZVFFTkFsVGZsTDgwcy9TVU5Z?=
 =?utf-8?B?dWFEb2Vhd3JxN3k2eTc5R0dQa2tTOXErdzBScHVKN2tzSkR1eTBTSGZ6MTg1?=
 =?utf-8?B?NE4rZDF6WlA1MXlXaEZ4Nmx0OUtxSncyTTV4WU1QaXhDWFI1bXJxNU1VZ1JM?=
 =?utf-8?B?STQ0NDZEcEpUaExDbSt4M2xKYzVKbXdXMURpYyt0MU5EdWd2bk5KL0FyeTFC?=
 =?utf-8?B?bHQ5SmNSWjIvVTFmQTZRQ3JEWXFsVFpUd1FUc3JTekdWTmJTYm03ckNDOU5w?=
 =?utf-8?Q?h41gzogc8VH1relMZgUJfLXyQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6852bc-79aa-4de6-d8da-08dde70c302e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 14:56:09.2877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1ea3qBkusCrXhh7WdF4P5VuclL14z/LrjnSNz3heQ8uxxrpZRlSB5il3eC0iKfhZQdk1GufcLfmqQs/Lveg+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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


On 8/27/2025 11:10 PM, Matthew Brost wrote:
> Add explicit tracking in the GuC submission state to record the source
> of a pending enable (TDR vs. queue resume path vs. submission).
> Disambiguating the origin lets the GuC submission state machine apply
> the correct recovery/replay behavior.
>
> This helps VF restore: when the device comes back, the state machine knows
> whether the pending enable stems from timeout recovery, from a queue resume
> sequence, or submission and can gate sequencing and fixups accordingly.
>
> v4:
>   - Clarify commit message (Tomasz)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1185b23b1384..9e4118126ef9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -68,6 +68,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>   #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>   #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
> +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
>   
>   static bool exec_queue_registered(struct xe_exec_queue *q)
>   {
> @@ -219,6 +221,36 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>   }
>   
> +static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> +}
> +
> +static void set_exec_queue_pending_resume(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> +}
> +
> +static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
> +}
> +
> +static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> +}
> +
>   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>   {
>   	return (atomic_read(&q->guc->state) &
> @@ -1344,6 +1376,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	return DRM_GPU_SCHED_STAT_RESET;
>   
>   sched_enable:
> +	set_exec_queue_pending_tdr_exit(q);
>   	enable_scheduling(q);
>   rearm:
>   	/*
> @@ -1494,6 +1527,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   		clear_exec_queue_suspended(q);
>   		if (!exec_queue_enabled(q)) {
>   			q->guc->resume_time = RESUME_PENDING;
> +			set_exec_queue_pending_resume(q);
>   			enable_scheduling(q);
>   		}
>   	} else {
> @@ -2065,6 +2099,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>   		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
>   
>   		q->guc->resume_time = ktime_get();
> +		clear_exec_queue_pending_resume(q);
> +		clear_exec_queue_pending_tdr_exit(q);
>   		clear_exec_queue_pending_enable(q);
>   		smp_wmb();
>   		wake_up_all(&guc->ct.wq);
