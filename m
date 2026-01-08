Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB022D14888
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 01:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5690D10E2E4;
	Thu,  8 Jan 2026 01:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0mRokoe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BBC10E2E4
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 01:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767835230; x=1799371230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ewPRyCCD8dm9iG/Vl/S90Y0c4SUxrtwPtU8slkCi2uQ=;
 b=m0mRokoeu+4sAos0XoGWjYW8hiDE85xS2bFarar0Vo8x1urunXWaO+wh
 ++Kv3meRH6ox9VI8Sye41+sUzOVGlgnmhZ6xW7LjYN6eK0BYseqnw2fIj
 4/9LKRBZlNrpUis/SR+eZdSdChm0oouiX9bfM0mcLgywcjZxAPtcox8jt
 d/0sHVkUg8i2mIOZm/5fKysAVaE8wd6iNyothxFdxHHA0fU2Pb/0IIhjg
 cQlBY+wSf/6CsJlh7W0kM+ebwrYghH6zgaV4Pmq+kOq56ktLuHmEIRuup
 9o809eAu4WRXRa2c21FoW7YzCa7QAnmJBnYPgCE3FQfrfh5xmnQpcOTc3 A==;
X-CSE-ConnectionGUID: MMzbmlP6T12j2gEHbd1fsQ==
X-CSE-MsgGUID: 3YQM4ATQQQG3b/rrIdUJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56771757"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="56771757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:20:29 -0800
X-CSE-ConnectionGUID: L+i2dGaTQlu2riE4btAccg==
X-CSE-MsgGUID: mFlDffbfRk640qQHcEPvQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203127487"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:20:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 17:20:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 17:20:28 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 17:20:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+VzsHh4ePDEFW7yZpAJ14DU2HWz26gSsxMfVjFUPaXrTm5CrYITO/JjbbB0Iy1a/1SA1aSN+WpkbvTvPVcCa8V70RMPFJVvYXDbxFm4kPD1DaXAymDmWp9WVdxX0P7+oowLB59xGdVJ4phI8O83/YRuEWA7D6SuaMx/czts20l9AjIUHoIhIB0+4o9F/AHBObc7o/cMNrQ9HWox2omQ0ZTzdmxpcRb4Zq+3Av6jGh7Ju0MM+PibM4CXPievUH7WewgYbSbljIepF5fDMR8IBe8TYpvZwANmT54rh42Mm1eVytZyrjvQBD+WctH5V7Vo7Es+CQkn0W7wS31I9x63og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UW6/5neY+0TT8mvYG3Du9rGxBNwrrzmPyH1qfc2wbfc=;
 b=BjfZuBM0BZzosl1ELk8xtDTFVpAvL87buN3tdfMnGP0vhXqr03UTYmq3GGJ3tCPdqjc1tgAwchC9vPvaHIvOQX8zzg6GRbbOnlzps4nrZNCExm297fY0EiOuF4rFZWO4nrbbzjJhJHJCdO2gxIzs8B5XTSzh8AqTjRgzJ3bh1z9APGXq2AYE4Qiq41oEjJ8m7ql7OkkgI0Y3L9vLV0LeGq9BCGq0f7rJBhmzMf4YNiQrBbenXBUqleALXy5l95MXGulheTT532WF4acz6IR/yPiqAtGhlnHU5b7Vtv+yBKWd2S5iy7zlR3+Sr7UpdxYs4iy1EZHQEfcVrxlKSVgJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 01:20:26 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 01:20:26 +0000
