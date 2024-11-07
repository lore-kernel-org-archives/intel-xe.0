Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896ABD5D695
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 22:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C1610E17D;
	Thu,  7 Nov 2024 22:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDrFDP7d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8F710E17D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731019080; x=1762555080;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4uOzDoASlaX9dLqgPrEZhPhd6s/Fo5vN1+qSgxuNqto=;
 b=YDrFDP7dOcY4njrZ/D0Eo8pP+q6YNmOHAtnZByXaLMjc8yCSItv4lUbD
 pX1khUg2k4eOTWw4Ws4F42m1pvw5fgKhf2jfRR0YIDo8cbLkexXCLF9Vu
 WvN6+RnXfLWh/i+c6lcxzhFMLZxYaGYecSbtTd3cbJQynXkDyBQdwVCL2
 B3SkF5fFmFnBaPCLcWfGCJuycNUcZ0NlOb+0T6JPH4iUpTvqzOvTAPIQb
 BcTohUifw8ZvhHwps92ZntgmBZcdckouXw9gpfXOJBtLRuZHe4cRgx8od
 7vaQ4Oz0T4q4kMMkdnaGBKGYtNYmw7lVQqsGr0M+PGKAUvZDFtHymNDCD w==;
X-CSE-ConnectionGUID: Nb4Uo5XeSw68MrQFnLrxVA==
X-CSE-MsgGUID: YyW+x9TfQp6CvZXdmD6W7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31113547"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31113547"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:37:59 -0800
X-CSE-ConnectionGUID: GghQFwFtQGu0ej4bI482Cw==
X-CSE-MsgGUID: 2TxUi6hHQ/KqjCmahOjNcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85670652"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 14:38:00 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 14:37:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 14:37:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 14:37:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTgeJ3X5Ru2WkX5Dq/XIKzNZr4TXo90gyy+mwhcnewEj1lcK0Q8Ja7b21IovsSg/19merpN/7ckRUMv5tBQHfhaRUl//kw29TKnz4CDfCuF5RYPCJ9nFvMuavNc+Gb6sZLQiI1ywieUfJyMMva7rNELdHi0jx1fsHXCXX+ASz49FdXDWXTUPXq9pjCdUCMPk+b/DF2ERLtpxEU0gtP5Bvc9jLIHBAOXShVVkiQZ4tk5MDindpZr+7szOZt7eAw4ZKkQ9QzJCpomz6qjNNGFIIx92UGHvuXm3gNwS8EbTgaK6f2WHVCQJT6gC4QRUHbHwHumyk8Knac9mFtOQlZYV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7MYRYqRjuy9H7+M21qvOgI72bE2/BW18w3oNprD/a4=;
 b=MAzMwKFkI26hkYxK7kTOvVK9RJb9XhXrg8OWJd3UJ1guNPdz29pXn+x7mAPpUt6D20AV31Xfb14xLxt7p8EtGjHK3jJpkk333DKF4jqjaovFyaon/W3nJnBXhA6hOlooeNV+UhgHE+XLbnZ0D+D99YAKNzjoKK64Y/AP2WybExXrZQs6VPQDBZK1PYK/Yi9Z81CugaCxRNyIuKP3rBa5c1Pke/VYPlv7xYgLDBpdBIRH+xG/+6W+xHMUUoacVBcOdn3y5NSb4aOUhl/BseQswFPWNSYnAfo+WXBI/70JwaUFTQXzW4vbWqmmyO4p883sj5A0ftKL87xr88VyZW0+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Thu, 7 Nov
 2024 22:37:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 22:37:55 +0000
