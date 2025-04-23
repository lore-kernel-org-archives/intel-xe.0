Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB46FC369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 09:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB4110E66D;
	Wed, 23 Apr 2025 09:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4Lg/kCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D1A10E1CC
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745402391; x=1776938391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P2cQobB/XJ8DpkdP74YHg9iuYEloctM9SVVglD0wXIE=;
 b=V4Lg/kCcXEwnN7Vv+NHG51VRSbMqqsb4fJ/v+a3BM4bOv5Du+qH1BPOj
 U4xv2vHMaGmEby+hjPbaBpUKa8l2AThxamXddIssopaaIWuS3mXxEioe6
 3FFyCtuHC1c1vqjELs7ZvjEuW0u8U5upcs3LvtREjpcgvTsIyt3HLWooE
 MYI+wVBcZqberyodedAcHoVg7Uq8Uf1UJ85ATBs/vpWbZH3setJXHqt0I
 4pzX6d6gh8Z1gnf3SWustoPacCqSK4Ox4Oc4bhEw5+L6BxqSBe0bzT8QA
 jCCehWmb6BkQ4ICPn7Q+nljq4BFWgPKry0cr1Ax065yq6GaX1A+4HxMb8 g==;
X-CSE-ConnectionGUID: jEJOmvHYStSwJzsCWD0Ygg==
X-CSE-MsgGUID: ZpqpDi+DTXC/x/Odg695wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46222718"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46222718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 02:59:51 -0700
X-CSE-ConnectionGUID: lriMHxPkS4qBmgXfApGFlA==
X-CSE-MsgGUID: 4fpx+By9Tbuimv2e9srbEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="169483243"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 02:59:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 02:59:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 02:59:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 02:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMXlY9GcHCG42DT61IGamAsbzC+ITY+XjwkTWb+b9fxZ+4OtiLEdeperIYpYf397DlqmxiQqkf7c1ygC1HDD/E4heQ77VeR9IahPhpEeM2BGOwuQO4MN7SxcaU7Zh1LZ0yYqzvimGWf+QhRXIA5OITXi/JFIzMVFZ7UH8iY1/wPEct2ljqZ/BLfzGGGgSKFc6GUDDB2zkJgNNdwZSDOIgrplnJyYwNchYucsqZwvqSxN+XKNrjD14+uOCgVfD1WZbR8yIGyY7OHfPH4QYzIcfhi+oQddZw0cK8I0pMYWdqSl0fUYduZ1BBf5r+eKDHMyWJ1m6A3jfugZQ/5UxDasUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JDddq4zMxQ3eKE4hHSzqeYpGQNpMDfsZQBHRj926ZI=;
 b=tF4+kW75loP7mIqnrNFpasT7OEFwXCF2lCl19jELITIhgbIUHdGZCeGipjYc+OgwIJ0N77cllc1zAEBo2EoqLb/FqKxenxjiev278fhqUFykeuoABtxiJWJSj5igoFytsOr+D5zhtG5Nru09Qb8l5OJ65XuAjHBJkMosy2l7/Hba4TtLh0gShwxqZ9HxlWkRkMHKESrltClCNAKrrdJcZw4/MNSWwjDNgy8R9LHtOmjhFFebJxqm0vUGiACv2fIo3Qz8fsAkzgJIx1WYhaicVJOeHkQnAvgEfxFVO6YJ7BvKuNvR8+wIsgzDARNAd+KFUe5eiNLBdv0INUqiXZL++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 09:59:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 09:59:48 +0000
