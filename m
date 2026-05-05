Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA88FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209B110E021;
	Tue,  5 May 2026 05:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhVxycXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18B10E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777958255; x=1809494255;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9cliIY6lUwfD3fbbeFh/TEeSYShjjsnMB43KRlgyjrI=;
 b=mhVxycXCoI61VSWE9HiU2xdHyVNk4OE01bUHf/5mXEN+y9LSQERge4yP
 pBLa8mIo4wXI9fYOyf05XdJEp5lWc5wLNMFcbXRllPJ1ubjbaQXfRIm+T
 Nr0+uyiBolezMitRSrBpRY+8AS1ZhaEUeqyATFMKTyjf5j1FUH+sfFV/l
 wquhqaqYNUGR1X1YswFsL6GuluH9oMH3FBf0s7ycs1EsGhKy8WhxQNw5P
 xyHSIXvpud5nv3DGyvhcdtfdm5xD3qy0/XE9AzyIvr4Dzziw7aawYJN6n
 aNuZxfRwC84ntYZ8zUzlXBAuvn3Aa2n+PbfdiLAtyMz7cnGql9zlaL+sM Q==;
X-CSE-ConnectionGUID: oIfFGKcBTMWx07ioHHSJiw==
X-CSE-MsgGUID: 9uYc0De9RJispg6dhGe7gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89409574"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89409574"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:17:34 -0700
X-CSE-ConnectionGUID: c3Zwb1LfTwisUZC6FnkaNg==
X-CSE-MsgGUID: SaG4EqTwT4ObPA9Wq4TnFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="231339532"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:17:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:17:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 22:17:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:17:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxV+k9tSYMBLJOYqs8C/4Wi3Qk65mqsnNvc74eEmvoFvSH1Lj0Ge+Teai3qY8WCPXJvsY3PEsZzUvZyFa+2Ef4J7QtRSVZ/j1cJKZpY0688Yg7ZChvpZpBP2Sp3DKTj+U7xgFGqpvETbkwPEpApU7/YdshEdY579QCssc7VHBPMw5SdF2iOnS9zDekuuxtNkQ/Ic9JhuvYP096Ju3zopIro/aGvYoYYjEScxcLe0Bf3/XH/2kDvhSz4bwDQIo0U9ic9JBuO2Ggjul31nXWf198Tcd/T2sqGnEr5Bzi3lgAmrkbvM1FlpaasOHJ9GpMiJpdwmjN8RAgMox/BspM1HZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXYN2aCfRdEg/HklmvWHhww4ReHA0F1bsS2avVBp4ew=;
 b=LrXQkNocv8CSlUIP1qPutjfnFSbOJyQGbX2vWFk2hi9l3AaFppi25JL+sXXwhAFD1iOJdtBswKeM+yI9SK+WABA9gk786zBO89qz2zdaNIbBOzGc/3gBlPHv/1qY6iM2bTylNoX/ADu6apG/rSKKzghCLE51fllmH3JiN1DIiTAfkiz7FtwwfqikEd7ITFPWENNfV82APfN3uEofT6mmKHyl7XCoI2hQfMnZvle4FftYOrrh5trO0RakOU7oVJJNR36PktJi3QpG76mKcA3cDkKM35CiUX8jz4PwQDfUML2ZaX2EaMoGd3GjlV0Op7lGLXbtw72fYaRnOvD8z1qVDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:17:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:17:24 +0000
