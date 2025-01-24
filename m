Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E95BC02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 11:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E038910E25E;
	Fri, 24 Jan 2025 11:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYw/Ptjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C41310E002
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737719967; x=1769255967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eUQs51ZAd72bpB2HGP817NW2a7R/i+9ytIEHltEHW10=;
 b=RYw/PtjxjkW6VVXUctB7CKzocr0OkjPz7Jy9MTKEpCS+gB5EhkRqG+7T
 1PEq+3XC+1UX2DPNnwfiDFBSf7qkVe9oevFtf4fmLWnWyWBIqG6oH8A4q
 2xIPPl5inghEsRVP5l74gaKwjnn+Xo/VnqO0e2UjSbMNN7PTKmuDGJFqu
 /GwAG5badAAdqJpchVWk0H9Yf01R9jvrDvfJCjbMOYh0cyzxUD8NwwE1U
 L28yiS2KYuO8HUKdMQLq6TtfhR7qD9smPfOw2ORX7RnF1VRmATcNzlyBE
 PUEfsdELRtc/6HOSlgob9qP8gbfB3LawsCIMqb1m26ImAT4QjhgqgLXhB g==;
X-CSE-ConnectionGUID: uio0YIqjQ6qVXTij4zjxEQ==
X-CSE-MsgGUID: tyI7oUBjSMih/Aw0komwCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38394630"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38394630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:59:27 -0800
X-CSE-ConnectionGUID: hNYJLcGFRci/SPWhsOiTHw==
X-CSE-MsgGUID: 3tOOKNZZS/W1Xxd9OQWwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="108292202"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 03:59:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 03:59:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 03:59:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 03:59:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+20OkOMQET/uHVYdBJF/EQTd3QUg3iur/YNdAaqP+rXjzgo+LxzXv+bdC++ZQGRehN3c71mOKfXLAgSbrG+3zaUqWrqtoDiis72bAADSey4tcNlesl77Va3OWTHbE/dusowHivpveXKJg3hZoz1gZZwhtv1i/E4qwKFimjSVXawbe7VEDaJj7I4pGH+h+tr1lvVKir/6L7kHXCxSDs2HJ3+CdlDwRzTMOnrc8I45MRF733JoSpY4FnzjSeC5a2K2N0oThNzXoDKVjbB22aU95uxT+kfCVN0bvJ/c0SB+4wnfZmNCRf0joL60RG8ASbNpyNRgqIeflLyEychJxwuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBl/jBwPaEObEOMxS/quof+1vHDJ2NXG0CoDNyQz42w=;
 b=b/9TVeI4g8FklSD1UpJnic0JbndBii5gYfHT0njFMKs4AGEQrQef4JwrM5Ze4Oasmt5UTgZvcJ/KVtMF24xcrRC4+ELXqV8W3eqtTCq7HgfPMZkZFbAUaiqqdjMit1N4slhZOp6+peoDY5z1iUGFShSIvyzrMnuJf3Zp/OJTU6aFy8Ik+coClRpjU7uZD+FM2jWe7o4IfxfUw+HqflXVxNwqraYdIOQSnFNWI5hmJy04y/Rhyimvg8tCEirJWzu3U1TaB5swv2iA6GgBZoTnF1wq/VYbWDaCv3cTgH7wq0hEquzPasiNqz61petdooCslEslgizKQWJfcTK4zB/TgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 11:59:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 11:59:23 +0000