Message-ID: <dd8191c9-1444-45bd-b557-a3e8df67cb49@intel.com>
Date: Wed, 7 Jan 2026 17:20:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Allow compressible surfaces to be 1-way
 coherent
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20260106185501.964562-1-x.wang@intel.com>
 <38e7e2b5-bf30-4353-b97b-272e6ac3bbc1@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <38e7e2b5-bf30-4353-b97b-272e6ac3bbc1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab1976e-d68d-4143-01e5-08de4e541a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTQrRjdpd0tYd2I2TGF4Um1zL3RTVjg3VW5YVVdlTUd3VXBIcTNweWVJclZM?=
 =?utf-8?B?QVAzd3QrZFM1dnhjRVhlMkVrZkxVUHJ6UC9qb2JybllSSG9mT2JaMUZJVWx3?=
 =?utf-8?B?RDIyNzN5Uks3am1qNm15WHhYc01xbElWSmNqeCtCc3RDS1JRbDQ4K1RPZFJK?=
 =?utf-8?B?RmJEc3NEb3VwbzlWT2JoUHlndXp0WXFVOEhmdThWWVN2K0pucTZGakgvTnF2?=
 =?utf-8?B?L3JwK3U0QjhPUGhieWlLV29rRjJmTDhtVXYwd0I3Y0NJbVZaL25mU05BZGJN?=
 =?utf-8?B?SG1hZ2tYNndQWnd2dEFwTGQ2UWd1OXo3WXk0NWRSQVdyeVNvL29TcUdOV292?=
 =?utf-8?B?M2NWdjh3eG9qMlV6RldCWjA4MlIydmdtY0cvdDNNTWNmbkZaUUtOSUhwZC9s?=
 =?utf-8?B?dUJjY3liTThYekVENkE0Rm9hWFdqU2V0NjJsRTIrSGdpZG02ZHl0RHpCM1JN?=
 =?utf-8?B?NGhtYjU5c2VNZ1N2WWI5WjBnSm40aUd1T25TQTUyYzI5SjNnd29UcHRzZkg3?=
 =?utf-8?B?czNrK0xEbmk1cHM1enUwSDFVSDhWWnVPc3lYT3hyVWQvV3N5WEFqb1FTMFdz?=
 =?utf-8?B?cldXbnZwQUJmYmRHOWFTbGZnNzJaWW51Y1lBQ1hmbkRjeFZrK0E2TVhrcUYw?=
 =?utf-8?B?L0xEMkwzM1pIWTY0MXYzWFBjS0picTlnSHl3Yk94c2h0RTU3dlFiOHVHSXQy?=
 =?utf-8?B?SndkcVIwaS9HTFRoZFNySG9sblAyNFh3NUVZZyt6WWV2bGQxY3ZLSXcvMGtF?=
 =?utf-8?B?bklXUHFpY1NwNEFCeXZzQndzUVNQd0hhT2p5M0FCUlRSMUJQNDFPQ0lKQVlX?=
 =?utf-8?B?b2ZTUXdKbnZVbDRCNnRSdy81dWRTdFUzMnYvZjRiOGtWVktvZ09JandabFZP?=
 =?utf-8?B?dTAwSFBIV09YeDFtUXRzSnRDenNvS3NRL0FXZHhjSEZEZzBGNEJSYlIzVlp5?=
 =?utf-8?B?dThsUHdvUTZNbkNlR0JuUEtMSEtUZU5hVmVmL0ZaWWtGVGxLVTRWM2NVTlIr?=
 =?utf-8?B?ZFFqSVg4NnJYRG1wSmVnQ1l6cjUvaDNIUTh5R3IrSk4xZTdUb3pBUk91Sktq?=
 =?utf-8?B?M3pLenJpV0pjV1VoYkwrdGNhM0xYc3JUamlLMXF6S2NvcXZjNXBkRi95WnlB?=
 =?utf-8?B?RC9ITVUxTXJZNkRTdW1EeUVhSVg1T2wvd2NjMk0xK1QvYTVTa2tiUkpTZUhk?=
 =?utf-8?B?Nms3TVZXaW85aHJ5aExwWElreXhoN0NieFZOZ3dGaGJoSnduWEhGYmFtSDhK?=
 =?utf-8?B?Z0tkeENvcGRhZUdkTGxtc1hrZC85cHVQZEplc1RCSWNaQXEzMnJMVkgxaGZY?=
 =?utf-8?B?dENVbjhwS050K01mb2RoWXI2UHJLWDFhNlFmQ0VmRHNZSHBCN3B5dVF2bnBh?=
 =?utf-8?B?RHpQamFRMzRzdmNJMm5LRWQrMzBnQzNhdGs5MHl6akZPTGxGYWxWWWNiK2J0?=
 =?utf-8?B?Qkw3NkpHR3F0andzYXZkTEFPZkVsZXpia05DN1dpRVp6UGY5MVZWL2ZHdXFj?=
 =?utf-8?B?NWhKUnJZZlNrOWJ5SkcyU2lLSmJka2phV0lNNWpGQS9QQ3BwMHdrK241eEUy?=
 =?utf-8?B?STZBRWc4SWt3TWZhWmViazVmTDY0ZFhQSFBPc0pQaTN2d1laVU5ZeG9GWDdO?=
 =?utf-8?B?KzNQdmZLbW9aWjJ4UWFnMjdIZkNTZFNTUUkxNXkvUmJMaDUwRXpzUnJYak04?=
 =?utf-8?B?Wms3MHdDbk54SmhXWWU1YmQ5NnRVc1V4TDhsZTFDZEE5YU96N0Y5ZUJMalVa?=
 =?utf-8?B?a1BuSHF1U0VlRW1xeHZyZ3FTODhOT1pRanhzQWwzRzlhZEJxREhaYnBXN3BE?=
 =?utf-8?B?UU5wODROUlg5bmgvRzZjVThzTjhSaVR5YURBMEtuSGY2U3YvYUdXcmdqakE4?=
 =?utf-8?B?WUcveGs5ZFlndW0zR3R2aDEwL25uVTZSakYyaFlqVmZCOVlXYXI5MUpGRmpV?=
 =?utf-8?Q?Xrt4TE6FPcsZX2rYMCxkRhTsm9A9wxgQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWZER3NudWRUSTNzQWl0R3NvRXNvNFZlOCtWQ3l0Z2RRbnlkVHVGbUxMS3Ja?=
 =?utf-8?B?VVJyd3pRcVZ4dFEvaWgvdmFhU1h4MFd2QzZDdU9UY1JZOWFtVUU2MVlDZmJS?=
 =?utf-8?B?eFMwNThUekhxc05iNHVyODNFbVRkTXlrbFlSbUh3Q3BjaUFUN2VxZjEyVlFG?=
 =?utf-8?B?eWltSW4vSng2MjNjZmhYaTJmWFIyb1BLMDd2VXFaNnZxb3lBZS9JYnhwWENY?=
 =?utf-8?B?UjYrNzhqNWhSQ0NTUCswaFhKelhTck5xa0htOTBDbjNBYlFUZlFRY1dkbll5?=
 =?utf-8?B?ZHduYUdVS1M4YVI3ZFZ2b2E5Vkk1V2NjUS85ZXpPTjZDakVtZ05vamNKbjFz?=
 =?utf-8?B?MUdNbGtCQUVLRXB3TXREMVQ1YmlkSlQ1bmVROVdsUHcwRk9uTXAyQzNIamE0?=
 =?utf-8?B?dkZxTW9hWHZFUHFDcDNoekI0NEU0NmF3bkJTWkdBYURiRkRjUUVqK0svR2dN?=
 =?utf-8?B?TWpRNDRUSURCQnptOXRYdnpEMnAyTzNhdXpmNmgzbTMydzR0bGdzcGRPZWdn?=
 =?utf-8?B?QTROU0tNbkJRcm16dW84QVI0NlZ2VENDTnhHMkZhQWFGQkJpNHRxMDNGa2lM?=
 =?utf-8?B?V0FoLzN4S0crUGxqZVduOXR2YW8ySkFnNEQ4bW9hTXpMbmFadTFOaUMrbDdm?=
 =?utf-8?B?cHJWbHFESGJNemVEcEt6cW5OUHM0QTlwbVVFSklDU3NPWm9penVIWE5GYUZl?=
 =?utf-8?B?R1JWelZ2OHFGbjBlNDV0RFdRWkxScU1lWW0zM1Z4NXdlKytlaDlKaTNZQWM1?=
 =?utf-8?B?alljUHNPajVTYUdRbnhRSHNxLyttbUdsSHlDMFV4ck5xL1k2MVVEbmh1YzZx?=
 =?utf-8?B?SUV5MFdZcFhtRXZpdm80cDlBUVkyQklHeWlIdXcrclRRWjVLbUZCOGl5R1pW?=
 =?utf-8?B?QVV4ZlNVUEk1S3Q4TE9LbThCak5hTXRDR3pGd2Uwc3lMT0wzUXRvTG00bVhW?=
 =?utf-8?B?aVNQTFA2R3BCZ0dkak9QdGtaOG5VaVUwTmRKTVMzYXJ4dXJDN1hMeDBuSURw?=
 =?utf-8?B?aFl2VmRNc2E4elVxaitNcG0xWE5BTVUvMFMzQmEvOXBWNlFFVkNSdDl6Vzc0?=
 =?utf-8?B?MFR3SEJIYUp3N1BvbjZUODdxeEtZUVV2K3lHRVhBZk5yVTRYWGlORlRTYUtL?=
 =?utf-8?B?UTVyYS84Nng5MU5LLzRMaU1lSWtCcUdHKzg1aGYvV2tlZlYrNEtGZ1pmd1A0?=
 =?utf-8?B?bnpZcXZMTVU4eXQ5WUt0K1lqdTFTRUp5R0cvbVVCdVlPcitkWk1tWlBOdVRG?=
 =?utf-8?B?djRLUlJVam05SXVlVzM4R0RyZFk5Uk5JWVdqV2duMjZBZlhHL0dPUlVBMnNC?=
 =?utf-8?B?czE4Q2RPSW4rU0JRT1RrbUt5NHMzdGFPSmpCYUEzbUk5c1I3WWl0NWtodnB6?=
 =?utf-8?B?VnJISVFFRDVzUFVxZHE0L2x6bjR1MVlUYUNtSmVCdm54S3BtbldCNWdoaE9r?=
 =?utf-8?B?Z2xSRGpWWDJJSm82ckxNNnAyQUVWWmJqQ3dRNDlLTkxUVm9aRjNsQlVNWEQr?=
 =?utf-8?B?SmJuWHFIR1pkVjdxc3owSkt5L3c5b2J0YUU1QzUxdjhKb2tURWhqRitXR0Q4?=
 =?utf-8?B?NHNpcHRuKyt0THJEZVIwM084dXgzU2ZjWXo5YmNvQ1Zodm9xUmNXZmFMTDdS?=
 =?utf-8?B?cHVnaHg3cGdraGNKTmVvNmtIVkJTNVhjYk5zU09jU3dXSi84UXdwMVdHZXp3?=
 =?utf-8?B?SGRnRS9wMnB0MmZMTUdVUnpuYkhoU0pkcWp1TlNVZ3R2UlJ1ODdjYjNaRTZ3?=
 =?utf-8?B?UUhuSkJ1TXYraTZQWXQ3Y2VSZEswTlEvbXl6Y1NwVW81VUIxdktYTEpBUklL?=
 =?utf-8?B?dHk3ZFp0WG9XZ0trcGxyVVBtc1liNlY0SFIxZFk3WFVFSmYyY1FaaXJuNHFi?=
 =?utf-8?B?WUhsSlozaTQ2cVp5QWFpU1lXZE9tSEpHLzVaT0d5UWlHT01wQU5vVHRzMTJ1?=
 =?utf-8?B?QkJBcUFEZnNPbXRWVVNmWFJyenpDandGN0lTWm54VzdFTU9wOHY0SFZUckNE?=
 =?utf-8?B?cXc0QnNUSHp0dkIrVWZZSjc4QmNJQXhHQ0Zpa2RrWUliMmZ5SXZHT1AycEZ0?=
 =?utf-8?B?N1NCVzl5bG9WcFRveDEzbmdvbTJodUJjWmNvcDhMbXpKT3R2M3BOOEJ4bGhu?=
 =?utf-8?B?bkZRMkE1VXNHMnpZVTJ6bzVTUHlqUVErZ0t4WUZ4aUdVazVJb2pSRjlxRE52?=
 =?utf-8?B?VXUxUnpLTHo1VVg4RjV6REtmdlZPYmVyeUMyMjlBUUorZjJ0NFRueHYrUWxM?=
 =?utf-8?B?YThWZVo3cHlpb09Ed1ptZFAxNjd1NW5oQURuS0pWN1V6TlZTOEFTdENJMVFl?=
 =?utf-8?B?RlFhRFp5ZE9PMDZ1NmdVeVdLT2lUTHRTa2U1emxFSzBDMVNmNWQ2Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab1976e-d68d-4143-01e5-08de4e541a4e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 01:20:26.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyEh5yD2QKmtutiLNlyIVtnPuNJKfGfKgAoUXSOWmfIXnnDkiR9CaysPWwEYRZv+14WwXosxaTksnF4zB0ntPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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



