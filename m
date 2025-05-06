Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39A8C3ABBC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5AF10E311;
	Tue,  6 May 2025 07:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCfHYNRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0B810E311
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746516424; x=1778052424;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YQLPUienzBi8lFDmdMwKh1TMZIApkGUhM/q3/DRBBro=;
 b=XCfHYNRbop2RV9EmitED5DOOulvsDs8jwRvmnrDROKewGiARb0EtpLTx
 wQvpd+2dysrDE/qvFZ/nwuwjHy50J1SOfq7tsyncnRqTyLsaMTPBh79wt
 xXsPg2b70Rp+mLChioNpDgzP+xGp9sbpGeu+s70yPb9DDWBQqLL1yldgv
 bqAPs1qc0CR13pNoI9v1i4hdr/xybHJmZYsX/8Nt8w3SxECtQWoSPWK6z
 8/1oPpfAeFCGAuQlugRwpQHBBx3vRD2zra0FrQNuVyCZDXEdYrtvovXi6
 IrI/11EnmsKB7hQeHMqV++PfBV6sU52zua9iL4ex/sNNaR9k5WVkjPzcM g==;
X-CSE-ConnectionGUID: OvshP65bQkCTuDnvAo6POA==
X-CSE-MsgGUID: xkyxz84XRpaCJKNjM98ARw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48299290"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="48299290"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 00:26:57 -0700
X-CSE-ConnectionGUID: z1HD+V5nSZ+QRZqj+q7gtw==
X-CSE-MsgGUID: eIiSsNmKT7WwUlnmVDY3uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="136048782"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 00:26:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 00:26:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 00:26:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 00:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICL4wQaBqYUqARuOCp2E7aDmPMQ4EB8nE0VpVgevCSPAjo5422oNth8maOzVV1ctToNU0OXD0AA4bLLrbTHuy3fEd1fjpIeoftnShUJZhpfDcBTEyD/0eb/WOVy86D4cVTbjamjlJKwiSNN+YhlvfNE0ckkNUmp/KMin287DfhvPcz9c14RUnOFHch2NGF9d3s7soiNQdd+PygHOCCNPdsvSqcCqJHW0l6eWwMI4SBQyzI79/hqAYCadJDhmRUM4lbYb2qRz1V6r8+GG8iTH8DLw0HUtG33VyrMXmY7zL7XwXMoUmWC5wmPZaXS0kmqJXa3fCalIQCxiqEL3N8F7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqRDqetGvMCcekhq7sF307TivLB+3VqgD2J8RJsF0mc=;
 b=E99QSDgIp9i3GF7ve+6+oMSDh9cm4FCaz7obWlIHGf5o/h6+MFpEEVzOzPraphucrh228UgmpRKTQq8x0ZBaEDiiS2sczIudyp3isUXt/C/j+tbwctaojbHqwd4n/dI+HJ5fDe2Cbv/5a/JB80yYX+NLzuFQjT6crTn8DZlLIbyCVsK9QdKD8Pw7DrtjSElAHTLLGDtpKzRGgogirnHhL9EkJ22Lqwzqkocy0vXc+M9VHWGGQnrOAgXL1bcwqgMAaKmYsp7ipZ+PQxIIk8tBno6Y0S/7dGDl3ZBt3qfGuedFawkoVVieAtsmEy4gMzu38+uQ83NeY/GGCa3DYVGOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 07:26:42 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:26:42 +0000
