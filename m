Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F4FE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 18:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DAF10ED9E;
	Thu, 19 Dec 2024 18:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0dkJg8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B0E10ED9E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734634002; x=1766170002;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nqgJmp4GBxpnfia1AHLmDa+dY5VnEyPdy1OGGOf8QI8=;
 b=H0dkJg8uOdj8Sa1gedpbX4BV49jocKgmtc89e8Cuu2VMGYQPCQS9Ib4A
 uyIoXFKPb1nq6BkTOVcwOuqEaq8HGT2l5CFLZbLKehOH1k0DZaF3aMEdF
 8xAJkQE1lqmsvQ8XlWwstFvjSxT9Nt/UQufZfOlAhMiNS0Guip88dCNNn
 IJryVk+whoTebcwXlHq+pFjR0zazBaOCMAGuM29qtz+BmGKcaLsYOsmaX
 8QMLweGuUY5YDctrtuwg3lML4a4SeuTr/SiaLRtthgehzXisbS7q54SJ3
 tknjync+wiChNM1lay8Sxy2W0iK80eKm48ZsO1V59QoTJE1MsjVZiXAnW Q==;
X-CSE-ConnectionGUID: X+C0Px47Qxm+j0XwoO3VFw==
X-CSE-MsgGUID: qIJaHARtSAWzIRmp5EeC7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38845193"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="38845193"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 10:46:41 -0800
X-CSE-ConnectionGUID: LblFKZpgQkqdgCAA/fterg==
X-CSE-MsgGUID: rl+Hvx2lS+yhpByYEsv0gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="103153260"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 10:46:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 10:46:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 10:46:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 10:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObNRZa/wEZ4wKTtlI4mlBaYF720nw3cbFIhIjanK2os/e+xBGukhRe2Ek5kRt8teOOuD8g9Vveyv26fCwerzMgmE7juPFAyHCTbCmlX4FSpfjP4zY9mQKhJIwk77O8R8YUtdz7SsqDAT81FU1SAy4WacU2iZ/AvZ7BHpwMTYfTVrKNXziffNwy1PojPdtxMC4VrdX9g1YJ8oZpqOg0D2yDK+zdavVGOqEt3cDepw6ERjYNEpDTPtAkTWxdO70QHZ/Ma3+nJ4RR+QxLYKa7p0jf286Lsud/FmzZqxhShhiqtTXCzr+ssRytauqqQ0EybHwXSd7iqSDlKvoaysduP5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB6mwQ63CBGs17W8sn/NsM/Gq4vSSKr8YYfow7bQbQ0=;
 b=enGRwHObg05vCYOoSghYT3hpvEYa8U+a125MIKpX9YCrjd2BGcmJ1aIoRO1ylnb3XcSbJb+nEp1QdcofzwUxTR/fSJLlX0HGGTR1Dn9fZsoYVRyoRrMik+o645J+P2icik2vCqQdiQPKxlpRt0n2TiJ5SFhHeq7HrqrqVNIgdCOPmLqg67yVb1CWDHZ8lYHQOEA78hpnikVGdHZrGLPHIt1OhFJug66Da4fI6N8oG+1axJStzWR+93SSoFOu7Fux7hcLYNBYT72xF9pmaIHpMjPUiqtnc30aStbRuSklIOpsHSFxP+VGEACGyfAtLKWQvDcUD2QORpUVxumLtvOyLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 18:46:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 18:46:08 +0000
Date: Thu, 19 Dec 2024 10:46:06 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe/pmu: Add PMU support for engine busyness
Message-ID: <Z2Rp7q09O3knfGqS@orsosgc001>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-9-riana.tauro@intel.com>
 <4k3j4q3sakdke5fd3l25rrntjtdjxcm6447xg66czx6whofjbb@jel5xjc7kf77>
 <5165cae4-729e-4b78-84d6-fbbbb3470fb9@intel.com>
 <erhe5xquod7e7mlr5nnnaqtlzxsvgytrnxw3xczydibvqcxxtt@v2ta2k3tzip4>
 <517cea2a-96ae-4f78-9761-ec3f553516dd@intel.com>
 <d3d24cd9-c54b-43bd-a9d9-d7682b4fe10e@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3d24cd9-c54b-43bd-a9d9-d7682b4fe10e@intel.com>
