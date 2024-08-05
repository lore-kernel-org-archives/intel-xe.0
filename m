Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C90C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 18:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6391910E27E;
	Mon,  5 Aug 2024 18:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g479McPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E55110E27E
 for <Intel-Xe@lists.freedesktop.org>; Mon,  5 Aug 2024 18:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722881930; x=1754417930;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lAd10PTSjUw7jxDJH/F8HJcijqAc08MIHZQMWAjOe6w=;
 b=g479McPwohYV73kVp8N6cIuFYBsbckqrujBglEfFYiYIIRHTVbmOUGLL
 uBJlD/pzaqDZPFjuhD/DoJQxqR6COOUq0wcBglbAHjAPqMa9uubGPs3dq
 bVbW9TFMpvfAcsvqrK+sw0IFJG1EF/tTW++MVpa+y5KJCRePGgp4ViO2D
 N1SHDk3eEk4fZJzLj9UmaTfdPWCG7TEzHswpa7UL2CSt9KLomDLsKfM1w
 JkKhIr4z0UazfhmdWjoR8gZ6uf7LMgX78HpFuZ6J80KzymGWSBqEs35Rp
 x33RUABgbIqJhdtAmUHJA4RkccDmpTxQbSWAEdioX1Y6Y4NpAWF2gDnnQ g==;
X-CSE-ConnectionGUID: HbHMAoP7RcWd5ZkJiHkaEQ==
X-CSE-MsgGUID: JapdoW+oQx61gGA2a6EnyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32270327"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="32270327"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 11:18:50 -0700
X-CSE-ConnectionGUID: 3RbbRXEEQbyCqFmKG7mK4Q==
X-CSE-MsgGUID: AjNzH9jUTtytTg6dg2Zezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56142224"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 11:18:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 11:18:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 11:18:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 11:18:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 11:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYjFrGM4oTpOplXFGaCsE7J59eDfs4sF1vQw1LTj32I/x1cPE7X4IoCkG7+NT/rtWSWWX26YdFzpyUeqeO4leThbDz73UP+fiy4BhAFzGm1K8ucLi6K8VpAd78ETSPoJ9mM34/RW35Eejzq4WEyZT8WTYUVgRcNIRBSz64a+fMTzkWiLiN7hW9Gyxz1n8hSBkWVPURAk1t69ltLYibtDVdkmJFnaeWoM1FTp3QACXCPKlpRMI/W/31p7oBAFNk43P4UqIX12+E3yvjogHumNqpzM04p8D+OZGBQE3Agv3lNldJNdwV4f6k4Sagr+Dwzv5TjBlpFmOBdQ8rlKaLl1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFecjtNPSspzBv1g0P0wdOaJpEJFbygL1V6lWFjM87Q=;
 b=zFCyKARed7OqP7Md8gYiJBta1jlj2QSdGK88s33OIlCwcQvIHGmoPeLt+i3cnG+B4JPUuxWnu6FJXjxlssBfU+mAjYetVnwfkkovvwSGx65JXxayPvapwM/pVfXrzWNEp1QXr4Ts5OTCa1XNVRfnFJtDP0UeORMdtbI/REt6ak3PCzSsjpUZW7XXwsi5xEDQIxv6OfyHVGya+UPJ3xH+qUaabIzjudlc311XnjV69u357rhEMmJV4uwD7JsO5gYzYlC3ldC+JBaKLbKiKN6l/RNhbrLGHRAe6i7mkWWWQ8I7hBvEbhdKWGAfDf8EmF1le21o5AzkbdlqWemtO5Bsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6371.namprd11.prod.outlook.com (2603:10b6:208:3ad::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 18:18:46 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 18:18:46 +0000
Message-ID: <287ac5cd-6ff1-4051-b372-9771f5844174@intel.com>
Date: Mon, 5 Aug 2024 11:18:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] drm/xe/guc: Remove spurious line feed in debug
 print
