Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248FACFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 13:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA73F10E096;
	Fri, 28 Nov 2025 13:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQ2/8dm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9C310E096
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764336086; x=1795872086;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=F9s+J2tjkhIlSwPSn6jnMFqHCFSjewUpFNbody+A28g=;
 b=iQ2/8dm6oZT65QkyoCnAc8gn3Jv6Phx6GBYwPzb3b+PocGUS5iIm18kU
 cjQRNxQQYlkoLcuEQHT5sZbxhJR9PzR7JDEFvnd1H278lHf+G+JFy3Jeo
 RypUjDEEanAidYM+xvmjKN+BtHyKfUHiueD1gELdApaQRRA75SBZXI6BQ
 TwtUcaOXKkJVwaYTcQ90H/GwA2nIm5HRpbzopLxpAccRvgpcXFbo5TJSS
 Q9eS/h4Je119hSXEknZLt1l6ruNZuCsFSSpwa/Ae6PiPQpYyWyMWJBirO
 NC7WisyFLmrNW0MeCE+oThRXNRBeDAvSKmkkS9gKzweiENP+D3QVQxNxk g==;
X-CSE-ConnectionGUID: DnrFrOZ+Q8SixIy3IYGu/Q==
X-CSE-MsgGUID: Bdmhr1f+RpOYCFxZU3Q4eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66316276"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66316276"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 05:21:26 -0800
X-CSE-ConnectionGUID: e/MvkXxiTiqrYzkTtBzLMw==
X-CSE-MsgGUID: E+IGoVm4TbuVdfubvo4AOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="224165021"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 05:21:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 05:21:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 05:21:25 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 05:21:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYiQRlu7AByQItOvtLAbbn8OQ0MM94trzxX4ZCgKlNlvjvTQLpbkjmJZkYMtqmYDhLBqCZCkC3N9Q/qwLUL3nG97Vccu8xMhwr4g2pg7FWYM2j60dpp3WvEN9/z728G845Xqm7a/9qwm+mm+bQodFLxxRauHKRn7Fc++tvQdk1H8OJct9xgaorpKH4Z4HkGHdUo6maGriaqg80SKNZDoYbhwm8KgTuQ6hKoyA7GwixfgmOB72c7M5nR2Evpkbgu/lmHNOXnsl78NHSqIa/ZtFBIJcSYvFTrQlmQznoXQFd/NUmzoXp561cEwhIHri/oE7NToO/mp/5T/lMLxtXUECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0Mt7J6hZzmrRRoVVr+QqlEWH85pyAJyx5IYhElfm6E=;
 b=TRD4kSt6vrWNvaEWUs0HDrj5KUN20ZcxTfK6G7Q1LDD0/h7vghZ4Jv4hRMxau7omeP8knoFR5oBxtwQJWtQC1bZmKild/s6/P48ruxHWT91Ix/BvTW39ybE2bOvaiwW9rHl7fu3GVm9VP7ZE3c2XOnsLekRkdjir0Mn9LnINjG+OTnRap3UJ4XZnaH3Zh23Q2/LGu4mfX3fdbbyf8pjENGUVPQBZDq3YzTNV9ug8uYBPMfPnncbtkg0G9pPMcHlnG6Gz4EPiiMTO709lH/odz2I7zajqsmvxwgy/K8rQPG3cX4Vx0ECETAOHrRjQ5Yd9ELQlUG77yBix1ta+cNYFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 13:21:23 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 13:21:23 +0000
