Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C8CCFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2259410E07B;
	Tue,  2 Dec 2025 13:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G01w052H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267810E07B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764682351; x=1796218351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0GS2Wt9X9FUgwKP4T8N4JqxE4RyKh3pZaqeZealc1mA=;
 b=G01w052HViDHDgBwTxWaYsaAH9oknMOpOINK6JiDgEEZ/D3ABfz0sJPt
 QX6mVPRPlFoJHqtyA+H0KYVDlkJMz7a1qgO0kasvPJWyf2C2+mNBDIGuS
 XyoFKlGxZbwvreUh3IhzqvE86yB2ShtsUPyhIpCVcZLzPlVg9oegU4ETV
 a4ktWGcEqP4wusDegf27FRYZnDwZiFSIJ2sS4M2vr6fxEr+6IXqmCrZIN
 axieTKy9kXlv9XW56vumdGnvbA4UpYx16Re/broqmkDPfzVBIHRiOHB7x
 7508AvvFFPMZtJtJrrlb+nFVMK/umEOQmKL6fzXFm4PuJyf66fEkBeeSg A==;
X-CSE-ConnectionGUID: yE35Q6obT4W3rgYz+OK3TA==
X-CSE-MsgGUID: vj0xg2cXRJq1GH48OucRLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66592033"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66592033"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:32:30 -0800
X-CSE-ConnectionGUID: GS95schjTW+jegbFDM6vEQ==
X-CSE-MsgGUID: 3iQJr14YSMyxiD8vFslI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="193671119"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:32:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 05:32:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 05:32:28 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 05:32:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM1vz2r8cyMAdvgKd1EBHxD2wqOJRT7fIi1zaU7D/SPmfXT+Kxe+v1Y9qdIbD0guR3k2QiQafgy/8lArTqVG+Ck2NKVeCmQaYLKXcy+mBRmiDhEiZ7xFq+G45T4FPWF+q5J41brw+yrXTJVcw1eZS7tqwj8R5HWSeF0GZF7GyZ/d+ybi8Ot9/zAHSRUBjbMmb2kg8dqnBH0NGEgLo6UTUZ3/N09PSKQ9z/4MROr2kEyIlZP37UmjJvLRYbHmiPpkiePAek29BR5Zix2IRhGRXNxih7B2fWysqzgyq86xF5FXrg99H9w1gaG7dKFHohsGQbPZ/z0ujgbaN/asqJGoqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0boWoJh47Rk7LqBgPeLnudg7mIIJOggkEhW2Of3Kdos=;
 b=UFC5Tb4Cc/TmGeVOeCDJzGWUFgRydRBndNVpebwrg4gKc+2zhsIY2UtVegtGSdMtL+AxzUlVgkBKeN1pNMUItmv4OQpLNI06VwZmIGbpIbV9xACS8+Y0cMD+xXT/dvsPb+DWvCkKuCm1rRozEHvgiHT3lOHF06RCACO4FZ2CwtmxxNMVS8JONFq/F3ih9Oodk3KvrTzZmfdk8bPfTOUMtoUb2xwqNZ4uU6B3+J6i3I6ePqe1CMUuQTQ9gbcUwNBRBenT5BE/sTRZmksXEziwa3HDF5WO3GO/0Oc6e2j7N0G2tcJFnk/z7cd57FbPwjKibrROu4SMwHV3YcdNxk61EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BY1PR11MB8030.namprd11.prod.outlook.com (2603:10b6:a03:522::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 13:32:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 13:32:26 +0000
Message-ID: <f9690fe0-a3b0-4ecd-a488-72457440a8c8@intel.com>
Date: Tue, 2 Dec 2025 14:32:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BY1PR11MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aef1a7d-6ea0-4d5b-c24f-08de31a73b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3FOTDBNZ05UcVNIZkFKTUlhb0xxZjdsWGdOMkdnUXVYOTVOWlVFdERyNDlD?=
 =?utf-8?B?YWNNTyswVGtNdFBwZVdoVFRieTFkSjRvMFhTVTdxMHBWNWh4bnRUQnpkY21i?=
 =?utf-8?B?RzVoQU1xaW1CT2lKTTM2U2o1bHpJdnp4K0haRDFZZUxmUjVrdTJXS3JGMU5L?=
 =?utf-8?B?dVh6cGhJekZOV3J5MTRlNjlNQkx3L1ZYQ2JLVHZiRlRpc3hxbjRSckIzQ0Jj?=
 =?utf-8?B?UllxNFNHTndaMlRPWXJaQjRKWmY0MWlhS0xQZzZoR1FCYlhDVHdtYjl1TVZ0?=
 =?utf-8?B?T1JITnVlZ1VhcWZtOW9nMWIzOXQ3MVpacXJMUk1Gc3dpckVScEUrVWlnb1Rh?=
 =?utf-8?B?THYrRFVta3RuZWcwSFIvZ2pSRFBvd0NweUJNQmFFOEljM0dSUXpqQjlySG12?=
 =?utf-8?B?TW5iaTFrNStNbnh2RWNEQVFPV0RBaWtYcm01OGx3cDBHNitJSDNlZDB3Y3kx?=
 =?utf-8?B?VEtVODl3SThuTlZMY0Z3ZE9jcVVocXBvbmlHSTdzeWs2WTZya3NVSVFPdFdl?=
 =?utf-8?B?MldWeUJqK2ZleXkxbU53d1R2NGVpSFZjVFQvWkhlaFBBeFZva1RVMWc3dVZN?=
 =?utf-8?B?WUZPcldVTi92SzRCWkNlSUZKOFRFOE03blA2VFVGb01zL0VNUTRsT1Vjc1VC?=
 =?utf-8?B?R0RtcjhlS3VLamdqWXl2eUpNUlJFRTNaSFVibGp5V2xxNXN5V0F2RVpsTG9F?=
 =?utf-8?B?bHZhZ1cvUEFyUUNnb2pYdjJqVGEwRzZFV3ZjbmlUNWkwc2IwSnZWa1d4dklZ?=
 =?utf-8?B?SHhhMG13bTNvUFRDc2c3Y3FZUTRyaWFYN0t5a243NHVjaElHQlcxYXhOcTZi?=
 =?utf-8?B?cEJCbVNGS05Qb3lVd3RlRHhuUG5lMEhoeTk4azB0aHMvWWdKTHQrWE0xc3g5?=
 =?utf-8?B?VGtkcUo2aUFPbTB6dnZ4bldwTmZ1alpRSTFrOVVZQUtyUkJDZ2dRU3lpa1h3?=
 =?utf-8?B?ekU5dHhjV09GOTYwT3hkd2pYZjhyWExhT3BxZjAycytZT2o2dmR0TVJpYXBy?=
 =?utf-8?B?SWVWcEVzUWtoWDdwOVJ5Y2VTdWF1UWZNSmlBM2R0TXRPZkNucDB1STB6QlJo?=
 =?utf-8?B?K21wek1nRUdzTXpQQXN5TVlUOHBsRzFmWXBFaG5ib2hJR3F3QVAwL251ci9U?=
 =?utf-8?B?bXJ0YkNxalcxalNDRmszdFFuTDRaSGljd3JWcjB1cDF4cHM0L0FmWmFqZzhj?=
 =?utf-8?B?a1pRT0duMk51NEptR2FZYVl0cjlGNTJZQmhvS2ltSUg2SzhGZklacnRnOEc3?=
 =?utf-8?B?MHpKaWRIY0g5aXhRRVBiTzhoTG5GTzRoUXFNWlZJWXV2alV3bE9ocS9SMWNR?=
 =?utf-8?B?OHJVcEkyUFNHS0hta1ZFU0Rxam1tN3R5b3JpcW0rL3I1Tk9oV0RIbG1WRzJV?=
 =?utf-8?B?K1AvOStVdFVzcHdWbGk2VFFmeUJLU3VvTVNtMVIvTVdYT09XazNDYkpkcXlu?=
 =?utf-8?B?NGNXQkxiQzNaT1JGSEdRZlo0N2J3a2ZvSWMxS09DWFozdW1JZStWSkRmNStS?=
 =?utf-8?B?bHNkUnRlNXJtWGNUaUQ3d3JxTlBidkt6QVBxRldlZTg4THdOUFg2ZmM1bUpV?=
 =?utf-8?B?MVhDZndQaUpwSmV2YkZhekk3djdUVlpUU3RFUUJRRERhUHhmWFExSFZsKzZI?=
 =?utf-8?B?dnBaUmN4RGJGZC9BQ0JHeXFzQSt1M1dzQWNlQjNuRmRTT0RSZFM2d1lyUTdu?=
 =?utf-8?B?OCtlNFhPcSsvZlVZK2ZDMmhPVHVvREp5TGp1U09wMVhDK2hNM2hGWDBsZlZl?=
 =?utf-8?B?YzdGMjEwMjlrZmFkbC9vM003aitjWktOUUFmTjdJdnQ5QWl1MWxJYWlzcnhD?=
 =?utf-8?B?b3hxQldRUG92V3JkVWFvb1M3TEh5UkV2anU0NXRJMmZxSzkwYW5neE12WGRn?=
 =?utf-8?B?UXYwdFZhS2ZLTThYdlF0bklSak1CUUVlbGhlcHhLUjk1NnFzbEJUMjJVU3lX?=
 =?utf-8?Q?9k3YsUQg7aExMgiYViG6Sl5qaO+WUgo2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2tqTTl6d0ZXa0FTVHBtMVBtUkhna2hxTGFpaUFhVms4Vms4T0ZjT2hvR3Qw?=
 =?utf-8?B?bkJLc04xZTdKYTQ4OWhmckZvZ3BoWE8vTUV6dXhFOE5LRVAxNXZHcUFmMkE0?=
 =?utf-8?B?eDNkTW0wRm9EMlRKaWRpakxZdys0L2F0dC9nTmpNNEZ6M201RktncjRqelJP?=
 =?utf-8?B?Vkd5ZWd5MHY5TFZOR1VoREE3eVRLaDFiQU9pREUvYWlITjA3Z05KODhsTDVE?=
 =?utf-8?B?K2NvSEUwZGl5VG16R1I0MU50QnVsdGNjT0RaOHJnRitNdE43N3Bndm14cnJF?=
 =?utf-8?B?dFdZcHM0QVp6RCtuMmt5ZzcvT1dPM2R4N2Fsajl5YlNFa0toVWMwQ3poUWE5?=
 =?utf-8?B?WGxXZFRpRC9vZmxGZVEzdmt1QU80cUJQa0JMRjFicUF5SlY4dWo2NGtVQjdH?=
 =?utf-8?B?b05zRVJzQUx3MWl5eHZncUlYZXR2TEsxZnJUbWplbFVLdDZWOFFlRjZqejdw?=
 =?utf-8?B?d3BOSG5VbzI5cGpQNzJSemJaMDBpU2NWMUM5ZlF2MDhTMUYvMmxWYXJoOEts?=
 =?utf-8?B?YjVGbVFtWmV2L01McFM3eExsR3BsaHZ2OWRORTJHQmx6dG9EUDRpWFB0M3NW?=
 =?utf-8?B?M3VzZ0RxLzhNSkRJc0VQMmJXQUI5cVBzdUc1b01TZTl3TnE4NFVXcWFKYm1V?=
 =?utf-8?B?MEVVbDFtRFkrTk9wVVdSaGZpdFM4a3BNWmlYTi9VN2U3RitZSlV1SjV6VGNn?=
 =?utf-8?B?TThlMmpQM0RvL3VwQ3BhT2NhZTRZMjdlS1JkeG5EMHcvanBTOHJKdXhaeHpM?=
 =?utf-8?B?VUNYMTJjOUt4dEk1R1V2cjhHbFdVaVNiWVZFMDAxN2dvZlU3NysxUDBJZEVC?=
 =?utf-8?B?MVliU1Z1YjVUelJCMWdJUkUxYzN4Umw0K285N1g0NUJGZ3p3ZTEwV3R6Mkpj?=
 =?utf-8?B?Uy85aDRoZEc1M3piTVlrTm85WlpkN1Z2R0wxV1RnZFhMMnR1eEttV2JqN3VV?=
 =?utf-8?B?RDRjd1FGREdHVG1zVDQrRzE3VlVMNjhNRUMzZ1htT1kyUFUzbUlGZUJrcDd5?=
 =?utf-8?B?WWR3NmhVOUkwS0tyMVlUNlh3bG9jT3BwUk56eUZUTGNhU01oK0pjY3RQdFZ1?=
 =?utf-8?B?WkxlQ1FKWmQzVTY4TFJBR2pMTWc0d0c0SWwxM2Y2SUlGSnQvVXY0R3R5S2dw?=
 =?utf-8?B?K0pwMkxQSTlMSkdxdGN5RC9RTE1OZ1BkcDFpMjNxbG4wdXNVU1dyeGpkUHVE?=
 =?utf-8?B?WlJqZWRhMVROUmx5OXB3UDlUMHF2ejdFdVBOZzByUGpYSEQ4R2FiS2M3NXRt?=
 =?utf-8?B?N1hmY3pkeExRVlNGL2loOWhXbEwvd1FZM1B0WjBMcmJheFJrc2xJWTVHRkJZ?=
 =?utf-8?B?bHd4MStUSXpLRkJ1M3l0S2lFaVZxRHNaV0o0MWxScGVJZmhnVjhNU1VLY1l6?=
 =?utf-8?B?c2lmb1RWSFFaNEF5VUI4R29wazdtanRaMGpPeWVOSjkxb0xSenFlUEp2ZDlj?=
 =?utf-8?B?RVk5WFo1NmEvUklLUE5STExmTEZubmFmbjRIaUF2NDRnalpxMDhNOG43V25S?=
 =?utf-8?B?OThubWQyL3lQM3NDakVuRFh0OEl0ZE8vUDNWMk1VMXhwUmRuWTBETHdOcHBn?=
 =?utf-8?B?OGM5aitnUVVnNUxZc3RLaGVMeWtuQnJwbDdkR1VQMnh0QVRKY1ByRmwyTjV1?=
 =?utf-8?B?WmwrZ3BDOHZxQnRmUkJSU0ZlSUFQY3NyaXZoUno0MHliaWZ0L1RTRThuV0V2?=
 =?utf-8?B?YXFWUE1zVWZEcVVUTW5Xa3dWUWxNcE1acXN1citIcVJvN2lUdTNLK1IrTHJJ?=
 =?utf-8?B?SksyTjZPYUFuR1hUTHE3em1VUkVFcFVGQkxVQW53TU1TaithZHhraVhXUTk2?=
 =?utf-8?B?YzdjNDdWV1FqVkFocDlWVXZhZCtDcjlkMEZ4U0xmakUwWmZET0E3azhoMmRI?=
 =?utf-8?B?Um1DQlNkRmF4VWU2ZE1KTmlzeDA3ZjFrd0x1TksyVllnbnNUOFdDU3RwYUk3?=
 =?utf-8?B?TXYwb0dLS1g1MjlUQlNQK0N2bzF1TG8zT2dSU3pZeU5CTGF5V2J2NFBtSDZV?=
 =?utf-8?B?K01VcEE2NjJxSTVpbEVWUzFXNGRUc2RjQ2UyeEdoV2lLS05kRTNhOWhaSEh5?=
 =?utf-8?B?cXhtak1CQXJ3dzhxS2RaNjhId2lzcjZldG9DZmdkOTViMEdsTWgvV0RJaXF0?=
 =?utf-8?B?d3l3VHNuZ2FPMTZaVm5Pc1g1djJTcWE1MUZZSUh2bFM3N3hOdStGUHBpeHRU?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aef1a7d-6ea0-4d5b-c24f-08de31a73b84
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 13:32:26.2303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqakLdV2uaj5N/jKNTdAtiWHwaijdYrXz8pKDFbo9PEeMZd9E+VUxoAfbeSp17TfoAma4VsFkCABDGVc5BiZSv100b09MjmkTaX2wqjAvlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8030
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> Since engines in the same class can be divided across multiple groups,
> the GuC does not allow scheduler groups to be active if there are
> multi-lrc contexts. This means that:
> 
> 1) if a mlrc context is registered when we enable scheduler groups, the
>    GuC will silently ignore the configuration
> 2) if a mlrc context is registered after scheduler groups are enabled,
>    the GuC will disable the groups and generate an adverse event.
> 
> We therefore need to block mlrc context creation when scheduler groups
> are enabled.