To: "Souza, Jose" <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@Lists.FreeDesktop.Org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-2-John.C.Harrison@Intel.com>
 <9306b3ec-3999-468b-8395-dc3b7900ff6f@intel.com>
 <a9ef6254-f428-47b7-827d-82ec94408ca2@intel.com>
 <1dd11a1f9d0ba530483bc443f6ae09481569fb17.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <1dd11a1f9d0ba530483bc443f6ae09481569fb17.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf5e533-682d-45b8-a54e-08dcb57b0ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDhQZk1xc3VJOTJ5em9zY0NJalJyZ2pqZ1dRT1JzcWROL1RYY3FJa2VZa0RB?=
 =?utf-8?B?dHZGaWs1QS8vWS9tM1NFT0dEZ0RlWHUwdW8yK0RBN05wcWoxSkY3eWw4N1Qr?=
 =?utf-8?B?MGtrWVZqbi9BZHNTRVdPQVpURzJObkQzREhudFUxR3dnZ2RtbXJ5SjNvVXBC?=
 =?utf-8?B?eGdWTkRDZnFIY2NEeEwybnpNMUtWMk5hUUNGSFhTYWprblYyTE5OUEVWSjY3?=
 =?utf-8?B?R1d2UklGVW5COWpDdEFwdWJaWWY1ZWdZKzlWN0JQWjQyaDFGQ2VLN1JUc2Z3?=
 =?utf-8?B?S1dNYkl6TG5xaUt1NmlMaHBCaE54bjZqTG83TDhHT0d5d2ZZSmpNU205RzEy?=
 =?utf-8?B?SThWU2hkZzdNQTBEdnJiekJ5OTN1NWQ0bzR6ZHJ2YzZlbm9MZ1l4Y0NPRG9q?=
 =?utf-8?B?ek1VWEJLNGUvUHhxVi93WFVWVndUL0x2Q1pNWEZTSk03eXh5a1c0RHRsYjQv?=
 =?utf-8?B?V2IzdFlSTERnMnFKVkRkMUVHN2hLQkZja1kveDFSalpwMG9HZXllOExWZVVl?=
 =?utf-8?B?Ulc2VHB2b29KQkhTRjk5ejBJNzFNd3hCdWxCcnh2YitCcHZnNjVWbzdFN2xG?=
 =?utf-8?B?UE9VaHliM0NjeUZCS0VJUzVBOG5nZXhGZ2Z6eFlPaE1UN3YxNlphU3JTNlAz?=
 =?utf-8?B?TFNOMEVuYjV6MFlZM2lsbDFabE5hK3J5RXlydEpINFBsWXg0N09EZFNjTU41?=
 =?utf-8?B?ODBVendCZUI5QzQ2QXZmRWFmZTlUUW9XdDVsRkdwYzh1Z3pyamoxdTlsZDdO?=
 =?utf-8?B?bEMvdm1lUHB5WE45QWhGVFU4cDRkYnFGamNhNHlrUEh6azcyVFlLZkZLWWEx?=
 =?utf-8?B?KzhDUTRyUjE0RjA1MmNIenpVc2VZeThZd1M3c0JjVG9UVHhlTEh2SlpGTkZj?=
 =?utf-8?B?U0poc29xb0FZNGExVVJDdnU5djA4ZjY1eUNUZjhlcEJaUHY2WUtYQVdiVEhv?=
 =?utf-8?B?djB1M2MvS3V3c0tIQXV0ZWRyZzNnN1o4ZzkwT0JYOU5PT0w0Z2R5aDE5eC9q?=
 =?utf-8?B?Nmt1YWs3dmZUNWwreWFoMDdHZThjdGZxWUVQZkZXSHhja3ZTMFNxSDdueFB6?=
 =?utf-8?B?L3ViZE9Ga1BuOUMyNnZtMk5IYjdrNEpoNmkxOHBsYWNDbVd1aXNCQ1IzeW5s?=
 =?utf-8?B?Z3k2M0Rtb0ZtdWhVSkdMTG8vMS9CRzdiM24vSzF5Z2czakhsNEhRMUFaazNj?=
 =?utf-8?B?dlQ1V0VBTVBQZE5yUGtGckpjbmRkSHdUTEI3YzZsNG9Sd1pQRjJpbDFhbHQ4?=
 =?utf-8?B?THh3YzBPQ3lqeWU0azVGMzdiWHQxM0d5RnFPT0J2dHlGNmNiclN1K2RNUDlR?=
 =?utf-8?B?VWc2RnIxSk9FTnRyaWwwdHp5TkxiNzg1U1FJbHVOZkRnczJpK3ViRjRvODI4?=
 =?utf-8?B?ZUF6WUdJamhXMUM0T0ltYU82MXAvWEhRdkV2dldCc09GbXJOdks4UEc4OGJr?=
 =?utf-8?B?cmxtNWtBcDN2R2tFUzM3dkxzcmZCVDgrWDlVcThTK0o2STdWV2p0TlZiT0NE?=
 =?utf-8?B?M3lpTkExb0hHK09iRjBtQ0ZReldLeE5MRzJvaDFMaHhvejJCQXhGd01STE0z?=
 =?utf-8?B?TWlaWXk5ZDV5eSs0TC9RdDB0TUsybWhBR1ptZGFvM2pkcFpMM2FYS2V0M1lU?=
 =?utf-8?B?MFM3SmRTaTJGdnRGTDA1czYxRTJNTjRkUTBYM0xiN0l1Q1pRVFdZNU5WaGhU?=
 =?utf-8?B?M1NKd3VQcyt1UnFieWU4U01qdTg0a09tbkw1cFFSZjBkQkdqVnRUYWFwUFZZ?=
 =?utf-8?Q?L/8xc90+tseUMf4/ag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTdXMmo3MzA5bDBtTmcrZkpTNmQ1WWZZSTB0Rk1BdkxzK0oxR2lQa0krYlR0?=
 =?utf-8?B?Y2d3eStCRHh3N1VCcTZSSHJESnVzcDR1T1VISFpPZ0RlMnFRWVh3OE9PUElS?=
 =?utf-8?B?VFZ0aFZpWENLQzJXVDNremhUeEdwcURlYkhXRVBSZE00dlV4ZHdrY0tvN2RH?=
 =?utf-8?B?U0tSalM4U2NvY0ZwTUdBSHN2eUpxSmlGZTJrZGtxWnhOb29NcStDSi9zWkFY?=
 =?utf-8?B?emhTMnlkLzQ1Z0p5THQ1cnNVbUJQMnNNRDdVWnhJbWtnaWNYajltUEo2TlA3?=
 =?utf-8?B?anJkUDFNQ0lBL0ZIWXduNWpRcUJvZE9NRWptUFdseDN4UHFFVk51eUtnYmVF?=
 =?utf-8?B?bWdMK0JRN1NGM1FLV1ViOVhyZm8rSzhLY0wrdStNRDRpd2ZVZ3VhS1BXU1pa?=
 =?utf-8?B?SVN6cDRzWlc1eDF4ZzVjTmR4ZS94Wk1DRlJ4am8rOVRFTXBXZlEyYUV4Y2xR?=
 =?utf-8?B?TUN6dzFjVGtIZVZqeWdWMUZxWWpKQWYvNk9ESWQ0MTlYNHFEM1RUOVhReTla?=
 =?utf-8?B?ZTB1bTVuSEJWU0s0d1ArRnVNaVMySnpSY0srblVwRVVlcWRydWJVdDR2eEVU?=
 =?utf-8?B?dUFYUCtxYkFiM3ZYb1UySEcyZ3RSaElrT2xYaUIwMis2ZnErWFYwZFoxL1FK?=
 =?utf-8?B?Z1dxNjFMWm9tUlRWN0ZmSDVuTCtBR3RueEZ2bjd5UER6SE9nRTcxVGNSVU9p?=
 =?utf-8?B?dGZicVVKdm1xb2NQVGd5ZVZxK0dhRjNRVkN4WWFhRlYxaG9aN3kzK0RveUNM?=
 =?utf-8?B?R2l0UTlzS0JrL01pU3RLK1YvTzZCeUNndy9xc1RFM2tCc2kxallzUGpHUGJp?=
 =?utf-8?B?dHNVdENzQ0dWT0RKVjN4VmoxbkJqYkJZUkxVSDBCOFRBb29VSTNZUVBNQzBs?=
 =?utf-8?B?aWJNenlTdmprNVNtN0JXdHZ4aHFGcEZDUCtnS1VzeGZ0Nnhqd1JQMklBTVdh?=
 =?utf-8?B?QzQ5MktNVDlla2NQMnBEZElPK1FjVGMxbDIyVEw1a1J0dkpvY2x6Qms0SEI3?=
 =?utf-8?B?M0pwTk9Zc2p6WmFCeHJYMlhyNDdaOHBuSVdiaUJWOTkvWDlmNWRNdXVXVVVP?=
 =?utf-8?B?SkVzdkx5RldrT0tLcU5RZng3K2pCcllmclpiZjloNkVwejZ5bG1teFZJbWxB?=
 =?utf-8?B?cG5GUDZGT3pIOU1mMWkrS1lqcmU1YlFTNUhteC9sK3Z4K0xVLy9zQUVlWERp?=
 =?utf-8?B?RzZ5RWNub2VDcGJQTkhNY2pZWU50VmR3OU9CR2lWeDRyQnl0a3B0ckEveEFM?=
 =?utf-8?B?bUFwbDdJd0NwNEgzNlY2WFpacUUxS2FmeUt5ZTZ0MGdxd24yc2FWcmxQZEs4?=
 =?utf-8?B?ZDEwWnBJT0xhRFk0a2NFTitLSExGODZXSGhXMDNMVzRaMGdMWnRPRitKcSt2?=
 =?utf-8?B?TW5zdDlUMHl5SmFhS1krSFlEbHhJemFmWG1iSVAvMDE3NkdCajVheENyQUdz?=
 =?utf-8?B?R2hlRitYVElUREFmSWM5ZnZlK1VUNW1xVm5OSmoxZXArdm5Sc0ovVnR2dllx?=
 =?utf-8?B?NlQ4aEIxVUZTMXBrYmV5U0xBQUIzQ1FLQkZWeVBLc3Q4am01aGpHejVuRmlh?=
 =?utf-8?B?OU1kbi9takZxWTFuQlpvRysvUEszSHQwMGc4dXU2WGtDRkNGRFZGNS9CWjJk?=
 =?utf-8?B?bDQ5NnNvV2Y1dENRRERkQnIrSnpCUFpIdEVuS21XakdaUll6TzYwbzFTdFJ4?=
 =?utf-8?B?RlN0NGR0ZG1vQnpkS3dPeHJsdS9NZmIvSldsVmROenJjRG9nZGNMRHlZdXFo?=
 =?utf-8?B?ZFI3S21kK2pmTFFDQTRBYURGaXI4WDJnSkpDRXF5dFNzQ3UrRStuNVlQTUwz?=
 =?utf-8?B?VU82cXdGUHdYRm4zTWtYb2pqUlhjelhOeDQ4Zm52VVhpL0NDQUhGK2xBaHF3?=
 =?utf-8?B?TTZGa0dQSDR0WHBwTlZncmRzaHZTUlhNbzNJcHRTQVlNbXFuS1QzcjhoSEMz?=
 =?utf-8?B?dU5qTlhvM0xXVzV6K1JWTzdSSVRxOVVLc3djTkNTbGtENWVqcVRZZG9VTjUy?=
 =?utf-8?B?WldPcmFBT2hUeGdGa2dHOFVvS3UxRWNhM0JoT1paT1dDTFFWWTJISUlrRTc2?=
 =?utf-8?B?NEhBQVNmRDZuc011azNnY0tDOEFQT0tLSGNCcEpnZXI5ckJ6bnNTQ01ZZk9i?=
 =?utf-8?B?R3dQSmtpVzU1VXJVdlQ0L3JYYlVWQWkvWkxBZEpTeXdSZzBtem5YWkV3ZE82?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf5e533-682d-45b8-a54e-08dcb57b0ba7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 18:18:46.2620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ukb+5qT1JMiVus8kOF0l4wXz37AAh8Ag6PEOcO1rngSH75luQmPpN2M30AtGIfeRy7GMT2WPQ9x/1U2w+6zuRoMb3spGZKIV6o/VZWPwwbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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