Message-ID: <92b72df2-8f8b-4af7-9f09-0d7a928d91d4@intel.com>
Date: Fri, 28 Nov 2025 14:21:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [V9 PATCH] drm/xe: Mutual exclusivity between CCS-mode and PF
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251015142820.2519054-2-naresh.kumar.g@intel.com>
 <20251128123843.2763356-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251128123843.2763356-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::46) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: d42bd4b1-5529-491f-a94d-08de2e8106a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUM1MVYyMGpuMjhqblpaQnhvZ0lPWDNVUE90NEx0cm4zZFFvQzF2c29oZVhF?=
 =?utf-8?B?WTd4OWRaa0ZOYmJzb3RJTnBDamI5aWFnclVISlVjNGV2RW9ZQjZaVzF0ZTdq?=
 =?utf-8?B?dGJoZE93K0RYRmozQnE2SHk5UTFmczBFQ2M3VSs5eEFXVWhaanlFbnQvNGZZ?=
 =?utf-8?B?UG9nU3hTL3JvMkQzd09BSTNVYjgzQmgzYUhoeUcyL1lnTzdNUWY4TzZCajF5?=
 =?utf-8?B?cTl4MTlkWSt3Y01ibUEwbVRYanlnd2lLbmZHYThYVndpWVhhaUtQNmxMOWVx?=
 =?utf-8?B?ZTRSM040Zkl3SnY5ckhCc1hMYVdFUGtMSE9HSC9Zckx1SWUwdzdjSmt2M0lP?=
 =?utf-8?B?aHFYVGZ6dUpQcWdnR2Fhbld2eDRDQXJmN0VxUjkvaFlKNTV3UEFZMzhJMHlV?=
 =?utf-8?B?U2pVREhaY0krRmliRDJqM053cmVITFlRQVRPeGNWazFPK0VXOEFqNTByU2Vu?=
 =?utf-8?B?QlN6NVpWOWV2UFV5eG96TUhxT084ZDg1Zi91S2hkQ3lJb1NGMkM3YlVWVHV3?=
 =?utf-8?B?cHJTeXQ2WlhNR3l6YmJhWm5Hdysrb0dEZVAyazlRMmtnUDl2bTZZL1dXanlE?=
 =?utf-8?B?OXhNNjFkMmdjUGZkblJnYmdCcHlLbTBHa3B1NXQwMm9LamNMcWJReXYzKzN2?=
 =?utf-8?B?VWE4UWNkOGdsNnFlUzl0T0hubDF3SkFpZnJvWlBqN2M3Z0dYYjBkSkRqRnVn?=
 =?utf-8?B?MUdickN2emNRMi94Zk8ya2w0bXRuTTN0bGMraHZUMzFEc01iOXkxbWRsSmRw?=
 =?utf-8?B?WTdENUJ2WFFVVjVoVml6ZjV5R1Z6WGVUM2d0TlB3YVNkVE5BMDRNS0Z5NXNE?=
 =?utf-8?B?b0Y0SUNpUFRTV0FOREx6cmFtUmhzM3FQUzh2emxHT1E3U254VGdieFRzTXZL?=
 =?utf-8?B?c25USXJOeWtFSnZxT1V2K2trdko3a1JLV3hWeUdLZ2F0dkp6ZU1Sam43a0dV?=
 =?utf-8?B?ejBtVzRGQkdtQXBxeXpZdUJwNStMN0J6U2ZJRURyaW1QYkxiZkVxYUpFb3Er?=
 =?utf-8?B?ai9Zb01WdmV2M0FtOGZpZFRyRzVOTXJMTUhZd1IxZXl1UTFpRnBSdG1FczE2?=
 =?utf-8?B?anZvbk96emYyaWk3VG9wazBrUUhESlhFN1ZZUi90RUI5ZFNtRW5URmNrSFI5?=
 =?utf-8?B?SURkWjVOVDUyNzRCR3ZyRjBDR2t1cGd1T0hJOE1ZM2VlU0RNL3hZSlNTUnNY?=
 =?utf-8?B?T00zQ3BWZTV5SHl4WmZCUURLb0gvQkdSQW1hVWJZM2JvL0Vzdm95Zkx5ejVQ?=
 =?utf-8?B?R2Y5akxxaDNCOVg3MjRoekplQnN3QS95Z041TEgzVFhSbktYcmYvZzUyL2dn?=
 =?utf-8?B?SkJEWCtmNUtDQmRySFZac2VmSVpJOW9oT3o0S1Z4cXlpVE5weGVoTysxRlNj?=
 =?utf-8?B?WHZPaHdSS0VBNVZWRmd1U2N6eVJGOHZvVlBiaXhOYTRWbDhjQitYcTdUcG9M?=
 =?utf-8?B?K1cyd1dTclVBMEYrdWoxN2hsaTh3aUJxUkQxRnpWWDBWZlJjTXAwb1diMGFG?=
 =?utf-8?B?YUFsUU1qbXVJMUl6UlhaWDJOMFpZb0ZJYzZzc0lYZ0p1Mi9TeXJlTzNzRjVQ?=
 =?utf-8?B?djZxZTdyMStPWkZlSWl2SXJOdk1OT2lKMHVxeWo5QkFhNHkyTndvMitpSC9z?=
 =?utf-8?B?Z2ozOEZHVTJmVmg2OTFhN1ROaFZGdkVpWkdiT1hDM21TNUpKSkw0THQvcGc2?=
 =?utf-8?B?dXBPUWRTY1prQXg3N3ZmZjk4SWU3VVpMRE9YU2tOYmNzeVFQRm1nMEcwOWFF?=
 =?utf-8?B?ZUF1MjhmNDdzZjB6RGROcFpHTlJLMnZxdW5tR01nM211YlZ0WTBGU3JjSHlj?=
 =?utf-8?B?TnZYNVVPWUxqNTFZMC9YM056WlRFMGhObGZkM3ptSUs4SVVXYXZ1TS9oaEdX?=
 =?utf-8?B?TnVJU2JVcUdBZXpKZE9mK0lHTitvK3dqTHhyK3A1WnEwOVcyYk9JaGVySHZh?=
 =?utf-8?Q?GCOpCDLuh0S22HTRw+F8RGKOeqKszc9T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0txUXhET0Z2Zm1qNWFXcWZwdHhsekxOcEZVRVNXYlFuZDBSa0k0bEpEYWFO?=
 =?utf-8?B?TE9qUEttaTN4ajdhRXl3SGMrVWh5S1lNWkZQTWs1aWlhdTN3Y1VnaWF5Snl0?=
 =?utf-8?B?QTJhb1ZaRCtBMElwWXZLRmFqZTg0bmM4UmVFbHFtV2NjMkVlVWVIbUpRNk1M?=
 =?utf-8?B?RVRsaHdaMndFRWlhWVM5QUFFVU5ENE9BVjdteTdiRm5kMy8vcVpySWQrOWtB?=
 =?utf-8?B?UDA4SG4wOGNBWG9GM3N6NWZhZVZDOFpQVjQ0STlpTjFxWkVPaTBQQ3R3YlNZ?=
 =?utf-8?B?Qld0cDhOR1oxakg1RmIxckROL2xHQi9mSS9taVdmRVFGVmFGeHd2OVFCUFFh?=
 =?utf-8?B?WXZEVEE4cEo5OUlPQ0lqRlJkelV1K2hVNlU3RW1idk9XWVdUeWJZbXFNek5Z?=
 =?utf-8?B?akZyWWd6UXUvV1k1OGNxWHM0RSs3TTB4ekVBQnM4ZklVWU81MFRCdE9xUzdn?=
 =?utf-8?B?cFJIQVFYeWN2bUpqc2JwNElqblBoTEl3b1BISVpZTDYxNTBjVDFuV3NoNXJG?=
 =?utf-8?B?cmVxcjFIb1Q2RjFiRWVaemtMbE54bHkrMEcvbmNKQXVGY0lsVFRvV2Y3cWUy?=
 =?utf-8?B?TUhCOTFhSTJzWHN6Z2JlNGFnTmE5WWQ1QTRrRi9adTZqblJWMVgvUlM5Q0Ex?=
 =?utf-8?B?OWl2U0hxUkFwZUYyQ21paTlHSlVXbmlLRnlwOXlUVG94U0E0TkZ4ZVdoelhT?=
 =?utf-8?B?NlVZNzMvNk53K3EwL2hxWTY5em80UzlNdzBMZjhUcUpibDBZempZZk1aRUZE?=
 =?utf-8?B?V2JpYkl4V3Z3KzlidVVaWjBRYVNub2c5T1kvMzN0dHVXNHFsUHJYTTVmVkZE?=
 =?utf-8?B?eHY4aEdPdUdid0FGQjBDdmxqUmhxYmRRM0Y5ZFVoTXRWMWxQTi83M0NVbFNl?=
 =?utf-8?B?UTJMRmdEQjl2cnRDK2xxZVdRVkhpWmtKanZDcXZuOTNISzRTOE9WVDNMWUZP?=
 =?utf-8?B?amJ6eFlXWkNNTDEza21aaFlXNTZKNWxmejFrYkZ6bml6ejh5WExJNVdyV01G?=
 =?utf-8?B?VWxNaitxMDFFRU4yUW40MHJBRGdkeTJBWEVsV20rL0ZTQ2lDM3Z2QzhUTGhr?=
 =?utf-8?B?NlFYaHVxRjRudVdmL29RRUtZYWJ4ZDFpYy9VUzhIQUtqcVEyVTZ1bGNHME9o?=
 =?utf-8?B?UDlSRzNyTTNoRjVScHBJdkNudkxqcVhuckxvSTYwVkMxb0RuRFQvYmRHRGQ5?=
 =?utf-8?B?SVh5QWgxY0ZoWWNwSHVsT1dPMERyNC9RVElqSVlVOGR1ZmJFUU1RRkpRWkZo?=
 =?utf-8?B?ME80YjFSMkJlMVdCajVJNXE1OXpnZEx0cE5wSFNNYWN6dHAzcTFlRldRV0FX?=
 =?utf-8?B?NWxDNHZKWm4xZTZMbmFVVzgyaHNJREppN1lHcEtadHJINXR2WjlsU1FYalhs?=
 =?utf-8?B?VjViNHNFcnJiUUdnaktCeFU0MTlFSXdqV3lJeG85d0NwbmZoMjgxQjdYZit4?=
 =?utf-8?B?VVFzcWtBb290VFUzVTFlOGFVdFlwRkVCai8zRHAxUW5BNlZZSm9GY3ZleU9p?=
 =?utf-8?B?bE9OU3dTYkpjMUtvc01yODlkazBFb2RIMHFIbDRnVXlVaWZIQlg0NVh3Vmtt?=
 =?utf-8?B?Q3lab1JnZElVVmh4K3MvU2FuQlJicDJ4bXVBcy9LeGVadkVaYklFbWFIeCtE?=
 =?utf-8?B?RFZCWXFOWXNoazI4dlVrNlZmeHhRVUJCMDNrUVRETC9SZTMvTkYzUnRsUW1X?=
 =?utf-8?B?alhDOWdYSXBEbEdTOTJXanh0Mnk5aXUybmRqb3pkeXhyV0FlbnlaOFNvQ1Bj?=
 =?utf-8?B?UG9ESWtlSHZHKzU1eHoxY0gyN24rbnpvZFlCRVA5MEtwQVdtQ3VFSS9NUHRL?=
 =?utf-8?B?VFpUNGd2YjMzMjNlOVNRQzFxOGV0dUZMNU1xcDk3QXpnUTRPWm5QWjM1R01Z?=
 =?utf-8?B?SitaRWNmMFU3Nk1OQzlXYzA3bk95ek43eCtkY05SV1J4ZW83NU1rOXpvcm44?=
 =?utf-8?B?cG9CU1hCUiswOVpwUk9BWE44dkpjRk5kWkZaK2RWamF6aVd1NEVtR1lQdjZt?=
 =?utf-8?B?QzRia0FJVFFCVkg5SUZmVmNVVlNhYVRMMUxBV2FEUnhZUEUrTTBxNEV6b1Q5?=
 =?utf-8?B?Sy9iaDBqRElrUzQ0aXI5Z0tZQ1hsZU9YRldJVjZ0alp4VzFvb1FFUTdOc25p?=
 =?utf-8?B?c0dxU2ZJa1E3VHY2WHpmSW5TcFYzQ3Z3S0lMcUowOVZCbnp1WXR1NU43R1ZW?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d42bd4b1-5529-491f-a94d-08de2e8106a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 13:21:23.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYWj83+hCuIK6tqxbw1sytr2UrcouzmXf4B08jKYnsqJHVDTmW/AVhavTGlIoQY+uX8EyzeHMNW1XvYUPT3Ir/7EiKZvjz8syFclbSwu2M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
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