X-ClientProxiedBy: MW4PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:303:6b::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 9751f8b2-4779-4c86-807b-08dd205d66d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDBwN2pPOWJsNHdZWEFYUWEyZ2VWNGpQQlhtUGU5Tm5zWVdzajM1V2VyZ1VD?=
 =?utf-8?B?NlBEWlNIZFdKeGVuOVdqMk4wNEx6UHlQaVJhUHNkZS9zUUJIZTZPSm1IbGx0?=
 =?utf-8?B?VFV5bDBMV2hPNk9aYVovVkp6RnF0dVprM1lFdFpjV3Z6TFJNd1JzakEvVGtG?=
 =?utf-8?B?eEYzVW5OYmlaQi93djdreWdaY085cjJibTRGTW50aG1EbVFXdDRteEdHU09a?=
 =?utf-8?B?YVFkdlpPWkV1SjNCWGcvbCtSMURGTE1ZTFdzb0pHakdGcFVKdUFEc2JJWGVT?=
 =?utf-8?B?Mlo0bGxQMDVIbWx6ZzJSNGJldzd3WE5kRGx5dGR1ZFF1cHNYcUxsbUJTRktF?=
 =?utf-8?B?Nk9IUTRoR0w2ZkxLbkJqcnlRa0NIVWViZnlETGU4MjFLR2xrSlMwdk1SYzNU?=
 =?utf-8?B?emFqbXVLS1g1MlFxajQ4cXhwZFpWbzdsbnNvVVc1QmhPQUsxMG82RmhFTmNu?=
 =?utf-8?B?SEVEWTdnMUlDR3MvdE1vRnNMRS9nNVZldFFCTDNMSnByb012ZHY3dGp6alFY?=
 =?utf-8?B?L3BCczFqZ3I2N0M1Q3dmTHlhN2dNVjhoTjdNc09hejhNbmhvQis1TmY0b1Y4?=
 =?utf-8?B?RG1FWU43Z3VVSnNKOHEydVk5eC9OMXFDZ0xYK2czSnhodHhoMUxWWG9kQ0l5?=
 =?utf-8?B?cCtBSVdEWEtiN1FNSG93V013bTIrdW5yVGlKU2lqUTEzUEM0dzVub1A5UmRU?=
 =?utf-8?B?YmtLbjZBK0tjOEczTDFtU0RnUk9wSWRVR2dBSzdrRUc5dEZUUExMak9jdEZS?=
 =?utf-8?B?N2QxV0NtNFMycmVPY0RmRFN2Zk1MV1pwM2tKbW1JZHJISTAzMGlZM085cXpT?=
 =?utf-8?B?QUE2bFBIN3FEMWpGUC8yNnplREdGTkdEbSt3aE55Q1A2ZEtDNlNDVkFkbWN0?=
 =?utf-8?B?YmFSTmR2K1ladWhscGZ1UVdZcWRlQ1dYVWExS0Z1L0M4V1VLWHh2aUZnWkhs?=
 =?utf-8?B?dHpnR0hrTUYwK2xVV1YwaWhKUFBBS01IOTlQODNmMDlzWVl0TTRmektSK2w5?=
 =?utf-8?B?YURJN1BHS2x2UWxUNDFIZW15WGh1emxzZmkrc0hiNVV3LzNueDhLWWhJR2JU?=
 =?utf-8?B?M2h3RDNZL0RTaCtFU2JUK0l0b1JIWGlWcUgzdDBnWG15OGk3ZUcvc2dmMnVQ?=
 =?utf-8?B?b1o0akpiaVJuQVI2SWpDdEpHMXVIOWhGcjdWSGNZeTI2RjR4Y2pmUDNSVUNX?=
 =?utf-8?B?bWtSbjN1ajlVN2lmSm1OVHBpajA1NU8rTzRteXd4ZXc3VmYrbnBFZXYvQVJu?=
 =?utf-8?B?dktGY0tkejFJUFpNaXBLdG0vS244NkdoUTdKTlkrajBLV1JZeEFOSXpJb0lx?=
 =?utf-8?B?dkFRZ0thc0h4WEw2MWs4SkZSbjlCTjVMQnpzYTJ6RVJyQkhHcUdOcVo2Um9P?=
 =?utf-8?B?UTZveEY4bTc4RVg4OTZJT3B6SVlDWjErdlZxN3JLd3c4VE9yRW56ZXRjS0pi?=
 =?utf-8?B?YkVieU1sRGNhK1I2ZEVXRG1CWXp3WkQ2U0VzWE1UQm9xMDUvZDJVR1drMjdj?=
 =?utf-8?B?ejNiajVXblJwN3plMG5NSnU1ZG9XcC9HbUNGNjV5QSs0TXYySXJ2MkJuRnZO?=
 =?utf-8?B?cFNmY3FQVWN0NW9CKzU4TDdNZXNFZFFTWW44anlKNTUrY2V6QmtVRGZ1S3lQ?=
 =?utf-8?B?UnZNKzRPOUp5VWNzUTFhZXZpNzZJYWthaVBucUgzVUNMOSs4SlZLQjZXSlN0?=
 =?utf-8?B?alg0UlBCWkxhaG83K1I1aFQ3Zmw0anc2Yk45L002Z080RFV1UDdzS1FaYkNP?=
 =?utf-8?B?RDA4VXlDWFNNaGxlemtuaVR2YkRzSzJlQ3h5UVRaL2JBZ0xPZC9JZzVFakZI?=
 =?utf-8?B?dkVaL21FMTV2MllpZ0ZYSFpMd1FSMXlhSXlpK3lnNVVyN1Y3U2NjRFdJUE1K?=
 =?utf-8?Q?PcKOVUYEy1rcX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTFxcFFYdFY0N1p3WVJvUlpDWnF0L2tYNnR6V2hxZG5UeUhHQUhPQ241MlRj?=
 =?utf-8?B?eVVCdWk5cmdvTEVTczI0Mjl3ZVRrckhhdFAveTErNlJrejRLeUdoSC85UTVR?=
 =?utf-8?B?Q0k2VEs2TjIyRHFRTXNzU2xTZnVYZG5VREFNU3JnYlZxT2lWUXhJcEg4dnJW?=
 =?utf-8?B?U0hkanJDMk4rbDJDVzBsL3ZWSTBGZCtLVVZucVFsdHk2NEVtRkJIOEcyelhQ?=
 =?utf-8?B?ejBsckVKQnNzWi9GU2JXeU1YSlNhTk1qVDgreERrKzM0STNGZmlqSGhsd0F6?=
 =?utf-8?B?U0xsNURrT0pqYkZLaVd2NS85d0M1Yk9SOHM1U2cyTDZpSTF5M3ovWFNuMjd0?=
 =?utf-8?B?L3ovWjhnU1F2Qkl0Wk5ScVRabDlyOE1FQk14MjNmUjFEZWpmSFdqSS9MbW12?=
 =?utf-8?B?bngzQ3o2ZXFZVGRWTTdzSW1RZ3VPYUptdmtjRXlTeXpPTXpnY2wrQ0RraEsr?=
 =?utf-8?B?VmRXS29MNlJOWUpiRzl3TTVaMnpFemxNcUYzcndPNVROQ01uWCtiZUFpZi9j?=
 =?utf-8?B?Q2lkdjdEaVZmUk5kaURHeXlFdDFKb0pocC9ubXd3UFFHSmJSa3NoZlQ1amUr?=
 =?utf-8?B?V2pNY0ZBeDF4ZWRzWVdHSmEwaFF5MklZU2dLbjk2TDB6ektZR3hwV0JFQ0k3?=
 =?utf-8?B?ZS80eUl5bDNESWdpS1Z3aWtHT083VVpaekR4WFE3NmhwcS9Eamtqc2M0Q0Qw?=
 =?utf-8?B?b2NqVXlTQnpzdytlV2pDTjEwbDRNOUZoa3lJMGx2K1hNVWhMYUthQ2RsRHRm?=
 =?utf-8?B?cHZKVFBndlZrbnRJRXIzaFB6STUzNk5WUjlzSy90bmFpQ200d0pKZ2ZkeGVV?=
 =?utf-8?B?UzRoNngrQWlrbGswS1gwV1U2Um9tN1RKekkybE9mV1VONmFSbnpOaXdPclBM?=
 =?utf-8?B?RGUzUjhvelh0THJwdDJETGIxWUZURjh3RDl4TlJkNEFtSnRlUm9wTTNUWmVy?=
 =?utf-8?B?SE93b2dpR2xLbk5tNi9ZRnBmWk43a2lacU5wMEpJR3Ntb2tGQmtKVzgxb0hS?=
 =?utf-8?B?dVArNlo2UlZaaitHdVZ4QWp2N0h4YmpmMkRDY1dCdWhVZXhFbjczK1JOV2VM?=
 =?utf-8?B?V3lBbzZvUlk5YURaMnF6RHlva0JjRHlvZXJJeW45ajY3SU04dHN2Z1RNSXZT?=
 =?utf-8?B?VVRYbGVkekRqeUJTci9vR1VZZ0d3dWJaL2V5RGE3b3pCOWVBcnNQZnFHaFhq?=
 =?utf-8?B?TnhUd282TGgrY05yUW5CczFwaisxa3hTWllkWVA2MmRkaDZ4bTRacUpNRmJo?=
 =?utf-8?B?WWFya0M5WVprejNCSDlBSEROTDd3c3JVV1VTRWd0VWkrdkxtS0E3ZTFicmlr?=
 =?utf-8?B?MHlScDdsa3p0ZVJuenpHU1B6RDk2bUUxR2dpVzQzWTNsMjk0Z3JmYkV1K2JK?=
 =?utf-8?B?UXNHb1MwbGFQSXlUTStoQ1A1OUtxZ3RzWDJtaEZJTlNQZWFSdGNiNjhnNEZ4?=
 =?utf-8?B?Ty9NcVh1RXdXMGlwTnNjaGZkSldEYThCN2xZaW93VWNOUU9uTnRyYklTejhH?=
 =?utf-8?B?TE9qZFhoTVpmTzJpeGxSZ3d6ellyNmdqN21zUTR2OENJYi9ZM244OFJpeEIy?=
 =?utf-8?B?Z3FtNTlqNkRjdG94R2tMNjZXNHNHenpwdWxMNis4ZzVjM0NWVmJiSG5VQUQz?=
 =?utf-8?B?cEk5ZWFUNStrZHhFN2VJWU9vbjIrTGJrMW5zNndNcjF4U1h3dUZXNThRRERn?=
 =?utf-8?B?Mm9FMzBuRnl4c2htd1AxdDBTMzk3bGhsY2lNWXVMcGtsYm16RG1SdnRRYjYw?=
 =?utf-8?B?WmdBenVMaUZXUzhwditrVmV2dEdrODdTTkdxMEU3bTl1cnk3ZGc4cG5JNFd5?=
 =?utf-8?B?NkVITDUvOEZwdjhRUkZCLzMzM29ucE56dkE1VjJKTjRRWFVtMS81ZzRDK3l5?=
 =?utf-8?B?YmlWeFFpOU55S0tvMjJEQkJuUnVYdFRwWHVLcnBzT1lueU1hVko1KzduUG9n?=
 =?utf-8?B?UVFYRW9CUjVlU25Ib0NyZngwaXlDbXhRNGRQK3B5Kys1cG5LSDZXSW9IN1lI?=
 =?utf-8?B?TjdGb0d3TzY2Z0VOOUdUMG1pRzBCZWFVNVdaQjNwdHpoU2ZxTVRUUHZVNW5Q?=
 =?utf-8?B?blhaMDY2ZXF1QUFFSXFaRXcvRWxVaGk0b3lwSEtmZGdhRVo1ZkNwM0M5aVJW?=
 =?utf-8?B?aW1NZjhQM3IxSk4rTHRhRktaQnFmeER1dXNTbXBsS2Fuc3g0WkFJdkZvc1A5?=
 =?utf-8?Q?gy9jIQMxZ9fQBtFqV9aekMU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9751f8b2-4779-4c86-807b-08dd205d66d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 18:46:08.7280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQmx8yq+oxAUINbkIQ6POEtg5TIroRbe/jRTNgJfJSneL8P0EzH9v3+fawgJ0EM2qiiAHkgHf9UUoX9PA8oviJCJMwcjD7htFwkd0AJAe24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
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