Message-ID: <6f649863-750a-4289-a8eb-4418652ca46b@intel.com>
Date: Thu, 7 Nov 2024 14:37:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] drm/xe/pxp: Add GSC session initialization
 support
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-7-daniele.ceraolospurio@intel.com>
 <5a1779e7-14b5-4ff5-9c25-1ccb8bc5f05b@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <5a1779e7-14b5-4ff5-9c25-1ccb8bc5f05b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 5399375d-1183-4227-d93a-08dcff7cd2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVY5ekUvVlNiTkFwSmFRanhsMDlwdEp1aFZRRmdNRTZleFd1M2xFRjh1SENT?=
 =?utf-8?B?dUxDVXVEenQ1TE1Sd0FMUmRQcnFwdlA2VVhKbTZaVjI5cGlqTUYxamRVS2F6?=
 =?utf-8?B?WW9vSHpKeEFyMDVadGVtdTYvRUt3cWYyamZtMmlDbG1ZN2VoenEzTlRQdjRp?=
 =?utf-8?B?RUxXY3J1VzROTkdXZUJVYzBiR2JERm5kVWlIbytwWWtvVi9PQ3htZVVYTi9p?=
 =?utf-8?B?Vy9qeE1YTVpWRW85WVBrb0xoMFpOQWJOWm9TdVpEYmx2SmR4YjRCZE5RcVpu?=
 =?utf-8?B?ZEVYaXhOOUZuekM2ejRjdGJsdEtHNEhZYXhabVZKY25lRC9sT2I4L2tad1Ir?=
 =?utf-8?B?ZFgwSVNtZnFDcEJTQ3d0c0MrTEV0TXBQZUs3YXg1R2pYMFVCV3lZc1lPWjd0?=
 =?utf-8?B?MktsZnhoSUdLeVlpazRhUThacGZiTW9PYUs1OGY3VlpRRnVZZUc1TzhDTFhm?=
 =?utf-8?B?NExlOUpOWWVuT2RjS0JoYTViQ2EybEgzTUcwb1YrcDNqWk1MajFFWkRrL2w3?=
 =?utf-8?B?d0ljQWYycHNqSzVWd3oxQmlEU2ZCWFBsc2xzSFJ1TW1Xb3FyeTdHUXZQajlq?=
 =?utf-8?B?cmowaEltQmwwUDFGSVFObVRyRmxGNjZuemlXZG9TbkNwaGJ2QTF3aHZvbzdJ?=
 =?utf-8?B?QjU1bnlWMzM2OVF0aXE2YW12ak5HMklmMTdRSFNYVTFEdE9hc2FMeFE3OXVn?=
 =?utf-8?B?OHlHa3I1dEswYVpUT3piZDN3L3dDNUo2MGplT3lwdksvaEJ0UlkzQ2pyNGlN?=
 =?utf-8?B?NU5yemJxUG1qVXRQaVozRWdlRjNGOFhLRTNoa1pPNTN3YklSRmZmOWY0Rzcx?=
 =?utf-8?B?YnNERkdRV3Q4VkxuRFlpTXRKL1hvUitVVDErS01vNlVvWmhCVmxXaDh4WHlh?=
 =?utf-8?B?YVY3czhKVmF2NTZpblVJckppVnlLMk9JNzdoMnl0RjRDU3Y5d3FndVc5WGdU?=
 =?utf-8?B?bTdVS3VYL09qY1BKOWtPbU1QV0ZIajBrZWxZbUtoT24wNDZNbWwxV1R5S3pE?=
 =?utf-8?B?L3llMEMvN0l6TkFLaFZ4TkhKM2loTnEzSlRrTXpkdzF6NmFsako2WlFaYnEr?=
 =?utf-8?B?OUliNDB5MW5sZTJ3bEQ0ZUtwb3N3TkNjS08rYXZmN2tYMjBCaGYvWW5vZlFU?=
 =?utf-8?B?eTZjbnBJOXRlcmxHTEViQitvRmRvVlc2MDNqRmY2UUowcW1ja2svNHl6OVg4?=
 =?utf-8?B?ME9tS2NwVTB4aGNhbWxFd1prS3ZrdGlwL2l4T3pLelk4WXphQlpqYmdhNFJP?=
 =?utf-8?B?RkllT2RqZXh3VnQ0TTJoTlpqaXVYRkJXQkdXck1ieks1U2ptam96YlRucDY1?=
 =?utf-8?B?cTdaZ3N5aWtyUGNJOHBXWXpwS1Ztb3hSVE5RQ0d2Vlc1OXVLbTVwcnVrZkNH?=
 =?utf-8?B?aXBBN0xlUGZZejZhY3h4U1IxMXd3SDgrL3huWTBCbzBhOVViTk5SZ0o4Y29J?=
 =?utf-8?B?OUJRbDlwb0NGZDNnNVZnWG01OXQza3BLMFpDL0dkZThsd1hRNTltcnhkWXlT?=
 =?utf-8?B?ZTNKVXFvWlFnbjdtRkh6WXVwOUJaY3F1MnorYlR0akdUTTZQSlFjMmJMNlVD?=
 =?utf-8?B?ejRKZlVCcGpPMHJTQWJSdHlkSW12RWEzRStOZng3NGdNZ2VLbEc2YXprcitp?=
 =?utf-8?B?T2NRNTFUalpUZXRTdzc3dTg2WEFKODJwSnpMejRNWFlBTVhncHF6MWZPZWtQ?=
 =?utf-8?B?dFpHMG1jRDZIVFQySnU4T2p0amlyWWtEdFhJNWpqREpKalpPbEZzRGNLMEtV?=
 =?utf-8?Q?P/zg3l+5QzRHL2C9hYKpkA3TYqEIPf4YilyJjpr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjkveEFySzJxVDUxMWd5QXBFZVcyamVlTHN0Uk85Q05PRWliQlVVeWh0bjds?=
 =?utf-8?B?NXpvUm5HRTQ2K0drRXhiUW9KY2o1UzFUOWJNdmdLd1RtQzdhbkZ1SnNNaGRL?=
 =?utf-8?B?d3Flb1FXTFJzZkFRcVM4K05hZWlnWkZ1M1F1MWxBU2orNTlqUTF5Q2N4c2dt?=
 =?utf-8?B?cHIzWGlsVGxnYkI1N01LWmU2UVdDck12TC9uMTBuWHNGMVZSb0dZNzhtUWpk?=
 =?utf-8?B?dG5jRWRmRVh0TTJsSmo1NmoxbGhKb0xtTVJrbGF0OGdVdVBZbDl6VnkzVGpC?=
 =?utf-8?B?cFJvTlBkSDNjSjJXOHFBdFR5Tkw0YkxzUjVHVDgrbm4wT3NWQ3pUTVdLYzR1?=
 =?utf-8?B?SWpFUGxSVURCQWcwclBBUmNmN0hYZDVnTllwbEhwRkJKbTRDN2cvWHFUeWt5?=
 =?utf-8?B?VTB0YmFTU0thR3hsS3BmWGpjZVlkcWxYMHQ1SmtwT2hYc3RuZjJYTC9zUG93?=
 =?utf-8?B?clhLY0JZb0I4TWJ2UE56U0xGRFdOVDc1TCtGRm9BaE4rU0EzdTFuVVpUdDh1?=
 =?utf-8?B?Qm4yVHBxaEpiYTAyK2dReTJUdmo1NHNkRnRxd0hXVURlYnh4WnV4RFZ4T3Nt?=
 =?utf-8?B?T09xT2pmVkp3MVRlSGp4RVIzOEZQQ1VFQkxpZW04TjVJM1ZESjR2RnFIczBV?=
 =?utf-8?B?ODJoU3hPQjd0TlVHbElINVp5MytOY0dsZWNIVmFicTJHN0ZTdFRtYlNGQksv?=
 =?utf-8?B?SHVIem9kQkFCWmFYTzd6NFhabnZnRFhiRFJ4cWhxT2RIczlzZDNKUm8vY1Vm?=
 =?utf-8?B?V2R6SGtaY0pSZ2s0M21yd2hFUHliN2JPTjR3ekFES2NkK1l2aFYxUFMyZTJW?=
 =?utf-8?B?RklRZTdFVmQvNTZLNWlxdXZKSDh2cUI3Tkh3SG9sQU50NGV5eXFwTERyZmY4?=
 =?utf-8?B?Y3dDTmh3dG9IUWtNYTV6QjJLbjV4eTVUU00rR05DWGZhMWlKTGFZb3dVdE5E?=
 =?utf-8?B?V1lqU2w5ZmJDbnJkRVFaYTFTamR1ZFNYTWhHakplRGxwLzNyVithcGpQemdk?=
 =?utf-8?B?SWd2ZWlSbDhNandoK3VQQU1NdG52UGZFRUJwdFdyeWRnTGtDK0tPK1FkV2M3?=
 =?utf-8?B?TnB6dTZWM0UxMExscDFubjczUFN6TFM2L1B0aUdhdGs0aHZXU1ZxK2xwMWRo?=
 =?utf-8?B?aGpXdXhDVnRaVHdTem0wSC9kTHh0c0l1YktNcmxKb2U1MWFxcCtna3BGUzhN?=
 =?utf-8?B?OFlFcVVXTTJHZFRiZGhZa01RRVNuSjFtSDdTZ0hCa1JSNlcyT3lBa3EzQThX?=
 =?utf-8?B?UVpxQ3c4N1doRzRGYlZWUFFhYmkyTW5RK2l6TzFGZEpjUFkrTEpYUnh2OUF2?=
 =?utf-8?B?elNRVGJkbUk2QnJOYjVOVjJzRWord29OSUNKenRRQ3hBNThKVTRydE1rd3J2?=
 =?utf-8?B?YmpFK2xlcGVpUElVSDI2TG4ySGl1bStYanMyN3lVTkh2dTJwQ2YwZnhaU1kr?=
 =?utf-8?B?SEZXOGxVa2NoNjRGMVh2ZU5pd3UyZHpKSk91Q05hZVlTc0tsZTJoaDY3TkJN?=
 =?utf-8?B?M2hGdHlJdXM4TW1ydHV6WlVTY3N3bldLQUd1bWdVazlBM0ZsMTFYSTZwUCts?=
 =?utf-8?B?c3VxRG5NY0N0UDk3d0pkN1RVbkxrMDR0WFIwak81dEozRTB0L3J2V3FIMjhS?=
 =?utf-8?B?UXlFazZnUTY2dUhZbVRRU29obTB5ZE5iZkRhQUpZeUZkaG1nUlRjUlBudGF2?=
 =?utf-8?B?T0RTNDFLbDV2enJ5VWxoem5rZ3dJOHdxSjRYOWl0TDBrZUltSWZMdisyUDFs?=
 =?utf-8?B?QWM4MHhGa3Z6M215clFRbkozZUthOVlsV00xYWtxcjBkelNIbHpEL3JRMlRT?=
 =?utf-8?B?YVZwR3pLN0xFTEhvQXFFM2VqaWRycnZMQythMzMyZW9GR3JKU1lCOUxxQzEr?=
 =?utf-8?B?dGhWWDZmTXZTc211UitLOHp1TkF5aFlFOElLMjdudGQyMkxvaUNKMmduU2pS?=
 =?utf-8?B?STlqVUVMT3dTNXdmazVYQ2pndVhWNkdyWlMwUFpPZUdZczUyVTNtbVMwbFhj?=
 =?utf-8?B?akpKU1BOaWduTUlOMXRYNFVkVFVoVW82RDBzQmNOTzZaSTVicVptZ01hWUNk?=
 =?utf-8?B?QmxFVUlCNHkwNjRCZnBJZ091MnFzcGZ2VjI5bURMTnV5aGFSYitNbjd0UWY2?=
 =?utf-8?B?clJPYUVZalhZbUFuTlkweTUwem1GNmhCWlVVczd6aFFraHF3d3FqOGlPRUJi?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5399375d-1183-4227-d93a-08dcff7cd2b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 22:37:55.8197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ox4oREghcPpQO17JxVDYc78NDcuimfNWOVJcdj4OU0YLekYwezAzJKWdHAeWkEAtTO6IdHetIz2ok8gWQid6n402g3kh9FA5r5lOB0Tdxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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