Message-ID: <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
Date: Wed, 23 Apr 2025 15:29:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
 <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
 <aAipZ3pFfD_w7e2z@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aAipZ3pFfD_w7e2z@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c2f419-6f58-4de5-8035-08dd824d9514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWNSdXN3My9OcUFjc2lzQVFicFdyWlFQWWJNS3VKMXVPd0ZVQU52cTVYODBJ?=
 =?utf-8?B?RVRZRmJBOCsxMXVYem4xNDVwOFZrNlI0NUQxY29UTkhod25YbHp4K2p6ZWEy?=
 =?utf-8?B?Q0NOd2lpYzM2OFB5V1R5M010ZTFnSWx1enB1eURnRFc3bTZEQk1KYTFPRWFS?=
 =?utf-8?B?YTBZblJWbk1EVTd6UzFXYzVmbDJUYm9VcHZnM2hVZzVMa0psMjdaVHFaTDZy?=
 =?utf-8?B?WmFVVG9rYmcyRys3bjJ4MUVTY0NHSk85TnpZOE1KbVFxSUVlbzZqTHlYT2xa?=
 =?utf-8?B?a3c4UTFTTklWUmFVQzVYeDk5bWRLMlc1Vjd1TEg4T2kzV3FpT2dpbE9Qa1hw?=
 =?utf-8?B?aVlmOTJaUWVBbEJxeHBPWGJDa2c0bzR1SFZKWEQ3SGlqQXhud2dCZzcrNjNn?=
 =?utf-8?B?VXVqaTk4SXI5SGtBQkIvalg1QjhWRWVXQWcyRUM1cnFzdFYxcVRCQVlvMDZM?=
 =?utf-8?B?R2M3NHNlY1BITUVIc3MzN2lmcStZQ0RnZlZRNlVkR0dSWFc4ZnVCMXZzWFdz?=
 =?utf-8?B?aTNLWWQ1RU9kTTZ4NFk2QjRhbWRnYm9PZlRiejdlVUNBRW9zam5yaXFlUFVD?=
 =?utf-8?B?OXN5Z3RVb1k3ZWEwRXBrVzl5SG8wbG5xRVVWd01CY1lnbTJ3K3VEWWZnR1Rt?=
 =?utf-8?B?YnRKU3M0ZVI1REZDL1dzUEdOMmpuMzU0ZUpsUUtydVh0ZjRuQUdNUXFHanlw?=
 =?utf-8?B?RlRxNlpCK25PZnVNZC9EL1ZyQWhSY09BcUVDN3pYY2VRRWhETXdxaUxyS0wy?=
 =?utf-8?B?WVJ0akt0MjhsOUFkbGJwelRKTlRtYUZjc0pBSEVGNUNWR0RRZEFUSEpHZStW?=
 =?utf-8?B?ZjdDTXV3NUxPaFBKcnVYNTNtYVpMdmw2TitLenJyY3FYTmhoQk1QWkNjZzNX?=
 =?utf-8?B?a1paVEFic2NBSSsxeS9IYmQrVHlMeEEzRXJvYlRRWkhwSmYvZUZJbUwvMzBM?=
 =?utf-8?B?WlcrWXV3TWhjTU9OVmFYeXY4azl4eHJEc1F3cHRaRWp0UkljSER5VHNERXha?=
 =?utf-8?B?UlNUbFhLcldJVmtLU0xkMFBDbU8zdDRhbjRRVXIxOHVLTEs5SzAwaW9HeUw3?=
 =?utf-8?B?RFRCYTdlWGNmUkJCWmFwbERJWjFXRnFzejFHNWE4Vk5ENTh2WFpTcU4rU3lS?=
 =?utf-8?B?YzNJYmZuaDJidnRWZmZVRTJoakpBai92aFFLUndkZEp5MENTS21aN2k0ZmpM?=
 =?utf-8?B?N1F6Q1c1SkZKWDM1cXdWVjBtdS81L0RwaWgzQWFQYUJCRnI0Ti9YSTBuWmpI?=
 =?utf-8?B?ejVkNWVJbUpwRG00NWo0MVhRQ1RYNjh4V0FOQy9kc1FmeE9aNWU1RzVTT081?=
 =?utf-8?B?MmhLci9jV0RjQzZlZUdjMFY0b1RnQ29FallhM2RsZmFnMGU0Y3ZOMnhsclp1?=
 =?utf-8?B?S3lmdjNtQjdzaTQ4OUJvaHNFYmhxOUZBcEd4V0grQWl3b0pIT0NGQjNUWjc2?=
 =?utf-8?B?MVZGbmZJZWFHMjNNZXpOYWdva3Q4US9UUlFia3JxTUJHTzlFM1E4TXNWbUM3?=
 =?utf-8?B?RkxhSERJaXEyWFZSUkl5bFpsMjhhN1IxRTN1TEdpYVlkK25GdVJodUdFUzZJ?=
 =?utf-8?B?ckc5VUNkY3p0eUpmRit0OTIvcHFiV1VsMGFmSk1FQVJ0NVk2Tno0dlBEN3Z5?=
 =?utf-8?B?Njd0bytjRFdaaEVxZ09uMC9Ua0ExTEw2L1hxVVZMWktPUnhMTjF0aktKQW41?=
 =?utf-8?B?N2U3bVA4MTR1bkFwd1NyYmdjWUM4YUUrZDE0VnYvSldJQk1XNlhQWERzQVNW?=
 =?utf-8?B?dTcyUWR2amNpNXVwdXlNUXFZNWx3dEVZMHJTL3BuRzF2K3g5dEhhNkxZVVZB?=
 =?utf-8?B?bThnNVJvOEdTQ1RsY3hhaWFxcWtnM2hoMXJjTUN5QVZIUmVJU2Z5cTZqL3Uv?=
 =?utf-8?B?dGN5RTN3TXpVSlV1N01vQ2trSHFCSjFwSnlsd3dSWXM5UmxlbkU1RkQvNyto?=
 =?utf-8?Q?8WTXJxml04o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnpHRXdyWXlVem1hY1FSSDFBNmYwSUlHTE43dU9sU2dodDZickxDUHUzZjB5?=
 =?utf-8?B?WlZtTDdXK2ZZVnFGazNvNjZmWXl5S1kzWEpaYjFERXNKSWNSd0tGOXh1c09w?=
 =?utf-8?B?UjhIb2VXMm8rbk8xS2lQc1Q2MWZTUFFWYVMvMnBIVGw3cXdNbmhzVHlQallN?=
 =?utf-8?B?ang2aFlKeVorK1hIN3BrclRhVkRIdzhVTzE2YktQN2haNUNENXdTcVU3VW9Z?=
 =?utf-8?B?TThRMjZrTWdDYkZBeDdLQXNDQ3dQRXBqVWE3SlpGTTlXa2JrWUErSVRmSXVZ?=
 =?utf-8?B?Z2JOSEp5ajN4ZDFIblY5OTZSdlBCSmxFTVh3b3NpTUg3dE92aWRvdXhSekY4?=
 =?utf-8?B?ekxXT25vUStEdmt2L3VWTEZxTkVLY0ppSDhIUGFxZjVMTjcvaG41MWRJSlp1?=
 =?utf-8?B?K29UNERmTk4rS1E1VUFwWWwyMElKNVNFUXBab2Y1MGoyUndHVUFGTTlPYTRE?=
 =?utf-8?B?QzFpOWc5czUvUVQ2NG5sUTBEdGRGZWZGK0daS21iZGJhek8zWXVEaU4wODgw?=
 =?utf-8?B?V1lSaXFUZ3hKZ0UvR1daQVRackdXY3lsMjd0dDE3bmR6RCtCT01VMFJydld4?=
 =?utf-8?B?ZEk0cEFIR2U5dlkwUVEvaFp3R3dSQm1RS0lVUEZkekREcGZEOW56dnA3TlpH?=
 =?utf-8?B?RjRqT0p1M0M2UjlwRk5pSmxOZXdXNFBYdXNmZFgvS0dsU2hmMWRJNlpKYWJQ?=
 =?utf-8?B?dEFxWnJqeHpGcTJqcDNWRkVCWUsvS2VsWDlaTnFKelBnK3I0OUJJOWZYbzcw?=
 =?utf-8?B?N0lRUmdma05qR1Z4bGd6Yjhrd2hVelNkQXNMb1ZTdTN6OHBuWFBuVDhXRGFI?=
 =?utf-8?B?eTg0TkY2YUVVMUNKTWNoanc0bDlmcVI2UjZlTUhvR25lUzhncTNjcmhIRy9k?=
 =?utf-8?B?Zk9LQXN0OEZrT3dIWFdDaEU0Qm9zTnYvSFJmbmNzTXdmWFNMOFVyZngxUTUr?=
 =?utf-8?B?M2U0Q25aZnZoaXRWSk1PMlI0aHNXKyttdWJ4MThIbWsva3NRa2tTQm9rZ2th?=
 =?utf-8?B?ZEtkQmNqem1rRnNEMjVqTytzclB5Mzg4S3lhaEI3cTZaSGVhd1hEVDlrUkp3?=
 =?utf-8?B?THNML1FUTHBlNnZmUEtCbXc4V29nZ3poSTExMlZQZGwwRFdHYnZMQ2ZRY1dE?=
 =?utf-8?B?b0FzdkJVUjdKU2EvaitFbG9Qc21yR3drUS9iblAzdGtpRWVYbG9aQnFGWWx4?=
 =?utf-8?B?TFV3OUpQMzFWdC94Tnh5c1NIc3VLQmpxeE1OU1FhbTI0TVY3OVdpSU9GR3Ux?=
 =?utf-8?B?cU94QlZyaHIzZ2RrRXlQT0VRWDJodWNIRGozdWZWSE9VbmVaN2Fsc3RSUWta?=
 =?utf-8?B?OTl6OW1lb0loUjhCZWRDWkNHNWxEWFNMSjRtczJrN283QmJFWjdvMlRlb0dK?=
 =?utf-8?B?UWw0MFBIOVNUTkdMZThRdFRwcU1Ma2U2aTVPcUtHK1VpTW5sOUdiM2swOEha?=
 =?utf-8?B?U2Voc3Q4N25hdjJIWUd1VW03TDltRU13c0JIVFFpaDZuTjlwNHAvSmc1ZU1Y?=
 =?utf-8?B?VDhsN2Y5YUFoeUNXQkRnN3N0b0ZNMFJ4azBnQUNxNVFNelpYdXc3anJHc0Jx?=
 =?utf-8?B?NFAxbzB5QkRTdEJWOGtidGJoMXNvRXpRUzhrRUZnVWV1ZUk5VExFYU5OZU51?=
 =?utf-8?B?K2ZSQko3Zjc1UHFiNnhsVFgraE5TLzBRaXZ4UjFPbUF0ci8zZTM4MnZWSXJC?=
 =?utf-8?B?VTd1ZUVSR1JMR0JZWG1pZnQ1UG8vYU1PTU9mMTFwRmZWR0dWdVhXNmRZeE5B?=
 =?utf-8?B?UWdkODVrbUROZXN5eithZldZVmFuYmZ3eklGS25zZnVlQXZaS0k1d2JXUXZS?=
 =?utf-8?B?T0NqQ2xmSkFBOElpSythemE1blhNYmJhMHQ4MGpGVk1yT2w2THpzbldKbFU5?=
 =?utf-8?B?Mm9hbSt0aEtkWXo3N05aUGxhVEUvWmhGYStYL2grLzBvYkdBYVZkaS9YS2U3?=
 =?utf-8?B?WSt3VEovb09RNkF4M1paV0tvcUNlSlA2Y3hMUkdNdFdSZXJKU3B1anpvMklS?=
 =?utf-8?B?ZCt6c2lGMVVKWFNyWUNWaDJOQmlqYU55UUt2RjVocDdVRDVsS2NDWERZemY1?=
 =?utf-8?B?ZTY5cUNwL0JNbGs4MllsTmFwOXhKam0vUHZrNWRCZDVnRmNPbFcyUHRLeTFR?=
 =?utf-8?Q?7gZqOkOGmSjSZR/bExj7aS6WA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c2f419-6f58-4de5-8035-08dd824d9514
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:59:48.5233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ddm4cTFUfL76/9uMYVpBp9PkkGI4R2XazTRwEDUNxlhWplsNTPTyTa0Y5Ao3oQt/9nHNObpOID6kMRpqeLqwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
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