s/mlrc/MLRC

> An adverse event threshold is available for the new adverse event.

changes related to introduction of new threshold deserves separate patch
(as we need to handle GuC FW version checks)

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 +++++
>  drivers/gpu/drm/xe/xe_exec_queue.c            | 19 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 30 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 59 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  2 +
>  .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  1 +
>  8 files changed, 129 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 274f1b1ec37f..a6dce9da339f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -46,11 +46,18 @@
>   *      Refers to 32 bit architecture version as reported by the HW IP.
>   *      This key is supported on MTL+ platforms only.
>   *      Requires GuC ABI 1.2+.
> + *
> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
> + *      Tells the driver whether scheduler groups are enabled or not.
> + *      Requres GuC ABI 1.26+

typo: Requires

and don't forget to update xe_guc_klv_key_to_string() with new KEY

>   */
>  
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
>  
> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
> +
>  /**
>   * DOC: GuC Self Config KLVs
>   *
> @@ -369,6 +376,10 @@ enum  {
>   *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>   *      :2: HIGH = schedule VF in the next time-slice after current active
>   *          time-slice completes if it has active work
> + *
> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
> + *      This config sets the threshold for LRCA context registration when SRIOV

... threshold for _Multi_ LRCA context registrations ...

> + *      scheduler groups are enabled.

"This is allows PF to monitor VFs' behavior when EGS is enabled."

>   */
>  
>  #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -427,6 +438,9 @@ enum  {
>  #define   GUC_SCHED_PRIORITY_NORMAL		1u
>  #define   GUC_SCHED_PRIORITY_HIGH		2u
>  
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
> +
>  /*
>   * Workaround keys:
>   */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8724f8de67e2..e59c41c913b4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -16,6 +16,7 @@
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
> @@ -698,6 +699,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>  	return return_mask;
>  }
>  
> +static bool has_sched_groups(struct xe_gt *gt)
> +{
> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_policy_sched_groups_enabled(gt))

