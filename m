Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19B1E7718B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 01:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5231D10E23D;
	Thu, 19 Dec 2024 01:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pke25npx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD1310E23D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 01:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734573110; x=1766109110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AepmH0n3ObD64haqv3XR5zB0hIcKIZhdGmOOBeMFBcM=;
 b=Pke25npxy1aMTU5dZWEI2/hc9b017vHvIZ6ZEsKYBBmBRZPKIzDZCUaX
 fJbPaiHu6aJAx/tFvqtp16NtwbJvB7GhGf42HPOxwS8zmrQ1wLrO5yHQg
 7uvh/Tefkb+qeoWGeVACedmNE15O9HFILaEnF9wW5Q3DwkFuvP4F4DiG1
 2W3krhIQ4BKUNxsz3T2zlcOBUZcSbTWpFHNkyrwf2ZlRjvSI0yTuT4bCa
 VODcpjahJA9KUe/0OH8lL6mcC7BqjtjQcvxo9Q3NdI0XUmgZJCftnIdaP
 pQhUM5Gpdbefxokm9wWEY1h+d0aj+5jud0cAE+1dMcVvFimVEDountQgt A==;
X-CSE-ConnectionGUID: ZBE+orD5TmqZrn7hYCUz5A==
X-CSE-MsgGUID: NaL/AjXpS1WB6gq8BwlNGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34961327"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="34961327"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 17:51:49 -0800
X-CSE-ConnectionGUID: qEF/ckeySXWS5OJsfegu5Q==
X-CSE-MsgGUID: EU7a5el3RyGoaNxbyuMXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="103124634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 17:51:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 17:51:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 17:51:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 17:51:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/XqSAEDoV2RPCTqeJsXoTAuQvKI/W7rUHoPeznG69hLv/5+XK8eqVQXC62kCpmxNo9jZkSJzykFzuU/PKqu4s4UV8Gu8+yHXfAiXWitAZMLj6IwenwWEmIQmvbeCSjGtxSNRHr5uV13XK2Yq1idR3IipvUb3JRTsb3V0N9URnfvgYblvLvbooKuFT18ZVPtDFsJtlvObAVelv/WXc4B/FNHue7ZjbHh+/HhOEd/4dbHYXrF7WsI6bQ5+bbwq4g2h35gPQ1zdZpeQJ2jmTQTrvOnTj5PpLCQGST//ajRh5Y21RauGlyTKD6lVGBN8UQqO7mS9I+46KJD5Y/5uYujWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmGQyuO17hcvNv9j8LUz1anc6x50vBU6hUlE9nM6XKs=;
 b=Ad2PLqLGUfC7jm++nFTmi1O5xLjNlFfm3VklyZuFUN3lpTB9fHod/smos5BHtZOsBwY9EKnC1fd6ydhvVIbtPI9i+7Mu8ADynVIaRa1m70noVpkXemlGKytPgNllBh/6tm0UZ6mFXqRG8DIoj6mpYynP7UKzsrx/bIYve0WduDNQzOdo+/PPJgNwCPK8PuBgQ24WPqjD6DVQdHygHbrHiN7aQIHvg7fAvsoaMUQ+UGw1BBjiOtoS63+XcCjyo8LvIPOQFZJnvwikuVL7/D32W5gZjuauCHM4xidxmiISX5pgO3fQLenKl+gZLFPoxjWOYH1Rx/D9mO97YCwkKGJYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 01:51:28 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 01:51:28 +0000
