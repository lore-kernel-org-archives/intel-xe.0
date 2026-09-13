Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C26EC88E65
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE4310E0F4;
	Sun, 13 Sep 2026 15:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5bCTAK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351FA10E09B;
 Sun, 13 Sep 2026 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789313514; x=1820849514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9jdXWk9PvkADJA0MF1d5KWO3Zaqoy9h2q8sUeR8nG48=;
 b=N5bCTAK6T38QRtqLrTI8pvftlRKD2n8aBZfiqjS3VY/HCI9cYgWb4e1B
 z0cgqqjywFVFsycrR7tjSlJSJU+VjAizOnLpDdqFFGtYlB+oC9My1AfWH
 7jxkKZDmRGkJ8WdjHI+dCPZls0glT8t2pIUmBDBvN06WZ8+236tKrPJBZ
 1qeGWW0n8ouSxSbGb8n4ZZmiG5fv80JGGrarET+hBlFqq0o0hI1+PIgro
 ekAaG6++8H0AYGJMpNroWrel5qfvL8TfOEch6JFxTOqcGS8MEiw4apC+A
 /6Zj9hmGX8re0SpKZwGsMGbcvqADwsthiSMdyG/VPGmagBipdtDMLIFRY A==;
X-CSE-ConnectionGUID: XwA61MKqRj+XwE+M3J0ssQ==
X-CSE-MsgGUID: 0o8ZWij0TDW+ThUsuw/t5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100354368"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="100354368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:31:53 -0700
X-CSE-ConnectionGUID: eWwjIaCeRwGQMaFibnRI8Q==
X-CSE-MsgGUID: av2ZgpLpTCK/SFrVuxQK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="272389918"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:31:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 13 Sep 2026 08:31:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 13 Sep 2026 08:31:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 13 Sep 2026 08:31:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffrc5VzhRCoEBTFzs9MQtG8Wo6ODu+H1itNmM3eyLEN2nTyoXTszLuqTrLLYbZc9d8Uhj//hYiBrecA4aSjutn1VIKYyHzQi3zJUoLn9j1OzVvtkEZg6OUHEjXpsJkBn8LqBw087wxYO7XV/C3t/TiIaTLMgSs0ntgW7XCJOOi4S3682ZRRhhftOvCH92sPg5FJe4geUcn3jb8Wj3C5mZZSoOHr3Oganj8eJ2NfTdkYkYwX1bVsMmDwa5JHwr2BL+zv/JOma+1xNJ01PJ0YxUsBt3L7IG38c+4rnjKQ6WFzEdbHxg3uuPo++tl1ADVYNGjz8GSlDyLzqMq8vlKNbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r89iOVPgPcFCXBVn6EB97QrR0coGHzzBQ9aP0Utt6SE=;
 b=Y+WHnSd0/9mYT+eWfoj+lcqgRTkZOZb8hRwPI5Mk3Vxv1dkxofeSket9wbtgY3j8oNPV/QtFem7pSl1UwCdpPyH5eDNncg3vh7f1SsSzqXqmefR4RmovLHujI6MQ9mTV8f3cLX8PfIaPD0hwqsL9Sh50Xgyc/hM4YPfFBWYZL9DOueOB5FmvIArOI+/1Kdhj/pMRt22P618f3mBHmo7XMRJlQCKRYUiVeT8raFklFFwvilLkiNqYO2xQ5Vp4OtrD01K9r1Cckt3bofj9QEsnzwNntO5x1cr+raEkMbeQwFgTGSTWBolc1UAT4HpLcZa+rPLQEbdqPKKHQLinz9YDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB533224.namprd11.prod.outlook.com (2603:10b6:8:46b::19)
 by LVXPR11MB9707.namprd11.prod.outlook.com (2603:10b6:408:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 15:31:48 +0000
Received: from DS6PR11MB533224.namprd11.prod.outlook.com
 ([fe80::42d2:2116:225d:d046]) by DS6PR11MB533224.namprd11.prod.outlook.com
 ([fe80::42d2:2116:225d:d046%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 15:31:48 +0000
Message-ID: <3f1b6ba7-77f8-47cb-b012-cf41000d95a4@intel.com>
Date: Sun, 13 Sep 2026 21:01:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission line
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
 <DS4PPFE901A304F33780D3462F329ABB79EE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <DS4PPFE901A304F33780D3462F329ABB79EE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To DS6PR11MB533224.namprd11.prod.outlook.com
 (2603:10b6:8:46b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB533224:EE_|LVXPR11MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd4a88c-b4e2-4f56-4108-08df11ac2041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1w80XlX3cLA9/Y6HvQLnDxzfnJL8WSgtg4agoZpgDP115KZRhoKCS59xMRf2pTpC+Tuc17u3TgJ7qlL0J1AJiwfCAaAvy8pfdo91TwIY99tXQPm/lYkMqCgFjZN8aroqVCeEYjH88a0AKeI0gYEXXPaRdrtfJ9DOiOryVcq2CbEnshejGgc0EF67m/A+jt6GryLkH573AkRFoBp1m0H5RGluxFR4I0h8wfR3BWN5tmUm+9yS47OtD7ayko6xJxN7VKGVgBP9wkNJgh1TQSF8zwVix6I6bM67AMFxCmU/LGLHGYrjmQz/TBT8ezumerBGWjuaks8AhoAEjRy5/Y8dqpgEU1HAjfOCk9km4KT4OGXl+gEdTbCDjsFmdrQ+R7ekfATLQsVjGao/+4XYCuYnQfB93UciwUCLrYNEhy7zSaJK6Yf2+mcqG4YGN52T7pkcqt8SxcB9Qj8ktl6tEcDCJC9geAqVwvfbLvuiB69wQowA6hTK7gW/atAiWtGlhbytkr6Xj4Uhyw5pDKH0579WMbkWBU6dt59ry3Mv8qRkULPZhtlaGaSWHk2ppmzFV87if3knUqvkBBuz4GG34ELbBRqxwdlQqvhULGgw+CePyRRiqumWI5cfIhCjeLpvmjcxoMPW5y/96AZPIIuJF1Bl7gJETQD9nJXSoZJ4sVffg4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB533224.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFJ4ZENyS2FCNEErTDBEVCt4eU90OFlybUIyV0xlTE1sOTFoQjNTQVg4Sk9R?=
 =?utf-8?B?cjZyNGF1T1Q2bk9LdlVYOFZodlBpTURFY1JIbGcrS2wyZ1dmeXEvVDNkRjRm?=
 =?utf-8?B?ZFM2UFptYTdYRzJrRFNlYlZpMG1NUFZJakFjcTRVYldRY3JhLzIzZ2loZHBY?=
 =?utf-8?B?OHgyZ3d4NTArTlhaUEhla2owd1k0VE95dVZhS2h6KzV2Z3JsS3ZsWkJ5b0ZR?=
 =?utf-8?B?bEZ1MHVveVFKTU4xWkg2Wk11ZHJRbFU2RGplU25welZudzY1eWU0R3JGZ05y?=
 =?utf-8?B?RmtvQURFenFsOHdSbXBKWERmRk9jMEltbW5rMExaaEgyYjVUNTMzZm5ENmFp?=
 =?utf-8?B?L044N09SWktuMkxCOWs4cGh4QlIyYzhRblIzSlBkem9hY0hIRWxiWmpSU3E1?=
 =?utf-8?B?L1cvSjgyVzQyTWYxQXF0bmlvZFlxUWIrWWpQVlVZa0JkL1hWQ2ZaUmh2Q1R3?=
 =?utf-8?B?TStHSU9EOXFlVDVsQS9ZWVpzVFh5MmxlL3g0czlCT1NYQzF2RFdGYkRyQ1Rt?=
 =?utf-8?B?VVBFbE1PSGZpRjdjOVRINjNZSXN3Vm9jSTBWOVNJT0JhU1ZaYVN6czdLNXRx?=
 =?utf-8?B?azFtRThLL1Y5akY3Tlh3emIzdSs2UnQ0Q2JRS3JnODJBTkpUWWxTSmNvRWlW?=
 =?utf-8?B?YklIVWxhSFVkZ2g3MndlZ0xya214V09Dc1ppd1h5VXh4eHdlQnM0azVCVE8z?=
 =?utf-8?B?M3pNZjRNWUdVNm14K3BJeDFpVHRITVpub1o5dGNqeXV1T1pNaDdjYm1SNkxi?=
 =?utf-8?B?ZW5jUkZ0bXF1UXpzazl4eW93SGVFcEsvYnJCSmRQQ3JleXVXQ1loTjRndzlK?=
 =?utf-8?B?cTFDUjExYXpzcFpOWVd4SVEzeFNCYmtZdDlTWUR4VTFTOUlZcUhLU2s2M0lI?=
 =?utf-8?B?VnJYeWtnd2Y1VFdXYnNweVF2eXIvY2lOZklTTGg4bzZMTWY4UnJsSlpROGZ1?=
 =?utf-8?B?TzhocGJybmxqcHp5OVAxcldjT0Rick9xVzRPem1ocGttQWtwQWg4N01tL2Nx?=
 =?utf-8?B?M0E1bFRiYWNaejBEZCt1OVoxeGpJUklVYVNlOTR5cDRxQU1ybVFMSW90OUtz?=
 =?utf-8?B?azRjZEI4dmhTMDR5azZGUUhZN3Evc0hOdWpzcTVwSmVGSGxYUW1BNFNDUzFH?=
 =?utf-8?B?WmJuYjhkSEtPSW9aN1l3NWMwMFRtbEIvK3dGVlRJRjk5emFzb3N4MGpCR01G?=
 =?utf-8?B?d3BQN2E3THpiRTJaR2xOeDFKQktlRHNNTEN3aUZQaC91aU4xK3R4SEpzamUz?=
 =?utf-8?B?QnZEQ050M3lhN2FPbFV0ZmJZRXVBbXBTVk8zVlNCTkZTLzNyY212SHljZEJ2?=
 =?utf-8?B?TnExeHR0Tm5PYUxJekc0ekNIalBKS0VTSUlCc2ZOSHRvaUZnMDlLKzEyek9D?=
 =?utf-8?B?VmpPSGhhVnNoQUdjV0YxaHVzTFJkT2MrN3VOWjROMmVrdGxHMGwwTEx2aVZV?=
 =?utf-8?B?QURoQlZVRUhBcE02SHY2d0Y4M1psNnhxeU02dWRkektTeDBVZStTNitwYjZC?=
 =?utf-8?B?OHBORjY3aWtJTUdBbFljdVVSTFpQSzZURjZDR2VjN1lFSU1qZUFVMlJNK1dD?=
 =?utf-8?B?Y2FweURvNkJmOHNHNjhXS0VZSGFTSnZtdFBMRGd3ZUhYWDJjUU1kV3haRVBI?=
 =?utf-8?B?SkdtMnM1azFpNkVmYzBZdjhwNVYzcEJiUmc1ZkxHd01ZWWxGRlFpRytHSEty?=
 =?utf-8?B?MkorSHRsc2lpRlVVS0hiUERxSUZheENqWFBHbVZsNkJ6bDRueGdHM3M5WWRq?=
 =?utf-8?B?S21IcHc5QllzY3IwNDMwTkIwdkRETEV6Zmw4RHNwNnZLcDlVbE81Z2g4NDd3?=
 =?utf-8?B?dHlpS1oyaW8vbnV2WU5YeVJFK3EwNWc2YjA4SnpIc21nSmtVczgrR3hjMGxG?=
 =?utf-8?B?TkNKRjRRRTBIZDlLKzJoWDNmREY3SEdrM2Ztam9JRTZib3BqcFpiUVl0b1Zw?=
 =?utf-8?B?OW9WZnJiVCsyL3lRRlIvZGM5ZnRPdFBiUk1Yd3FPa3RWcHQwVnFhV1RtbnNO?=
 =?utf-8?B?ckU1MU1kT1Q1R1VmSSs2bUIybWhNLythZWZoT3J0Qm43clJUT0g5TTc0ckRz?=
 =?utf-8?B?aDdIc2R6U2ZsdjJSaE1mQTJUTUR2MURnSlhjQWNNNUlsM0ZTN0wzbkpkTllm?=
 =?utf-8?B?akQzSURraDBIZUJreTNRZW5INHU0NFUramg1d1RWOUpkQ0RkQ3Y5TGxlL1Zq?=
 =?utf-8?B?dWlxbXQvcHZiSi8wNklnL3EwQkJyNitPYVNZWHdJMVE1NGMraTdZMi8zUXd1?=
 =?utf-8?B?SDhObDVWL0hNek85VDJNNmxpaC9aMnFkYjRuUE1aVXNNSUNVbWhTT2VYand3?=
 =?utf-8?B?aUlucFNtWVNLcjZVL0h0d1A3N3A1K2UxbVdnOUh2WlZ0YVBUNFprVkFOYmgy?=
 =?utf-8?Q?XJZmiISNqbK19zqw=3D?=
X-Exchange-RoutingPolicyChecked: QRqCBsUbczWo9Z3arnokleXmdBECDWiLH/Tx7LFYIX/geW4nLb+uBsgnkGOag/CO/mPfeZtLC9aXOes+wtqFMyZwAMg7irvTMuw+AUz6UbOFNKHvXwtBCujt4EGHxIC5ZvF/HhDA+sfzVFm1ja4Alo6/RWw75KcOXq1v+tgFa4h4+rTuR+91spxWMCju07Bt2RIi49b59UcHuNAkkhvY/oIy/rcXTa2jM6LjsSmcfRSdRMR/4Gq/gtoJz4NFvi1lohJcR3IaWQAYLJ2rwN5hE3IjIYQnveMztHTG54s5L5COV5x28rqf7JKGJoD+fhPGy3I2tqSR/1HseC2l69sbRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd4a88c-b4e2-4f56-4108-08df11ac2041
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB533224.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 15:31:48.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6wfae7jm6IQ2HwzZS6bJuSP/GXJjPt8XlLDINuMuQ6447Aw2h83Fi+XZQ3lK9IPpocjexLkyDjvWasOo4cRWjGlqJ45HQ4LggVuayQgWqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9707
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


On 9/8/2026 1:40 PM, Kandpal, Suraj wrote:
>> Subject: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission line
>>
>> Enable programming of the common SDP transmission line on platforms that
>> support it. Compute and program the common base transmission line and per-
>> SDP stagger values from the crtc state during modeset, and disable the feature
>> on pipe disable.
>>
>> Currently, the stagger values are set as per the default policy of the Hardware.
>> This can be optimized later if we come up with a specific driver policy to
>> sequence the SDPs better.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_ddi.c |  3 +
>> drivers/gpu/drm/i915/display/intel_dip.c | 90 ++++++++++++++++++++++++
>>   2 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
>> b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index dacb4b7588a0..3cdb06e81130 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct
>> intel_atomic_state *state,
>>   	/* 6.o Configure and enable FEC if needed */
>>   	intel_ddi_enable_fec(encoder, crtc_state);
>>
>> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
>> +
>>   	/* 7.a 128b/132b SST. */
>>   	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>>   		/* VCPID 1, start slot 0 for 128b/132b, tu slots */ @@ -3124,6
>> +3126,7 @@ static void intel_ddi_buf_disable(struct intel_encoder *encoder,
>>   			     DP_TP_CTL_ENABLE, 0);
>>   	}
>>
>> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);
>>   	intel_ddi_disable_fec(encoder, crtc_state);
>>
>>   	if (DISPLAY_VER(display) < 14)
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
>> b/drivers/gpu/drm/i915/display/intel_dip.c
>> index 0c80d6305fec..007c8fb87ecd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dip.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
>> @@ -10,6 +10,7 @@
>>   #include "intel_dip.h"
>>   #include "intel_dip_regs.h"
>>   #include "intel_display_types.h"
>> +#include "intel_hdmi.h"
>>
>>   static int intel_dip_get_as_sdp_transmission_line(const struct intel_crtc_state
>> *crtc_state)  { @@ -54,14 +55,103 @@ void
>> intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
>>   		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
>>   }
>>
>> +static int intel_dip_sdp_stagger_to_tl(struct intel_crtc_state *crtc_state,
>> +				       int stagger)
>> +{
>> +	return crtc_state->dip.cmn_sdp_tl + stagger; }
>> +
>> +static
>> +void intel_dip_cmn_sdp_tl_compute_config_late(struct intel_crtc_state
>> +*crtc_state) {
>> +	struct intel_display *display = to_intel_display(crtc_state);
>> +	bool as_sdp;
>> +
>> +	if (!HAS_COMMON_SDP_TL(display))
>> +		return;
>> +
>> +	as_sdp = crtc_state->infoframes.enable &
> Since as_sdp is bool does this need to be "&&"

Sorry missed this earlier.

infoframe.enable is a bitmask of enabled-infoframes, so we are checking 
if the bitmask for AS SDP is set or not.

as_sdp being bool, the expression will automatically get converted to 
true/false, so we are good here.


Regards,

Ankit



>
>> +		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
>> +	/*
>> +	 * When AS SDP is enabled :
>> +	 *  - The common SDP Transmission Line matches the EMP SDP
>> Transmission Line.
>> +	 *
>> +	 * When AS SDP is disabled:
>> +	 *  - Bspec mentions the positions as lines of delayed vblank.
>> +	 *  - Guardband = 1st line of delayed vblank
>> +	 *  - Common SDP Transmission line is set to 2nd line of delayed vblank.
>> +	 */
>> +
>> +	if (as_sdp)
>> +		crtc_state->dip.cmn_sdp_tl = crtc_state->dip.emp_as_sdp_tl;
>> +	else
>> +		crtc_state->dip.cmn_sdp_tl = crtc_state->vrr.guardband - 1;
>> +
> According to Bspec 74384
> The transmission line for each SDP type must not be within the V. Active region and should be positioned at least one line into the V. Blank (see "Transcoder VRR Function" for definition of Vmin)
> (V. Active + 1) <= (Vmin - SDP TL)
>
> When Panel Replay and AS SDPs are enabled, the eDP/DP standard requires the VSC SDP indicating PR Active to be sent out before the AS SDP. Therefore, the following programming restriction is required for this configuration:
> CMN_SDP_TL >= EMP_AS_SDP_TL
>
> If PSR1 is going to be used with the Sink, then Software must position CMN_SDP_TL on the second line of the VRR Guardband (i.e. CMN_SDP_TL = (VRR Guardband-1))
>
> Don't we need to check these restrictions
>
> Also according to Bspec " crtc_state->dip.cmn_sdp_tl = crtc_state->vrr.guardband - 1 " only when using PSR1
>
> Regards,
> Suraj Kandpal
>
>> +	/*
>> +	 * Currently we are programming the default stagger values, but these
>> +	 * can be optimized if required, based on number of SDPs enabled.
>> +	 *
>> +	 * Default values of the Transmission lines for SDPs other than AS SDP:
>> +	 * VSC : CMN SDP Transmission line
>> +	 * GMP : CMN SDP Transmission line
>> +	 * PPS : CMN SDP Transmission line + 1
>> +	 * VSC_EXT: CMN SDP Transmission line + 2
>> +	 */
>> +	crtc_state->dip.vsc_sdp_tl = crtc_state->dip.cmn_sdp_tl;
>> +	crtc_state->dip.gmp_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state,
>> GMP_STAGGER_DEFAULT);
>> +	crtc_state->dip.pps_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state,
>> PPS_STAGGER_DEFAULT);
>> +	crtc_state->dip.vsc_ext_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state,
>> VSC_EXT_STAGGER_DEFAULT); }
>> +
>>   void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
>> {
>>   	crtc_state->dip.emp_as_sdp_tl =
>> intel_dip_get_as_sdp_transmission_line(crtc_state);
>> +
>> +	intel_dip_cmn_sdp_tl_compute_config_late(crtc_state);
>> +}
>> +
>> +static
>> +void intel_dip_cmn_sdp_transmission_line_get_config(struct
>> +intel_crtc_state *crtc_state) {
>> +	struct intel_display *display = to_intel_display(crtc_state);
>> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>> +	u16 vsc_ext_stagger, pps_stagger, gmp_stagger;
>> +	u32 val;
>> +
>> +	if (!HAS_COMMON_SDP_TL(display))
>> +		return;
>> +
>> +	val = intel_de_read(display, CMN_SDP_TL(display, cpu_transcoder));
>> +
>> +	if (!(val & TRANSMISSION_LINE_ENABLE))
>> +		return;
>> +
>> +	crtc_state->dip.cmn_sdp_tl =
>> +REG_FIELD_GET(BASE_TRANSMISSION_LINE_MASK, val);
>> +
>> +	/* SDP VSC uses same transmission line as CMN base transmission line
>> */
>> +	crtc_state->dip.vsc_sdp_tl = crtc_state->dip.cmn_sdp_tl;
>> +
>> +	val = intel_de_read(display, CMN_SDP_TL_STGR_CTL(display,
>> +cpu_transcoder));
>> +
>> +	vsc_ext_stagger = REG_FIELD_GET(VSC_EXT_STAGGER_MASK, val);
>> +	pps_stagger = REG_FIELD_GET(PPS_STAGGER_MASK, val);
>> +	gmp_stagger = REG_FIELD_GET(GMP_STAGGER_MASK, val);
>> +
>> +	crtc_state->dip.vsc_ext_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state, vsc_ext_stagger);
>> +	crtc_state->dip.pps_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state, pps_stagger);
>> +	crtc_state->dip.gmp_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state, gmp_stagger);
>>   }
>>
>>   void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state
>> *crtc_state)  {
>>   	crtc_state->dip.emp_as_sdp_tl =
>> intel_dip_read_emp_as_sdp_tl(crtc_state);
>> +	intel_dip_cmn_sdp_transmission_line_get_config(crtc_state);
>>   }
>>
>>   static int intel_dip_sdp_tl_to_stagger(const struct intel_crtc_state *crtc_state,
>> --
>> 2.50.1