Message-ID: <dea087ac-68fd-42dd-ba9b-abfed59321fb@intel.com>
Date: Tue, 5 May 2026 10:47:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline list
 and queue commands
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-26-riana.tauro@intel.com>
 <DM6PR11MB32277AE94FAD89591953174B812C2@DM6PR11MB3227.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DM6PR11MB32277AE94FAD89591953174B812C2@DM6PR11MB3227.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: 81724bee-8026-4a75-76bc-08deaa6597a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ERGxukNpQykeYM2BKRBh0ZsQt4C/G4CGMse5WxSbRTgDgDO5/FoC6Xg5+GJRehNkVJsAqWpmRXpYsvz3wD4R+AagFC0b8fWKt0Jh6q+V/vRHTguON8RRnIoWom5yYja7Ffwf1LL5KSFVTczYNbszQG7QQ/UADhwqCitxFGmr34vSGJIMvLPKpYMw30QU0euTwU8rSdGl6sWu6huQ0HG5PSkDiEuT6KmmZ5c2QMYmmIla0Xk/eG9QwWtXjEUX/Wx/1lM7yUH4SeUNTBYYzgrk36Il7QxATmx3Oynw2LV40M3ppqbkx8jeJrr2rDngeq1A7UdO87Yyen43YaqeXts+GZjEdET6ICFtAxWKgw2v+b3wIexq4o9dqLrFJLGtGvZJTzUtNIZ/8ADxSav5uR2cKg8PRb5HSAC3d6fZc7vz1NrUS4HNnHrI/gERPcF4IHRYoKia8qC0jVLPdYo3XTCnjNleUd9ye86DCD6EpjJWHPhaoDnu6y0NPTj/5aMxthD/G9fLfvY9dz5wXhbjz0gsFjm22FnIxSXbIuJy7qxwQ+xVNSMpaaEQ6NPq5uVoKebGbS3u3BlFWxXjtTUMIDw8F7fcdx9/cn9WTOvubV1Lx17luzxbnucMugYBbvW/kB1XLmbwdLFqPvLg8wxxAQ0g8tB3w/ygiDyOtsSRAkTJi1GKcnlRhX6+vO8p8YlM4iSH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXNnTnlrZFBVdEZaMmVDdDIwTGd2TWM3REozWUJhdFRYY3pRbGxlbVlwN3hF?=
 =?utf-8?B?bkM4RldRWitFNFoweFRBenNBZGFXNDY2aDVQV2FNekI2T1lHUm1QYjBJNnpC?=
 =?utf-8?B?UlZydXJrQ2xPSnhhaGZmRlhqTWFRbU9HNzh5YU1TSmlDS3ZWcTJNTEVtakZF?=
 =?utf-8?B?Y3krTjFMNkFjbDRyUjFOdWNKQncyOTdUK1o3RDVwSmsrTTk2WEdIeFhDMlBR?=
 =?utf-8?B?T3BsRUZnZjBEY1owKzZzaTdUYi9SZzJaUzNIRWR6Tkx4SEYyWC9pd3V1ckFl?=
 =?utf-8?B?Qzc0cS9MK0NPSFlEOStrZzg4cTNNQVlKVHpKa3krQ3B2NXZqMWdaQTI5eHlF?=
 =?utf-8?B?cFBMSS90S25jbloxazVMZGlaakQvZGsvZTBJUnNuVGRGUzVPRnR2WjFsM1JJ?=
 =?utf-8?B?L2FYYWlwa2t2K3N6Ym1MVnlyNGtINGc1a2N6T0E3cXhKT0RNWWdyUXJLc3FQ?=
 =?utf-8?B?ZnZzSXFCTm5MazdpbURYdXJWWEFrOXRkZUFCUnllNUlib3JqMWx0ZDdSN0dq?=
 =?utf-8?B?SHJQbGE0bDRlNWRZY2xTN2hrZGZSMnJSWDNtUHByV0t0WGlqVGFleHNWdGY5?=
 =?utf-8?B?YUdzd1RGaTdXdlVKbFI2SjBhSWNQSEVGa04yYlNHUk9Db0pyaDh4ZFI2ZkpY?=
 =?utf-8?B?U3BoaXdCVGUwWHhwSjNmTzlWTk9ENVBmd3YweGVOeHZOZ1RWcGREbGZWZGlr?=
 =?utf-8?B?ZjljWE1peFNySDhZMlVJZFZmNE1HT0gyVHgvbUJHN0dtOFQ1VE9aQVZxZzFt?=
 =?utf-8?B?UW14WkhMd2VibnpmTGpSbnFDRlE5NGtRZnE2bC82eEtZWUJlMDRwUEpTUmVD?=
 =?utf-8?B?VEVDMTlZRSs0MEIwbFVKU0h4VVZRbmFVV3BsMHp5NEpDYjhKTitDa3VOcTFj?=
 =?utf-8?B?NnBGcjNkQzc0NENLY2krY3hja0ViaHUvOHhTNG9kLzdoelQ2QWxPcFlpZUho?=
 =?utf-8?B?UjlISUxIWXZEc2xCaUYwN3RCbnRIQjRWYUJpblVUanZNM1hJWmpCbGRhdUZ2?=
 =?utf-8?B?M0w2RjZkR3NqWnNsWXVoVDBPOW43VkVPd2x4dEczNFV0YjFhRGVuYWNOWkt4?=
 =?utf-8?B?Tmd1bW9zODdldTJwTThHa29TWmM3M2NoSzlTQk53QksxZjJISVB6MjUvL2Q1?=
 =?utf-8?B?NWYxWW9jN2M5bmhkdWZTQXBiS2hRL0VIUU5LRXJSS1N3MUxCV2l0MlJzNEtu?=
 =?utf-8?B?dVhNSkZzZDdRMk50cHc1akRiOTgweXBDWEEvMHU5YzBwN2tnZ0VDVnZieG80?=
 =?utf-8?B?YUJNRHdtcytiVUNrcUR6WTl5Q1NjN2dKWlFUREhXeHRRSFJRWUs2Vk5oNnRS?=
 =?utf-8?B?N0xPTWNvVlNmOGo0Q2QxS0c3UmN6eldZQW1JRSt4TnR2MWF5SlpxRm9YU2hU?=
 =?utf-8?B?UkNkbkpocVlTbUxVLzN2andRUHpwWlNyU3cycll3SkNPbTlNRy95b1pvanZn?=
 =?utf-8?B?bmEwaDdsTjVqR2xqWEJSbXlzUmw0elNHVm5CTzQyMjJvQTZZOUk0N0lSRHJl?=
 =?utf-8?B?TUxmVVY5amNhcEw5SnRZYmZ1L1RiUnBVNFVrTFZrZlBPa0M5UVJoeTMrazdD?=
 =?utf-8?B?UHg2UFNZZjNEczJIZUNMVUdKbHhmdFkyeklteEgxRjJSeFFVbUo5cWFzZ0VL?=
 =?utf-8?B?L1JmeWI2enhyWFptd3ZmTEtMVkwrYlZRZkZDcWdYd0VyNnlOQ3JXTTdjM0Rx?=
 =?utf-8?B?dXZvMnZ3YWJyQkUrL3E4VnFLeno1MmplZXlBaXMwVDVqTC9nT2VnS3dMb2xu?=
 =?utf-8?B?ZzF3M21BM3FwbEZ6cjc1V1dzTEx6M2llb2RGZlQweDVZS0FOZUY2UVNGZjRH?=
 =?utf-8?B?REI3VFl4ZkZ5T2lyZk16dUlTY0h5ODYrQkZURXFyR0ZSSjJZdXNrQnVSRVBv?=
 =?utf-8?B?VWlFQXlTbVk2dXBiVEJxaldrTVA2ZUJBWE1ZRlhtVldsektTOHlkZjZyeFdq?=
 =?utf-8?B?QVcvTEwvMEwzR1R6bWpvWm04WGhyZjB6dzBSL1FSSTYyNjFBTnZPd1I2RmZt?=
 =?utf-8?B?V3pnVUZBSTdLM1VPcGdlQWsxRmFPWVJ0MmJzZXlzRzY3S1o4SVB2eG4zZTFq?=
 =?utf-8?B?RnN4dWVLZlZDZkFJcThOSzkvRFJrcWltdENyNmVnNUtNU1JrMkt5UUl0dXNH?=
 =?utf-8?B?QldzK0FTUTdOOEJHY1lMZTlDbmx5QzVZaXBoZzdFY1U4SkpucFR2VlloUFhV?=
 =?utf-8?B?eEtSc3JvNWNqaEpCNGtOaW9zcStOdnFIMlROazIvZWQveFpVNmh1ZU1jQWQx?=
 =?utf-8?B?S3BYNGpEZE5DR09Tc3ZkbHcyNi9BRFIyVytDTTlDYUVWZFN0Z0pBbURBQklO?=
 =?utf-8?B?VllnaElGN21aT2pDeWFnUkJzTG9paUdJblVUdEMyV3k1U0c0ZUxjdz09?=