Message-ID: <26097e15-9e66-493f-abd8-5a5236a6ebe7@intel.com>
Date: Tue, 6 May 2025 12:56:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/hwmon: Read energy status from PMT
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>
References: <20250430203607.926585-1-karthik.poosa@intel.com>
 <20250430203607.926585-6-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250430203607.926585-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: afddfaa4-88a4-43aa-ff00-08dd8c6f5961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTNFYTVsd1RuRUdkeHphTGZITEVPRmVaaTRXT2puZWZnR2oraytiTzBKZnZP?=
 =?utf-8?B?UGQ4MjNSbTBqOUVTRDY2b1JKVWlVTmxDQ0RPL1RGUVhKUWt3eWVVOG5IT0la?=
 =?utf-8?B?WEtXSG9DNlU0SldGREovd3VBS0h5L2hYOUZzakN2OVRmWWZ6YjJDQS9mdDI2?=
 =?utf-8?B?TkhHa1lzeGtaWDdwTUM1aE1oejlhd2dGYmV0NXZuUjRrMlgwYzRkemZPeXlY?=
 =?utf-8?B?SERDMU00ZU1NZDFOc2FWLzZLZnVocU1oS1h1YWFSZVQ0WTYwNHhDb1hqbXRp?=
 =?utf-8?B?VjAvWXY4UmxEbmF4Um5mOHJRY2lYczhMc04zUldpUjF4RXpiL3g4WUdja3BE?=
 =?utf-8?B?WEFSNmQ1SW5PWHJ4b2NsYUQzeXo2UU1OTmhjM0k2bDU0NGdWK0RqUEFwL1Bx?=
 =?utf-8?B?ZTA2T1UzUTFGcDZ3SVgyZW9BUWtldk9CMVg5TGRreWFFQ1llYStMNEd3bG0z?=
 =?utf-8?B?V2RWUG1oQy9yWFpTcTdiZHdJcE03V3NhS3JjcWcxbmprUEtLWWgzazdybnln?=
 =?utf-8?B?dS9yVSs1ZVpiODhaOGNzZGFIS1U3Q2oxUEtJZmpEUWE3VHhRWnRaM2xJTDI2?=
 =?utf-8?B?T2k0bG9PZTNZcGxlMkM0YmpnWE9mek9vU0NZaDRhelFPU2VDdEY0M2t0cnNS?=
 =?utf-8?B?SUlhcjZVb1huV283V0xjNElMaHdyUERhTncrR0pVVDQ1bmJPS0s0QklNdjdM?=
 =?utf-8?B?VVhjK1ltelA2enVvRjdBKzRaQ3dGdUZXZU9GNTZQWEQ4VWNkYzk2eUltQmJ0?=
 =?utf-8?B?cFRyMlhTa2dmSHZrSVVyd3dkdy9Wb2ZQWm1CYXZJeU55cjNjb1pTOWh5UnVl?=
 =?utf-8?B?ZisyVUh2emEvNUhoakllWjZHNm5jSXBNbE1TcElua290WmtpenZiYklTazRn?=
 =?utf-8?B?Nk9PcDlRaTJRMzVEelZyZFZlZkg5R2Z4N0NUZHUvRzl0a1NUWk9WV29TdDRX?=
 =?utf-8?B?bERQSXV5S2xScFJwTDJXRWRIRWpoQXJtbjVGWXNVbTNOU0pxTjhHT0l4OFpl?=
 =?utf-8?B?WVNWQ3NGZXI0TEM4MHU3dU1qR1dHVmVtRUJjaEhsVFVXS2pZa2xMZXdubmhy?=
 =?utf-8?B?VXNjNnZFN2o2Q1FmQzVPM0lmeDJuMnVwQkF2d0p5K29VdGpuTFV4b0k5YkxF?=
 =?utf-8?B?K0x5cC9Xb0NMZ1NLVEtscTRKZ3ZxUkFHaXZZTTZKU3JJWGcvN0VHaEJ6cmpM?=
 =?utf-8?B?MWFJcGZzNmpweHFMclBHRUxwS09kai9veTlOdXdHbHlROEhXcWwvS1NnTWsz?=
 =?utf-8?B?djhMbjUweWVJTE0yVDAyTUdqLzVOeWpUOHdzMDdwOEpSTWN2RitVL1A1K0tJ?=
 =?utf-8?B?SFlId1hNcmxnUklZdHhYblc3anBMTkZ6N3dzZzA5NmlBVFdyeTF1TmtkcHd0?=
 =?utf-8?B?a3B5aFZFR0k2VDRBQTEyZGEzYU1zNWdidDFlNE9HTjJCUjlEbVFOeHB4WWsw?=
 =?utf-8?B?VlRXa3gvenl3bmZkWTM1SFZwYnpUWWQwaXdCeHgxdzBOdTRndzNVVVJWdHVX?=
 =?utf-8?B?OWR2OWhOMXc5TXA4U1RzemJQdW5acHBtUWU3UlZqdENHMHhmUUlrbnV2QTVD?=
 =?utf-8?B?d3FRY0pEbThQQXZvMC9tOWl5NTZJaFNvaUdMMlZLQlJpNzBNckRMRFZUVVdh?=
 =?utf-8?B?ODI1S0lUa0cwS0dnTjVzc1pISEJ4WFFETzcyZWlWZFJSYXVUK0FyMUpsMVcy?=
 =?utf-8?B?ZGQzL2RCSFlCLzBkTFhjTUF1Y1B3WWlyT1BGR0NJSHoxYWZSeDBPYnZxMXEy?=
 =?utf-8?B?MVErWWhBWmZ0VS82NmIwaThrd1RLZExMN3BNbVo4dGtxaVJxbHFrMGFra2R2?=
 =?utf-8?B?aEhOMzVHS2Q5WERtajR2cTI3eEdNY0R1V0FoYVJkWUpCejkwTyt5SmR1aUVs?=
 =?utf-8?B?YjkyYjUrVTJQRHlCdWgwR21GTy93Kzk0NTIwMkd5czVGbTUzRDhwWWY3QjdS?=
 =?utf-8?Q?3SAAB8ziGyg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkF4NU1ibEcwaDlkVG03aEYrL2V2bU9NMkhuTDBNUFRuR2JBU2lRQjRVTCtC?=
 =?utf-8?B?YUxibkJ5NHJNZEZ3enFodUtoK0FnTFJqWmlFZjM3dVJtMGNJeVRUQUV5VlRW?=
 =?utf-8?B?VWxvazI4V0d4SHROQU80ZmNrNmd3Rit0bVE5SDBjNms5Y05QcmMyYUxQWW93?=
 =?utf-8?B?NW1jRWhaUTlBeFJLRDZscGh6V1NQdk9KYlhOc1hoVG9XaWhsOVBWM1NxQkFp?=
 =?utf-8?B?VkhRR3dEVVVQRW1QbEk0S1ROWWJIOXc0MTA1N0N3UFI0cVIxUG5zeUhBd3g5?=
 =?utf-8?B?b0xra2xLVWlKM3ZaN1JKcFVLQmhjTFgwR0JBa0haSWRrWndkY2ZnYjlSNGNZ?=
 =?utf-8?B?NWQrQ2hEOE5SNUd5cE9tMnBRR0NURkNEQmlPOWY1ZVJ4U083N1laa2pPWThm?=
 =?utf-8?B?dFAxaTFrYkt6cVdwdlcvTjJ3UENFbXBQNlhPTlVwS0M1T1M4a1ZnczBEMGtH?=
 =?utf-8?B?YThuVURkL01TNVNoTk94SDR6MjhFcVpKU1ltQyt1K2thVDk5OEVwemtZVy9a?=
 =?utf-8?B?ODJ2MzFiMStxM016NjNmelVWQjlsWGkxZFo2SXVHTzhMcGNOMTQvSzFaZTc3?=
 =?utf-8?B?YVczdmhaOXBvejdNV2hrcnY4RnhpdTNmY0tKRmxnM3Ayd0dMSjZmUlM1aGta?=
 =?utf-8?B?VTY4bEhuOThKTzhMTkIyaERSY2duSzBFeGExQndaRVpES2dyNm92aGhXdXdK?=
 =?utf-8?B?b2ppc3lFUGpkeVppOGhjRldYU3VUT2p2bXpDU3hIeXRZLzFkM0VJSzNGdmJx?=
 =?utf-8?B?VVJxV0IrQlphU1IxTC9VcEdyalFOR24rWkV1ZDlDb2ZCZDZrTk0rejhHNVI1?=
 =?utf-8?B?RTVXVzhlMTRIdHFYeTY1Q3ExczJqcFFBcllnYWtTNEhYQ0Rxd3F2U3FDRlFx?=
 =?utf-8?B?cjZQR0w1cUw4UnBpTmVMNHJCL2hEaDFFbDArazFzdVhIaEtBY0lRNW9ucnZm?=
 =?utf-8?B?ZUV4Sm1qcEFUbXk2dXpEU3pCSk9XY0Q0K1FieUptMnZLSFpTd0RCTGowZnZ0?=
 =?utf-8?B?K0ZnZm9pZVdkeFBlaTlvTURWV2NweExkR0l4cWhYVnE5bWdTYkR3U1d1WlNP?=
 =?utf-8?B?WW1mUTRiOGliNEhOUE9jL3BJRXIwbHpmUndwdThMSmZ3MVg3SGoybDE1THNy?=
 =?utf-8?B?UzBwRjN5QUY4RDNXdXU3T1Fjd1VsSjlBUkxZNkJJKzVBeWxCQ3Q2T0Voblgz?=
 =?utf-8?B?Ym50bkxLbjVwb1hLenR3ME11MHRuNzl2Z2x2Zjh4cnE0cnFtV243T1VPWkdC?=
 =?utf-8?B?Qjk1YnIxMjVHZnF4ajN3L0tqREZQVnhKUGIxUFd6OWw4OU1VWXdCTG9sSTZE?=
 =?utf-8?B?ckFLbUZkTW9JNnhjb1h4ZFMwbmNKbHNmSTN6TnlLd1Jldk9RSkRuekYwN09Y?=
 =?utf-8?B?ZTVKWThEcXVLT01ZRkg4YVkyTFJmM2syYkhpY21OQXRCMEJnNW10aUJVc3RZ?=
 =?utf-8?B?Ukxab3QxNWJyVCtyd0Vqd25DYk1UUWJvRGZ6bVVQWWI5eDZhYUN3SlpDbDNK?=
 =?utf-8?B?aVAxWEhYSldoQ3dyKzlWQmJHNDV2SjRKM2tBMGhLSHhRVkxMMlluOVBVeE9P?=
 =?utf-8?B?RTJtT05jRm9TenNjbWJodjcxNlBQVTN5cXNVbmloMHZtMXBQKy96dUxQUU1E?=
 =?utf-8?B?ZUJwd25hSG8rV2NrMmNzTVFNQ2txdWhGWE1FZVpxQUo2WS9hcTRxN0Evc0c0?=
 =?utf-8?B?cURYeFpFZm9TTnQ1amhpSGxOY1p6cUQwSjRJbHc0bk82TGl2NlZXck5idlRm?=
 =?utf-8?B?NGZNcE84ai84dkQvcHRpd1o1a1p2UXVqR200MzFyem9GV2QzQW5rRzJ6cmo4?=
 =?utf-8?B?Y09XM2RvZmh3ZUprdFNzKzhmc2o5dXVnOFZqb0UrcWk0K21URUtrY3RhSXJC?=
 =?utf-8?B?dVZ5TURzUktOc2gwOFRrU0x5UjM2VkVzL0N1RkdFQkdsVmc5OUYrYnBOUy9Z?=
 =?utf-8?B?dE1ZaEI4Q09GOFU2TTNoamhYVlRHakRETktZZnQwWHNZZC95clpNUHZIQ1ZK?=
 =?utf-8?B?ekxlMnU5dWU1WS9oRnc4TW9EZTA0NjQzV09xY0dBQ3VVNC96TnZXZUZtajlO?=
 =?utf-8?B?U1hqc1MvOHNxVGIyR1pTNUR4QndvTjVKREFVWW4xcWdwSjQxMzdFUDZDeE02?=
 =?utf-8?B?NXNXVG9LeVlGTHI1ejRYcHYvT2NCZG5qV2NnaGhCRVdsMjd6Mm9rOGVPNEdL?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afddfaa4-88a4-43aa-ff00-08dd8c6f5961
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:26:42.6945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPpyVO8G/DyfXS60JRREvgAUwiEUxHpH576jDynuPrh96fqX+yZM97Qsq9KXPF6d5Go/E6Y9tpESevWamHbD+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
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