On 7/31/2024 13:14, Souza, Jose wrote:
> On Wed, 2024-07-31 at 12:56 -0700, John Harrison wrote:
>> On 7/30/2024 02:14, Michal Wajdeczko wrote:
>>> On 30.07.2024 01:17, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Including line feeds at the start of a debug print messes up the
>>>> output when sent to dmesg. The break actually appears between all the
>>>> usefu
>>> typo
>>>
>>>> prefix information and the actual string being printed. In this
>>>> case, each block of data has a very clear start line and an extra
>>>> delimeter is really not necessary. So don't do it.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> there was some discussion about merging this one without a conclusion
>>>
>>> [1] https://patchwork.freedesktop.org/patch/601018/?series=135447&rev=1
>> The last comment was for Mesa people to shout if it would be a problem
>> and no-one shouted, so...
>>
>> However, I would strongly argue that devcoredump exact layout and
>> content cannot be considered UABI because it is going to change as the
>> driver changes. Some of the information being printed is internal driver
>> state. Driver internals can never be UABI. If there are userland tools
>> parsing the dump then those tools have to be able to adapt to changing
>> core dump formats. There is also the argument that we are still in
>> force-probe so there is no fixed UABI yet anyway. So now is the time to
>> get the formatting as good as possible before officially going live.
> I don't think KMD can freely break fundamental UMD tools, during my time in KMD team it was not even accepted to break the behavior of a sysfs only
> use by IGT display tests.
My point is not that the KMD can do what it likes and break tools on a 
whim. My point is that the content is going to change because the driver 
itself is going to change - different hardware, different software 
algorithms, etc. There is nothing we can do about that. But what we can 
do is write those userland tools to be flexible and cope with unexpected 
changes in the core dump file.