X-Exchange-RoutingPolicyChecked: tyCA4PZaXWB6t5Nm09Dw54lL90GF20gFM9r0IR6tAxAcG995L6hP3xiEUdMvkTEajR7H3C+dFxCLTVbGWJ4XYtJRKweoimRNuU4xyDDHGo7kenns+fBdLQ9I0O07KqfAQlmANKweDSNnQxsvybau5awVPbFqIe0kxYQSGRI/lwkdOgvpQh8S6zsE0lltHRPbL6b36GN62bmbQfPFfcu6r6kHJUzYfgQ8yLpYRsYGuqxmKvOJxBWmFmMJ8aF4NlIGqWB6fIsieUK/+JMltRl+N92VwLiKbkJnM3Kml+ym2SpGLAezMNKhrYIixcu9NGbKlTabNee0BtjjhCLanz/Ymw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81724bee-8026-4a75-76bc-08deaa6597a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:17:24.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OylLrbzrrcgTSIKAwxUVd+09DOoAiCxszStttfXidr6XnJ6upoEwQB7wJ4Kf1eeMk1QdP1HmnshlvaSmRFbAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
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


On 4/21/2026 2:40 PM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 17 April 2026 14:28
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline list
>> and queue commands
>>
>> Add handling for page offline list and queue sysctrl commands. The page
>> offline list command retrieves pages that are already offlined by the firmware.
>> The page offline queue command retrieves the pages pending to be offlined by
>> the firmware.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 39 +++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  6 +-
>>   3 files changed, 129 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> cd1ac6441b92..42ec27c05e9a 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -319,6 +319,87 @@ int xe_ras_page_offline(struct xe_device *xe, enum
>> xe_ras_page_action action, u6
>>   	return 0;
>>   }
>>
>> +static void get_queued_pages(struct xe_device *xe) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_queue response = {0};
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	prepare_sysctrl_command(&command,
>> XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0,
>> +				&response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
>> +			return;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
>> Expected %zu, got %zu\n",
>> +			       sizeof(response), rlen);
>> +			return;
>> +		}
>> +
>> +		/* TODO: Process pages and offline them */
>> +
>> +		count += response.pages_returned;
>> +		if (count > response.total_pages) {
>> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
>> pages %u, returned %u\n",
>> +			       response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>> +static void get_offlined_list(struct xe_device *xe) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_list response = {0};
>> +	int ret, count = 0;
>> +	size_t rlen;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	prepare_sysctrl_command(&command,
>> XE_SYSCTRL_CMD_GET_OFFLINE_LIST, NULL, 0,
>> +				&response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
>> +			return;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
>> Expected %zu, got %zu\n",
>> +			       sizeof(response), rlen);
>> +			return;
>> +		}
>> +
>> +		/* TODO: Process pages and offline them */
>> +
>> +		count += response.pages_returned;
>> +		if (count > response.total_pages) {
>> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
>> pages %u, returned %u\n",
>> +			       response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>> { @@ -394,4 +475,8 @@ void xe_ras_init(struct xe_device *xe)  #ifdef
>> CONFIG_PCIEAER
>>   	aer_unmask_and_downgrade_internal_error(xe);
>>   #endif
>> +
>> +	/* Get any pages that need to be offlined from firmware and reserve
>> them */
>> +	get_offlined_list(xe);
>> +	get_queued_pages(xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index d76310866da5..1a5de6cd16a1 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,7 @@
>>
>>   #define XE_RAS_NUM_ERROR_ARR		3
>>   #define XE_RAS_MAX_ERROR_DETAILS	16
>> +#define XE_RAS_NUM_PAGES		25
>>   #define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
>>
>>   /**
>> @@ -297,4 +298,42 @@ struct xe_ras_page_offline_response {
>>   	/** @reserved: Reserved for future use */
>>   	u32 reserved;
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_list - Response from get offline list
>> +command
>> + *
>> + * This structure provides the details of offlined pages from flash.
>> + */
>> +struct xe_ras_page_offline_list {
>> +	/** @max_entries: Total no of pages that can be stored in flash */
>> +	u32 max_entries;
>> +	/** @total_pages: Total number of permanently offlined pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of permanently offlined page addresses
>> (4KB aligned) */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_queue - Response from get offline queue
>> +command
>> + *
>> + * This structure provides the details of queued offlined pages from firmware.
>> + */
>> +struct xe_ras_page_offline_queue {
>> +	/** @total_pages: Total number of queued pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of offlined page addresses (4KB aligned)
> I understand that we will have 4K aligned addresses reported to core offline API right? If yes can you also add double check before passing if its really 4K aligned?

Yes will add this in the integration patch

Thanks
Riana

>
> Tejas
>> */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 2cafa8a14cc3..b6139ac0eaca 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -15,10 +15,14 @@
>>    *
>>    * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
>>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
>> page
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Get list of all offlined pages
>> + from flash
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Get list of offlined queued
>> pages
>> + from firmware
>>    */
>>   enum xe_sysctrl_mailbox_command_id {
>>   	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>> -	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A
>>   };
>>
>>   enum xe_sysctrl_group {
>> --
>> 2.47.1