On 01-05-2025 02:06, Karthik Poosa wrote:
> Read card and package energy status using pmt apis instead
> of xe_mmio for supported platforms.
> Enable Battlemage to read energy from PMT.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  3 +-
>   drivers/gpu/drm/xe/regs/xe_pmt.h        |  2 ++
>   drivers/gpu/drm/xe/xe_device_types.h    |  2 ++
>   drivers/gpu/drm/xe/xe_hwmon.c           | 46 +++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_pci.c             |  3 ++
>   drivers/gpu/drm/xe/xe_vsec.c            |  4 +--
>   drivers/gpu/drm/xe/xe_vsec.h            |  4 +++
>   7 files changed, 49 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index c7d5d782e3f9..487a01455f2a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -20,14 +20,13 @@
>   
>   #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> -#define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>   #define BMG_FAN_1_SPEED				XE_REG(0x138140)
>   #define BMG_FAN_2_SPEED				XE_REG(0x138170)
>   #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>   #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> -#define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>   #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> +#define BMG_ENERGY_STATUS_PMT_OFFSET		(0x30)
>   
>   #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index f45abcd96ba8..ad91f6fef6bb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -10,6 +10,8 @@
>   #define BMG_PMT_BASE_OFFSET		0xDB000
>   #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>   
> +#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
> +
>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2c8321eb41b9..cfac809dd7aa 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -330,6 +330,8 @@ struct xe_device {
>   		 * pcode mailbox commands.
>   		 */
>   		u8 has_mbx_power_limits:1;
> +		/** @info.has_pxp: Device has energy status in PMT */
> +		u8 has_pmt_energy:1;
This flag is not used anywhere, better to drop it.
>   		/** @info.has_pxp: Device has PXP support */
>   		u8 has_pxp:1;
>   		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index ada8c15829a3..349eb27d977b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -20,6 +20,8 @@
>   #include "xe_pcode_api.h"
>   #include "xe_sriov.h"
>   #include "xe_pm.h"
> +#include "xe_vsec.h"
> +#include "regs/xe_pmt.h"
>   
>   enum xe_hwmon_reg {
>   	REG_TEMP,
> @@ -263,12 +265,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   			return GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_BATTLEMAGE) {
> -			if (channel == CHANNEL_PKG)
> -				return BMG_PACKAGE_ENERGY_STATUS;
> -			else
> -				return BMG_PLATFORM_ENERGY_STATUS;
> -		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
>   			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>   		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
>   			return PCU_CR_PACKAGE_ENERGY_STATUS;
> @@ -449,9 +446,29 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
>   	u64 reg_val;
> +	int ret = 0;
>   
> -	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> -							channel));
> +	/* Energy is supported only for card and pkg */
> +	if (channel > CHANNEL_PKG) {
> +		*energy = 0;
> +		return;
> +	}
> +
> +	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
> +		ret = xe_pmt_telem_read(to_pci_dev(hwmon->xe->drm.dev),
> +					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +					&reg_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(reg_val));
> +		drm_dbg(&hwmon->xe->drm, "energy from pmt, ch %d read from mbx 0x%016llx, ret %d\n",
> +			channel, reg_val, ret);
> +
> +		if (channel == CHANNEL_PKG)
> +			reg_val &= 0xFFFFFFFF;
> +		else
> +			reg_val = reg_val >> 32;