On 11/28/2025 1:38 PM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs,the alternate CCS-mode
> cannot be changed when VFs are already enabled.
> Similarly, enabling VFs is not permitted when the alternate
> CCS-mode is active. Additionally, the sysfs entry for
> CCS-mode is not created for SR-IOV VF mode.

maybe this VF-only change deserves to be in a earlier separate patch?
we could even add Fixes tag, as VFs should never expose this file
(unless it would be read-only file with (expected) fixed "1" mode)

> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
> v2:
> - function xe_device_is_vf_enabled has been refactored to
>   xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
> - The code now distinctly checks for SR-IOV VF mode and
>   SR-IOV PF with VFs enabled.
> - Log messages have been updated to explicitly state the current mode.
> - The function xe_multi_ccs_mode_enabled is moved to xe_device.h
> 
> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
> 
> v4:
> - sysfs interface for CCS mode is not initialized
>   when operating in SRIOV VF Mode.
> - xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
>   enablement.
> - remove unnecessary comments as flow is self explanatory.
> 
> v5:(review comments from Michal)
> - Add xe device level CCS mode block with mutex lock and CCS mode state
> - necessesary functions to manage ccs mode state to provide strict mutual
>   exclusive support b/w CCS mode & SRIOV VF enabling
> 
> v6:
> - Re modeled implementation based on lockdown the PF using custom guard
>   supported functions by Michal
> 
> v7:
> - Corrected patch style as message written as subject
> - Used public PF lockdown functions instead internal funcions(Michal)
> - Creating CCS Mode entries only on PF Mode
> 
> v8:(Michal)
> - updated short subject and few comments
> - used guard for mutex
> - Add a check of PF Mode to ensure use of xe_sriov_pf_lockdown only in
>   PF Mode
> - Added default CCS mode check to xe_gt_ccs_mode_default(gt) function
> 
> v9:(Michal)
> - Added xe_gt_ccs_mode_default(gt) as static inline and it can be used
>   across driver to use between default or alternate CCS mode
> - removed comment from obvious code
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 47 +++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++++
>  2 files changed, 49 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..8621c39cdf58 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
> @@ -108,6 +109,35 @@ ccs_mode_show(struct device *kdev,
>  	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>  }
>  
> +static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return 0;
> +
> +	/*
> +	 * We can't change CCS-mode when VFs are already enabled
> +	 * and we must prevent enabling VFs when alternate
> +	 * CCS-mode is active
> +	 */
> +	if (xe_gt_ccs_mode_default(gt))
> +		return xe_sriov_pf_lockdown(xe);
> +
> +	return 0;
> +}
> +
> +static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (IS_SRIOV_PF(xe)) {

maybe we can use the same logic flow as in 'prepare' function above:
exit early if !PF

> +		/* Allow enabling VFs, if CCS-mode changed to default mode */
> +		if (xe_gt_ccs_mode_default(gt))
> +			xe_sriov_pf_end_lockdown(xe);
> +	}
> +}
> +
>  static ssize_t
>  ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	       const char *buff, size_t count)
> @@ -117,12 +147,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EOPNOTSUPP;
> -	}
> -
>  	ret = kstrtou32(buff, 0, &num_engines);
>  	if (ret)
>  		return ret;
> @@ -139,13 +163,16 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	}
>  
>  	/* CCS mode can only be updated when there are no drm clients */
> -	mutex_lock(&xe->drm.filelist_mutex);
> +	guard(mutex)(&xe->drm.filelist_mutex);
>  	if (!list_empty(&xe->drm.filelist)) {
> -		mutex_unlock(&xe->drm.filelist_mutex);
>  		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>  		return -EBUSY;
>  	}
>  
> +	ret = gt_prepare_ccs_mode_enabling(gt);
> +	if (ret)
> +		return ret;

