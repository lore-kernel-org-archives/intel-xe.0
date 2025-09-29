Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45B9CAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 15:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F1510E450;
	Mon, 29 Sep 2025 15:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O22lZEwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838A10E44F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759159066; x=1790695066;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mTNYIyXQvcPtwxpZiHBJx6uZ/B2/kwCtzkJKp2T5gMY=;
 b=O22lZEwkSWiRLm8ulUJdzr05BV9KVoj465ZhekwWVPkZ84g9yvYSC7uQ
 t6PSBu1Rb2XwtI2Z9V9mGPixNcXxvM/ltnqj0Ny5h3mWFO4JROSs0oRcv
 2U5+vUJ4GKgWcSukPTSgUjJYXLfF690YV6bQy3Soc2BnsjkGEbKiSXbPH
 saIT8pSHjcbsyy0yV7GSKCNCXbiau+YHmsJZIRNvpSxOMR7vYEu3HcqDy
 USWl15RX9O0jRxsh5gU6uQY5czr8OPf51n+LY0PsBHs+P0b/t4dJCmxa1
 87jyOYjP/S2bGGaMHaIN25HGdGT8Ki1+KKdHlUilo8AAcpNJDKhWfytxM g==;
X-CSE-ConnectionGUID: OeeSoJC2STmi4szuF0aoZg==
X-CSE-MsgGUID: 6BLV5BCLQdSiA6gIexySmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60436758"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="60436758"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:17:46 -0700
X-CSE-ConnectionGUID: d234uxzkT36zS4bot4ELSA==
X-CSE-MsgGUID: hSwuZP5+RMu4/3q7mYn0BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="182675498"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:17:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:17:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 08:17:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1wpLDWY8L/IokJu44NVK1cRduCCRBvUHfgmENQEpMBUU1Do3D6hS0b/+3w0hoJr87mWGWc/3dVsa401T0F2USKcwGGAakGMv/A3IKPzoeAWQvvLGm7NwEAKSCUXexTlFU8RI0w5azIGo7RiuWwU8OHWh6S0DKxCc7oS/bWdQ5a267Hzr1x37BWSJoFq6x0JlHpTJ1Zt9cB+IRjPylutS1FmElRmOqMP4ZYYyTtDyrPFefDHbTlPfsW1JAb79qvGgmMDGwMayM/rzZqQIRsVdfUSgCvFq6RNUHetPbpgpsS4gRAjjTquXwcKB9SfwVmFW6Hbi8AkMveHv9D6HASdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq0v1fSEZ4h5Y07aX2OTY6W1aQo3bH9w0I9+evcsp0I=;
 b=DJnuwv4o6T81kRVH21zL77t1cfYNo2JZCfrm+R14JhDk1RG6MmlmLtoO6XdtxYRbHq9A9zlpZ7uTtkw4YA2tKwfIBCRR9Uc/fv9se1XsqHvdfaUGTmJKUrMxo4+9Wx60BkD+Jv0k7o2bENyqjRAbON7uR15vYO5Pym5qfqya9OU8SWj+hjJpq2mUToRSWNmzocCcMSw3SWLoPKARn650ZR6x4x4OHLB7zJMzDXVXC+eNqRytUrOL9v47JWJdHrk5ZytID0l2WgJ+guCsTGT1P9yDkWF1a79rCtPXaehpObnUsKKl2y/Q5XG3DgDzYmYaEXcl0Qj3X9ta1pZ3WCyVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by BY1PR11MB8030.namprd11.prod.outlook.com (2603:10b6:a03:522::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 15:17:42 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 15:17:42 +0000
Message-ID: <7caa086c-d90d-4ca8-ab1b-7241e9d8c0df@intel.com>
Date: Mon, 29 Sep 2025 20:47:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 36/36] drm/xe/guc: Increase wait timeout to 2sec after
 BUSY reply from GuC
