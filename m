Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C47CA1012
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 20:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EFB10EAAD;
	Fri, 30 Aug 2024 20:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfK63nwP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C726B10E6B8
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725049885; x=1756585885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qz4+Wm3ubxO6Ryi0iKftPXgHaoc0SrP38+k4EuQ7j0g=;
 b=OfK63nwPuPV6XzFrT0DG98LSOnkcuvRLE3vRBzcIRbNvG/UWOpeaUY5W
 2Whi/JDizlWIPtrVJAVL4UzGJNs8UV8EeTAZYakfiq6u2QuzNuPMbYp0L
 2J+iFHZUN5P5ASFWiYsh0BBELAOrHDRMc0WSFduorCAFvvSLtUw0CblM3
 MsKx28lUl8hdBxUgh0UfuGfRBx9dpBsu5K//E/hizV0stI2X73DoZHxX7
 14I+oPZcos+ZwbJaI3gehNYG7mePkXYeccxdPaCJMQNDfEVMYYtWJVPiN
 KxiVeKhUBk8r/f84wMVp+hafV/6VYkCdwQtsNe7dW6LdlouI0iGektrz3 A==;
X-CSE-ConnectionGUID: O1GhOPk1Qy+mwtUh+o146A==
X-CSE-MsgGUID: sIsTJLivQweFOgKZ7wC/bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41200895"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="41200895"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 13:31:25 -0700
X-CSE-ConnectionGUID: zTmLitbMRRO58eXX5PMoVQ==
X-CSE-MsgGUID: iJhD4MCGTZKabHHM4EqoNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="87236575"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 13:31:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 13:31:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 13:31:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 13:31:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSIe80nJ6JcZiFfHGxLSvELwQqRDZePooRHweFOYiisEeg4RchHYcOE4BWrRu/6ZMuXtR1FZATgu7pIV//p0N/YrvwgwQ2b2qJPF/2QeAGmrVpqkdGbqcvxm4sRV65lOag8oC7mbMwAnaS86hudMj2WI5QVQVfe4pyqjjKyqHxFNwG90zre8o5pNfdfNXN7jrvz05yFK+tBJJHJLLZFgNKXk5VeYRxFVABSCCoAS5kKM4T17pm/KMp2ZkPrx+paS8KTBltvFEgRZMvWyAkk8Wi10dib5dTDt8mJDqbHgjpEbjF47yGTwfD4N8lcRheSe0gMbH4qxg/adQLxDZVTy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p52tG/yNBoBQaGH5O/s9fYvJI5G63hfTke9ymBfqyag=;
 b=GyhjH/gKGbJVQxuayQf9E/cRnMPAY8mRNnWv/m1yKTvSxQtpNfHPrZlsQEeTgaiTD0zlIrl5qa2zcTyCGX55T5aI4biu2DCQBQw6r+PfaSKZwozIov9BLGO9rZ0RHKP74Lhd7OtfcUQMQStZsC4Hmh8eGGjlIKtLBxRtwk0oFuuxhTbV5JbdLkiLpzAfjQj0FvRhjEe7aWkEoY4vPeSnu7XnC8sDS97ty8k3/3ieCtpEeqjQlXk3warKpxfPtmrRMzEkblCQXUEe61QPCGVJo+j5j9zV50pLqoo87cvLQN9QKOaGklTKgjwtA8Y2mf3s7UF3Shy1k2Bn6bVdLFa6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by BL1PR11MB5303.namprd11.prod.outlook.com (2603:10b6:208:31b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 20:31:21 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 20:31:21 +0000
Date: Fri, 30 Aug 2024 13:31:14 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Cabral, Matias A" <matias.a.cabral@intel.com>
CC: "Ranjan, Joshua Santhosh" <joshua.santosh.ranjan@intel.com>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Degrood,
 Felix J" <felix.j.degrood@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Kumar, Shubham"
 <shubham.kumar@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Message-ID: <ZtIsEvaBjSJJpdyb@intel.com>
References: <20240707224141.2865472-2-ashutosh.dixit@intel.com>
 <878qww3xh8.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB83605299AB7259BC17AF3E38B28E2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <87frqwyxsc.wl-ashutosh.dixit@intel.com>
 <3cab72ee68db99761ad07c6b8d8127b7d84ee77f.camel@intel.com>
 <87frqrtelv.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB8360E6440D35516CFF554555B28B2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <ZtFks4OB2fzoY-yu@intel.com>
 <PH0PR11MB560993EA3FF44C552B5C2081A1972@PH0PR11MB5609.namprd11.prod.outlook.com>
 <CYYPR11MB83609DA29E3E4B668A872235B2972@CYYPR11MB8360.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CYYPR11MB83609DA29E3E4B668A872235B2972@CYYPR11MB8360.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:303:b9::6) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|BL1PR11MB5303:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8702ea-6e4a-4c7b-5bf1-08dcc932b5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDVobkFvMVoxUDNoUS8vQ1JBNHk5enZkSkpGaWpuOWVkR3V6WjdVRlpYM21j?=
 =?utf-8?B?K2JUVmZvdllYZWRFdi8wUHgvMGdWU25rbC94cjZtSzBJcmVGcGtvVTBaa2Y3?=
 =?utf-8?B?NnlkY09PQkp6eWpNUzRxOXNkMzdxYkNRdk1IdmRPWVlqRVhiOVhPWWF2UDZy?=
 =?utf-8?B?d2VGTkRDaUxuNGlFb0RRQVh1VitMRWp0L1lyTGFJTTBQQ3VlYTJYaWxYN3Jh?=
 =?utf-8?B?MWp4bTlHS3NjNHg3Y0lzVFFIakN5a1V1ZTZnWDU4bjYyRktRaTVjM3FSaHFT?=
 =?utf-8?B?cFdhdDQvaWR2MlRsbzJ1a2M4cWJ3TkNMdTh5NDNzWng0N2pDakRaeE9aRTRy?=
 =?utf-8?B?YjZNbTg4MUxTSitsU1hNTUdXbk9VMjN3MDV2bE9rRUZjSjdxMWZTUGRiRU9n?=
 =?utf-8?B?VHFoUk4xMzJEalZqWGVWZ05DaTBPQnNSZHZhdlRHMFlLcHc2Y2FURHpSVUJl?=
 =?utf-8?B?MFRrY3BudTkyUUhJNitNbHdPQVFXNmREbVQ1Tm5Odm1GaGI1WERQM2g1U1c2?=
 =?utf-8?B?MVFxbGh6RDIzQS9kZ29jMDZuUUZndkw0Tmtya3RHeEZrcU5KK1pxaGdURTRT?=
 =?utf-8?B?NW5UeitBZDA0ckt0TlRYZGFuTWFHZlA3dlZicGtNaG5zcEhZVnpnNStDck9J?=
 =?utf-8?B?Sy80T3N3RmRVUXRrVDlzUmE3OVhEanM2b0JXOGliT3hoQ2lIdUpHZHZwRTlG?=
 =?utf-8?B?ZW1WaHVFNmxMTDF0Y1ErNlV1VktrdHdXcjBueStId0kzT05SU0hQaWRESXZM?=
 =?utf-8?B?c0FUZnB1V3FlczJuT2NHQVkyS2ZrWCtEMjJhS3VLMDQxS2I4ZDFUOXBSandr?=
 =?utf-8?B?OHNrbkdZc2U0Q2RnRnJQcHh4ZnROSE1xUk13OEFpeUJicGtRNjkzK2Y3eTBj?=
 =?utf-8?B?V3BTb3NzNHJwRVBaNjFSZ3AyeXIxWS8vZ29oNnd6bDdRMHZSZURFL0ZDb0FW?=
 =?utf-8?B?Ynd3VmUwczR2VlhEUHBYcDU1eGR0aXJWSnFRTWU0Ky9TcGlZWFY3UGNLWm03?=
 =?utf-8?B?NW1xVXE0ZU1RanVhRmtXUU50Rys0SHRxblRTRXUySXhiSWJ0YjNKdjhzN0F6?=
 =?utf-8?B?U280Y3V3MXVUUXJmUW90YVVqTFNPckd0UWc2NGlZUzdyMllGVU14Um9xc0Yx?=
 =?utf-8?B?bUM5eWtSOWhwZ3NZU2U4di9lUWlXZnlEYURjZE1jZ2VFUlVLVndWUFRrQ1V5?=
 =?utf-8?B?RVlpNk9oRUppYVV4bE9yUTNxMjhmWXlDbk9jQWVHeWpDNVF6YVVjRnE3ZnBs?=
 =?utf-8?B?bSs1TUg5WWl4TlRTS3NhR3llRnBIbnBNaDAvbEVEUkcvUk45SXE3cGhJOXVS?=
 =?utf-8?B?Wkk5b3R3UHg3S2lzWjY4UXlYNERCSTdMSUdRdGg0U05HSm5SZXhaYW5NK1c0?=
 =?utf-8?B?T203ck1qOGtpRG5xYTlzU1gvMVhxTHltdVMwZ0Rjbkt3V0lqckV3NWxoS0FS?=
 =?utf-8?B?L09iVkJBTk0zZkphWkVPclJReW9kYldJVC9sRUptamtxZkRmMElaRmorY2h3?=
 =?utf-8?B?eXlwMXNGRkc4dVZrL1Jzc3IvTXNhUWZwYzNLNjlRdEpvbmtsb1NFcWp1U21E?=
 =?utf-8?B?RVdWNUpQQmhveUVsWjhXc0pPaWNjMWk0SW94UjlFcmw0RnBiWi9MTkJubDhT?=
 =?utf-8?B?dlprd0E0R2wwUkJCUkFaNFFJRjBUbDh1OUltaGVxVWVOSEV6STFvbFVncWhS?=
 =?utf-8?B?eVdYaVJsclArTXV0THFabG1ZYXlCN2x3bnJGd3VNYTZScndUVlZYV09BYWNo?=
 =?utf-8?Q?P7RyDQf5A8KTIr5PPE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWc1UmJ1YnFHYjZDV1NRbitvcDAyRWIxVWlUa2FFcWs2WFJYQnp4aEdyMnB6?=
 =?utf-8?B?aDhJUkVaZkxvcVJZbS9OMjgyb0tCdFc1dUZjZFdtZWl2YTJWMjhaZWtFTDlu?=
 =?utf-8?B?dEhqS2pCU2c4V3JIM0VaSDc1ZzNtZWhnVGdaUHNwdHYzcUtGa0dMRXBMaHFC?=
 =?utf-8?B?dTBmUVJXbGxBMisvdDd5anlXaTVJZGlnZmswM0NJcmsrR2RKWk16YW95UmhW?=
 =?utf-8?B?K0VHMVlsMG5JaFNEQjdWbTBhUGZrMVozRmRHYnVENUpxVWZKU2w4M250c1hW?=
 =?utf-8?B?VjBjeWV2djNpU2tzeXZtYjcvUG5iSUhHdjhiOXY1bEc0OGdTT052aUN5UFVT?=
 =?utf-8?B?MmhoRStsNHBaQjNzcjZKVHJkcHlXeGZHVW1lc0xFdmh0VnVvb0tWRG1SNkdW?=
 =?utf-8?B?ampETmN3UVhFczBsK1EvTnB5VXpCdDY0aEt2OEw1bERlMzA5MTY2TFQ5dDVI?=
 =?utf-8?B?cW9aTmZ2L21RdkpocTVkS1ZFVy9pU0QrTHh4L0lxVGtUUGVQeEJsN0U2cWU1?=
 =?utf-8?B?MGR1OXZuRnhJQmhic094NXRlTmlvVUhEQ2E5RDhwWG1RMWhUMms3OEtMUldT?=
 =?utf-8?B?UlNSSkxjVU1lMUhaY3I3VVFXRS93L3k0OHIwS0RkdzFETUN3bkVwcHVaZ1BS?=
 =?utf-8?B?czlPZ0hKUFNLNi9iNkFueEFpTm11UWlVTU1wejhEYmREZm1hMTdvbE1ZbFp5?=
 =?utf-8?B?K2hwM3cwWVArbEgyWGV1c0tOaUY0TlJ1ZVE5QmVjdUh3STZnZUZ4ZFg4dDdO?=
 =?utf-8?B?UitSbjR0Q1Z5RVE4TzhhdVZYakZkdTJNRWV1cWFWeVh5SHpTa2prL3Yza0w3?=
 =?utf-8?B?R29HK2tXWHR3MjV2RkFWS1NlTERLYTJtZEhFZUZ6ZXVleGpkdHVHVWZpWlJP?=
 =?utf-8?B?dDNqendML2tXaG5YRWpWSTloaitmN3dWTStkeTljOTFRNlNZcDBCL25sTmNz?=
 =?utf-8?B?c1VUNktkNE0yRFJYY0V2MnkrSWx5cE1yYWlidFhqbFkwWFk5bGdsdmJiUjd5?=
 =?utf-8?B?STRzU3pYRWRNWWpqdDhPT2ZnWHV6S1VaZFpEYnFDNHdoQmI0eE9uZXVhbXFK?=
 =?utf-8?B?UG1TeDBvMnlqeXdKV2VPU0I0MGRycCtscWtYeHpzRnF0Y1hPNXRBdVdUcTJv?=
 =?utf-8?B?V3JTYlg0ZTJ2MTRPcXZDT1VQMklha01DeFRuWHRHQ3V3emFhUUk2Y0NDN2sx?=
 =?utf-8?B?WWZia3BzUEt6YVlGcVI4bHNnMWhJOXFGQmZtaEs1aTRkN20yMWlxWUF2ZHpq?=
 =?utf-8?B?L1g1L3Z1ZU45LzZEWlZ6ZFlZZ2hSSElzSk5EOTlBNmUxSkJLRFlDaE9hY1hr?=
 =?utf-8?B?TVpqV0o1bGlKQjRndmdkTWpXaGd5T1NVbUtTR2xKaTU1OGo4S0FPZ1dQYzBy?=
 =?utf-8?B?dnZ5cG0zMk5qcnB1MkJtdTJkcUFJNEZLSFdjMFoxSVpqTWJQS3pFUWpLaU45?=
 =?utf-8?B?enF3R1JrVTh5OEpHQ21OUFczSS9XbS9Eb3B1amNsNVJqaTZTN2tHSXBpeGp6?=
 =?utf-8?B?Vjh3LzNvMmJJQWg0VzdSYmxZUTZQRTN3VGYzQWpzNWJReHp3a0I3T0U0eitK?=
 =?utf-8?B?NTZrTS9FWEtpejBRaTlTUkFRbjA0TzVkS0hma015NXVmU2x6VVZtWDdIaFNK?=
 =?utf-8?B?WHEzQXY1U2F0WnhJNlIwL3dxUHh2SnQzOWprWmNGRFVFNnJsR05DQXZKSHhC?=
 =?utf-8?B?TCtLMG5rQlVjSnFUdTBFS0FKTHBNQUNwamVsdDFuUnkvWEJUSGtLSXpyL0Zz?=
 =?utf-8?B?OVJ1bnhpdE1oVDQ2QmpGdzRQUW55WDBJMW5PS253OTFCQlhlbi9BcTBBYUR4?=
 =?utf-8?B?SGF3UkQ1SlY4ZituQlBDd2FLOEZ2MmE5dityYTN5Qm1QWmlxZEVYK1pCcjQ4?=
 =?utf-8?B?aGZhOUl2MnhBeDFOZTFnQW9kdDR6KzZ4Rm8vaGYrYXBDeklUVFhQQkZleEFQ?=
 =?utf-8?B?aHBpcGJKME5ndEpmL0NnczhvS0xpUDlObTRlaXdVN0w0Ry9RNTJ5TzQ5aEh0?=
 =?utf-8?B?N1dFN292QVZJQzAxSTcyL2h6UjZxRDEwYXhxSEhkenpURk15bnVWZzNNcHRt?=
 =?utf-8?B?ei9ST0ZhSm5UZ1A4NjByRHNCOExSc004SEQ4NS9wZUxpdWhBYWZmZE0ycjdR?=
 =?utf-8?B?VjNoM2JjOWRWQ2RFTktLYm94d2dnVjdJaGFGRTJHQldINFJSU2FzL3JVVmlK?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8702ea-6e4a-4c7b-5bf1-08dcc932b5a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 20:31:21.5554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9CUHUxzpqdqbwr5JM/Mfc7XZCFln100QWtUrG4YnhI2BeqgEPfXJn1qcFAdb3auY+5G1hTTgakApfBkds3+nrdhwSyRqtNNdn1S3JWje8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5303
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

