Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E98DD26D77
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 17:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD9710E78E;
	Fri,  9 Jan 2026 17:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rsdkyo8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9385510E78E
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767978278; x=1799514278;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=826gM1VfqmoMNAMiuPU56XTwrkpdBxt8YAda9njd+cU=;
 b=Rsdkyo8bH1ZnYLkbK+5DooBoTWnMsWRZqTceiFpNg9S4bnteaXUk7z/P
 YgfPFQKYesoyus1SaLjJZCBNGBx+RL3bhq8IFvy1jT6BS/eyrjlbWSWuH
 PSHNp8Al1It3dk0s93W6XoTLrG/8aU273E8XUwChdrFuySg+pp+AzQU41
 UQQEEfy9VVIxD070fuBnKlir4QGnXWZDxSBB3kOtJWr2kD35fzUNcfgXJ
 GmW/BdCMFe3lrcLJvhYhjEUJbcPwtB4v6bgR8kYxyK0HvIAiTabT0LExp
 FdVB/pDIS1FIOctf1x6oaswXjovkKHAU+0rDvXdFEbjMUkxzBSvY1FcJM Q==;
X-CSE-ConnectionGUID: M/b623RqSlGjYLobTmhX/A==
X-CSE-MsgGUID: j0rwYqjvTY66fgQ9AG0Ejw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73219112"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="73219112"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 09:04:38 -0800
X-CSE-ConnectionGUID: NLLGh0HwRrCbO12vdfw7hg==
X-CSE-MsgGUID: ZDbmROgcT3uEAgmAkz6f5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="202720919"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 09:04:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 09:04:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 09:04:37 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 09:04:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdWcOMsCGk6LW8dpquJ0qidZrUvzTVr9TP1XeyPxXbPyNMOkTAKNzdige6F/re6RncUNhhCGgCDxp6YtEagGdfKVln+5P457X+6DdZvi8EzgEe+jxZoJaBECZ8xQ9L3jhEGBdrWGyNZ2UWdXTvOLhX3Tn4PAPVKouQ3OC7bKL/T6KP2x3XeQJjzUB62Vtv1NpVSWs7SktTNvSRAImplicMqlEuHaHOXfIOgp+/Wow4p96aFvi7lXtowgEY3/PlrybifVJveZGYV+4fheTap/W2a2y8lW97v8pTYOLcIWUB4mOAFSyQECrugL3xSPFqJcIfp8c+EjuO6vSVhlpHCZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41413tpKoj5dGMydXfhRJK1Z/07E0o8GzX9APE95GvU=;
 b=EeChbPau/c1CMf37QnZyspIiolpt69qg1ycUbS8BgZ9wmF/ZUPbJb1g8GjcJCVi3dFisgAFk5durwpuA/f9NjpWuPyl2+39dQEew3snEk+qoOA3VzI3An9fUidkAqizwtbrknES9wNgsP5P0Ssh6pEbfYrgGX0qlAnXUxR0ggvHeCpiV169NvsWuYW4wYJXVzp9CQ6r/fNWM68vUoFzrnRicM32lo0kH+nbukzwKuVr00cCCwjbtCYz4DE1npqqVg1Fs3+EFZ3oCgydZGfxBeWmbBNYexyXzAEIvLMuaO2JJU+08+98eS6QvfV/eYg+MLqDD5qzCVH59+LG6W7MZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SN7PR11MB6656.namprd11.prod.outlook.com (2603:10b6:806:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 17:04:35 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 17:04:35 +0000
Message-ID: <56c6f0f3-1777-40af-a2da-431805b2c634@intel.com>
Date: Fri, 9 Jan 2026 18:04:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/mert: Always refer to MERT using xe_device
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
 <20260109151219.26206-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260109151219.26206-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SN7PR11MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 865ed440-1bff-4c3b-552d-08de4fa12a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmhpcXg0cndpTG96dldLTGtrbXFZU2FKUzE2R3lNSWh3K0xnaU52dnliVFBJ?=
 =?utf-8?B?b1RDbkhZSmJ4UzBvYXp1S1I5aCtRWDI5UkFqNko4dG9CUEw5Q0hWT1B1aE9J?=
 =?utf-8?B?amJkenZaQmVkeEFaRFFrWUFzcFpYRHJFN05sTzlHb0xUYWhCSGFGaDh2TXF6?=
 =?utf-8?B?V2FwbFNhQ3M2T2tXQzZFRU5kYkZBdEJOWFRhOHB2ZlhLMGdVZW1oTnlUUFB3?=
 =?utf-8?B?SmpSRk1ZcnQ1eTJUZVRBd0EvZG56S2Q5R0pJQkF3YjBWeUpQT2N4eXdCUFYr?=
 =?utf-8?B?N05lS251dHAwcW5xRFJBbHJCYTFqR1FlLzIyc0h1UWI1OTdETmpOeDcydDd0?=
 =?utf-8?B?aWFRR0h0YlJUeFllTGl2ejZZaGRYa2luRDg2bnhEdzk4a3UvdExjZ0V6K2tD?=
 =?utf-8?B?VXdnOHBOMXhOK0Q0a1ZYWXczU0dBODc4MHNvdDdyT2RhdWN3SDlYV28yL0NN?=
 =?utf-8?B?cy95WXdHM1U0VUExRnE0cWw0YjZ5VVZlUy9aQ3MxQjQ1enVTZTNDK0JjV3cw?=
 =?utf-8?B?UFJuT292N05mRlhxT0lXQ1VjOFhLYThGNFdkbmp0aGlJdHExOUhWWlhYSEtX?=
 =?utf-8?B?bkU5eVJLWHlBZDZKVm5HelNZbU90bWI0QU41dmFkemdIeW4zbE5uZS8yK2Q3?=
 =?utf-8?B?QVJVS3A0ZG8yQlphYk9ZNkRzV3NhNENLUEVsYnQ5V2s4U09PUjVPN2JkOEoy?=
 =?utf-8?B?UmtwNC85Y1hVN2xUWHRkY3UyeDFZU0lrZllwVUtpWWNpcno1c1FrTGxwZUUw?=
 =?utf-8?B?dWk5VG9BUUtDazdNTEwvNktCZDRTMDhXUWs3ZjlLWG1xeWt1VVJERFNLaXJw?=
 =?utf-8?B?aWFtYWs0QXlISGVvSDE2dXlucTVXL1BTVXlQaUsybW8rcnNtWWp3ZXdNYmNV?=
 =?utf-8?B?Mmp6TlJ2ZGhodEk3dE84V1M2RkRqeDQzWTkyY2Q5RDg2ZGswbkFBaUhFams3?=
 =?utf-8?B?VDVYR3ArclYyKzFXRyt0YzJxc1A5S3pmTG9WVjMyZjEzVm1VMGI2elNic2NM?=
 =?utf-8?B?WkRmTlVUNS9vemRDMUVIZTVJWFlpVThsQmZZRUhpOVdnMnlMQmNmM2Y0YTlL?=
 =?utf-8?B?MjdURm1BWjdzU0tBK1JuOWM1L2I3MHRmSFQ4M0pBdWpZU0RsakdpY2hCVjdx?=
 =?utf-8?B?TE52L2w3SFpBdU04R2o4YVU2bzN0eUNIbmxqaW8vUEE2T2J3WWtoQTFqYitH?=
 =?utf-8?B?dDI2MkZWRFZHZzBPMXFVWjNiMDVvelcvMjdZeklMeFRmNmtwQ0dGa2pDa1N0?=
 =?utf-8?B?Z05yUFZ2RDJ2VFdFZm9EeDF6NmduZVE5WEJMa0hDcmNvc3Y3SElVamVuTVFD?=
 =?utf-8?B?VDJjUUFqcG9jd2M3aUhTNHh3TmExWmZESTNmVHNiQmh0clBHR3lxVmFleTB0?=
 =?utf-8?B?Zys1a1g2ZCtyanZ0VHRBUlhja2g3bitXcWlnQ0wwRlp4TER5Q0NiSHVlcTk4?=
 =?utf-8?B?Vkp6US9jUkNIbVgyL2U0VlRVT2dNUjErMSs4Vmh6UnZjYnFzMmIzaWpDQkxG?=
 =?utf-8?B?bll4UjcyTU9ZWHlkZ1UwVjBvYlhIMHI2K2szbit2TzN6aWczWHJZcFJuQzNJ?=
 =?utf-8?B?N08zUlVtSU9peUpsT1Q2WlFzUDBNTFlRS2JSaWRnYjFmTHBkSmY1UGc0N3lm?=
 =?utf-8?B?SkE1U1pMOXBXS0NkdC9vY0ZCTDZoMm9seXV5WmpOcDhYRUdqbDVHYVRvbGdM?=
 =?utf-8?B?SVlNR1pUaGJjR1Fad1hXMWpSOURrWWxYWWhmRlJKbzJ3YVYyMDFUR3lodU4r?=
 =?utf-8?B?OSszbjllcTFCN0k3OHA1MmtzT09pbktjTTc0MFBGWFBZQ2hsV2xaZ0UzdG90?=
 =?utf-8?B?eTJIMWk2ZHFweDhhOXErQm1MMGl2U2sxUWx4aEFlU3FISmtaQzdDS0NGZ0JN?=
 =?utf-8?B?Nzh6V0lhY08xTExVMkVwV2RRU0l5YVZHbjlhbjVFc25GOUZEZEJxZVBDN2lV?=
 =?utf-8?Q?KMucWKzfvHxyFBtWuwiydOYoCpEKfwU9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTFRcFQyZGw0bWdlbkJnREJWRmFFcitWRThKd2RLU0x4S3N0aVJybVlrWk4x?=
 =?utf-8?B?NG8wNHl6QkhBZDJjMVBTelNoaUNjUUhOWmZacGRIY0N5TWVwM3piT2s3ZGdL?=
 =?utf-8?B?WTZhYk9NOXNDMzI5c1NpbmYrbkRCaEZRVEIwS3BoZFJoeTlJYWhaRjkvNTVz?=
 =?utf-8?B?R1E3dUhqRFBvMnBIQ3oxM0UrSGhsSVZBT2NNMEZUbHY0ZVVuOHVvd2dvYjVV?=
 =?utf-8?B?bFNyTE91bTRhOFF3RUZ1alcvSGJlVldCY21TbkJMOXFIa0dqU0xud0R4NU9o?=
 =?utf-8?B?MUpHZHJvME5IREwyU0FiR2V1R2ozTnYrY3RpektjQ0R0TWhDUWovVnIydFdj?=
 =?utf-8?B?TjJvTm9qMC82blU3ekxDU0FpSGpvTUphcVA0THFvMlZZbTkxWlpTRzAwcDVJ?=
 =?utf-8?B?R1JKRnpBdktZVHM3aGgxKzluRmN5djlRdjQ4T0d0Q085ZERDTlBiK2kvb2F3?=
 =?utf-8?B?RXBYMkZ0REl2bnBQK29BY1U0Yy9GdnJoRkFzeGdSRGJQZzhQR1hqelBlYUhr?=
 =?utf-8?B?UHZ0LzVDd2I0MUNKbUY0amQrV2NVUC9iNE40OUo4TWtndUVKazZUZVRGMnJp?=
 =?utf-8?B?SDExYzdZWlNoQytFR3RTYTN3ODV6SzI3UU1GVmVtdWcremdML1RXeGZNQ2xN?=
 =?utf-8?B?bExYa2NGcHd0dlFRbFFHRXJkWVZrS2NyQnV6VUdaYkdFYUlIbkJCcGgrZk02?=
 =?utf-8?B?eWxNeVZJcnU3NEZwZ1JTOS9MSmQvR3lrL2VmeW5OVzBBdDBUMXIweXY1TEs0?=
 =?utf-8?B?cW1PcHJ5eWtQY2s2ajM5SnQyZUdweVlBRHljZTQ0K280YnhVU21OTXd0aHd6?=
 =?utf-8?B?WHo5YlpXQnE5emdRdG1pNUZUN1grc0JuM05HQnZGblVTMWljQjJZcHgvUXZK?=
 =?utf-8?B?TXNaS2drSEQxVjdMakEwblpnVkt0YjlIVm1VMk15MmdmVXVkajN6dlBXbGZj?=
 =?utf-8?B?dFZ6cDJhYW5oT1JFaWxQTVJaVC8zY0FyNDVFV2tETkhrbUJjcXlRS0lmWmRn?=
 =?utf-8?B?dlMzZGlRek85bGcxWkRCS05POHMzbkFKU0phM1RXRlRtTk84ZG05OU9uZjBC?=
 =?utf-8?B?UVMrbGxES0dMTmdEQm1XbVkvaFhGSlJDUHdlMlRPK0ZXVVBRWnRtUTVwcEx4?=
 =?utf-8?B?UlRoWUdCbHVNSGdHTm1pRnpuTkd1dHhqZHlueFFZeWdRN09zYjZTSFJBT25H?=
 =?utf-8?B?dW1oNTZBeGw2UTNaUVZhSTdjU1QxM2lhM2V0cnNSdHRqVjg0UmZyMkhHaGp4?=
 =?utf-8?B?b0lIWHl6NnQ5YjJTM2JRWEk1dUZkakF0YisvYzZWR3lmeEVUVUlVM1gwakp6?=
 =?utf-8?B?ajBZdmZaaUhudCtwTXBWa3hzN2wvVGdDeWhSLy95RTJMWnNoTnZUWTBFWUl2?=
 =?utf-8?B?RnNhYWVReXdiMmNwM2t3RXVURkx5cyt5cEJ1bzl3UVRXc0ljM1IxT2JYZ2ZC?=
 =?utf-8?B?aUxoaGlCclVZMVRqNU13ZEtCaEo4a0Vnb0FJVHR6ZkpodmUyUklGMzIvdjhS?=
 =?utf-8?B?Rjh1NkFtMFN4dmM3NTU5S0Z4a0U2ZUZSSFd1amR2RGI3THpzUWZwUC80c3JP?=
 =?utf-8?B?Z3NPa0hUQVhOQU9SWXBoUXM0Z1kwcmVxSG5renhaenJ1cGUxZXNLRkRZR05R?=
 =?utf-8?B?NFFKOXpGM3dYQm84bVNVRlpuaDh6bEFTcEk4RUt1Nm1COVB5ZUtNeGo4T1Rt?=
 =?utf-8?B?NGhlcjZoTnlhd1pHZ3NaUDR0MGZqL3lySXRiVDN5aEo0cUxEVUNjSkhUM0s5?=
 =?utf-8?B?b1Y5Z2RGeGpzMXFHdFo2NzR4aGZzcVdVNjV4RzFGNkExZzVJUGd0SDdvYmRY?=
 =?utf-8?B?MzJDM2pKTGQrZWN6Z0ZHcG1RVXNod256M0ZNanlDeWNBMlkwZnJGRTg3UGVS?=
 =?utf-8?B?bHhsdTVldksvOVhwaXJLNzdKQUVDT3BVSWoxcXU1dXE5alBFdUE4VWxweW4z?=
 =?utf-8?B?RUNXd3VCZDZJLzQrS2xlOVc5ZklpbDhSdW5oeE50Snl6WmE4OWRTQStHd2JQ?=
 =?utf-8?B?NHU1MXUrNlZuUit5bDY4WjZkbGFmZTlyaXBvZ1ZKOU1IK1RRb2F1OGpKSWIx?=
 =?utf-8?B?OFBzOVFMdGVRNjVGOE1YaEtPY0tVVFNmM0ZZVjkxRXpsQ0JMd0Y2aUNTbVhr?=
 =?utf-8?B?cHlBNzlrNldwcURtS0p1YUU0MCtnTnlLSUNlRkxQQS9JY1h1N2pMUmRVTjkw?=
 =?utf-8?B?U3BWVGN2TjBvYkI2Uy9nZmNIejJUM2lsUUhmclFZMzF2VENUa204U05YdmJQ?=
 =?utf-8?B?VDJyMzU5dXcxL3VTL1grTDVUY1Yza3pHSzF2TVlvSHVOL1g0b1krUEVrYTFP?=
 =?utf-8?B?ZnR0K1dUekl4citmNDhZU0FqRno2NFN0QlFsQjF5T2ljRXNVNjM3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 865ed440-1bff-4c3b-552d-08de4fa12a18
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:04:35.1396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6K7eQUkpJdHIkpMMaR9xLVi/vT5i1EPVCWC4mfdY7/drWSqZ2LbWg23fMqqm3cghB4e4DIjydtss39f6jWi1fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6656
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


On 1/9/2026 16:12, Michal Wajdeczko wrote:
> There is only one MERT instance and while it is located on the root
> tile, it is safer to refer to it using xe_device rather than xe_tile.
> This will also allow to align signature with other MERT function.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
>   drivers/gpu/drm/xe/xe_mert.c | 8 ++++----
>   drivers/gpu/drm/xe/xe_mert.h | 3 +--
>   3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 3059ea6525bc..2077e1ef8b43 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -289,7 +289,7 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>   				  ERR_PTR(err));
>   
>   	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
> -		err = xe_mert_invalidate_lmtt(tile);
> +		err = xe_mert_invalidate_lmtt(xe);
>   		if (err)
>   			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
>   					  ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index f7689e922953..5aea6f082bc0 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -12,16 +12,16 @@
>   #include "xe_tile.h"
>   
>   /**
> - * xe_mert_invalidate_lmtt - Invalidate MERT LMTT
> - * @tile: the &xe_tile
> + * xe_mert_invalidate_lmtt() - Invalidate MERT LMTT
> + * @xe: the &xe_device with MERT
>    *
>    * Trigger invalidation of the MERT LMTT and wait for completion.
>    *
>    * Return: 0 on success or -ETIMEDOUT in case of a timeout.
>    */
> -int xe_mert_invalidate_lmtt(struct xe_tile *tile)
> +int xe_mert_invalidate_lmtt(struct xe_device *xe)
>   {
> -	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);

As tile is always the root tile now, the xe_tile_is_root() assertion 
doesn't seem to be needed anymore.
But you can remove it before merge:

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

>   	struct xe_mert *mert = &tile->mert;
>   	const long timeout = HZ / 4;
>   	unsigned long flags;
> diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
> index 0e27f9fa24bb..44daeca094bd 100644
> --- a/drivers/gpu/drm/xe/xe_mert.h
> +++ b/drivers/gpu/drm/xe/xe_mert.h
> @@ -11,7 +11,6 @@
>   #include <linux/types.h>
>   
>   struct xe_device;
> -struct xe_tile;
>   
>   /**
>    * struct xe_mert - MERT related data
> @@ -26,7 +25,7 @@ struct xe_mert {
>   };
>   
>   #ifdef CONFIG_PCI_IOV
> -int xe_mert_invalidate_lmtt(struct xe_tile *tile);
> +int xe_mert_invalidate_lmtt(struct xe_device *xe);
>   void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
>   #else
>   static inline void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl) { }