hmm, usually we don't want core code to look so deeply into PF subcomponent

also, do we want to work in hybrid mode where one GT is using MLRC and other is not?

> +		return true;
> +> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
> +		return true;
> +
> +	return false;
> +}
> +
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file)
>  {
> @@ -790,6 +802,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			return -ENOENT;
>  		}
>  
> +		/* SRIOV sched groups are not compatible with multi-lrc */
> +		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
> +			up_read(&vm->lock);
> +			xe_vm_put(vm);
> +			return -EINVAL;
> +		}
> +
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
>  					 args->width, hwe, flags,
>  					 args->extensions);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 48f250ae0d0d..c7f1ea8eb9c5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "xe_bo.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_policy.h"
> @@ -527,6 +528,24 @@ static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>  				      masks, num_masks);
>  }
>  
> +static bool guc_has_mlrc_queue(struct xe_guc *guc)

this is all GuC stuff, so export it from xe_guc_submission.c

> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +	bool found = false;
> +
> +	mutex_lock(&guc->submission_state.lock);

guard(mutex) ?

> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		if (q->width > 1) {
> +			found = true;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
> +
> +	return found;

what if new MLRC is created right now?

maybe we should use xe_guard to lockdown one feature or the other?

> +}
> +
>  static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>  {
>  	int err;
> @@ -548,6 +567,12 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>  	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>  		return -EPERM;
>  
> +	/* The GuC silently ignores the setting if any mlrc contexts are registered */
> +	if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {
> +		xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
> +		return -EPERM;
> +	}
> +
>  	err = __pf_provision_sched_groups(gt, mode);
>  	if (err)
>  		return err;
> @@ -600,6 +625,11 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>  	return err;
>  }
>  

