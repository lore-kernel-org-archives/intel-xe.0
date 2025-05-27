Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35687C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 14:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E561810E4F3;
	Tue, 27 May 2025 14:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qg/Hd6ci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7939710E4FD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748356145; x=1779892145;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l+A3zI6TQFf9/902+brl8+Mex5K2bvdDLSkL7feyIvw=;
 b=Qg/Hd6cixmJlwDdxZExQE7GyzR1KpgrPxoJfgep7bSx6f2MQFCy7+cRq
 KaqKGvlNuqrYQT6PiFhmzbRB8EWNcDNs3M4lwgvIo3LcxTiEyWeQ1RUtK
 iwSqKzHIMGzy/17EduiAUOb2i6AOixYqIjgwA4Ee6uFoR1DI981p++/LB
 lPwzGugLbBjsgzUfFyDbcckwk+wDAqgLbhpiTTunDPO3OjZ47Vbl4wP4j
 bT1o9mx68wCYQ2FJ9fqw2hp58fE47X3TAxYdyj6fnnjfLdjS906IgLz0O
 MF8Kh2IFZgoBbaee0w/71HwNcCgfuvQ1GWFxgSchk3bBg9aWHgGwNB7t3 w==;
X-CSE-ConnectionGUID: jKzoYBMkS0O3G25jjBsBrg==
X-CSE-MsgGUID: JJQrbTKXSg+C3c4c+FR4EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50228045"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50228045"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:29:04 -0700
X-CSE-ConnectionGUID: 72nt7k9DRiG4GFDILHOwyA==
X-CSE-MsgGUID: rhnJtbUjSC+YwdkYt43omw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143805949"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:29:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 07:29:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 07:29:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 07:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C16QUyEBXEs/Ui2raDbOWL/alPcRJcoj+QvfNNFDAzDgPZ9R3m4WBWJ7GPEO9CTEXdNp7h3v2L4GqWvA7CxvuiQna/KXjMjqXDCs07VvLn/QYN15x7yzNTfu84ekjMRHBuhP/wLZkYySkh3FJ0ry4pcb7ANemq+RYMPkkgm/LMihFLtYBZZQtB6RyC7PLgpCBdljSSjbZjTK886Sxa8zo10Oif9hNgJ8GGDttzuRUlJq+lT0pFtexzOdqfEd4WGp57fQYMrlEll0+S8+qF7ezfpciXv45Zlg1/I249WZJaWoaMaDrioyQn7B4/1g1fVxFqazvhpIdgbNoD6jouyKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r7ZwlfIc7PP9/BnfqesN/R/yXCCEtJvpdl+leJL90M=;
 b=f6Qne/CIbHx9kVVi3885/U/044/DTghUDXJRm9Nezmq/iWFkTmY/cpUqPsTBEtFqPsqx14ApK3W8jSiHMiRknuGE1rGnv6MszJ2HrxKB9iiTxuqMF8AxCEG5wuXcNKE31r4YDQ/ohLn3qAkWWK0X+fbKnmnzeK7B/dbv+Wm6lu+/R3gOmoFJ0+9D07vr5CmpVSE4Lk6zGFhb5A9jOcFI+cM9VHVN4IWsDwNdLa7RPFi5d7da1pdp7xJrhhWbJJg7QAd2LzZnAfjwljd4NhXmXVi8Bm7ZCWvjIb+nt00WpHpTYMQIUpqb82BACcVfOFAc//f95nC4zc0mszPCxA5wDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 14:28:18 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 14:28:17 +0000
