Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1A6D2ED0F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 08:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABF710E58A;
	Tue, 20 Jan 2026 08:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY1CFByx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E8410E58A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768899134; x=1800435134;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R9VD5LTC/IUpjTjdpZPz4doJ+sfZAn8/1pN4fwueeJ4=;
 b=BY1CFByxex6Qlk7wNrl/LqAH/HXK85C3OonekQOJrCou7YpNCT6OMZ8i
 RMw/cu0ZFYa3ROi+2EqKjjnOWtN/Ak7F2uKmXUAajbJv0efi9YDtySLEb
 tKkAScbJYlZPjLVi6dzLHRKFHzfB3rTnTSylENQjEkFtss09rxqXgSysX
 oETlL9Jecm7waS88ShSprDpYXNihiNqCLL6KeSYMCIca6fkt9cGCYfz1F
 kdEnnHwwzbsOSxRtxAT1x75wRfkoBAM1b8vJCjeWxDkokghUXxOZj9AaR
 IBiza7iWCDA7ArydMAruojoGVUNfGEi4gKC+IuxSoexK2yn25XOaIvx7T w==;
X-CSE-ConnectionGUID: G3bgfwRGTx2Zy7Y8u8eXzw==
X-CSE-MsgGUID: x4lydmZXTkiabk3NcD8VzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73969187"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="73969187"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:52:13 -0800
X-CSE-ConnectionGUID: VH7srVtzSuaKu7n+BxeUAg==
X-CSE-MsgGUID: joI4JIBzSDyfnsuvN3VD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205316513"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:52:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:52:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 00:52:12 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:52:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIFALUEoahF6lfIhWZ9L5ewCipArCHuNeH1wttlhAhx9a40T7aPhBsRDYVZfJCietEWxotRptN2DvTGinRd3IUPfFBjT+ce2OLADoqg7p1/MC3unCzDOdju0y0shuNT+/j0VJ//YJHX/m6reLLNdOds/fm9Tqhe/hXKAuEf6lKHIJXWTN0Z8FK/Qjp1/nEwqp7oM6D+lmTxIz0a/bE5/nLqsgd3vQ7l9CnOsVypNmmApDYKWVqm9cQRhbHM10FZjAJ0TQJF30IItNbPDqs6hY8+S0ZfcLqsVCCSkJC1BhBScOwfMzixXmai4vm8P9ejL+gKVuMBBoB+7k5HNRuezoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e2n/uh9BYNlVeXAlwyiR+PrHVOeTie6I3F+xIrQJXY=;
 b=aAwFy5xsOAzUnQ9nmWB4f0rFm3C6QB6Fs4YKwh9LQqnw8GEVxyEf9cw4sP6mptebtw4i0hdoY8M2x44KDdBmQ1B9m5c2nddphtERqMj4rFRwpPvw94yXbW/zBuKY/IYiVVECBk1cfPkcDgo4f2Ip8uHlINw/2/a5FuR5oHfJAJLeZRHdWQi12cW3HQ5Uy/kUCCyjWQ9NhuL7kmgfu3JC14YFCVqvwKu4Nn/nyc5jBzDyW7cUn18+Tcw13srEe7609rLec/4qB0wURmtilwjodHAadaI4MK6Ll5PcnRDzTCbonL2mttBv60GkbFwsak5yp+fry4EthkkBDZhw3abBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:52:05 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:52:05 +0000