On Thu, Dec 19, 2024 at 11:17:16AM +0530, Riana Tauro wrote:
>
>
>On 12/18/2024 8:21 PM, Riana Tauro wrote:
>>
>>
>>On 12/18/2024 7:43 PM, Lucas De Marchi wrote:
>>>On Wed, Dec 18, 2024 at 10:42:53AM +0530, Riana Tauro wrote:
>>>>Hi Lucas
>>>>
>>>>On 12/13/2024 11:28 AM, Lucas De Marchi wrote:
>>>>>On Thu, Nov 21, 2024 at 12:09:04PM +0530, Riana Tauro wrote:
>>>>>>PMU provides two counters (<engine>-busy-ticks-gt<n>,
>>>>>><engine>-total-ticks-gt<n>) to calculate engine busyness. 
>>>>>>When querying
>>>>>>engine busyness, user must group these 2 counters using the perf_event
>>>>>>group mechanism to ensure both counters are sampled together.
>>>>>>
>>>>>>To list engine busyness counters use the following
>>>>>>
>>>>>>./perf list
>>>>>> xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
>>>>>
>>>>>this will need a rebase on latest versions of the pmu patches as we
>>>>>moved to have gt as a param rather than mangling the event name.
>>>>
>>>>In case of multiple gts, there might be different engines for each gt
>>>>So should we display a common name and unsupported in case the 
>>>>engine does not belong to the gt?
>>>>
>>>>sudo ./perf stat -e xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/ -I 1000
>>>
>>>why is engine not a param, like gt?
>Wouldn't it be better to have engine name in the event name? Otherwise 
>anyone using perf tool needs to find the engine class to name mapping
>
>@Umesh any inputs here?

sorry, I am not clear on how even gt_id is being passed here. How does 
the gt_id fit into the struct perf_event_attr {} that we pass as the 
event configuration? Are we using the config1/config2 fields to pass 
these additional params?

fwiu, whether we pass engine as a parameter or use the name in the 
event, we would still need to validate if the engine belongs to that gt.

Thanks,
Umesh

>>are you suggesting to have both engine and instance too as parameters?
>>Something like this?
>>
>>xe_0000_00_02.0/busy-ticks,engine_class=1,engine_instance=0,gt_id=0/
>>
>>
>>>
>>>Lucas De Marchi
>>
>