On Fri, Aug 30, 2024 at 08:58:17AM -0700, Cabral, Matias A wrote:
> Hi Santhosh, 
> 
> > Just to confirm, in case of buffer overflow 2 read() calls are expected to be done to read out the stall data ?
> Yes, this will be handled internally by the UMD. The user calling L0 won't know this happened under the hood. 
> 
> Hi Harish, 
> 
> >4. User space doesn't seem to be interested to know which subslices have dropped data. So, the driver would not provide any STATUS IOCTL to get this info.
> During the discussion the question came around the fact if in reality this can actually happen, since both slices are sampling at same frequency and active threads state do produce reports. You mentioned you would check with HW team. 
Hi Matias, I did check on this and I was told that different threads
have different cache hit/miss profiles and therefore generate different EU
stall data. So, in theory all subslices with EU stall data may not have
dropped data at the same time. But in reality this may not be the case.
This would be a good thing to check during testing.
Would user space be interested in knowing which subslices have dropped
data?
> 
> 
> ETA for this changes pushed upstream ? 
My plan is to make the uAPI changes and address other review comments
and push the next version of the patch by the end of next week.

Thanks
Harish.
> 
> Thanks, 
> _MAC
> 
> -----Original Message-----
> From: Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com> 
> Sent: Friday, August 30, 2024 1:24 AM
> To: Chegondi, Harish <harish.chegondi@intel.com>; Cabral, Matias A <matias.a.cabral@intel.com>
> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Souza, Jose <jose.souza@intel.com>; intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Kumar, Shubham <shubham.kumar@intel.com>; Ausmus, James <james.ausmus@intel.com>
> Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
> 
> Hi Harish, 
> 
> One clarification:
> > the driver would return an error during a read() if *any* subslice in the tile has dropped data.
> >Any EU stall data present in the kernel buffer would NOT be read.
> > The subsequent read() would return EU stall data for all subslices on the tile and also clear the drop bit in the HW registers for all subslices that dropped data.
> 
> Just to confirm, in case of buffer overflow 2 read() calls are expected to be done to read out the stall data ?
> 
> Thanks,
> Joshua Santhosh
> 
> -----Original Message-----
> From: Chegondi, Harish <harish.chegondi@intel.com>
> Sent: Friday, August 30, 2024 11:51 AM
> To: Cabral, Matias A <matias.a.cabral@intel.com>
> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Souza, Jose <jose.souza@intel.com>; intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com>; Kumar, Shubham <shubham.kumar@intel.com>; Ausmus, James <james.ausmus@intel.com>
> Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
> 
> Here is the summary of the discussion regarding the uAPI
> 
> 1. Eliminate the data header from the data copied by the driver to the user space.
> 
> 2. Subslice information in the header is NOT used by the user space since the data is collected at the tile granularity.
> 
> 3. The only flags bit(0) in the header currently used, is to indicate if the HW has dropped any EU stall data due to insufficient space in the kernel buffer. Instead of a flag in the header, the driver would return an error during a read() if *any* subslice in the tile has dropped data.
> Any EU stall data present in the kernel buffer would NOT be read.
> The subsequent read() would return EU stall data for all subslices on the tile and also clear the drop bit in the HW registers for all subslices that dropped data.
> 
> 4. User space doesn't seem to be interested to know which subslices have dropped data. So, the driver would not provide any STATUS IOCTL to get this info.
> 
> 5. Record size in the header is a static info which can be queried through an INFO IOCTL after a file descriptor is opened. Based on the GPU, user space can determine this as well.
> 
> Thanks
> Harish.
> 
> On Mon, Aug 26, 2024 at 10:31:04AM -0700, Cabral, Matias A wrote:
> > > Matias: could you please explain what L0 does with this dropped flag?
> > 
> > During the processing of the data, L0 returns a warning message. VTune ( I think) also warns the user that results were collected but will be inaccurate because the draining/reading of data was not done fast enough. By moving the warning to be returned at earlier/reading step, VTune may a) on the fly increase the reading frequency reducing the amount of data lost b) cancel the collection immediately, saving time to the user that may collect data in one node and process in a different one. 
> > 
> > Thanks,
> > _MAC
> > 
> > -----Original Message-----
> > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > Sent: Monday, August 26, 2024 9:48 AM
> > To: Souza, Jose <jose.souza@intel.com>
> > Cc: Cabral, Matias A <matias.a.cabral@intel.com>; 
> > intel-xe@lists.freedesktop.org; Degrood, Felix J 
> > <felix.j.degrood@intel.com>; Nerlige Ramappa, Umesh 
> > <umesh.nerlige.ramappa@intel.com>; Ranjan, Joshua Santhosh 
> > <joshua.santosh.ranjan@intel.com>; Chegondi, Harish 
> > <harish.chegondi@intel.com>; Kumar, Shubham <shubham.kumar@intel.com>; 
> > Ausmus, James <james.ausmus@intel.com>
> > Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall 
> > sampling
> > 
> > On Fri, 23 Aug 2024 14:22:19 -0700, Souza, Jose wrote:
> > >
> > > Hi
> > 
> > Thanks Jose. One question for Matias/L0 below.
> > 
> > > On Thu, 2024-08-22 at 15:53 -0700, Dixit, Ashutosh wrote:
> > > > On Wed, 21 Aug 2024 12:35:51 -0700, Cabral, Matias A wrote:
> > > >
> > > > Hi Matias,
> > > >
> > > > Thanks for responding, the input is _very_ helpful.
> > > >
> > > > Mesa folks: would it be possible for you to provide similar input too?
> > >
> > > Felix's MR[1] is only using record_size and num_records, if the
> > > drm_xe_eu_stall_data_xe2 was the same size and the sample we would 
> > > not need the header at all, inline replies below.
> > >
> > > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> > >
> > > >
> > > > Thanks.
> > > > --
> > > > Ashutosh
> > > >
> > > >
> > > > >
> > > > > Hi Ashutosh,
> > > > >
> > > > > Some inline questions below [MAC]
> > > > >
> > > > > Thanks,
> > > > > _MAC
> > > > >
> > > > > -----Original Message-----
> > > > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > > > > Sent: Friday, August 16, 2024 3:38 PM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Chegondi, Harish <harish.chegondi@intel.com>; Nerlige 
> > > > > Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Degrood, Felix 
> > > > > J <felix.j.degrood@intel.com>; Souza, Jose 
> > > > > <jose.souza@intel.com>; Cabral, Matias A 
> > > > > <matias.a.cabral@intel.com>
> > > > > Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU 
> > > > > stall sampling
> > > > >
> > > > > On Sun, 07 Jul 2024 15:41:41 -0700, Ashutosh Dixit wrote:
> > > > >
> > > > > Hi Harish,
> > > > >
> > > > > Some comments below on just the uapi first, towards finalizing 
> > > > > the uapi with the UMD's who consume this data. And also 
> > > > > comparing the uapi with what we did in OA.
> > > > >
> > > > > >
> > > > > > diff --git a/include/uapi/drm/xe_drm.h 
> > > > > > b/include/uapi/drm/xe_drm.h index 19619d4952a8..343de700d10d
> > > > > > 100644
> > > > >
> > > > > /snip/
> > > > >
> > > > > > +/**
> > > > > > + * struct drm_xe_eu_stall_data_header - EU stall data header.
> > > > > > + * Header with additional information that the driver adds
> > > > > > + * before EU stall data of each subslice during read().
> > > > >
> > > > > One question to resolve is if we really need this header and if 
> > > > > UMD's are actually using the information in this header. In OA 
> > > > > we dropped the header and are providing information in the 
> > > > > header via different means (see below).
> > > > >
> > > > > Another option is to actually add a property for the header. So 
> > > > > headers are added only when user space requests headers.
> > > > >
> > > > > > + */
> > > > > > +struct drm_xe_eu_stall_data_header {
> > > > > > +	/** @subslice: subslice number from which the following data
> > > > > > +	 * has been captured.
> > > > > > +	 */
> > > > > > +	__u16 subslice;
> > > > >
> > > > > Do UMD's use this subslice information? We should check with L0 and Mesa about this.
> > > > >
> > > > > [MAC] L0 does not currently use this.
> > >
> > > No usage for sublice at the moment in Mesa
> > >
> > > > >
> > > > > Also about whether UMD's need or want the header itself. For OA, 
> > > > > UMD's were happy not having to parse the header.
> > > > >
> > > > > > +	/** @flags: flags */
> > > > > > +	__u16 flags;
> > > > > > +/* EU stall data dropped by the HW due to memory buffer being full */
> > > > > > +#define XE_EU_STALL_FLAG_OVERFLOW_DROP	(1 << 0)
> > > > >
> > > > > In OA such information is returned via 
> > > > > DRM_XE_OBSERVATION_IOCTL_STATUS. For EU stall, e.g. we could 
> > > > > return a bit mask of subslices which reporting drops. So similar 
> > > > > to OA, we could return -EIO when HW reports drops and userspace 
> > > > > optionally issues DRM_XE_OBSERVATION_IOCTL_STATUS to retrieve 
> > > > > which subslices are reporting drops.
> > > > >
> > > > > [MAC] having a return code to notify of reports drops would be 
> > > > > much preferable. This would allow the UMD detecting this 
> > > > > condition during the read phase without needing to process/parse each report.
> > 
> > Matias: could you please explain what L0 does with this dropped flag?
> > 
> > Harish: do we know what is the reason HW sets this dropped flag? Is it because userland is not reading fast enough so HW is forced to drop data?
> > 
> > >
> > > But what can UMD do when that is set?
> > 
> > Mesa can ignore this if they don't need it.
> > 
> > >
> > > I would rather have a warn once printed on dmesg, so the issues 
> > > don't go silent but it don't need to go to the uAPI.
> > 
> > dmesg warn is likely not an option because it will trigger bugs in our CI.
> > 
> > >
> > > > >
> > > > > > +	/** @record_size: size of each EU stall data record */
> > > > > > +	__u16 record_size;
> > > > >
> > > > > This is static information. Does it need to be in each packet header?
> > > > > E.g. it can be returned via DRM_XE_OBSERVATION_IOCTL_INFO after 
> > > > > a EU Stall stream has been opened.
> > > > >
> > > > > [MAC] since the size is constant, it seems an overhead including 
> > > > > the info in every report.
> > >
> > > drm_xe_eu_stall_data_xe2 should be of the same size as record_size so it can also be dropped.
> > >
> > > > >
> > > > > The INFO data struct could also include a capabilities field. So 
> > > > > if new features are added to EU stall in the future, they would 
> > > > > be advertized to user space using the capabilities field.
> > > > >
> > > > > > +	/** @num_records: number of records following the header */
> > > > > > +	__u16 num_records;
> > > > >
> > > > > This will not be needed if just return raw EU Stall data without 
> > > > > headers. Or even otherwise it is probably not needed, it is the 
> > > > > total size of returned data minus the size of the header.
> > > > > Provided we return all available data.
> > >
> > > Same as above, would not be needed if drm_xe_eu_stall_data_xe2 matches samples size.
> > >
> > > > >
> > > > > [MAC] the KMD will always return atomic units of reports, right? 
> > > > > Then this is not needed, having UMD the possibility to query 
> > > > > report size when opening the stream, the UMD can know how many reports are in each read.
> > > > >
> > > > > > +	/** @reserved: Reserved */
> > > > > > +	__u16 reserved[4];
> > > > >
> > > > > This can be handled via 'extensions'. And if headers change they 
> > > > > can be advertized in capabilities.
> > > > >
> > > > > > +};
> > > > > > +
> > > > > >  #if defined(__cplusplus)
> > > > > >  }
> > > > > >  #endif
> > > > > > --
> > > > > > 2.41.0
> > > > > >
> > > > >
> > > > > Thanks.
> > > > > --
> > > > > Ashutosh
> > >