Message-ID: <c6fcdd50-223a-4568-8e87-6b2bf9826228@intel.com>
Date: Tue, 20 Jan 2026 14:21:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,4/4] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <soham.purkait@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260116093432.914040-5-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260116093432.914040-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW4PR11MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 776b7c23-2830-4e7c-ef62-08de58012f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d09YWXR1ZWJYYXlhdm9UOExwYW52c0NOUSswVUtRUTU3bG5hNEUwN2xXaDlV?=
 =?utf-8?B?MW9hOXQzbHR5Y3JISnVVQmx5Smw2WWQySmtFTE5Zdmh2alB3OUgzbkl1aU9W?=
 =?utf-8?B?LzdXNk54ZVlMVmh0NkRzd1g0dXlVeXRnVlc3NnJ2OEFMeTVoaE04MVNlZ3lj?=
 =?utf-8?B?TmRqMUtBVElLY1VhOU8rRGxBRnpkRFF4djFnQUNVaHRRMnVGUldLamVSNWUy?=
 =?utf-8?B?NUdQRUxPQXpKaitWRmdzbEFTUnBLZWFGTS9Renp6TXdDVzVMZmxwQWNzU0Fy?=
 =?utf-8?B?cDdWWFdlbWZveldVcnI3Nis2eE9zdlNFSEgxVWYwTzQ0VER6STZlWDVibUtE?=
 =?utf-8?B?YmtxNTE4MzdMNGdldjVWTXVMY0tpbHRSL0d2ZkR2QUdyK2tiTjhrOHBudlE3?=
 =?utf-8?B?WVdiZEVMb3ZFSy83Rnd5S2xLSDVvWXVTS2laMjFFK1N6VHB4MHdqbGtIaUxi?=
 =?utf-8?B?bEM4RFpLNkxoejEwOCtsYXNKT3YzWEhyTVFNZTZjbkVzNkwyU1FCVVdURjNR?=
 =?utf-8?B?a0J2bXFhUWJDRTl0ZXZsc3B0ajkyRm9veHA0dXhrTUxxRGVYWklRMlU0NFAw?=
 =?utf-8?B?UG9hbnowSS9PNXJqa0tjM1hYTWpZd3Q1WmdYYUh2MlpYQmoxOFBWaWV6VTBx?=
 =?utf-8?B?M3ViWEMrMlRtb1MxQkd3ZzZpMTNFMUFDcTB3Y25WbUV2UEpOQm9tNHYyVHQ5?=
 =?utf-8?B?YjhITC9lYkIvUDRiMnkzWFJiczB4cTQ5dDcyNlZ6RUhWOW1uTzlKdDlyeGpn?=
 =?utf-8?B?dHoxdkNaMEc1Z2tKZkhIeFI4ZVNzdElpdmhqU3pXblVVdzM5cVlNS0RKMmZR?=
 =?utf-8?B?NnZ1SzFzWWROVmRiaWxlcGxpVzBOT1JYRndBL0dFeFdHSEdoM3B0bGZNRk10?=
 =?utf-8?B?dytiNW9sOUpyTWNOTW5CckF1ZGlDMDM4a0E5Z3RyRHlFTG5hNzJuQzVnSkl4?=
 =?utf-8?B?d1YzN21GRk00dFdwNCtNL2x2TERWb3dqamRBbEJFcFJUL0FZcFVuZ0huWnVW?=
 =?utf-8?B?VU5vUlE3OGZPUXRIdnFJRGxjaUlobnF1SWx6aHp3b1U3MkZiRkRnTGsvanRZ?=
 =?utf-8?B?cEgycDZrNHhLUy92aE0vVWMyOFJEc2RiSUN6MlUxQzFFWDVkUlRBMVNQVFRS?=
 =?utf-8?B?WGo1Mk1aMzVOQ2FWNEZkNDZVMHc0bUwvbmUwbFVCTW1sa0pYbksycFFYZlgx?=
 =?utf-8?B?ZkJoenNESVBQUVdFUTcvZzZCbS9Kd0lTSmhvMHFlZkFFdEdGTVhJY0FwNFNt?=
 =?utf-8?B?ejZYTGcrTmErU2E1YVl1MjRJUENwMnI5NXM4YVN6Z1BOZS9wV2hDakJBSVNP?=
 =?utf-8?B?eHFRNDJIWEFidFFPdlpqRWxjQWEvSVc0Q3ExR2F6M0UrNTYvMm1RaGorUDg3?=
 =?utf-8?B?b0MybnQvejY4Mm92dlBQc3Y3UU0wbTkyUG1SSjNINmJ0QzZBamZ3clAyNXpx?=
 =?utf-8?B?Wk0yWG1VN1ZtaEJmbXYwd0hNYmJTMGxyWEc4OHo5dzUySk92NklEd3NXWkZX?=
 =?utf-8?B?R3NsbHliQ28reXFxci9waEtZcGkzd1ZZcUdrdTU4N3dBbnJsa2pBQXIvVDVO?=
 =?utf-8?B?RGo4UDZWNmZrTE4xbDlEMXdCdFNtOUJsSnhjdzFuUWFtVWFYblcwVDdOZHp3?=
 =?utf-8?B?WWNUMEdEZ2krdGgxZHg2K1EwaW40VDBwKzVQV0ZYbEZLQ3EwY0FkSkhMUGgr?=
 =?utf-8?B?VGlwQ2xQV2ltQ0hsRkdNSDkwQlFlejhoeEVpVTlVdHBJVkoyK2lEdFdTMVFU?=
 =?utf-8?B?U0x5b1dDd0ZSY3BqcXR5NlBsWDJuSVJXZHVjTTFIZmxtNGRScVlWTWVTaHJX?=
 =?utf-8?B?RjJjNjhVdk4vZTR4dytWWTdWMFpPRXN3T0Y0ZWpBNDJ5OG96a2Jsd3FSR252?=
 =?utf-8?B?L2dlckdKUWpxT2lrTzdnRnFwZFp1NGJDZ21CSE5sb1hHaVV3QjJtaUtTOUZI?=
 =?utf-8?B?U3g1VWNmR0Mzam9Ib1d4MEZVdFg2Z0NTSStseXZxNjgxMk5vaThwVHpUUUt3?=
 =?utf-8?B?K0EzaGRnYk1UTHN6ZkpyVkVSaTBYbUdmUE9oaVI0L0gzYVhzaUNFUFFnOUdW?=
 =?utf-8?B?T1JEZ29EM3JFdGxCYVZhaENRaVQ0eHdCNnNuUEVXbVBUZWFvK3VXNWdrZzM0?=
 =?utf-8?Q?3v9o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFVFOXgxNTErVGxEc3BGakE3bXRIVHQyaFN2MDJ1d2liMlA5WVQ1Q3NaMkV1?=
 =?utf-8?B?K1NqcDRGR2tQaWxLRVZUcldPd2ZWbXhGalh5TVpBQjZXcDlNRVVzanNwUE9W?=
 =?utf-8?B?U0hlZlpDaWh3eVlXQVFMSlFHYTNXRU5OSk5YMTZrT0ovNjBLWFhXenpMb3RN?=
 =?utf-8?B?RU01YndvMGlnWnM3dFh5YmEyZzl1a2NPS2tFZEhOdWxHRFo1RVJlRnZKUG9m?=
 =?utf-8?B?ZnpoeDg4OTRaRXZucVNnWUx6MVBFajNySmJQazcvOXZFanhsRU9jblk0UWFp?=
 =?utf-8?B?eFlpTmI2c2tMMnlDQkI1Nk1RS1NSWFNvL0RJZHBIVEgxYWNCRUFFRVdFekFN?=
 =?utf-8?B?bm4yNDFnWDBsWmwvL0JTVVQyRlhITHJnUERFZlBsdlQrV0x2a0p2TnJXcmJy?=
 =?utf-8?B?dE5rMFRGS0huOTg3dFVNREk0aG1rSmJMQTllS3UwbDA2dTQxeWF1bkk3UElt?=
 =?utf-8?B?VlkySWVOUC80MXVJUDRETjRDb3FNTWlPcTFDdDNkenZjbGM4S1ZLVWIzWmM4?=
 =?utf-8?B?MlErcmdlU2l4cVdjUWsvVmdsNzJyRjA1RkxOWjVXenBDb0c3bmpMMUdoUXg0?=
 =?utf-8?B?MnI1TjExUFRndVhQYnk2VTBENGpSOHBPY1A0STZsaFg2VCtkeEJLVHc3RE54?=
 =?utf-8?B?M2tvbWM2bEdsZXVmZnVWWnBnQlVhaDFLNDA0RHN1bUc1bkJiVFhrSnhub3BZ?=
 =?utf-8?B?bnBRR05WYzFuZUM4Sk5heFJBajVYUTFCemVNS3g5dzBRWVFBYzRmNzlqdXkw?=
 =?utf-8?B?VlRCU1JtanJGSllDN0ZRRkVHeFljM2hDYUVWRHVhQldndHZaN0twMVZiT1lD?=
 =?utf-8?B?dFBGUVlNbHVNcWdDR1IvcGNtSTc4SzZlLy94dDBacXg5QkRtS2w1YklmMDRG?=
 =?utf-8?B?cTZtblkxcWd1SFNHTVpMVjM5TDZlOUJWdDZiTmRBRkg2SWNSaldvTGxpN25L?=
 =?utf-8?B?MjNBSFNpN1JkSzhhZUJBWDFRbXUrVURRNXlJaVAvUEJKUFVyUTZmQy9YMG1o?=
 =?utf-8?B?SzRkOTZMNmJabnRYVnlZSG84ZWlkaXNOWFdYdWgxSWk3L29sQ0tMWUo2cmxP?=
 =?utf-8?B?U0ExTFh0RFByTmNiMUZXQnBoeHNURmp5ZlN6dHhiTkFKL01kQ0NZelhnZG1E?=
 =?utf-8?B?Vzdqd3JBcXBJMWZOYWFLL2NqaXFpSWVBUnd0R2tMNGVYRDBUdDc4QXZJaExN?=
 =?utf-8?B?dVVwY0hkdExMenhsYkxJZGVERjFOOS9pek1rdlNSblIvUUQyTDRkai9QbFhz?=
 =?utf-8?B?bEhpdWZDUXR4K1h4OFNZRTltdnpRYTMzT3BadFNaeUV2djhwN3ZUaHRsM0R4?=
 =?utf-8?B?QllQTHlLSldBcFd4WGdvbUNQVCtaS1BaTG4zV0lBZTJGcTNLSW95dzczZkgr?=
 =?utf-8?B?bzhPVVJFUzhLRExzaEhqb05WUnlJdXRJS3FOY0lyeXZLeFNDU3h4WjBpaDlR?=
 =?utf-8?B?eGJURWhUcE8zYkkvd0JoVVJxbHB4cUpLOCtVdjdMbVJEMTJMVVh6VzJZQklz?=
 =?utf-8?B?SjRXNk92N04zcFl5ZXZidTlKd0VrMkVZaWtHazBVOXdIenNRUW1OZ1RWbHpU?=
 =?utf-8?B?dlhlKytXYzg2dERSejA4SlBKVTNEeXA0NWNkNjI5MkxNeS9kZVIveGZqd1hY?=
 =?utf-8?B?RFpIV1YxVFBZcitoaEk0Ny92bEV5VjRydDRUMnA5aGZRblBGVXJpYlcxa1dz?=
 =?utf-8?B?S3BLRlhTalFaQkhCdFhQUlJZMjMwUktmREtya1d2QVJkNE1xcklZYy9hUWJt?=
 =?utf-8?B?RjRIa21ocGJyeUNXQloxQ0FDdmxINVNFS3lTZEhleHo1V0lNWDlXSTB6TGNR?=
 =?utf-8?B?THNrU0ppdS9vaDRRYTFGWUVGRGYvOGpWOWNQWXRWRHhHVUROTEMwTTZub2lN?=
 =?utf-8?B?dHdvZS9adWFFWThjWGpzKy9lTzY5VXp1VUVjWDVUYkZDMGlOcWgzdmt5dWd6?=
 =?utf-8?B?Zk50dFlrOWVYVlBkZDk0cURKT2UwZWFGeS9MQ3F5MjZ3ZEJlVG44TnlxVi9I?=
 =?utf-8?B?bzRMZ2xVUFA2T0FkOFBwOHd6VGlUVEdDT1VLMlhEVi9oM25nV2tOclRhTWJ5?=
 =?utf-8?B?ak4xMnQzbWRXRWk4YkJqUXpCTEN6T0o4cGMxczlTemlBVEVJdlZidVNRVkQ4?=
 =?utf-8?B?VWROa0lrbGJhMGxPR1dtb3BLRXA1UTJTTW53TDlBRWMzR3ZVbitKZWpZajZk?=
 =?utf-8?B?amhxZWg3THlsWWMrR2FoNFpKWmxtUlZyRnUyaWN4V0JIbGZFZjd5ZVJ2L0pK?=
 =?utf-8?B?ZTJsYWpwRFB5R0swQW9iQVBMNXVyMWVDeWVzamFMemVzbFlxdmtXOTZ2T3do?=
 =?utf-8?B?bm5uTkd5bmg1K2tVemhZdjJqTDJGNFZmRzNkTitkWURETGZvd1hyMUd1SE1C?=
 =?utf-8?Q?+R4OQWZJGy8RMfJY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 776b7c23-2830-4e7c-ef62-08de58012f57
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:52:04.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdbNqeFSiPkncTZdJDaI3RK1XP/JvlA+zbF5FQr9bq+4lXlYjFYJpotii1vVCnPicDga0pNCorLM0G5bJYpO5lfxe709lFU5gLyCCNgWSaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
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