On 1/7/2026 01:45, Matthew Auld wrote:
>> ...cut...
>>       /*
>> -     * Compression implies coh_none, therefore we know for sure that WB
>> -     * memory can't currently use compression, which is likely one 
>> of the
>> -     * common cases.
>> -     * Additionally, userspace may explicitly request no compression 
>> via the
>> -     * DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag, which should also 
>> disable
>> -     * CCS usage.
>> +     * For WB (Write-Back) CPU caching mode, check if compression is
>> +     * supported through any available PAT index. If not, FlatCCS
>> +     * can't be used.
>>        */
>> -    if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB ||
>> -        bo->flags & XE_BO_FLAG_NO_COMPRESSION)
>> -        return false;
>> +    if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB) {
>> +        bool wb_comp_supported = false;
>> +
>> +        /*
>> +         * Compression for WB caching was introduced in
>> +         * GRAPHICS_VER 30 (Xe2). Earlier versions do not
>> +         * support it.
>> +         */
>> +        if (GRAPHICS_VER(xe) < 30)
>> +            return false;
>> +
>> +        for (int i = 0; i < xe->pat.n_entries; i++) {
>> +            if (!xe->pat.table[i].valid)
>> +                continue;
>> +            if (xe_pat_index_get_comp_en(xe, i) &&
>> +                xe_pat_index_get_coh_mode(xe, i) != XE_COH_NONE) {
>> +                wb_comp_supported = true;
>> +                break;
>> +            }
>> +        }
>> +
>> +        if (!wb_comp_supported)
>> +            return false;
>> +    }
>
> Would it be cleaner to make this a feature flag instead of checking 
> this every time, if you want to avoid the version check? 
> info.wb_comp_supported?
>
Since we know our newly added PAT entry will definitely be used in the code
later, we might as well add a new cache type, XE_CACHE_WB_COMPRESSION. This
way, we can determine the return value by checking if a valid WB COMP pat
index exists.