To: <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-37-matthew.brost@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250929025542.1486303-37-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::19) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|BY1PR11MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: b76bb4f4-3bbc-4dd2-6452-08ddff6b5582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3pQLzdiYTF1bzA0K0xJZXNiZjV1b0ZoZ0NqeVBuS0N1MGVHdXF1WG11Nk5j?=
 =?utf-8?B?NEt5dXhaVXRCUys0L0oycW1xTWdxUmUrWThwTGlqeUk2d09UU2VBYU5VOTFL?=
 =?utf-8?B?Tm95UEp4YXZwNURmRklXdjgvUnFjNVl0N0ZGU1NwbkhrNHJsZEFzYmt5NnRn?=
 =?utf-8?B?OG95a2FwRjFOYkk5TUtlVC84bGNxZDhpVEVXMnlCWEJVODlOSU92Tkd2d2Yx?=
 =?utf-8?B?QXZrcVlnZUd0ckg0SXhZU0tmbDdyRXlIL1crREpiUjVHQTRmWnpMUmdjK3lD?=
 =?utf-8?B?S3IrZjg5QkhERVRyRjh0dlo5bnBXWCtna3pqc1lnVVBRVmEybzVaNzNjdjdJ?=
 =?utf-8?B?SzJXNTBRQW82QVdqUjFCVjVIdVZFR2wxMGc3aUdoMG4wcEtrTlhqZjNSOTlG?=
 =?utf-8?B?Z1R5ZWNRdkNKT21KRjEwVVZnbDBFaGgwZjZScElEK2lCTlZBQkhlT2ZJWlpn?=
 =?utf-8?B?U044bFJjWHRzSzI4dzRZVUlpTTMydUtJLzZEVWk0a0JuWVk2aGxSQkRJdURZ?=
 =?utf-8?B?SFNCTEIvY1F1Zy83OTdNV2swM3dxeHUrMHBheTUxN1QzaThPS1pHa2ZJcTJX?=
 =?utf-8?B?MlNhSzAwUG1GcWxBdm5jLzdrUkJsSlZrRlZwSGxiSHY2ZFgrSGhmbGp1aHhG?=
 =?utf-8?B?U2pYbm95RmhDeHZId242ZTdFRmszVTZWL2NCZG4rTkdtc2FvSGVRTGJZWFM0?=
 =?utf-8?B?Zlh5L1JkaGpMbzhYbFVZWlVEaS9USjNWaVRQSHFUUEdNL081MVdTQU1DWWFo?=
 =?utf-8?B?c3R3c3dKc2JWZ0U3dXpvL2gxNXZ4dGM4KyszRWpNWnNUSXo0OXVZcnllSm40?=
 =?utf-8?B?NUovYjRVRk50NVA3QTBpOHZzSUpFYitKRkNSRUpuaTZRd1pyTklmblM3RUhQ?=
 =?utf-8?B?ZGo0THZJcWhGUUM3QVk1OGxza0lxaDBReklPNlpKWXc3SXJST1RlekdNU0RC?=
 =?utf-8?B?QlpocmYwU0laVEVKVnF3TnBmNTFBSGRKUTdIRXlmaTVyWE1Pbnh2MU85bkxj?=
 =?utf-8?B?NWJHZ3Y5dFFxS1V1MVBJdWp0bnk5M3NVTjAxRS91WE9SUzhlZm9RZmIwZ2Vn?=
 =?utf-8?B?RG9PSCtOK3E4M1hiK0NSUGJaVDNnZk1SbnZIVUd2VTNodzYzM1k3bEdQNmk4?=
 =?utf-8?B?NlF1TTRhS1RLYThMSXZkNlZuVURTM2cyblVKaTRWMmJzaGIwc2FMUXMrZWFI?=
 =?utf-8?B?OXJiQlFoUEkyMFZuMjJ4Qk4veXdwdHRmY2N0eE5oTStXV0lqZVV4NDlFazdI?=
 =?utf-8?B?cWF5cG9ZRUFacjRrcUJQZEpsdkhrMUxDeWw4Z0FVVHRsNlE4NmFxQVp1NVQ3?=
 =?utf-8?B?dFhsRE1TZ0VvY0grMjdUbzBSUlpMamtmNk4zMGNvYW1vaFl3Vi9FN1VaZDdm?=
 =?utf-8?B?emhRaitOMC9lNmxlZVdRNllUYnlFa2JtTnV0S0FUVkovemZOTzdmK1B3Y2RN?=
 =?utf-8?B?a01IaTI2Z2xhZHJKTTh5RFh1QnFkdTJjakhHcGIrcWdSaVZCbzZDMENRNU1C?=
 =?utf-8?B?RjR2TTFwaDRmZU9yRENNS2xyUnlBVGdMa2ZaYU5iWVRlWEdqZFp6M0pxVG1Z?=
 =?utf-8?B?MkVpbkRnUVEwMFZKN2N3QlNyTnZMcWdWbmZIaStrdVFYYlQxSHRtVjA1OTF5?=
 =?utf-8?B?TkhFeXhONktITmNxMU8vZ05uWkZuTnliVG9zeVRQS29EU21pZWowa1k4bVJT?=
 =?utf-8?B?QTdxUlFCYTVWUzE0Unk1YUc2NGg4VHZXNWU4RGdKdG9saEc2b3hOWTJVZCtS?=
 =?utf-8?B?Tlg4V2podWxMc1RPTkZSSzhkR1BCd25YT1lmb0VHQlNhQ3BSMWk1T0p2ajR5?=
 =?utf-8?B?S3pRcWRHMTY2MXVlZTNuYnVFenFxN1N5cHNGOTBLbUJNT1RTTU4vNW1mQjFL?=
 =?utf-8?B?WnhrMUVDOS81RkJVUzd0eXlSQ2Q3UUJjOFkwQ2cva1FFK2RtWW9pTi9tV2k2?=
 =?utf-8?Q?cfXAmFYnS6WIgdlhLKJsSXbHEfTpj23g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGxueFQxbndoYnkxcE1Bckt3WmYwbGdNY1U2TEV1SGZ5NysrQlNQaXJwYndS?=
 =?utf-8?B?ME1ycUtqek5ZdEJUc2M2bGRKVU9qb0Qvdm9xbWtwNENHdGZKMjhQc2VjQmcx?=
 =?utf-8?B?TlZpRDliYlRvQnIvcWpTRHpTVndacjd5cm9ERHRkM0ZVMnoyRVViK2xQNnFk?=
 =?utf-8?B?aTljSGN3L1NScGdsMHZhVFU1R0dwUDRNdVNlQ2tuQ3g2RlB2eGpkWlpzZzNK?=
 =?utf-8?B?cHlvcXozUWhKYmRaTjlic2lMZENzRWpFbWVPd3dSaHEwNXdpeVJsakZoUDUz?=
 =?utf-8?B?azl3dkZ3TEtQM0NTNWViMzJUMUdtSDlVMWQ4cHVka2xNTUZKUGg3VnM1K05Q?=
 =?utf-8?B?L0M3T1o2MHJDVU1wcFhJMzBFSkVBZ3U0eWJCV0YzREs0TnV4SHhOblhoOEMv?=
 =?utf-8?B?VXVEZXREak05cU8wdzQrYnBJOVArVlhGVHNkTVIveDVxSkQ1Nk1TY2xSY0RK?=
 =?utf-8?B?aWtjZlF5Um4xNER0Z1FlOWw1Uy9rMnZTZExwN0hmYmFRUU9LTEcvRXdOd2Iw?=
 =?utf-8?B?Rjh2dlJtd3FVK2VybGdTMXV2UDUvSytjcEJBZHRnOTFtL0FNajVCVmlHbTlp?=
 =?utf-8?B?WVFvWVhjTzdTOFpuaFYzZW5maHZWTE4rUEpUUFZjakdmdmVybjNacWdOaklH?=
 =?utf-8?B?eW5QK3VlaFBBVkhnZmRVY0c4SythUjEzdmpJeXowYURSSHovVENLM1hDNW9p?=
 =?utf-8?B?TXJUbDdSNmZrSVRVRWVFeHVHeEl4RThKWTd4R2k2TWRHOWpIYkwxL1BoUUp2?=
 =?utf-8?B?bEVTcDdTOEM2WG8yTzhNWVJjc1RydExPbCtCR2EzU1pld2dKMHdXWVdCZVBi?=
 =?utf-8?B?ZGJDVTNlU1FrWklJT0xvM3l0YkZwdXJ5UGlzYzJ4eXQ1UkQvODRuN1ExTGRo?=
 =?utf-8?B?WDh4RXJQUHQ5aUQxV1RIU3pVeGJxR0ltdTEraEduUzVLaG1DVzNXK2dzZFZt?=
 =?utf-8?B?TjhXZmNxV0FxdStkbFF5L3ZEeFczS1dYb09jdXlOTGNjN1BBdFFWVnFLcEZB?=
 =?utf-8?B?Z1hvdGlBV3hjQm0yeHN1aHpHa3J4VjhJd09Hek91ZUtaU2ptaXk5WFJ2aHVk?=
 =?utf-8?B?V0dEa2JsWG1xNm9qNmpMZjhhYW5WNVl0U2pCQmVRUXFqZi92aXdKVWxONjRj?=
 =?utf-8?B?eGZNR2JEQUsvZURvQ3doTFdyVURkN1dpME5Vak45Vlg3S2xrUXpubjFLMGhP?=
 =?utf-8?B?S0NMT2FHeUdabmhzWWdUZk4xS0ExdVZNMVVVUEU0YXU2ZXo1RlFKdCttVGV2?=
 =?utf-8?B?elI3YXAxem5FeEhSaEx6QUtPYUdJRjBISnZMRndicDgvNHNoOTBWUVdtZFUw?=
 =?utf-8?B?MTQrV1BtMUovWTV0QW9ZdXloeHZYbTdKcUtCdFBnanN4MGlCTHVmZWFlL0RY?=
 =?utf-8?B?R0tBVlEzL1FJVndIckVvdytWcGVzR00rUkY3Qk44RmdybHc3bDdxRXlPSWw2?=
 =?utf-8?B?Q2FxL0JuZjJLZXltaTB6MFZnWE5FOEhGVncvRDdkL0orOFZGQnArYkthZ0dz?=
 =?utf-8?B?N0ZlOCtXSUNGRmtNdHhoa0pXai9teEVrQld0MTJaU2ZRQUVYeUM5N24zS1RN?=
 =?utf-8?B?a3ZPcDdEUThqRTNvdnQ5a2NvaVZTM3g2TURsUEgzVjVQYWMwWkZmUzdVTlFT?=
 =?utf-8?B?Y1RiRHZPTTNydzRWeElFOXJ6V0ZhNDNVVE43TU9NS2crazdWSnNXcXpUMHR0?=
 =?utf-8?B?ZjZ2N1oyZXZxSmtEd1FpSmlFcDA5RjlTb1ZjSHRVNUEvVXdBWGMwYmk4U1B5?=
 =?utf-8?B?OW1leXVzdGpZdURabUkrR21McWhEbWYxUUthcCtCM2xCKytHd2ZOT2oxUU4v?=
 =?utf-8?B?a3BTb1pYVzBsbHBQQnV1R1FLWWM4T2IyVm1ucVZ3Y1l2US9RRWMvVXlYL285?=
 =?utf-8?B?c2FxTzR0aFdPNXgxcTJLaVpJNW1aZlAwV1hrcmJHQXZyVEcxdUtuN1lDd095?=
 =?utf-8?B?emVKamRRbEZjaEErT0VxYnVqOTd5dm9sSzJYM2NIc010Nzh2VVVveXlmNmZ1?=
 =?utf-8?B?cU81REtCQnVnUWhJL0Nac1ZEb3Z0S21WZ3hWckU5bnV6ayt6Tlh6cFY0Tmho?=
 =?utf-8?B?OGI0QXBTeWQ4cGVxU3BJbHVmck9pY00vRGh4RnQ3QVE0a0lCR1gybVBXRHlC?=
 =?utf-8?B?R0tyYzBQMWJmMTV6d3hrNWYxUkV6Y2J1aGpJc1hiY3pCS1NTeDNURk44eDBw?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b76bb4f4-3bbc-4dd2-6452-08ddff6b5582
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 15:17:42.2007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Csta7qiQ0Lik/y9TXywsG6hXYq3jUL2h2DnWut62gLWiVsUkIEUG84mdBJS5UvOFhLQbmpxduUBvPsOQuDrQVT04pjqMGCpK3KgugdJqHIY=
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



On 29-09-2025 08:25, Matthew Brost wrote:
> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 
> Some VF2GUC actions may take longer to process. Increase default timeout
> after received BUSY indication to 2sec to cover all worst case scenarios.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c016a11b6ab1..f0de1fa61898 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1439,7 +1439,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
>   
>   		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
> -				     1000000, &header, false);
> +				     2000000, &header, false);
>   
>   		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>   			     GUC_HXG_ORIGIN_GUC))

LGTM.
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