Hi Raag,

On 16-01-2026 03:03 pm, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 86 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 79 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 182 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 16e28cab8464..8cc060a64c90 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..6fea009c991a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED		= 0x00,
> +	XE_RAS_SEV_CORRECTABLE			= 0x01,
> +	XE_RAS_SEV_UNCORRECTABLE		= 0x02,
> +	XE_RAS_SEV_INFORMATIONAL		= 0x03,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED		= 0x00,
> +	XE_RAS_COMP_MEMORY			= 0x01,
> +	XE_RAS_COMP_GT				= 0x02,
> +	XE_RAS_COMP_RESERVED			= 0x03,
> +	XE_RAS_COMP_PCIE			= 0x04,
> +	XE_RAS_COMP_FABRIC			= 0x05,
> +	XE_RAS_COMP_SOC				= 0x06,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_MEMORY]			= "Memory",
> +	[XE_RAS_COMP_GT]			= "GT",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC]			= "SoC",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> +{
> +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> +
> +	return xe_ras_severities[sev];
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
> +
> +	return xe_ras_components[comp];
> +}
> +
> +void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response)
> +{
> +	struct xe_ras_event_threshold_crossed *pending = (void *)&response->data;
> +	struct xe_ras_error *errors = pending->counters;
> +	u32 cid, sev, comp, inst, cause;
> +	u8 tile;
> +
> +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
> +
> +	for (cid = 0; cid < pending->ncounters; cid++) {
> +		sev = errors[cid].common.severity;
> +		comp = errors[cid].common.component;
> +
> +		tile = errors[cid].product.unit.tile;
> +		inst = errors[cid].product.unit.instance;
> +		cause = errors[cid].product.cause.cause;
> +
> +		xe_warn(xe, "[RAS]: Error:%s Tile:%u Component:%s Instance:%u Cause:%#x\n",
> +			sev_to_str(xe, sev), tile, comp_to_str(xe, comp), inst, cause);

Please add Error timestamp and Threshold reason.

Thanks

-/Mallesh

> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..fdefe0e2fe98
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..348ba520d676
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			21
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error - Combines common and product-specific parts
> + */
> +struct xe_ras_error {
> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_event_threshold_crossed - Event data for counter threshold crossed event
> + */
> +struct xe_ras_event_threshold_crossed {
> +	/** @ncounters: Number of counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @ts_high: Upper 32 bits of event timestamp */
> +	u32 ts_high;
> +	/** @ts_low: Lower 32 bits of event timestamp */
> +	u32 ts_low;
> +	/** @reason: Threshold cross reason */
> +	u32 reason;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 3a860bc34db0..d70bef72764f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -8,6 +8,7 @@
>   #include "xe_irq.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -34,7 +35,7 @@ static void xe_sysctrl_get_pending_event(struct xe_device *xe,
>   			xe_err(xe, "Unexpected response length %ld\n", len);
>   
>   		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
> -			xe_warn(xe, "Counter threshold crossed\n");
> +			xe_ras_event_log(xe, &response);
>   		else
>   			xe_err(xe, "Unexpected event %#x\n", response.event);
>   
