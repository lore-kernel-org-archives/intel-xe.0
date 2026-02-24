Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D459DF4BB63
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 17:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7E910E60D;
	Tue, 24 Feb 2026 17:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hanxUMu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511A410E602
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 17:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771955520; x=1803491520;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LgV/sjC85PBPvgJKa+qRvBhijX+q2M8osMQWC0qQa94=;
 b=hanxUMu/NePoQxsqy9A2Thu0zMa0bV2P4SczvrzF+pu6ojdLlO45udU2
 7B3Rw3Bo7IFKbqt4FTna7oXhrVW5Re2O7PRYh/ft6xAWVbvDn71CgBPz6
 LL9nT/GqUBbiFHw9WjvrsfC29qrqImkGMILz0zCuG78RUF09QJreOIOGs
 X8TXhRjxeR960Mfh31y7Vg4ht13AMzw6UcMMu3nOioNBprz9B8eYVbunO
 u2xXUuxKRCLtkpgqh7YeL5JxGljrpPXQ1o9a+Vk9cG/FDc2lhqQbkOMQ/
 57gQK+Wwg1x/V3U3d8k5E011Ld9Boe/3ISoWXQwoCANEceqnF/D9rxLTK Q==;
X-CSE-ConnectionGUID: R1maP0DkSkCZ9KoV5yxBPA==
X-CSE-MsgGUID: ugOZm35zTkW9YGwUIHu4Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="98444973"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="98444973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:52:00 -0800
X-CSE-ConnectionGUID: WnB5HyTGRwWSC/RgFfWAUw==
X-CSE-MsgGUID: uhrc5XKzQHOIs7S67qcEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="219438947"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:51:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 09:51:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 09:51:59 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.32)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 09:51:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbLkfufAZgD+gyxSyIoPvc2sTIZ026ievfYa+L/ne6fN/cOdD68VPg5xYnZRRPJooFyECNW8FdoCsdADTt1y0qBMb67fKTmSEpqcHsPVsWFq255ueXLIZc6HnP4XnKHXUVkhsfDmC0WYqu3wSRwHGc1L8vo32c8fNTmroeoeqO1r/TxRqXan/Oksc1aCHaa+9yIwqgnWQlWkslvfUKnIIiMDOWUfScErIOSBZIGmXHKAVwLJpKYOowNP0+PpaG1JYPUs28fkEUDxRZeOySvx3P4ML/Teo/0XQzFNy74dv2JoC494rw6D6M2g5RWA5UpmAgxpg69AVj1msEzBMWGrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb0AvLTnfhT/ZQjjALrAkNr/scuDydaNZKUyerchY8g=;
 b=KPxLeUvSKQl/Mu1LwJlfgPqw/JngnbnDJoOLj+kqeWyzhvGV9feXp1xIYQswzgFup6f8Uw1c0fH8DX/iH2YPqHYgP+9WvBavh3rbRodZC+Nk/jXo9bLo/taNb/NsUcH33jLEF/5smlAy4RywLHeBrJhS8+SX45TEAgple3QhF8ZRLBTH0Y4OEzAvzBzPQRRGMI5PuPajtBWdXjerqQlQN3GBSg2sGgyEyOOBxD4iSonBmuVfwcG4MDMt1oZ2fzBziRot8GuVzMITkoFdd+eDR8oPxeIDLpDdaJlFpi+XT0uw7rKbayxKJmLb6U71C+EAY3NLP/tPL0q71PGJsuVgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:51:52 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:51:51 +0000