Message-ID: <a79e18b1-49da-4f14-bd7d-06bc497fa004@intel.com>
Date: Fri, 24 Jan 2025 17:29:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
To: Riana Tauro <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
 <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
 <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
 <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c23e17a-dc2b-4d41-49ed-08dd3c6e8ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlNwY09SYUFwd2k0WHdvZHVUVzJoUUgxM3FUak1SQ1duSjZpRXNCdGtYejVw?=
 =?utf-8?B?a01FMTk3UkFZeGUwK3JsazBlL1ZIZk1RU3hRb2Vuays5TDZPS2xMTHNBVXdz?=
 =?utf-8?B?WFNSMTA0WU1rNmN0TDNSTXdadnN5VjZQZkU2ZmluUGZqNDJ5ZUFHSDM2Z0cx?=
 =?utf-8?B?WkdraXNQVHV3ZFlNakdyTktrRmpJQUcxMCtVZkdMd0dPSmV6Z3ZjaUp6bDlq?=
 =?utf-8?B?TzFmSlh5YVpCZTZNRFZmM2FFL25iRGZBdi9zeW1XRVd2ZGtBZVd6VEdxNW1j?=
 =?utf-8?B?YWppMnZ4Q1Jua29tVVVDcUZPT3g2dWdoNVZMUGtzdXc0OUFMSmFNWmNZNjdJ?=
 =?utf-8?B?OXJCNEhMVTE1ZjhpS0paZ1B0K1dHRWs5STBkR2lVRStham0zWlI5YlhRRzlH?=
 =?utf-8?B?ZEpRSWpnNlUzTkRtZFNOemJlZGhQT3cyclZUQm5MZzlMekR3TW8wdWR4Y1g5?=
 =?utf-8?B?N0ZQc0taQkE0QytWYUVlNVpINTdqc0FpbEwyNzNFU2dEUFJ2TUYzS3ZQSFVp?=
 =?utf-8?B?V29uZXpDTVcrYzN0ZTU2N2hPMGlKMFZzdkhFTFExd3dUMXMvYko1bVVmdGhh?=
 =?utf-8?B?RDdaM1N1UkV2Rjl5Qlo4YWpkVmtjWFdBRCtvMkpxbnJyZ21JMTVoY2RRMW1i?=
 =?utf-8?B?ZmNRclQxR0NNbnVxOFp3SWlKQVlnZzRDWUh0TjI5N0F6d3NCcFhja1dpNStk?=
 =?utf-8?B?R2xUWkdFcWh0aFdYWlpTbnIySm9vV2Juek0vZzZLbU1jOWhNSHJoTXJZQlZn?=
 =?utf-8?B?Z1RybkVWZUZQeWxmRW92MDZuT0NKYm04Yyt3bTBpbmZNM2xHZFdQRXNGOTJp?=
 =?utf-8?B?MTB0RGFmdHNNQ1hpSDcxNXpWRXNUcE5nMDlwaGVySzFZZy9tNityOUh4bXZI?=
 =?utf-8?B?emxON3EzNVA3YjJBYmVDWWtwTFNqUjRVQXFFZ24rcHNramJJMTJaMjhiZ3d2?=
 =?utf-8?B?SHhERDkwS1dOZlhqRXI3aHFGNFJTUFJ6TWpjQWYyQU9lSkZROUV2OXZIaUp5?=
 =?utf-8?B?eDFDNDk1d3RQQTlHMmxxQklpK3dDRWppM0FPU0xpcVRRQkROR2JHY2xLa05Y?=
 =?utf-8?B?ODFYU3diTG1kMkhpV2FPUmZmVTZLWXJuUHJkVjhtaDRxQkpicDllK2VHa1Vp?=
 =?utf-8?B?L1BucXhHK3NBV29mVmdlNkovZ2NHenRqZSs3MWxaQmpJSTIvVHNSeVVERnJ4?=
 =?utf-8?B?RFA2QUdyZHdpQ3BtVWZWS2J1VFZxMFBEeXJwWFpMRWxmN3JLMWFPV3FyaWxL?=
 =?utf-8?B?Uk1iNU1PQXF6bXRwZFd1UkJGd3NGWUdwbGtPdHRtNTN6NWkzNnZ2V0h6Q1Mv?=
 =?utf-8?B?QjlzWHc1alRPTG10TEwyMEprZFE1OU43NE9nQUVRNmpTUzd3Q0hVTWJXcjZu?=
 =?utf-8?B?RkFCTHZBeTBDS0NkRHNHa0dlb2lnblQvTzV2TXJUdWU0RWFuR0hCTzh6aEE3?=
 =?utf-8?B?RjQ2WFlEcjZoaW1GenNkNEh0VVIzQStQOVVyVXpjMVF6bFR4SGkyc0hxeXJW?=
 =?utf-8?B?S2dlWm96TW4rQXZXaklmanJ2aUJRb25uUGpEUjlza2ZBZEg2QXJjWlJMYnA1?=
 =?utf-8?B?dDBQejluRDhmWlVxWmpSOHFocHRRVXJ1emVicTR4WDU4V0R5emRwZVZkQk1J?=
 =?utf-8?B?b3BGcjJPVkphZThxV2RVZmtJUVNlaUF1VnNERHRweEp2OFE2Z1BGNnJ6eWtF?=
 =?utf-8?B?WUNDaEo0VUpubWozeDh2U3R0Qjk3dDFmd0o4NnVMbEg5NjF6Mm9MUEpqcUJl?=
 =?utf-8?B?anNZU1hiSjhmcEg4NDNKRGhrM0JJN2tQaU4vUGFDVUlxN3dXNTEraWo2RCtQ?=
 =?utf-8?B?a0RBajNJWnM3WWYrRWdyblRoeG5MSHJZL2JSWERWNnFJVDNUTVB5ZElVdzR3?=
 =?utf-8?Q?iOqYG2TcBpyIM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anhRS09ObEF6ZFNRU2JDSkRzMHdFbkRMcHp6VitnYVhNMkhwU2NwUG4zb0xo?=
 =?utf-8?B?bHBkS0lQRWdoRGlXeWRhTE9hcE1WeTJGbEtjbDZHL3kwdVhCaXR1bndvYmRJ?=
 =?utf-8?B?ZG5tMmNRMDEzSWJqRlc2NjAydUhuR3lOZ0tlYzNrcEdPNUhWRkRSU2FWZVFr?=
 =?utf-8?B?ZVcwWXV2SU9ldFJwTFBpMU1ZbEZoL21LaWxITXBJelplSlpTS0U1RkZwajJw?=
 =?utf-8?B?aFJhMEozRWtXUDc0OCtaTUJ4VjVVYUxQTFZsQmFka3VUMVJRNUd5WVJDeVc3?=
 =?utf-8?B?dFdXeDJvQ09HOXlxanRTaFo5SkowVFZZQ0lBeGpyVkw0VnRSWDNKdEU3MDMz?=
 =?utf-8?B?R2JYODI2R0tmdWxMcVNiODZtTFNRc1F5NVJhRUZmaGNiY1BsaVYxWC9RYUhO?=
 =?utf-8?B?aVdUbmZ5c01waUo2cVgvcVZBRlByUDVuaUN3ZE9PZmxwTXZjakJIS3liOVla?=
 =?utf-8?B?dWFUUlZXeFl2bk9lRmxIM3RUTE55bjRQTWx0ajVXS1ZDS1NmQW4zYVpBU2xy?=
 =?utf-8?B?SWlqajJWd3A1ejF5andObSsxWUhWRjlIYUV2RFBUR2FWUjl5aHZwKzM0Mlhr?=
 =?utf-8?B?dlZaOFBiYlRVc0M2d1JGT3UrekFyZSt6b2xOM0Fjb3BzSGRDRHVuMTJLbGFX?=
 =?utf-8?B?eXA4QW1IUEV5Ymo4S1Q3ZTR6TXJUMHlzYVlPQmhOdFBUMWE5OWxTUytia3hr?=
 =?utf-8?B?a2tWYnorM3Jpa004Y3Q4Ykp2c1diN3J1cVo5aWVEblc3Wjl1RiszZDRhaEdm?=
 =?utf-8?B?STFkNTRISGFBYkMvNjVCcDhPKy9TU3lKbzhzc0Voejcrd2lrZXRBTXd6L0xU?=
 =?utf-8?B?M0VycjdVVzEvMFUxZUkybVMwZHc1a2VZUGJYaUlNLzFCZ25rR20zSDE4czhL?=
 =?utf-8?B?bndWV0NkZmZtZ0ZHWUNoZmJ6dGFVeXZDNFJxcTVQbUlhU2pzR3pSejl0Q1BH?=
 =?utf-8?B?SnFLSnI4aHVIRkdDem9NT3Jxb0NnekVET3Rnd2VxU2VHWkw5c1ZMNUwxdEtX?=
 =?utf-8?B?NmdRMUNNSzNSMTQreHdOSytnUldjN20yMktFdVU4M3BZaUFWem8yM3ZDRlF6?=
 =?utf-8?B?NzZOOUhNMnVFYk94QnNGWERXcktHRTZpYXMyNW1Rc2tWOVhaSVE1QmZzRVJk?=
 =?utf-8?B?UTNFTDl2QWNjY2dVUXdKcTZWZDkzNGt5K3VWeEd3VEhhWGNCRGVaQzE4RnA1?=
 =?utf-8?B?Qk1Hb1hwYmp0bVVlUnNlT1B0QWxsVVd1bFY2NUxoS1B0bi9wRlJmR2pVRlJN?=
 =?utf-8?B?NHE2blhCTEg0Z05PdFhFUnM0TXZjRnB2eFVuRUhIMHFYVGxHQVVZM2g1SGJC?=
 =?utf-8?B?M01zcW92VEI1cGJtaU4xUFluVjFPVjF2NG1ieTVxRzBqeVFxVjhKaDArZ25z?=
 =?utf-8?B?U05SZWVDSXprUlpwc0xqa2xEUXJUT1dIeEhvOUpLbGdUWUQxKzJLbDRzUEFt?=
 =?utf-8?B?RUMvMVA3TitSMWY1czAvdk9Qcm9TckVIc1hQN08yd1ZTMHovS3BNT29ITlVz?=
 =?utf-8?B?Vi9CdEJTeFc1OXZoTERIRXhNMUx5N2hVd2pkNm5SUW80N0txbVlSMHRWdlVV?=
 =?utf-8?B?SUxUYU01UHNMTEU2NTBpRTA5Yy9YRTBDM3JzbTJMQ0RycGQ0N3BabTJ0dGU2?=
 =?utf-8?B?YW54QXZMQitBckp5dmh2Qi93T21MUjJlUWdkazJJcHBvdmloRjdCbzI0aDlL?=
 =?utf-8?B?S3pJRFM4TnNFVmVRRVMyRk0xd2lVV0NnL2lxV2hKMWpPWW5Qa0FBTG9jdkdW?=
 =?utf-8?B?UmtLaVhwc3pvdWx4dzhUaHY2aXp5RWk3YkYrNkhaZEx3c2FEUE1Ob3hRcTR5?=
 =?utf-8?B?UE9mNVhXTnFJZllydktPSjl2eDVKLzlBSFFFdW5mTUMvT3VUSVhZNmQ0OFFq?=
 =?utf-8?B?ZGVaOG5tdjcxK3J1ZlVOWXdVb09XSGtrSElXYmZraGpWYXcrOWZPeUNIeXR6?=
 =?utf-8?B?a1czYnlaVktJV3RHTU9jYmNLa2E1WWxCdm95THp5OGhIVGVSZjZ6aFI2dGNT?=
 =?utf-8?B?Ry9SRWhlYUlyR01hSEt5YnJsbXZJamtkNFU4QnYvRHNjZ2dWSlRWYmhYUHpj?=
 =?utf-8?B?d2t5WlZ1ZUVpQ3hjNzhLcDBwOXhnVlNiblpDYUZ3K3FxT0tubGRFWXJ2bi92?=
 =?utf-8?B?N1E3SWdwbjZ2K1p1V2hNOFltVkp3T2VVQUQwMytrRkF6bUp3TFVSak1Wb0ha?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c23e17a-dc2b-4d41-49ed-08dd3c6e8ab8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 11:59:22.9399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vocyhfimtbTD1DocwLb0bgs2824h4xrGWJuM18tenzjXWdcfiYIldNvVY059TBDrFKd7T1jFI5LXgsXSSK2vWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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