Message-ID: <d7eca832-4b1d-4622-894d-c8d99e0dd39f@intel.com>
Date: Wed, 18 Dec 2024 17:51:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Make GSCCS disabling message less alarming
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Eero Tamminen <eero.t.tamminen@intel.com>
References: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0324.namprd04.prod.outlook.com
 (2603:10b6:303:82::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: 491418c2-7cba-42e0-1fed-08dd1fcfa75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGZhOXVQa0FUcFd5YzlhL1hTcmFYeTBZSWNJRUdoRVBEdXVCbHdVVURBbVdT?=
 =?utf-8?B?QlNYYzF2ZE53elpzL0E5L1VIdzJzYngxSDRYMDNscmpBTEdndUc5czlxeGhi?=
 =?utf-8?B?Qm84THJOTU9DWTJVc0RmZnhER2NJSTFuaFhkY3FWbndzdGZ1cmVFVDZYQXJN?=
 =?utf-8?B?a3lBVGtRb3lNY2FZQ2w1SWlhejd4cGoydTRmVmxEK2Ztc1R1SWNObGkwSDc3?=
 =?utf-8?B?bERNRzZSRTR0MXA2OVpkQmhJa0htZ2s5Zy85OTlKWmNHZE93eDFWMFJFenBY?=
 =?utf-8?B?M3kwQ1kra3FaR2Q5bFRYTHM0aTVJQ1ZOT0dEV1QrUUFDcisyb1JMN3JSbFpy?=
 =?utf-8?B?OGRhd3pZZTg4NDNLdDkrMTRUM2VqSGFRby83czVjWHBuaXlocElEMmlJeHdN?=
 =?utf-8?B?R2J5SXRHeC90TmppYjVrbEl6aVMzTmtpWisyak5zOXJnSGFiVjhxREpYTlZX?=
 =?utf-8?B?c2VRNGQwWmJFZGprcUJvcjFmRGRnaHFHYko2Vkk1ajNjSTdDWXZxK0JqaUkw?=
 =?utf-8?B?QWQvRkJ5OHI5WHhMNll6ZzRYRmwrUjRmMTJHN3lGZCtITzhWWjRGbDRNM1Iy?=
 =?utf-8?B?bElhT2NhZ2dMQzY0eHRTSnpLbGh3SUJobGFJa2U4RVhlcGJEVnREM1FuaVU2?=
 =?utf-8?B?clFqYkJjQnVqbmNaSndzZEdvb0w1eHdvRTlhdmtFSmVyalJ6Z2dBREQxZ2g0?=
 =?utf-8?B?ZngvVG13UWdMdXpSbXBJZUxGZGwrK2ZGRS9qOUpNWkR4NHFoOE9UQnNiSFdM?=
 =?utf-8?B?cjYwa3N1dGkrY2F5U25XZHFWaDJtcndRNWNhVVNKdDlleldiM3djYkczRTNv?=
 =?utf-8?B?eldBVWpDQXBOalpmN1o3aHVoMDF5MGdWZWdPdHFWb3UrK2RHUnRTVmJyNDhC?=
 =?utf-8?B?WXBwSnU3MTU0RHJqaXlydDZnSkN3R0N3aGUzUXNyOUFVTGJjd1NMc0NmZTNW?=
 =?utf-8?B?Y3JHTFdsMTdzT09sUU5LUDBSTUIrREYwWHI1czY1Q00vMDAzeHdvcGlLR2tW?=
 =?utf-8?B?aEVteFVxYlJYWUdBaUdWcGFWalVhajlZQjJNV3VuK0NFY1ZyVWs0UDQ4bml1?=
 =?utf-8?B?V2pheC8zb1JlNlh4UjNUNVhKS25MUDlNWUZjLzN2UXhQYjZSSWRUUUNtL3c3?=
 =?utf-8?B?NFlhMnJ6NmVzNjdubXYrSUlCTWRyczFmSXpjbXBsUCtlMUxxUFg0MzBGK2pW?=
 =?utf-8?B?VUl6cG5QR1I4eGhNMkIwdDlHdVdNRzhYUSs1U0Q1dytxQlF5Qk05bHRTajM4?=
 =?utf-8?B?TjBRSTRBb2NHZ3NBZ0ZlMW90Q04ybDhqM0ZSL3dvbmJMQytwWUVISkVEc21K?=
 =?utf-8?B?NTNzamNMeklvMnI3UDJFa3UwZ2Fad2cwVDhHZms3c1JJcGVRaTFmTWN3UFhC?=
 =?utf-8?B?dlUzdldhQWM5SmhhUFZoa1Bqa2Rhb2kyN1QxVTZhdk12Tll1WWFZU0c3WVR1?=
 =?utf-8?B?dzJJY1I0S2pWbUYzbDNQNEVISWdpMThVck9FZzJJTlQ1Y21hM2tIdytkcUEz?=
 =?utf-8?B?RnNycVVIcnBXUGdORzdNaXJxQk5tS2VRU2tpS29EN1VrK2lDREkrcGVqMFhO?=
 =?utf-8?B?a0ZUY2swWW5rdU9HOEYrZDVyQzJKYmp2Tld2alhFNkVJMlZPbGN5OXVHaGFr?=
 =?utf-8?B?SXQwRFJWUzBwNmFYY1lIc1lUNjJuTUtrRkljOTJGazRKbHRWeWVUQmdPcDFR?=
 =?utf-8?B?YzNrQjVDMjFNS2FVUU1EclZXSXJOUGJ3RW5uRUYwN1VHSTZYK2xGWEt4WmF0?=
 =?utf-8?B?WHdDVlFHRkZ6RFZKMUxvbVpDZEtiOHVhQmhWK1lXWDlObmdsWVczVTB1aWF0?=
 =?utf-8?B?Y3JHVzhCSTk5S0xFR0lzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDkrVHR4Zm02MlIrTVhmbDZXUThwVXA3ekZmTlM4Q3lvbEJVa3VHdlYzSmJM?=
 =?utf-8?B?YkhZT0xLV3V6aWxnZWhHZkI3eEEyR0sxZGZTQjQrZFlWT1g2V0hNbGs3QzZ5?=
 =?utf-8?B?enF6WHdNWFRQcUJaNGlhWkRGcUNNQW94V0RFbkJqbGRlVVhvMm5heWxxL3BT?=
 =?utf-8?B?RWhmS0J3Y2ZNNnVzNmdsYUxsenhkTkg5V01NYlVhb1NJWHlDSXZjcEhxWHdm?=
 =?utf-8?B?VTZFemlpVXJWcHlkQXpFZzlKLyszS1NzVG5ydWZiV0tsY1FqbGhnT1dtOURi?=
 =?utf-8?B?cUc0MjA4WWVZM2pwTE1odWFhcm1ONXB2UHhFWlc2QzBHOXAwYzh1TFd0dk9T?=
 =?utf-8?B?OEtocllWa0twWVpKaTllejRjTzBYc1hDdjlxbnIyWHRDdDRhL3FTSkF2QTdU?=
 =?utf-8?B?a2xEZnVQNldvWFVPRnhoOFl0OVFmUEFoUS8zekVFdWtuUEF2MlZnNnpGRWtT?=
 =?utf-8?B?dDE3dnU4cVVJWUpWQnlsaUJkcVh2eVVtaDEyaUZ3eFRKUGh1VDN0b0xvMVNL?=
 =?utf-8?B?bkZleHdIMGVyVitXYVFIUm4yVTYycW4raEZSWnYrTTlmelFQbDlqMHZiRzZl?=
 =?utf-8?B?NkhYQjBsYUF5eVIvNzR2RzBPd1o0RHRyVUFQNm0xUWRERXNWTmQ5Sll2bzU2?=
 =?utf-8?B?b25iUXgzdEFSVXorR2IxeU9qQkt4eTRXNDVaR3BoSW9JL0l4TTR1ZHlLdjU1?=
 =?utf-8?B?SHJaT2E4QmdqYnpGYVRpZU9FRGNQbEVnWHlKQzVQVWNZNTM3aHBnU1lNa0VS?=
 =?utf-8?B?dzg2ZHBCTkRPK2RBKzI0bzNaeFN6Y09jZkk5TkxrUnB6TXZFd3kyZE1zL2FS?=
 =?utf-8?B?Q3lhUmdGMitrYytIS1NOM2dqYTl0SEpvK2Mrd0hUQ1lUZXhUa0tuVFBRd25u?=
 =?utf-8?B?djdkWUV6TDNGSWlBSnE4ZEpKanNuamVCb0oxR2tzL25pdjhMU1R5eDFDRzBx?=
 =?utf-8?B?M1lrU0c2U0VGU0F3ZFFuN2s4WG1UaHVlMDdMcWZsUVlva01BeitVV3NCNFlH?=
 =?utf-8?B?ZHArK25sUDkzV2lGK05SSTF1Y0czenZCeHUwWGh2cUZFL2t5NW1TOEVtUTZD?=
 =?utf-8?B?ZmwrTWhMMCs4VElUbmpCZS9yY1IvSGlXT2F2azF5RFYraW5TaTc2bzk5NWFO?=
 =?utf-8?B?S3pONG00UmlCMkUzbENPVEdKZC9jZWZTNzlsbHdzcWk0bnZycGxyRUtxRUVN?=
 =?utf-8?B?UTQrN05YeGVxWnBuVzVqNjgvbUdDbFZDY25EQWJHSG0yOUEwQXpWMEJ4aHVN?=
 =?utf-8?B?eFZhd1YwZ25ucE9icC9Mc0RXV3hIZXMrL3FnSUQ1eGVxTEhQT09vYWxkZ3Bm?=
 =?utf-8?B?bFI0RW02QzlIay9VRVRuenZ1QkE1TFhjNE1RYU5oZXQ1aWM5dnlERnhQZGpZ?=
 =?utf-8?B?d2NoUWxmNUlQTExTbTZhQ1c4UUNPYWljRkI2bmlYdUdtOEZPZGh4SHc2ZTUw?=
 =?utf-8?B?clc4dHRSWHVSekFCc3cyNXh3cE5SbGJyQlJXWnAvamdFS3dvUEl2eFl6VVVE?=
 =?utf-8?B?TmsvQ0o2MlZadnR0TWxiZmZPMXZLejczOE42ZGE1cWlVVjhIQnI5d0dvR2hY?=
 =?utf-8?B?S0t4dEwzSXdYUjhROVZmRTdtQTN5MFdHZkUvTmVMZW93a2NFSVI0djV2YTBj?=
 =?utf-8?B?ZVV2N0ZFNzB5SG5Xd0NUWndsT3lQSGFlaTNMaVlFZGIvTU1PNm4zbHJxQ2pH?=
 =?utf-8?B?bmcweVdDUzBWMFhldVAySGpOQ3FFQ2haNzdDaXJ5UkRxSmVOTENvRWhvV0xx?=
 =?utf-8?B?dzRHUnBFYXZzNG9sYnd1cHdMWEF4TG1wYjhDaDBTV2FRdnVpVUgwOWJ1ajFv?=
 =?utf-8?B?eFRuamFrUkx0VlZ1bFV4SitYTG1VYXRKQ2M4d3ladEFFVkdkNmVSZEhxZnBV?=
 =?utf-8?B?cDlueDY0TzdTOFhNVDc1VXlIazd3bW9pTnA1aHV2U3huZjNqRjNXd3F5cFJF?=
 =?utf-8?B?R0lxREh5NXFqRHF6YlBtZHUxdnMwZlZQV0dDU1dUT2hWWnBwNWtUc1F0bTNF?=
 =?utf-8?B?N2dHdlpFWDN1SUQvbDN0Skh1Z1kvMHFvNEtCa1FwT3ludW0zTjZJekNQU1N0?=
 =?utf-8?B?U0gwQkVWdXUyOEt6YnRvNlJuWlpiVXl4dFVYVEgrVElQSkxnMXFrNFdJTW01?=
 =?utf-8?B?d1R4VlU3MmxxZWpya0ZZQ1pXVHR6aHZzVGxOZ0Y0Zkhoby9LaGdXRGh0dkVX?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 491418c2-7cba-42e0-1fed-08dd1fcfa75c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 01:51:28.4577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKNSZfs5Jm2bSJ+4Sj2TA8ZYG7q8bIHu3gNoNOp9pBwRUQlDylPN8xw80STlQFpd5R3z38h/UB+xVT60274i0x8P35p6NZrziykU7FlWCo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
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

On 12/18/2024 17:09, Daniele Ceraolo Spurio wrote:
> The GSCCS is only used to transport messages from the driver to the GSC
> FW; therefore, we can disable it if we're not using the FW, which is
> the case on both BMG and PTL. However, the current wording of the logged
> message could be interpreted as a problem, so reword to make it clearer
> it is not an error and lower it debug verbosity as users don't really
> need to know about it.
>
> Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3866
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4294aa600192..ac9c666a9652 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -775,7 +775,7 @@ static void check_gsc_availability(struct xe_gt *gt)
>   		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
>   		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
>   
> -		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
> +		drm_dbg(&xe->drm, "GSC FW not used, disabling gsccs\n");
This message would also be hit in the case where the firmware is 
supposed to be present but isn't. E.g. on a LNL but without the right 
firmware package installed? But presumably in that case, there would 
already have been an earlier message about missing firmware files?

John.

>   	}
>   }
>   