Could you please add the GEN_MASK for this.

Regards,
Badal

> +	} else {
> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> +								channel));
> +	}
>   
>   	if (reg_val >= ei->reg_val_prev)
>   		ei->accum_energy += reg_val - ei->reg_val_prev;
> @@ -927,11 +944,18 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static umode_t
>   xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> +	long energy = 0;
> +
>   	switch (attr) {
>   	case hwmon_energy_input:
>   	case hwmon_energy_label:
> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> -				       channel)) ? 0444 : 0;
> +		if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
> +			xe_hwmon_energy_get(hwmon, channel, &energy);
> +			return energy ? 0444 : 0;
> +		} else {
> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> +					       channel)) ? 0444 : 0;
> +		}
>   	default:
>   		return 0;
>   	}
> @@ -1278,4 +1302,4 @@ int xe_hwmon_register(struct xe_device *xe)
>   
>   	return 0;
>   }
> -
> +MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 95a2a458e8f7..f49452e4ef08 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -67,6 +67,7 @@ struct xe_device_desc {
>   	u8 has_heci_cscfi:1;
>   	u8 has_llc:1;
>   	u8 has_mbx_power_limits:1;
> +	u8 has_pmt_energy:1;
>   	u8 has_pxp:1;
>   	u8 has_sriov:1;
>   	u8 needs_scratch:1;
> @@ -345,6 +346,7 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_display = true,
>   	.has_fan_control = true,
>   	.has_mbx_power_limits = true,
> +	.has_pmt_energy = true,
>   	.has_heci_cscfi = 1,
>   	.needs_scratch = true,
>   };
> @@ -588,6 +590,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.is_dgfx = desc->is_dgfx;
>   	xe->info.has_fan_control = desc->has_fan_control;
>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> +	xe->info.has_pmt_energy = desc->has_pmt_energy;
>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>   	xe->info.has_llc = desc->has_llc;
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index b378848d3b7b..3e573b0b7ebd 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -149,8 +149,8 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>   	return 0;
>   }
>   
> -static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
> -			     u32 count)
> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
> +		      u32 count)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index 5777c53faec2..6d0db46d4700 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -4,8 +4,12 @@
>   #ifndef _XE_VSEC_H_
>   #define _XE_VSEC_H_
>   
> +#include "linux/types.h"
> +#include "linux/pci.h"
> +
>   struct xe_device;
>   
>   void xe_vsec_init(struct xe_device *xe);
> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>   
>   #endif