every public function needs to have kernel-doc

> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index 36680996f2bd..89aa3af6cc7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>  
>  int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4c73a077d314..7a180c947032 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> +static int query_vf_sched_groups(struct xe_gt *gt)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 value = 0;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
> +		return 0;
> +
> +	err = guc_action_query_single_klv32(guc,
> +					    GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
> +					    &value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
> +				ERR_PTR(err));
> +		return err;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "sched groups %s\n", value ? "enabled" : "disabled");

str_enabled_disabled(value)

> +	return value;
> +}
> +
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>  	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>  }
>  
> +static int vf_cache_sched_groups_status(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	ret = query_vf_sched_groups(gt);
> +	if (ret < 0)
> +		return ret;
> +
> +	gt->sriov.vf.runtime.uses_sched_groups = ret;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> @@ -593,12 +632,32 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	err = vf_cache_sched_groups_status(gt);
> +	if (unlikely(err))
> +		return err;
> +
>  	if (has_gmdid(xe))
>  		vf_cache_gmdid(gt);
>  
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_sched_groups_enabled - Check if PF has enabled sched groups

    * xe_gt_sriov_vf_sched_groups_enabled() - Check ...


> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: true if shed groups were enabled, false otherwise.

typo: s/shed/scheduler

> + */
> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +
> +	return gt->sriov.vf.runtime.uses_sched_groups;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..2e1d34c0397f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -23,11 +23,14 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);