Message-ID: <3114cb01-228a-4016-8e45-146202aa7828@intel.com>
Date: Tue, 24 Feb 2026 09:51:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20260220170137.328131-5-julia.filipchuk@intel.com>
 <20260220170137.328131-7-julia.filipchuk@intel.com>
 <aZiVvPmGtxxOi4JF@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <aZiVvPmGtxxOi4JF@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0347.namprd04.prod.outlook.com
 (2603:10b6:303:8a::22) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DM4PR11MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c6d7ff-96a5-4792-7f64-08de73cd63fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjFYU2dLU3Q0djVnS3lvaTduOTRsUWNVQ1ZBd2FTNTQ2SFZJWGNMYjIvc0ti?=
 =?utf-8?B?eG1BZWsvQWlUdXdhQWhZMEFEMFN2TmVtWG44L09oRHQ3WXVWQ0U0bmpCK3Bu?=
 =?utf-8?B?eENXWGVmN0VjeWFFcnVQUFQ1VjBSRks4TDJqNkVrZEE4SHhZdnltYWQySUZB?=
 =?utf-8?B?UFVteDErclpJT2ppSERSMG9DckthTkNuM2xOdERSdmFrZE1Ta1FpWlZGWFVZ?=
 =?utf-8?B?K0JiZVZtMVdaSW9RdHFKbjZLOGhFUExNdGM4THZwaEFWdnFCQ2Zjd1NFclMw?=
 =?utf-8?B?TkxDbE5tTnZtRnl6OUlWMlhvVjl4WnhlL1pPWWNGKyttNjRESDVLM2NEUThC?=
 =?utf-8?B?aWZEVkNmNGI5M0wvVmZvRG1JS0pWOTNJZStRTjgyazBhQkZnTm9uWkJCZ01K?=
 =?utf-8?B?dy9sYWtCNzJBbmpHd0h5bUpvTGN2TUpscXlZNHJVYmt5ZDJVVlQ0TDNiSzlO?=
 =?utf-8?B?bU9MRmxKNUpLTWE2N2RJRndqWHF5MStLa1JxNVJzclRhZ2pSU21mNGZ0MVlU?=
 =?utf-8?B?eXJQOWp0MVJrcWpTb3FVdlhWSHZDNkZuWnR1ak0vbStNZlZ3NmJTYktXQmNh?=
 =?utf-8?B?WGN6ZnAyWjZvTmpLQldhWTBsT2tnTzlvb0xLMXRFazFTYVhmM3BaZzhyZm9t?=
 =?utf-8?B?elNhbEtFRzdGYnp2b1hvZ05YUnpiRE5BYUtURTBUaTcwOHhYc1NPWG1hc0VQ?=
 =?utf-8?B?MksvN2tCNlFKYWV0N3NrRXJJZjU4K1lUN1JEa2ZBdHRUMGdFZ2RtSGJPSHJB?=
 =?utf-8?B?Q2I3eHptR29qRWJFb0JWcXRDRWxocSs3QkhpK1k0RW54bk10SU45YjJSNGQz?=
 =?utf-8?B?elZBM3RoUUE2M3V6aGRLckJwTkpzb1o5KzNDa3JmZzBwTXFqVm1uZkFQMVhG?=
 =?utf-8?B?ZHdGTVdvYTlQSVZqK3BBOHFObnVKZFJIUEhzNVJHVkZXSE1aSlo0Q3QrQXRO?=
 =?utf-8?B?d2JST2Eva0NoMTUxeXRJVGxrUnFkbUpOUG9nZy9pd21xNytkc214Si8zL1RP?=
 =?utf-8?B?UWgyYUx6bDh5b29IbzF6djNRZW8zY1dHcFVULythT3E2UG9NdnZEQTVoZWJx?=
 =?utf-8?B?NlZzbTlCeVZ1UW1TS29xSEo0NEIvcitHSkR1UWtyR25UcXJWenF1L1doZ0I5?=
 =?utf-8?B?Y1hZU1RpVGtSM0JVdWRJZGt6TnJhRjBBa1d0cXNCc0ZreWcvcVVIdTYxcnk2?=
 =?utf-8?B?ZjdHeTMwc1Y3MXIyekJxeXJ2b1JpMlFWWmFrUFYxTlU1VjBDcFlVYzBSVnhM?=
 =?utf-8?B?NzRmOHphNXE1Y1c4SVdJU0lGY1ZveUQ3bDI5S21teWhKM1Q4TXovVyt3dU9M?=
 =?utf-8?B?OFZqc1YrWHFRWVZZOXlhOTF6VitJaFdtMlVDT1ZuS254WTRQTFBCN1dqVDBq?=
 =?utf-8?B?S0JCMU9QWnRmNFdhbVZhSVlwMk5EZDhEWnlCeTBGaUpkeXB0MERwVndZS05i?=
 =?utf-8?B?d3NXTlprSHRUWC8xMmVOeW5TSGdyYnZHa0orckllYUg2MnVxVVQzdjVxb2Rp?=
 =?utf-8?B?cDI3MFJMTkMyemk5ZUNUQk01L25PWnNMMkpNeFpmUXQ4V3BYSFh3enlWWllC?=
 =?utf-8?B?aHR5QVgvUFp0OHlvdkY2SC9KcEZWT2ptY0JucHdjTi8yMWhKN2lHdmVHNGxn?=
 =?utf-8?B?c3pGbldTZG5RYnkwR0Q0RVlkUjdWcnFybTV3M0xYTEI4dHdBTk9xY1N5empo?=
 =?utf-8?B?eXdRcEJQYnlqa2NmMWF5TkZOam9LS0htTU9pUVZDVVM0R0IyTW1oOCtGaU1S?=
 =?utf-8?B?OEZCcUdvY1JSZkthRU1rQytnL0FPL0YxeE9iUERlRmhZNWZROEdRb01rUkFK?=
 =?utf-8?B?c2Vhc3J2SVl2b2RWWmEzeVRaL213K2MrcVg4UFVZWHFmNHlyVU9yTGlFclg2?=
 =?utf-8?B?YmpqRjZGRzZ0NWNGSnBnTVhqZmM2bnZDaUtJdExhNnFDdDVXR1dBUVhoMlZj?=
 =?utf-8?B?WGRDQVV2cjF1dkNMSzhFOGRIc3lqV3htYXZXckUxQnEwZVhtTml5UW9CVi9E?=
 =?utf-8?B?anpYeVI2UDRkWlhJdERLYUQzb21OQlY2bFJFOFpYRHpIT2ZKK0VVaG9GWEsw?=
 =?utf-8?B?VFNaOXh4aFVrWFM1cHVEVUx2eWFCSDhuOTR5d2pBN0JRdUcxTXdQeEJ2eWxk?=
 =?utf-8?Q?1M5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmxDUUplMElYdTVTajV6aGYwQTRpdHpxQ2ppZmFTSHF4VThjbXBnNXlIZlRD?=
 =?utf-8?B?dUIwcWp1cUduZ3lUVFU3K3lGNzZSaG1oWUM3SUFsdjF5Q29VUUt1YW02VUcx?=
 =?utf-8?B?WTlxeWlUd2Z4a3hNZitNdkVkWUMxQkk0MDNMdFpKU2pia3lKTUhHVjBlc3Ur?=
 =?utf-8?B?T1dVUlJ1NjY5Sm9TR2E0azU4aWJUOEdYNjI5L2ZzbVRKTlFKV2tvN2FibGwy?=
 =?utf-8?B?MTczeGFTVnlYWFhtNGVuekt3aUNWeXJHN1g0VkhOM0J5NmJBQkl0N2hBYWhi?=
 =?utf-8?B?bmFhb2dFYnRjTjRNUUtTYXBueUFCak1uMERSV2hZVi9TMDVjVXBoaUlOeXV1?=
 =?utf-8?B?VEtpNmR1dk5veFFmcXdLc1hhU2phdUJ5NEVkZldGNitkcVl6OEw0dXQ5ZEl5?=
 =?utf-8?B?NTVMUzdMTVNaNFF3V2pFTzh2QWIwcGJtbE8rNENSM0FjVXQ5Q3RoL0xrbElI?=
 =?utf-8?B?MzNZd3hSTEVGeC9yUTdZV09MVmFxS0ZwaHF4QWx6WENEU0k5bVlsRmpLd0hs?=
 =?utf-8?B?bUtDdVB4YlNyR2hjTlIrNDhaUVNya21CeVBweVliM2pxczE5dmxpMXNjTG4y?=
 =?utf-8?B?em1nc2hRcmtXb0NYL3h6MWZpT3h6SnhpYUR6MkpXbmFmNE9nQUllNmNOMUpB?=
 =?utf-8?B?a3NnajljM09abGVkWXI2Nml6bE5zY21xNWMvbzRSS00ycTg1VE5DODg0Vm9R?=
 =?utf-8?B?OWlMTTFSQ2ZlaGdaQnFPTVNrcnNwdnVQY1ZSS2lsMXd6bkI4NEVBMytjWjNu?=
 =?utf-8?B?OUFudnpuVS81K1BTaU9MUVNxUHlhTTlrTVJyUVRKTjcxa1plbDBVaFlHMThZ?=
 =?utf-8?B?TEU0eTUyeUUvelpyeVoxaEZBN2ZBTjBnTnZxN2pUVVZiam45UVc4NzljaFdC?=
 =?utf-8?B?L0ZLWFdSWGJ3QUQvUGRPVCtVOEdydURpOXdseU9Jbkd5SnFlRHB3WE5yWkoy?=
 =?utf-8?B?bWlhNWczUkE3UW1MMHdaT25SVzgvb29RMFFvMnBiZ3RxTkRDaytka2o3OUVa?=
 =?utf-8?B?OHVMbExVdDR4YkxIT0wrZVpZSDZJTm4rV2dMK2xCMS81RlhaSG0vdnhISXZY?=
 =?utf-8?B?Z0lleHZxcjY2Sm9QUVhuNGJ6K3ExbGp3ZmwrMEJNbTE0WnF1OENocUIwNHRz?=
 =?utf-8?B?aFV3clVlMFBWaHlENHNRZjRxcmJ1TGZ6Y1laVW4veElWQ0lHYUFhZnRSR1p2?=
 =?utf-8?B?ME5WQTZSd1ByaTVwM3pGMnlhTXZzalpFZHhxZTVnZ2xpUngrSGcvZEFNT3hM?=
 =?utf-8?B?SUlvcHhiZzVsV2xrYTNDdHZxQTM3TTlucUlteE44NVpVUk5wRThLMk1nV1V3?=
 =?utf-8?B?TWtDTkJRYWNDZU1mZVZlV3lBOHJsakNaV0duR1owaGo5RTN6MjJtdU90YzdQ?=
 =?utf-8?B?N0VsTnNFUHB4WmdmTU5BNXdpVTRhMlk1TDVuYlEyUGk2ZXJ3SnpqWHVUZ1Vn?=
 =?utf-8?B?L09oWEo0a0JoL21zMHRkaUxRZUZNMHE0Njg0V01SWmkrUUZVUmhBQTkzeEpi?=
 =?utf-8?B?cmlZc05LNlI1Q1JhdFdDOVFEWU9NeHB4R2hURzlwOFVYZVc3VC9JazJncHFS?=
 =?utf-8?B?TDY4ZTNZcVRrWTZVOHplbTB5dWFiMkJzMXhzMUdHSTlVMGkxVWh5WGE1QVQv?=
 =?utf-8?B?UnhYQ2J3U2h4UHZhYi8yOUcyMXBmNU03OFF5ai9aRVE2UWNFQmhMRkVHY0Fs?=
 =?utf-8?B?aUxERENnMVA4WWVlaFB3OXVTN3NodldQeFhyVnR2c3lFdHJpY2ZiTXU5eVFI?=
 =?utf-8?B?RnpXZkpTTDlxSEo3NkVYb1hGamhnZEtEbUVtWVlXb1RvZVVEUnRsZ3dxQjZr?=
 =?utf-8?B?TE82ZTNldzcrVG5JWXBNWkFnamJjTUZHV09MV2l0YjdYaXdOOEYySWp3alpU?=
 =?utf-8?B?bWxZZXpsQmtoU2ZMY3d6S3JQSmlvNGh2MXFsNXpsVnlMSkpnTkw4NW1iRGhz?=
 =?utf-8?B?N3ZRS2R1dVpldTB2b2xCWlJZU0IyMlZ5Y21mSktjL090OWloVDVPRmJJUnFJ?=
 =?utf-8?B?b3ZZM2lEdy81VDA2Q0Y1dTM1Y0Zpa3pzNHNJUi9qTFVWU2s0aGs5UTd3ZXhw?=
 =?utf-8?B?eFo0QSsyU0w3Ny80Q0llZ3ozbENEVE8wLzlyMm9XZFZ0YzBwY3RsQ1g2TU84?=
 =?utf-8?B?eXhIcTVyK0tCM3pPN2JDa2d2YUpuQ1hDNkQ5NVlSR2Y4WTdoall0c3dyc2Nn?=
 =?utf-8?B?MFROMGpyRTgzSUxZVk1VLzBKUjVsTDlrR3ZYbmZ6QmFPUDBmUnYzNTN1d1JZ?=
 =?utf-8?B?UCswSlhkZy9WM3E0Q2IxN0VpdlVSYTUrWmp4UW1OYnlrWkl2N0ljam9ZNERz?=
 =?utf-8?B?MU5YMUNpUklNUnhrUTk0S0taWHFZQm96ZlVzclA3c3Nkc0lCaTlvQjZZT0ZB?=
 =?utf-8?Q?5xhXbzH+X+Ii+WhI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c6d7ff-96a5-4792-7f64-08de73cd63fd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:51:51.7732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foyJPzRVlMVcffNJUozMwgYIvx8YmO/10qgZz0LgtEuPktHpgo079rt7cHJ8YlWalxMjj1HElnCXFsgfqF/ykccKvLRkIQ9vCUrv3mzsHm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
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

On 2/20/2026 9:11 AM, Matthew Brost wrote:
> On Fri, Feb 20, 2026 at 09:01:38AM -0800, Julia Filipchuk wrote:
>> This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.
>>
>> Previously this was reverted due to failures on LRC context switch.
>> Issues should be root-caused and resolved with GuC WA 14025515070. Now
>> setting indirect ring state is available by default.
>>
>> Note: Will be cleared if WA not available due to older GuC version.
>>
> 
> Is there a reason we need indirect ring state on Xe2? AFAIK, this is
> only needed for multi-Q or if we did user-space submission. I’d rather
> not have an officially supported kernel floating around on Xe2 with a
> mis-match of indirect direct ring state enabled, since it’s a very
> subtle delta that could surface in odd ways.
> 
> IMO, it’s best to leave indirect ring state off on Xe2 unless we have a
> concrete reason to enable it.
> 
> Matt

Thank you for input. Changing to leave off for Xe2 for now.