On 10/8/2024 11:43 AM, John Harrison wrote:
> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>> A session is initialized (i.e. started) by sending a message to the GSC.
>>
>> Note that this patch is meant to be squashed with the follow-up patches
>> that implement the other pieces of the session initialization and queue
>> setup flow. It is separate for now for ease of review.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h | 21 ++++++++
>>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 50 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pxp_submit.h            |  1 +
>>   3 files changed, 72 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h 
>> b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>> index 4a59c564a0d0..734feb38f570 100644
>> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>> @@ -50,6 +50,7 @@ struct pxp_cmd_header {
>>   } __packed;
>>     #define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
>> +#define PXP43_CMDID_INIT_SESSION 0x00000036
>>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>>     /* PXP-Input-Packet: HUC Auth-only */
>> @@ -64,6 +65,26 @@ struct pxp43_huc_auth_out {
>>       struct pxp_cmd_header header;
>>   } __packed;
>>   +/* PXP-Input-Packet: Init PXP session */
>> +struct pxp43_create_arb_in {
>> +    struct pxp_cmd_header header;
>> +        /* header.stream_id fields for vesion 4.3 of Init PXP 
>> session: */
>> +        #define PXP43_INIT_SESSION_VALID BIT(0)
>> +        #define PXP43_INIT_SESSION_APPTYPE BIT(1)
>> +        #define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
>> +    u32 protection_mode;
>> +        #define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
>> +    u32 sub_session_id;
>> +    u32 init_flags;
>> +    u32 rsvd[12];
>> +} __packed;
>> +
>> +/* PXP-Input-Packet: Init PXP session */
>> +struct pxp43_create_arb_out {
>> +    struct pxp_cmd_header header;
>> +    u32 rsvd[8];
>> +} __packed;
>> +
>>   /* PXP-Input-Packet: Invalidate Stream Key */
>>   struct pxp43_inv_stream_key_in {
>>       struct pxp_cmd_header header;
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c 
>> b/drivers/gpu/drm/xe/xe_pxp_submit.c
>> index 41684d666376..c9258c861556 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
>> @@ -26,6 +26,8 @@
>>   #include "instructions/xe_mi_commands.h"
>>   #include "regs/xe_gt_regs.h"
>>   +#define ARB_SESSION 0xF /* TODO: move to UAPI */
> This same define is now in two separate source files? Even if it can't 
> be moved to the UAPI header yet it should at least be in an internal 
> header rather than being replicated.

I thought about it, but couldn't find a clean solution. This define 
would belong in pxp.h, but that's not included from this file and I 
didn't want to add the include just for a define that is going away a 
few patches later. I could put it in pxp_types.h or pxp_submit.h, but if 
it needs to be in the wrong place anyway I thought I might as well just 
duplicate it.
Any preference?

>
>> +
>>   /*
>>    * The VCS is used for kernel-owned GGTT submissions to issue key 
>> termination.
>>    * Terminations are serialized, so we only need a single queue and 
>> a single
>> @@ -470,6 +472,54 @@ static int gsccs_send_message(struct 
>> xe_pxp_gsc_client_resources *gsc_res,
>>       return ret;
>>   }
>>   +/**
>> + * xe_pxp_submit_session_init - submits a PXP GSC session 
>> initialization
>> + * @gsc_res: the pxp client resources
>> + * @id: the session to initialize
>> + *
>> + * Submit a message to the GSC FW to initialize (i.e. start) a PXP 
>> session.
>> + *
>> + * Returns 0 if the submission is successful, an errno value otherwise.
>> + */
>> +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources 
>> *gsc_res, u32 id)
>> +{
>> +    struct xe_device *xe = gsc_res->vm->xe;
>> +    struct pxp43_create_arb_in msg_in = {0};
>> +    struct pxp43_create_arb_out msg_out = {0};
>> +    int ret;
>> +
>> +    msg_in.header.api_version = PXP_APIVER(4, 3);
>> +    msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
>> +    msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, 
>> id) |
>> +                   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
>> +                   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
>> +    msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
>> +
>> +    if (id == ARB_SESSION)
>> +        msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
>> +
>> +    ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
>> +                 &msg_out, sizeof(msg_out));
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Failed to init session %d, ret=[%d]\n", 
>> id, ret);
> %pe for error code
>
>> +    } else if (msg_out.header.status != 0) {
>> +        if (is_fw_err_platform_config(msg_out.header.status)) {
>> +            drm_info_once(&xe->drm,
>> +                      "PXP init-session-%d failed due to 
>> BIOS/SOC:0x%08x:%s\n",
> Style mis-match - "init session %d" in the first error but then 
> "init-session-%d" in this one and the one below (I prefer the first 
> one that actually looks like an operation rather than variable).
>
>> +                      id, msg_out.header.status,
>> +                      fw_err_to_string(msg_out.header.status));
>> +        } else {
>> +            drm_dbg(&xe->drm, "PXP init-session-%d failed 
>> 0x%08x:%st:\n",
>> +                id, msg_out.header.status,
>> +                fw_err_to_string(msg_out.header.status));
>> +            drm_dbg(&xe->drm, "     cmd-detail: 
>> ID=[0x%08x],API-Ver-[0x%08x]\n",
> More mis-matching message styles - 'SOC:%s:%s' vs 'ID=[%x]'. Neither 
> of which is the normal format of kernel messages.

Those I've copied straight from i915. Will reword.

Daniele

>
> John.
>
>> +                msg_in.header.command_id, msg_in.header.api_version);
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   /**
>>    * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
>>    * @gsc_res: the pxp client resources
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h 
>> b/drivers/gpu/drm/xe/xe_pxp_submit.h
>> index 48fdc9b09116..c9efda02f4b0 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
>> @@ -14,6 +14,7 @@ struct xe_pxp_gsc_client_resources;
>>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>>   +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources 
>> *gsc_res, u32 id);
>>   int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
>>   int xe_pxp_submit_session_invalidation(struct 
>> xe_pxp_gsc_client_resources *gsc_res,
>>                          u32 id);