Message-ID: <a07aae14-e824-48c0-8b0f-974b3c752262@intel.com>
Date: Tue, 27 May 2025 16:28:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-4-tomasz.lis@intel.com>
 <LV3PR11MB8695C380854DAA1F7F585B87F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <LV3PR11MB8695C380854DAA1F7F585B87F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::17) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef327b4-4049-4578-51a1-08dd9d2ab869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDE2RVd0SlM1S3ZPY29YSFNyQU1FZ25SVHJWTHRwMXJkUWF5NGwyamRZOFZp?=
 =?utf-8?B?Uzc1bk1qY3psVDhSV2kvSitNYzFBK3R5b3dIZmtNa0g3UUEyeGRlTDltTGFk?=
 =?utf-8?B?RTl5eGZ6a1VwQU9jWUJtTmFSM0Y3V0JuU2JRbGlpZ2ZiZmhuSDVGdTVxL25X?=
 =?utf-8?B?TGNDSk1OZGNjRlAwYjV6ZHh1cnhPcmtaRmtNK3Fla205OUhiNjVORmVxM0ZH?=
 =?utf-8?B?OFh6N2tzOHZTQ1FiOW1QSEJLRWs4a3dDbE9uNUg0Zk9UTWkrTXVWMU1yU3pk?=
 =?utf-8?B?WVZXdCtmRHE5Lzc0dE5kbzRnZEFlV1p1c0FtNEZtUU1uWWJ6VGRLRzhZS1hT?=
 =?utf-8?B?c293c3RLSEQvb1ZQdGwvaDVRRVphRlVwSVpic2FDd1lid2I5T0dhb1A1V0NU?=
 =?utf-8?B?ZDNnNklzY1dwTmNyK090T2FtaW1nd2Q5d3FpZG9mTmNZakFhbysyQU9Maklz?=
 =?utf-8?B?UHBxaVNDOXdRNFhYSWUwcy9vdkEvdENTc0NwZkx1ZHpZeW5HcFJHYW9wUVVJ?=
 =?utf-8?B?RzVjRE9PRnVMVklNWWhNRk4vbEM1alRHZlhsRXRVcEx4S080a25td1E3OEpr?=
 =?utf-8?B?MTAyajArOU1wTVQzTnBNRUFiQ3h0a1lZTUltbmlLTkdMMCtMRHVwTm1QeXZt?=
 =?utf-8?B?c3p2c1JlZGY1a0tza0tWSUE1S1pKek5JRVBySWJYekVDdTJYVmMwMHBMTDZi?=
 =?utf-8?B?djFpK3h0VHpSSmZuTWtTaUVxaTRwdXVNWEIydGM1QkNiYTV5bDNmUUttSStq?=
 =?utf-8?B?STZVVFV5alBUdUhTVTBsM2NKSnlleEtWNzhVcHhSZzVXdmVBRDJjZ2t3QzY3?=
 =?utf-8?B?eW9tR2hkVmxVTDNrajRpZTFVTTdHZ3RkMktQM25CNE9RcEUvbkQ4dzhSSW03?=
 =?utf-8?B?VzdLbzNLaXAyQWJQbk1TRm1Vdm9QV296QUZmbllpN0RkQmhINGY4MXJ5WXJM?=
 =?utf-8?B?UnpKYy9ZcStmQXRsSTVEcWFFTnZLb0FqTU1BV2RKRmpzYVZib2ZmbUFaTGhx?=
 =?utf-8?B?REJ1dVpSRG1UMWVoOWN1SGFrYkdiVWZQYVRNQ0ROSWk1eWY4S3FHNFA2UEdH?=
 =?utf-8?B?U09Ja3V6dTJ5ekZPTjJDWnZreXhxMGM0OTlRM3F3aWhPVzEyQm9oRGhUWkVK?=
 =?utf-8?B?RVdEeERCc3VWRHdWelN2VE90NWlGWGNaZ3lSeFp2VDVXUzhXSk9BcmFrTllI?=
 =?utf-8?B?KzdiSUZCK1AxQTBuS3p1S1U3czhRY0piR3c3eU9ZZUJRZkNFbk9rVWtFa3E3?=
 =?utf-8?B?bWxaeW1JODlJSnRZRmdmdi9oUXMwSVBNZFlOd0FLeTQwU2k4TmVxNWlxc1l6?=
 =?utf-8?B?ODA0WlBFOHBLaFpkU2JrSWFOUmxRaElUc1BFOGI1SnNNc0M2TTYwYmlobXlk?=
 =?utf-8?B?OUJEZE1ZaXc5RDNGMkNDNE0vcEdUZERZZmNtakZGcEVHcGkzL1lnOGhhci85?=
 =?utf-8?B?Zm9zRWg1bzEyVnJ2blkwTGpTRjk4Q1BhTlFaeHUxUVlLYXMrV3BTa3U1b01P?=
 =?utf-8?B?aGVzenFGN3dVZUxBUll2enVXL0k3NXZSMkJXU0trM2o3S0JGR3VLVVdFSzlN?=
 =?utf-8?B?UW1OdXJoSEE2R3llOFRHd1kxNVZpQU1Bb1p6VVFxc3JNZmtsNXd0UDNuVjdK?=
 =?utf-8?B?QTlhSllvMEkrM0I1TWVtZW43Zmg0V2c4T1pPU1g0WjA5a25ocDNONzIzbk02?=
 =?utf-8?B?clJQNUtNT2tQZTFYZnVQcWc2VmFNcFllYkl5TURmaUViTTZIVjgvQmhXY2Jj?=
 =?utf-8?B?aG4zUitxV2wxZG1IVlk1SGtoRFBqcFZ5SGdjd2RBWm04NVlGcWFwMUhRM3hC?=
 =?utf-8?B?Z3RORm1aa25rMUJkVkE4T01hOTREU1pVeEg5bk40OUVlbjU3UGErWG8rbERv?=
 =?utf-8?B?eFZsdFprenBQaDZrQ2ZEbjgrSWpqMitGVUJsUkg3TDNPUVVaYVNEZzJTVDhp?=
 =?utf-8?Q?06i5B7KZ6ww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVo5dDY5MHpvVmtyZVRUYTZ5SUFhcmVnMTBBcG5VVUl6RVVjcXRNOXpWVytu?=
 =?utf-8?B?bXlPZnJ2WEg5SStsbzFFcGg4bHowQmlLZE9YMkdiWUE3V0ZSeGsyZHhpRWJN?=
 =?utf-8?B?NDNZU3RLblZxbUtVdzhPbDZjK2QvYnNRczgrRHMySUVmZ3NRVG90dW84WUR0?=
 =?utf-8?B?SGZINnVNY3BRQXY3LzdBRkltdzd5YjZ3VVNPdXB1RmNibGcwbHNsVmNVc0hH?=
 =?utf-8?B?M04xK054bHVDZjF6MFlXOUkzajJTaDVTSjZNWDN0ak1mUnZJRExyN05ld3dE?=
 =?utf-8?B?YzVydmQzemZ6cXlUSGlBTEtRbFk2d0I4dzFYWUFPdFBrMDJ4bUw4YURTVVJG?=
 =?utf-8?B?OEl0RysxSHFaN1JkWlpmcmV2RVFTVHNsMTlTdEtZTG9sUG1QQWVuV1VLNlJ3?=
 =?utf-8?B?ZEc5VFRZWWduN0N4WGhMNmtEb2JvSml6U0UyM1lBSG5HUFRBcXloQmsraHhB?=
 =?utf-8?B?dkxKTElqVEpyTHdwbmNLd0g5VGx2VE1MeVY2Wm9DNko2dEZPSTdXOThieVZW?=
 =?utf-8?B?VmVRaEZxa2ZENGJ5TXVWb3MxaVNTV0xScG1aWXdjbU5ENms4MkwvWC90cy9V?=
 =?utf-8?B?V0Y4eHpyemp0YURaVkFWa0U2V0Z4c3hNa2hXZ0I0b21TYVJMWG5DQkRIWmph?=
 =?utf-8?B?bDMwbzc0dkdJWlNSeDJwVDAwUWdUS0JMTEduTHFHZ1FJNkVHNUZSRlNLMkpW?=
 =?utf-8?B?NHhaVGlOcGpOSFdxL2lPRzNWZXRIMk1SNmJwS0FsY1dKTmp2UGZ6SmplNFli?=
 =?utf-8?B?SjBTdk90QzUzcDR1TjU3VzhLYlNqRnhYWHJtUTJXMHdzM25WQVZLazFWeUJs?=
 =?utf-8?B?bE9JOTZUaTRtL1pqK1pNV0xqcDJOdW5NWEFWamJ6VU45cFhZT3ZwMUx6SUx2?=
 =?utf-8?B?K0gxREtoR2NJUGVuWGhaYTd1QlNMSHl1eXgwU0NxOUN4S3JNNWxIZHJ6KzFY?=
 =?utf-8?B?OElwOWZDeERqRW9hWUN0RFdVbVYxcEVoMmkvdnFEVWN4Q2dZdjJlZXNKSEw4?=
 =?utf-8?B?ajJzMEh3bG1vblU0WDl2K2lhZnFmUDM2emxXVlZ6dStVUldUSEVJdHVmalpB?=
 =?utf-8?B?MC9HNENzdUpIWkVzQ2QyUVB0eWkyS3UrSENKUFQyNmo3OTc1ZDJNQTZVUC9w?=
 =?utf-8?B?aTIvbTVUbHAxT1NONE9pTWVncWFxcUVyeUIxWTJINk9vYktmNWxTaDhtN0hW?=
 =?utf-8?B?dHIrZk00U280MkxVK3NRSmI2Wko2d0wxaTJWek1EMjhSZ0VvMkpyOFVGTVBC?=
 =?utf-8?B?NkxrTVNGTEpld0gwZDF2bmF6S3kvUDFGcmhNQTRLaTJLQ1h2RGJXNmUwak05?=
 =?utf-8?B?NkpPVkJnbFVERGdwa0NpSUNESUhGSGpJUzNRU2VCMFdPWG9UK3F1K0hLZW96?=
 =?utf-8?B?T283SGRxT1lhWjBRUzR5b3Y2ZUpVbk0yTU9HNVJ3SnJoRmtxR3FzNmtjTlB5?=
 =?utf-8?B?ZjBmOU9oMWtyejkyTElDV0tGemZVejVvZGRiKzN3Tzk4emRPbUZMMGppcXNi?=
 =?utf-8?B?RnZ5dXpSajkzTEpxSkhvcXZIcVVtV21ER2hDVHVXQXRLZ1dmYm9uZUF4N0cz?=
 =?utf-8?B?TVBDVlRSbHhtanVqZ3ZOSDRoOGtJMUkyd25lV3F0QXZBbWxkYitrYmUxSkVK?=
 =?utf-8?B?QUppZE1aM3FoK3QxeS9TcFJ2NU9BWGcxL1RNVzVuNURtanFIQlRMVExCVVE3?=
 =?utf-8?B?SjhCYXI3cXlHL3JaWDFDaEJSd3pYTzRVNHhnOTFXN21ER2VzNnUrNmlCeWN1?=
 =?utf-8?B?blVPQ1JWZ2gzTnFwWUlzaHZyVXZMNzhhMytsM1VFWXRzZG1sTk1yUGl0VFhW?=
 =?utf-8?B?c3F4b016cVowcEYvQnVWTUljVXNvcW5zQUh3d2E5S25YTnMyWUplS01tUEg2?=
 =?utf-8?B?aEZ6NjNWdElVWnJXbjdRTUFyN3VUclE5eXlmdms3OExPa0w5cWVhMHFaK3JB?=
 =?utf-8?B?UkE4N3ExVitxeUFRak9kbFA5dXdRRTFOWnczanlEZGJZYzFteWFGVnNoWjZM?=
 =?utf-8?B?L0JoZVFTTWxTelRKWkVKWCtlZDNqSWtCUGxydVg2U2VMbWptcW5qQ3JGQitv?=
 =?utf-8?B?bTJjWHBRNzd2QWRlcFdDQzFzdE1WZEZrTW9oSTB4STNiQmZJM1BJc0M5T04x?=
 =?utf-8?Q?lk/N4fcRvwPqCEN8hRK1LZC5p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef327b4-4049-4578-51a1-08dd9d2ab869
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:28:16.8984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhei8jU7UxMYKp89qi8NOdQT5ITSd77y+W0OHH8+EPpgIJVtfyvHEYtgFgIsQ+RFzGkjZ6htaaehpdF2e5UWwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
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