move it there [1]

> +
>  int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>  int xe_gt_sriov_vf_init(struct xe_gt *gt);
>  bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> +u32 xe_gt_sriov_vf_sched_groups(struct xe_gt *gt);

unused ?

>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);

[1] here

>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..5267c097ecd0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>  struct xe_gt_sriov_vf_runtime {
>  	/** @gmdid: cached value of the GDMID register. */
>  	u32 gmdid;
> +	/** @uses_sched_groups: whether PF enabled sched groups or not. */
> +	bool uses_sched_groups;
>  	/** @regs_size: size of runtime register array. */
>  	u32 regs_size;
>  	/** @num_regs: number of runtime registers in the array. */
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> index 0a028c94756d..3e55d9302855 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> @@ -32,6 +32,7 @@
>  	define(H2G_STORM, guc_time_us)			\
>  	define(IRQ_STORM, irq_time_us)			\
>  	define(DOORBELL_STORM, doorbell_time_us)	\
> +	define(MULTI_LRC_COUNT, multi_lrc_count)	\

this needs to be defined with some version info, maybe:

	define(MULTI_LRC_COUNT, multi_lrc_count, (70, 53, 0))	\

and then in encode_config() have two variants of code generators:

#define encode_threshold_config2(TAG, ...) ({					\
	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
});
#define encode_threshold_config3(TAG, NAME, VERSION) ({				\
	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER VERSION) {		\
		encode_threshold_config2(TAG, NAME);				\
	}									\
});
#define encode_threshold_config(ARGS...) \
	CALL_ARGS(CONCATENATE(encode_threshold_config, COUNT_ARGS(ARGS)), ARGS)

this should fix the issues already spotted by the CI on ADLP:

<6> [133.603624] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x8a0d : 32b value 0 } # multi_lrc_count
<6> [133.603625] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0001 : 64b value 0x200000 } # ggtt_start
<6> [133.603626] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0002 : 64b value 0xfec00000 } # ggtt_size
<3> [133.603653] xe 0000:00:02.0: [drm] *ERROR* PF: Tile0: GT0: Failed to push self configuration (-ENOKEY)


>  	/* end */
>  
>  /**