On 24-01-2025 11:46, Riana Tauro wrote:
> Hi Raag
>
> On 1/23/2025 8:21 AM, Raag Jadav wrote:
>> On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
>>> Hi Raag
>>>
>>> On 1/8/2025 2:54 PM, Raag Jadav wrote:
>>>> Add hwmon support for temp1_input and temp2_input attributes, which 
>>>> will
>>>> expose package and vram temperature in millidegree Celsius. With 
>>>> this in
>>>> place we can monitor temperature using lm-sensors tool.
>>>>
>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>> ---
>>>>    .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>>>>    drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>>>>    drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>>>    drivers/gpu/drm/xe/xe_hwmon.c                 | 63 
>>>> +++++++++++++++++++
>>>>    4 files changed, 84 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>> index d792a56f59ac..998cfb0ee1a6 100644
>>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>> @@ -108,3 +108,19 @@ Contact: intel-xe@lists.freedesktop.org
>>>>    Description:    RO. Package current voltage in millivolt.
>>>>            Only supported for particular Intel Xe graphics platforms.
>>>> +
>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
>>>> +Date:        April 2025
>>>> +KernelVersion:    6.15
>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>> +Description:    RO. Package temperature in millidegree Celsius.
>>>> +
>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>> +
>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>>> +Date:        April 2025
>>>> +KernelVersion:    6.15
>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>> +Description:    RO. VRAM temperature in millidegree Celsius.
>>>> +
>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>> index 519dd1067a19..f5e5234857c1 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>> @@ -34,6 +34,9 @@
>>>>    #define PCU_CR_PACKAGE_ENERGY_STATUS 
>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>>> +#define PCU_CR_PACKAGE_TEMPERATURE XE_REG(MCHBAR_MIRROR_BASE_SNB + 
>>>> 0x5978)
>>>> +#define   TEMP_MASK                REG_GENMASK(7, 0)
>>>> +
>>>>    #define PCU_CR_PACKAGE_RAPL_LIMIT XE_REG(MCHBAR_MIRROR_BASE_SNB 
>>>> + 0x59a0)
>>>>    #define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>>>>    #define   PKG_PWR_LIM_1_EN            REG_BIT(15)
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>> index 0b0b49d850ae..8846eb9ce2a4 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>> @@ -21,6 +21,8 @@
>>>>    #define BMG_PACKAGE_POWER_SKU            XE_REG(0x138098)
>>>>    #define BMG_PACKAGE_POWER_SKU_UNIT XE_REG(0x1380dc)
>>>>    #define BMG_PACKAGE_ENERGY_STATUS        XE_REG(0x138120)
>>>> +#define BMG_VRAM_TEMPERATURE            XE_REG(0x1382c0)
>>>> +#define BMG_PACKAGE_TEMPERATURE            XE_REG(0x138434)
>>> indentation.
>>
>> It's a git quirk, you won't see it in file.
>>
>>> Also you are using the same for DG2. Should have a common name
>>
>> Just following the conventions.
> Did not find this convention in the file.
> BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix. 
> Doesn't seem right
>>
>>>>    #define BMG_PACKAGE_RAPL_LIMIT            XE_REG(0x138440)
>>>>    #define BMG_PLATFORM_ENERGY_STATUS XE_REG(0x138458)
>>>>    #define BMG_PLATFORM_POWER_LIMIT        XE_REG(0x138460)
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> index fde56dad3ab7..5b5c844adf4a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -6,6 +6,7 @@
>>>>    #include <linux/hwmon-sysfs.h>
>>>>    #include <linux/hwmon.h>
>>>>    #include <linux/types.h>
>>>> +#include <linux/units.h>
>>>>    #include <drm/drm_managed.h>
>>>>    #include "regs/xe_gt_regs.h"
>>>> @@ -20,6 +21,7 @@
>>>>    #include "xe_pm.h"
>>>>    enum xe_hwmon_reg {
>>>> +    REG_TEMP,
>>> add to the end
>>>>        REG_PKG_RAPL_LIMIT,
>>>>        REG_PKG_POWER_SKU,
>>>>        REG_PKG_POWER_SKU_UNIT,
>>>> @@ -39,6 +41,11 @@ enum xe_hwmon_channel {
>>>>        CHANNEL_MAX,
>>>>    };
>>>> +enum xe_hwmon_temp {
>>>> +    TEMP_PKG,
>>>> +    TEMP_VRAM,
>>>> +};
>>> Can't the existing channel enum be used here?
>>
>> Nope, that'd break the indexes.
> @badal/@karthik Are multiple indexes for the same channel okay?
>
> In the current code, for dg2 only channel 1 is exposed for power and 
> channel 0 skipped. Something like that needs to be done here too?


Thanks for looping me in this. Yes, Channel 0 represent card specific 
attributes and Channel 1 represent package specific attributes. That's 
how it should be followed.
With that BMG_PACKAGE_TEMPERATURE should go under CHANNEL_PKG. For 
BMG_VRAM_TEMPERATURE new channel (channel 3) should be added in enum 
xe_hwmon_channel.

Regards,
Badal


>
> Thanks
> Riana
>
>>
>>>> +
>>>>    /*
>>>>     * SF_* - scale factors for particular quantities according to 
>>>> hwmon spec.
>>>>     */
>>>> @@ -84,6 +91,19 @@ static struct xe_reg xe_hwmon_get_reg(struct 
>>>> xe_hwmon *hwmon, enum xe_hwmon_reg
>>>>        struct xe_device *xe = hwmon->xe;
>>>>        switch (hwmon_reg) {
>>>> +    case REG_TEMP:
>>>> +        if (xe->info.platform == XE_BATTLEMAGE) {
>>>> +            if (channel == TEMP_PKG)
>>>> +                return BMG_PACKAGE_TEMPERATURE;
>>>> +            else if (channel == TEMP_VRAM)
>>>> +                return BMG_VRAM_TEMPERATURE;
>>>> +        } else if (xe->info.platform == XE_DG2) {
>>>> +            if (channel == TEMP_PKG)
>>>> +                return PCU_CR_PACKAGE_TEMPERATURE;
>>>> +            else if (channel == TEMP_VRAM)
>>>> +                return BMG_VRAM_TEMPERATURE;
>>>> +        }
>>> Common code for bmg and dg2. Can be moved out
>>
>> Again, the conventions + easier to add new platforms this way.
> > > Raag
>