E.g. use the '*** XXX ***' headers as section delimiters rather than 
assuming the presence and meaning of white space.

>
> Like I said in the previous version, I agree with the change if you add one line breaker in the end of guc_ctb_snapshot_print(), with that: Reviewed-
> by: José Roberto de Souza <jose.souza@intel.com>
Sorry, missed that comment.

We can't put a an extra blank line inside the helper function itself. 
That would break between "status (memory)...." and "g2h outstanding...".

> having a break line between sub-sections is good for readability:
But that is what the indentation is for.

Each sub-section is indented below a header line so that you can easily 
see exactly what goes with what. A blank line between main sections is 
maybe helpful but for subsections, IMO, it breaks things up too much. 
Sub-sections should be kept together to show that they are all the 
related to the same entity.

John.

>
>
> **** Xe Device Coredump ****
> kernel: 6.9.0-rc6-zeh-xe+
> module: xe
> Snapshot time: 1715877420.647211377
> Uptime: 70684.605982665
> PCI ID: 0x9a49
> PCI revision: 0x01
> GT id: 0
> 	Type: main
> 	IP ver: 0.0.0
> 	CS reference clock: 19200000
>
> **** GuC CT ****
> H2G CTB (all sizes in DW):
> 	size: 1024
> 	resv_space: 0
> 	head: 978
> 	tail: 599
> 	space: 378
> 	broken: 0
> 	head (memory): 599
> 	tail (memory): 599
> 	status (memory): 0x0
>
> G2H CTB (all sizes in DW):
> 	size: 4096
> 	resv_space: 1024
> 	head: 626
> 	tail: 0
> 	space: 3071
> 	broken: 0
> 	head (memory): 626
> 	tail (memory): 626
> 	status (memory): 0x0
> 	g2h outstanding: 0
>
> GuC ID: 9
> 	Name: rcs9
> 	Class: 0
> 	Logical mask: 0x1
> 	Width: 1
> 	Ref: 4
> 	Timeout: 0 (ms)
> 	Timeslice: 1000 (us)
> 	Preempt timeout: 640000 (us)
> 	HW Context Desc: 0x01480000
> 	LRC Head: (memory) 280
> 	LRC Tail: (internal) 552, (memory) 552
> 	Start seqno: (memory) -125
> 	Seqno: (memory) -126
> 	[HWSP].length: 0x1000
>
>
>> John.
>>
>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index beeeb120d1fc..422c3f5c87d8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -1515,7 +1515,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>>    		drm_puts(p, "H2G CTB (all sizes in DW):\n");
>>>>    		guc_ctb_snapshot_print(&snapshot->h2g, p);
>>>>    
>>>> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
>>>> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
>>>>    		guc_ctb_snapshot_print(&snapshot->g2h, p);
>>>>    
>>>>    		drm_printf(p, "\tg2h outstanding: %d\n",