On 27.05.2025 15:10, K V P, Satyanarayana wrote:
> Hi
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Tomasz
>> Lis
>> Sent: Tuesday, May 20, 2025 4:49 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
>> <piotr.piorkowski@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>> De Marchi, Lucas <lucas.demarchi@intel.com>
>> Subject: [PATCH v3 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
>>
>> While applying post-migration fixups to VF, GuC will not respond
>> to any commands. This means submissions have no way of finishing.
>>
>> To avoid acquiring additional resources and then stalling
>> on hardware access, pause the submission work. This will
>> decrease the chance of depleting resources, and speed up
>> the recovery.
>>
>> v2: Commented xe_irq_resume() call
>> v3: Typo fix
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 +++++++++
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c    | 35 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c      | 42 +++++++++++++++++++++++++++
>>   5 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> index 869b43a4151d..455ccaf17314 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> @@ -101,6 +101,19 @@ void xe_sched_submission_stop(struct
>> xe_gpu_scheduler *sched)
>>   	cancel_work_sync(&sched->work_process_msg);
>>   }
>>
>> +/**
>> + * xe_sched_submission_stop_async - Stop further runs of submission tasks
>> on a scheduler.
>> + * @sched: the &xe_gpu_scheduler struct instance
>> + *
>> + * This call disables further runs of scheduling work queue. It does not wait
>> + * for any in-progress runs to finish, only makes sure no further runs happen
>> + * afterwards.
>> + */
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched)
>> +{
>> +	drm_sched_wqueue_stop(&sched->base);
>> +}
>> +
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
>>   {
>>   	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> index c250ea773491..d78b4e8203f9 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> @@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
>>
>>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>>   void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
>>
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 80f748baad3f..6f280333de13 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1811,6 +1811,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>>
>>   }
>>
>> +/**
>> + * xe_guc_submit_pause - Stop further runs of submission tasks on given
>> GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
>> + */
>> +void xe_guc_submit_pause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		xe_sched_submission_stop_async(&q->guc->sched);
>> +}
>> +
>>   static void guc_exec_queue_start(struct xe_exec_queue *q)
>>   {
>>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> @@ -1851,6 +1864,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
>>   	return 0;
>>   }
>>
>> +static void guc_exec_queue_unpause(struct xe_exec_queue *q)
>> +{
>> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> +
>> +	xe_sched_submission_start(sched);
>> +}
>> +
>> +/**
>> + * xe_guc_submit_unpause - Allow further runs of submission tasks on given
>> GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
>> + */
>> +void xe_guc_submit_unpause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		guc_exec_queue_unpause(q);
>> +
>> +	wake_up_all(&guc->ct.wq);
>> +}
>> +
>>   static struct xe_exec_queue *
>>   g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
>> b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 9b71a986c6ca..f1cf271492ae 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -18,6 +18,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
>>   void xe_guc_submit_stop(struct xe_guc *guc);
>>   int xe_guc_submit_start(struct xe_guc *guc);
>> +void xe_guc_submit_pause(struct xe_guc *guc);
>> +void xe_guc_submit_unpause(struct xe_guc *guc);
>>   void xe_guc_submit_wedge(struct xe_guc *guc);
>>
>>   int xe_guc_read_stopped(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 099a395fbf59..fcd82a0fda48 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -11,6 +11,8 @@
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_irq.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -134,6 +136,44 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>
>> +/**
>> + * vf_post_migration_shutdown - Stop the driver activities after VF migration.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After this VM is migrated and assigned to a new VF, it is running on a new
>> + * hardware, and therefore many hardware-dependent states and related
>> structures
>> + * require fixups. Without fixups, the hardware cannot do any work, and
>> therefore
>> + * all GPU pipelines are stalled.
>> + * Stop some of kernel activities to make the fixup process faster.
>> + */
>> +static void vf_post_migration_shutdown(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_pause(&gt->uc.guc);
>> +}
>> +
> Since all GPU activities are stopped, no interrupts are expected from HW. So, is there an issue
> If we suspend all interrupts from XE by calling xe_irq_suspend()?
> I saw a comment from Michal Wajdeczko in rev-1 of this series, but do not see details here.
> -Satya.

It is true we do not expect any IRQs from HW during the recovery. 
Disabling them would increase reliability of the corner case where a GuC 
remains active during migration (due to two migrations where the 2nd is 
triggered at the narrow window at end of recovery from 1st). But - the 
double migration is exactly why we can't disable the IRQs - while VF HW 
isn't running and we can't get anything from that direction, the PF is 
running, and can trigger another migration. To support that, we have 
"defer" path in the post-migration recovery. Disabling IRQs would make 
this "defer" path unreachable, increasing the chances of taking risky 
path with double migration causing GuC to be active during the 2nd recovery.

-Tomasz

>> +/**
>> + * vf_post_migration_kickstart - Re-start the driver activities under new
>> hardware.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After we have finished with all post-migration fixups, restart the driver
>> + * activities to continue feeding the GPU with workloads.
>> + */
>> +static void vf_post_migration_kickstart(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	/* make sure interrupts on the new HW are properly set */
>> +	xe_irq_resume(xe);
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_unpause(&gt->uc.guc);
>> +}
>> +
>>   /**
>>    * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>>    * @xe: the &xe_device struct instance
>> @@ -247,6 +287,7 @@ static void vf_post_migration_recovery(struct
>> xe_device *xe)
>>
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>   	xe_pm_runtime_get(xe);
>> +	vf_post_migration_shutdown(xe);
>>   	err = vf_post_migration_requery_guc(xe);
>>   	if (vf_post_migration_imminent(xe))
>>   		goto defer;
>> @@ -258,6 +299,7 @@ static void vf_post_migration_recovery(struct
>> xe_device *xe)
>>   	if (need_fixups)
>>   		vf_post_migration_fixup_ctb(xe);
>>
>> +	vf_post_migration_kickstart(xe);
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
>> --
>> 2.25.1