On 4/23/2025 2:18 PM, Raag Jadav wrote:
> On Wed, Apr 23, 2025 at 10:55:30AM +0530, Riana Tauro wrote:
>> Hi Raag
>>
>> On 4/17/2025 4:42 PM, Raag Jadav wrote:
>>> Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
>>>
>>> v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
>>>       Rework macros and their naming (Rodrigo)
>>> v3: Use sysfs_create_files() (Riana)
>>>       Fix checkpatch warning (Riana)
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device.c       |   5 ++
>>>    drivers/gpu/drm/xe/xe_device_sysfs.c | 101 +++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
>>>    drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
>>>    4 files changed, 112 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 6c9d3009aa03..79b7b0ecfbae 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -26,6 +26,7 @@
>>>    #include "xe_bo_evict.h"
>>>    #include "xe_debugfs.h"
>>>    #include "xe_devcoredump.h"
>>> +#include "xe_device_sysfs.h"
>>>    #include "xe_dma_buf.h"
>>>    #include "xe_drm_client.h"
>>>    #include "xe_drv.h"
>>> @@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
>>>    	if (err)
>>>    		goto err_unregister_display;
>>> +	err = xe_device_sysfs_init(xe);
>>> +	if (err)
>>> +		goto err_unregister_display;
>>> +
>>>    	xe_debugfs_register(xe);
>>>    	err = xe_hwmon_register(xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> index 2d25e5b5d4bf..923612a0a2e0 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> @@ -11,6 +11,9 @@
>>>    #include "xe_device.h"
>>>    #include "xe_device_sysfs.h"
>>> +#include "xe_mmio.h"
>>> +#include "xe_pcode_api.h"
>>> +#include "xe_pcode.h"
>>>    #include "xe_pm.h"
>>>    /**
>>> @@ -81,3 +84,101 @@ int xe_pm_sysfs_init(struct xe_device *xe)
>>>    	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
>>>    }
>>> +
>>> +/**
>>> + * DOC: PCIe Gen5 Update Limitations
>>> + *
>>> + * Default link speed of discrete GPUs is determined by configuration
>>> + * parameters stored in their flash memory, which are subject to override
>>> + * through user initiated firmware updates. It has been observed that devices
>>> + * configured with PCIe Gen5 as their default speed can come across link
>>> + * quality issues due to host or motherboard limitations and may have to
>>> + * auto-downspeed to PCIe Gen4 when faced with unstable link at Gen5, which
>>> + * makes firmware updates rather risky on such setups. It is required to
>>> + * ensure that the device is capable of auto-downspeeding to PCIe Gen4 link
>>> + * before pushing the image with PCIe Gen5 as default configuration. This
>>> + * can be done by reading ``pcie_gen4_downspeed_capable`` sysfs entry, which
>>> + * will denote PCIe Gen4 downspeed capability of the device with boolean output
>>> + * value of ``0`` or ``1``, meaning `incapable` or `capable` respectively.
>>> + *
>>> + * .. code-block:: shell
>>> + *
>>> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
>>> + *
>>> + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
>>> + * instability due to host or motherboard limitations can result in driver
>>> + * failing to bind to the device, making further firmware updates impossible
>>> + * with RMA being the only last resort.
>>> + *
>>> + * PCIe Gen4 downspeed status of downspeed capable devices is available through
>>> + * ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value of
>>> + * ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
>>> + * link training (which is the optimal scenario) and ``1`` means the device
>>> + * has auto-downsped to PCIe Gen4 due to unstable Gen5 link.
>>> + *
>>> + * .. code-block:: shell
>>> + *
>>> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
>> The code looks good. But i am not sure of the word downspeed.
>> Couldn't find downspeed used in Pcie generation context. For link,
>> it is mentioned as  'link downgrade'
>>
>> Could you share if you found any?
> 
> Since we're describing both firmware and PCI link in the same document,
> 
> 1. It helps distinguish between them.
> 
> 2. This information is for the end user and has to be translatable enough
>     regardless of what spec says about it and the distinction reduces the
>     chances of misinterpretation.
Please get an ack for the naming from any maintainer before merging, as 
it cannot be changed later and differs from the spec


Code looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks
Riana

> 
> Raag