Xin
>>         return true;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 313ce83ab0e5..04dbf995a18b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -140,6 +140,36 @@ static void xe_gt_disable_host_l2_vram(struct 
>> xe_gt *gt)
>>       xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>>   }
>>   +static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    unsigned int fw_ref;
>> +    u32 reg;
>> +
>> +    if (IS_SRIOV_VF(xe))
>> +        return;
>> +
>> +    if (GRAPHICS_VER(xe) >= 30 && xe->info.has_flat_ccs) {
>> +        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +        if (!fw_ref)
>> +            return;
>> +
>> +        reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>> +        reg |= EN_CMP_1WCOH;
>> +        xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>> +
>> +        if (xe_gt_is_media_type(gt)) {
>> +            xe_mmio_rmw32(&gt->mmio, XE2_GAMWALK_CTRL_MEDIA, 0, 
>> EN_CMP_1WCOH_GW);
>> +        } else {
>> +            reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMWALK_CTRL_3D);
>> +            reg |= EN_CMP_1WCOH_GW;
>> +            xe_gt_mcr_multicast_write(gt, XE2_GAMWALK_CTRL_3D, reg);
>> +        }
>> +
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    }
>> +}
>> +
>>   static void gt_reset_worker(struct work_struct *w);
>>     static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>> @@ -466,6 +496,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt 
>> *gt)
>>       xe_gt_topology_init(gt);
>>       xe_gt_mcr_init(gt);
>>       xe_gt_enable_host_l2_vram(gt);
>> +    xe_gt_enable_comp_1wcoh(gt);
>>         if (xe_gt_is_main_type(gt)) {
>>           err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>> @@ -745,6 +776,7 @@ static int do_gt_restart(struct xe_gt *gt)
>>       xe_pat_init(gt);
>>         xe_gt_enable_host_l2_vram(gt);
>> +    xe_gt_enable_comp_1wcoh(gt);
>>         xe_gt_mcr_set_implicit_defaults(gt);
>>       xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 2c3375e0250b..440a9013dc04 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -132,9 +132,10 @@ static const struct xe_pat_table_entry 
>> xelpg_pat_table[] = {
>>    * in the table.
>>    *
>>    * Note: There is an implicit assumption in the driver that 
>> compression and
>> - * coh_1way+ are mutually exclusive. If this is ever not true then 
>> userptr
>> - * and imported dma-buf from external device will have uncleared ccs 
>> state. See
>> - * also xe_bo_needs_ccs_pages().
>> + * coh_1way+ are mutually exclusive for platforms prior to Xe3. 
>> Starting
>> + * with Xe3, compression can be combined with coherency. If using 
>> compression
>> + * with coherency, userptr and imported dma-buf from external device 
>> will
>> + * have uncleared ccs state. See also xe_bo_needs_ccs_pages().
>>    */
>>   #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, 
>> __coh_mode) \
>>       { \
>> @@ -144,8 +145,7 @@ static const struct xe_pat_table_entry 
>> xelpg_pat_table[] = {
>>               REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
>>               REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
>>               REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
>> -        .coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || 
>> __coh_mode) ? \
>> -            XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
>> +        .coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
>>           .valid = 1 \
>>       }
>>   @@ -181,6 +181,38 @@ static const struct xe_pat_table_entry 
>> xe2_pat_table[] = {
>>       [31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>>   };
>>   +static const struct xe_pat_table_entry xe3_lpg_pat_table[] = {
>> +    [ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
>> +    [ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
>> +    [ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
>> +    [ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),
>> +    [ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),
>> +    [ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),
>> +    [ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),
>> +    [ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),
>> +    [ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),
>> +    [ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),
>> +    [10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),
>> +    [11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),
>> +    [12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),
>> +    [13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),
>> +    [14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),
>> +    [15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),
>> +    [16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),
>> +    /* 17..19 are reserved; leave set to all 0's */
>> +    [20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),
>> +    [21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),
>> +    [22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),
>> +    [23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),
>> +    [24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),
>> +    [25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),
>> +    [26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),
>> +    [27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),
>> +    [28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),
>> +    [29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),
>> +    [30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),
>> +    [31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>> +};
>>   /* Special PAT values programmed outside the main table */
>>   static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 
>> 0, 0, 3, 3 );
>>   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 
>> 0, 0, 3, 0 );
>> @@ -501,7 +533,10 @@ void xe_pat_init_early(struct xe_device *xe)
>>           xe->pat.idx[XE_CACHE_WB] = 2;
>>       } else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>>           xe->pat.ops = &xe2_pat_ops;
>> -        xe->pat.table = xe2_pat_table;
>> +        if (GRAPHICS_VER(xe) == 30)
>> +            xe->pat.table = xe3_lpg_pat_table;
>> +        else
>> +            xe->pat.table = xe2_pat_table;
>>           xe->pat.pat_ats = &xe2_pat_ats;
>>           if (IS_DGFX(xe))
>>               xe->pat.pat_pta = &xe2_pat_pta;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a07d8b53de66..481ee7763b09 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3405,6 +3405,7 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>               DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>>           u16 pat_index = (*bind_ops)[i].pat_index;
>>           u16 coh_mode;
>> +        bool comp_en;
>>             if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
>>                    (!xe_vm_in_fault_mode(vm) ||
>> @@ -3421,6 +3422,7 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>           pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
>>           (*bind_ops)[i].pat_index = pat_index;
>>           coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>> +        comp_en = xe_pat_index_get_comp_en(xe, pat_index);
>>           if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
>>               err = -EINVAL;
>>               goto free_bind_ops;
>> @@ -3451,6 +3453,8 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>                    op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>               XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>>                    op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>> +            XE_IOCTL_DBG(xe, comp_en &&
>> +                 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>               XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
>>                    !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
>>               XE_IOCTL_DBG(xe, obj &&
>> @@ -3529,6 +3533,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct 
>> xe_device *xe, struct xe_bo *bo,
>>                       u16 pat_index, u32 op, u32 bind_flags)
>>   {
>>       u16 coh_mode;
>> +    bool comp_en;
>>         if (XE_IOCTL_DBG(xe, (bo->flags & XE_BO_FLAG_NO_COMPRESSION) &&
>>                xe_pat_index_get_comp_en(xe, pat_index)))
>> @@ -3574,6 +3579,14 @@ static int xe_vm_bind_ioctl_validate_bo(struct 
>> xe_device *xe, struct xe_bo *bo,
>>           return -EINVAL;
>>       }
>>   +    /*
>> +     * Ensures that imported buffer objects (dma-bufs) are not mapped
>> +     * with a PAT index that enables compression.
>> +     */
>> +    comp_en = xe_pat_index_get_comp_en(xe, pat_index);
>> +    if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
>> +        return -EINVAL;
>> +
>>       /* If a BO is protected it can only be mapped if the key is 
>> still valid */
>>       if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && 
>> xe_bo_is_protected(bo) &&
>>           op != DRM_XE_VM_BIND_OP_UNMAP && op != 
>> DRM_XE_VM_BIND_OP_UNMAP_ALL)
>