don't you want to add some dbg message why the change is rejected"

  		xe_gt_dbg(gt, "Rejecting compute mode change as VFs are enabled\n");

> +
>  	if (gt->ccs_mode != num_engines) {

btw, shouldn't this be checked earlier?
then if requested mode matches current mode we could still return success,
even it there are drm clients and/or VFs are enabled (or was this done on
purpose?

>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>  		gt->ccs_mode = num_engines;
> @@ -153,7 +180,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  		xe_gt_reset(gt);
>  	}
>  
> -	mutex_unlock(&xe->drm.filelist_mutex);
> +	gt_finish_ccs_mode_enabling(gt);
>  
>  	return count;
>  }
> @@ -191,7 +218,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	if (!xe_gt_ccs_mode_enabled(gt))
> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>  		return 0;
>  
>  	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> index f8779852cf0d..c5b459ef2f79 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>  	return hweight32(CCS_MASK(gt)) > 1;
>  }
>  
> +/**
> + * xe_gt_ccs_mode_default - check if CCS mode is default (single CCS mode)

add () after function name:

    * xe_gt_ccs_mode_default() - Check if ...

> + * @gt: GT structure

add empty line before 'Return' tag:

    *

> + * Return:
> + * %true if CCS mode is default(i.e. single CCS mode)
> + * %false if alternate/multi CCS mode

note that above will be rendered as single line, so maybe:

    * Return: %true if actual CCS is mode is single mode, or
    *         %false otherwise (CCS in alternate/multi mode)


> + */
> +static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
> +{
> +	return gt->ccs_mode == 1;
> +}
> +
>  #endif
>  

