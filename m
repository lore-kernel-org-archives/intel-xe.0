Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1496EE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 19:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D40310E6F2;
	Wed, 11 Sep 2024 19:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfqLZ/CS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1492F10E6F2
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726083090; x=1757619090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ppOzsIOp0aRmZS4OF8avc9KLFp0GJYvFvE1CJM4hRmY=;
 b=ZfqLZ/CSVYBrY8H0mRA2GAEsE/FVzLlxyGo9YK3SDgr8nXoLDKPS47tl
 /TUnLqB6xLfq2E7ewVS5AgamWrO5W3RSrn+X/PVSY8nGgFrW9byLIfUOP
 Imp5LH631S70W64UNMG+xrtrWYPYREtCc6keBvfQanxJS9UKqPHAPP1hE
 2bwP53KLlzj/XkJcGj4Y9zlbLqsLZcj4uKK9yy08viA/FeLNcu/QGOsdj
 i0HMiB73Aj8+aqGVVSsHZRcZJsus2XF9aFTuL0R8MeG9P/dPinhcBJvrI
 /RZJ0cgAt+2b9eI5ET2ZVYdkzNFxoWTl3VQVJcK1EVW/PXrvJq4v8UBd9 g==;
X-CSE-ConnectionGUID: ZjHN9xVfRP6ouKznCw9yoA==
X-CSE-MsgGUID: 5o9SW30RS9GyGxVJYLj1Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50321196"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="50321196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 12:31:29 -0700
X-CSE-ConnectionGUID: yd4jIRNjS0iNuqoijqIl6w==
X-CSE-MsgGUID: Dk63coogTzCRbro3Wrqf6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67194320"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 12:31:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:31:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:31:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 12:31:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 12:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xq1n5l/EiF1f44YWAr432bPxdY/EdqH96+VZPfsxac2nBlrC4jn2aPtmK356nXs0l0AYCFGvJ/ciw+04yMnhN32TzvrD57NZt6eF/129HZWVdm0v2ijWTMH/Qz2glaLQ01bKY8jxusIe95uazffyelph9jKbgXEmWJ756WUkxZA0Y7uI5VbU6MJfLdcMQ7X4P3y2Q7namfa7cXWuKOf7uxx64VCTySE8ByOlbTtR1nuG+lbgKjpCK6L9uDs1Tvmo2Mf2dbebaVKzJVi0yphWKi9XgQT+nrvIFydCslO+mnY4HhHCXY1WWky18vBrykoaxrrTCPtmErzVM3UEjJbrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uomA4gJRYvpzg4jE9broTXHq7A+clr7yC1bRruo0V8=;
 b=Xs/d5ewKkK9WOZuY+G5YL88goHt2xiVALd6ysqVifD7BxQ3l/MTsGnAZ9OaoluDnpRD5NAq0igCKhQ7fgjKZOouMzdvHiuVGZKHW5xTh2Z6TI/rAIkMZKffPvkETAh6hcder0yjYT1v7r4Z9ulbnSDzuOGyJ47LEbATYJ3yejasbezzeqkWZq+b2YXLn+0kMoY88LLP3NikBOXNnDZ2r50QCb/pxGEq97aGmjgDbXkvz8Gza1RB6xfGd+Y3jUxwD3Edsay1DZnldQU6VA+INhMW4fS3KF937Rjajv/31UD5uKWcG9rFLn7kho81xI9V4A7JFPocCElgoIHAFn3+cDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Wed, 11 Sep
 2024 19:31:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 19:31:23 +0000
Message-ID: <87ebf933-0dc8-4618-bafd-c42032a31b56@intel.com>
Date: Wed, 11 Sep 2024 12:31:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
 <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: f697e183-1e56-49b2-2e14-08dcd29851e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGc1cTRZUzY1MjlnMXQyNmp5d3AxYVcwN21RQzhUR0lybDlCMFQ5azF6bTdB?=
 =?utf-8?B?ZEN5U25vcVZJVFVTSnpTSzN3T0g0a1E4enpnNSs0MVA2UnN2ckUyV25ELzVY?=
 =?utf-8?B?N3BMNEsrNjhMTk1yVW82ZVpBNkliMVZ3Q1dPcXBnUkFiM0E2VkJqVVVhakN1?=
 =?utf-8?B?OGlyemRKWFZ1TmVmSUVsY3MvQzhJM0ZXQ2plS2RCQUR6RldtR29JamZ6NVRx?=
 =?utf-8?B?THNrWXFkanljOFdPK2JoaXMzc0V3eCtIWGJ6NGhVK2I1cHo3VTl4TWhLTGpi?=
 =?utf-8?B?VUtleXhGTWV1K3hGdUxzWHIyOXhqS1o0cUJOT0xQUU1kZG80VE5pT2c5bmpG?=
 =?utf-8?B?c3NLV2lndlkrMEJGS25uS2x5NkQrOEkzNFIyS0RIaVljT1lvOG5VbjNBVjJ5?=
 =?utf-8?B?UEJlTVFwRjdoUGtPUmtpamErT2t0eUN6RGVObGRPK0NTbmtvTE1DaldJZmZt?=
 =?utf-8?B?TUNJaTZXa3lnMFBkamdsOENYUnFrZEw2Z1hrTlVTYVVoRUI5dDhMMTZSK2NM?=
 =?utf-8?B?YTR6NndpZmE4Qm94U2RJcWkwU1Q5VTV0dWg5clNxK0hUenJWbkpFRVNaOTRw?=
 =?utf-8?B?ZThJN0piL3E1T1hxOFNWdWs4bGJ5SGNUTVlNOWZGRWpMcXB5RjFrbTFUQW8x?=
 =?utf-8?B?a2E0V3U1Mzc4Ny9JSGF1dG45SUZrOEdBNmI3NVZVZEVUSUczYzRGUW1NbTNa?=
 =?utf-8?B?MDdIdGp6Yy9yWFJWU1VuTlJtTUhLWlFLWC9ENkhaMDhFVGtFSWdVRVMvWU9a?=
 =?utf-8?B?MzAyMlIvdUZqc3pCQ2dpNllEcFovQlRNeUhtMDBSS1cvK01ObXlrYkM4YnNl?=
 =?utf-8?B?VG5KV0thZXZSa2NwdUVvaE8vSk9Rcm5nSEVjbHV2a3F6WmE3ckFHZDVPTVQ1?=
 =?utf-8?B?QWVpaE55dDMyRkdVUytSdm5EV1Zrblo5Ung5cEpUZkVEOEJuR0U1aC96T1U3?=
 =?utf-8?B?aEMxZ25jNHJOZE9GaklFWW9iOExrM1czYVdXV2dWUnBoaVRVQUp1WXphTEtt?=
 =?utf-8?B?NTRTMjV5cThoc2FWbUo3WVlCK3NWZVZsMjFubXJRU0JmZG1heTl5NUxtTDJ1?=
 =?utf-8?B?RVlJY0NXU292RkQwU2NlKzZqd2QyWnpQRWlqWjdkalY0aGk5ODNSL01EaGpp?=
 =?utf-8?B?WEk4N3c3ejdWaWUrVkU1Wm56OWNhcGM5NHdQYW5HRWUvb0RhWVMrV2t4M1Fz?=
 =?utf-8?B?SHhXdDRqSVpGTy9ncUVoL00yYjh6T0s4VjlBcTF5RzdwTzlZalJPdmU4TFVx?=
 =?utf-8?B?OUVJS013WHJYR2dYdmtnaE5TaktDS1pLYzdoblFlZ1BUNjRUWW10c0lVeHUy?=
 =?utf-8?B?TXJQR01GQ01YMU4rYTRTcGQwbVdYU0VpUlBML0JwanNsbys4YjhzZ2c2Znpu?=
 =?utf-8?B?OXdKc2RmTzJTYUQvNjRNUDdOcnhQTVZ6MEJrOFNQQTBoeTljc081bkdFWEZv?=
 =?utf-8?B?SC8yU1J4MDN1NnBKTVJicVZ3QzRxSFMxVnVsUkZ1bWVSUlduS0xNS25aVlBx?=
 =?utf-8?B?V0ZZM3FZdzVaUVN3QU02dkgxTzJqOVdmYm0vRGdkVzlnaFNYZVZPZWExOE9S?=
 =?utf-8?B?RWFZT1pFS3J4RE96dGViMlkvbWVkWFpFS3kydU5IZjNDWC8wYlArWUlzRkRJ?=
 =?utf-8?B?V0UxOVFkUS81T3lyUXFXNlBoT2FRWU4rNWVveldGeTlleHo0ZmpHZWJsU3Nr?=
 =?utf-8?B?aldqdkg2eDMxc0ExVHZwVGVPT2xKc2VFNlIwekcwVTMyQVFUSHhLWkh5eFMw?=
 =?utf-8?B?YSsvUU5YRGo5UTNXOUZrMzJmNVk2TVhIMk9ERU9pNlF1SGpWcXZRR0ZDU3ds?=
 =?utf-8?B?eUU0b2JSMXNUdlNSWWg1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWpFQkF3WE9vdldWVlk0amQ3d1dieGlTTENpbTBRWHc1VmZTclpZc3FNMHZ3?=
 =?utf-8?B?bExOeFpQRGJKT00wZXJxYkhRSkxQRlhKU1lGaEUxQmR4T1FZVzRIV3NndVdM?=
 =?utf-8?B?eDRvNDVLWkMydll1V0J6a2JGR0l5YnZRcDVCYUdGNWc3RnMzWEd6ekRaYWV0?=
 =?utf-8?B?VHRYby9aRVQ2WlRjejVHOFFuNTlVYjJ5SkhqV0lVNm5KbmIrL2hzdFNrOU13?=
 =?utf-8?B?MEJsdmZqeXQ2OW1iRDdiV2doeUI3dzREUThCdndPcDF4R0JxbG8yNnhhL1FJ?=
 =?utf-8?B?M3E4TU5ENkJlUGdFKzY3dksyVGQzM1FLTkU0Z2hRRkU5MjV5OGxRVTRiTXRT?=
 =?utf-8?B?ZVlKZDZ6b2l6YW56R0k2OFcyOE9vVk84NDVKS1owdzFQQVVZSjJEcjBYM1VF?=
 =?utf-8?B?dG01a2F0Vk1VdzFkZmVZcStDTkIxM3hGK0JiZHB2b2tKSEtGVXI2M3RHNTBU?=
 =?utf-8?B?czUrblM2RitvNnBEM0dQN3orajRiVVMrRW5pZ2FLOWUxS1dKY3lzMXVkYkFk?=
 =?utf-8?B?K01jbk5lK0o4NjdlM3pjcU9neXIxNTZ6T1RZaWU1bTNEeXJlOTROR3ZpVHha?=
 =?utf-8?B?NGVJVlFTN2RPSFJiYnZDWE9uaGpYT2YyTnBtUmdwbWNDSUlkQWI3VXBhcEU2?=
 =?utf-8?B?ZCtXTHhzaUp3YkZpSWVBbE9iMFI1ZzM4MllXYzd4K2M1VkNjQ2VaZ0RKcm12?=
 =?utf-8?B?MzhNaDdYWjN6YllLbW9jWVpTUzF5a01FK203ajJJWEV2cnpwcG9zQ1ozbHBz?=
 =?utf-8?B?NXBWaExlaW1zNGlOaFJJWFlsQVI5OWJBcDd1UGtEY0h1UkdzL0ZqQ1JNQnRF?=
 =?utf-8?B?eHVHTFhDaUo0bkROUzdMTnNwNmpzYW9QN3ZJNkJkT2ZMbWMyWXFLckhrMWhE?=
 =?utf-8?B?cHVwcVlkcjNycGtFZTJhOVRlOHpTYnd5OHUrak5tU3I5NDUyQm90a1ZodFQz?=
 =?utf-8?B?RGkwTjBQa2MzS1JFdnc1dFhnRjJuWlg4Zk40UFZyL1hXTFlIRUtWY1d3RHRR?=
 =?utf-8?B?NzAyeUd3cHgxZng2VzFkNVVsckNnMlhOa3J0K0tqcmIzaVRWT2tadkF5YmFB?=
 =?utf-8?B?NUxOOTdwZCtLS3Vhcm5uZStOZ1dRTnZwd3oxamQ0RFVNeWprYkFhNE43Mkhr?=
 =?utf-8?B?NmxRMVp6U1puNE82TlphOWRaWDJhVG05a0RMZzQ5dktMRVErcys4eXY4RS9h?=
 =?utf-8?B?dTljMlhuRDJlOEM5S3ZFNmdjRnVZcUJ3RTg5MFpqMTF2amM4bEtad3ptNVFx?=
 =?utf-8?B?N3gzb3pJRVNpZmsrb3VxTGt2MEhMUVJvVlUzdEJ3NlNRcWlYQXUvZ1E3U0lp?=
 =?utf-8?B?bXJGUmlyNjZLdElIcjdhUldBSk94RURBRmlxY3JxV01yT3J5RlJENy9IM2ZF?=
 =?utf-8?B?UG9FSi9hMWVIZ3poUUFSWEErNDRWb21jVjNTdXB3Y1NnVlRFbEI2dFdySCtw?=
 =?utf-8?B?OE04Zi9xWFVySmg5TExJdXZFc0JZc29BSkJHeXhTamFJOCt1bDJFRUFMVkJM?=
 =?utf-8?B?eUwyVVcwZ25jMnhVYWlnTHIwWWQ5VFlYeHlZYVduTEtnZ1FIT0lVSndvWEF6?=
 =?utf-8?B?VHpIWjd5cXVFT256dDE5Qy9jRStUMVJCcDBjVkRaUlFZblBvamVLTGptQWlB?=
 =?utf-8?B?aTE4N0lrazIrSk5ORHJRUTdjL3Z4ZXVPTGRnTFhMeC9kQ2UrT2ZVVzI1Mjds?=
 =?utf-8?B?NytRUlY1LzJ3M1VreS8xbFVLWjErRVFPNlRRM296azc1WmpDRkducXZ2b1Za?=
 =?utf-8?B?S1J2ZnJCZ1hQalBQeHU4WGNjeVF5Rll5MHlvM1ZUVkhBZGtWUEhOQ1ZSbmQ2?=
 =?utf-8?B?dnpIY2o5YVpkaG8raE01NmtMYzhXTTVIUUVKcnBVRjZTRjBQZm5ubWdvS2Yr?=
 =?utf-8?B?bTI0YlU3M1RlY0dNOGVSbkEwSDdmR0dDQXl0dDlKejJiWHdIYjFNem56bDJi?=
 =?utf-8?B?ZEcvZjJXWTVJWWQ0MzVnOXBnQlc5VGZlTXhVOVFjQjMyUlorTXhQNG8xdHUw?=
 =?utf-8?B?Z1VuaGRJVFhFam1ubVdxSmgzR2pMdXh3MGFyOHRLNSt0MCs4NEcvZFFKOThx?=
 =?utf-8?B?eDh6anZRMlVuYzdQY1JvcnJzejJCNU9wMzI2T0l6TTNXaXkvdS9tNXRPRnNH?=
 =?utf-8?B?UnI0eC9pQjBSa3hXZzFHb3VsRnR5V056UUZDYUpKaVd0UlJEcXpDUnR2RmxH?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f697e183-1e56-49b2-2e14-08dcd29851e9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:31:23.2404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Z9+Q4cWF/ziYE9iRkXy/nQbPLQYWx03xWwDXha7g0bHEllDdoI50EXVp2tqko6oW8xeSe4nvC6iCJoP33czlD1NeJRzKmXqTJZd88TS2m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
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

On 9/11/2024 12:12, Lucas De Marchi wrote:
> On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
>> On 9/10/2024 12:43, Lucas De Marchi wrote:
>>> On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>>>> On 9/6/2024 19:06, John Harrison wrote:
>>>>> On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>>>> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>>>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT, 
>>>>>>>> John.C.Harrison@Intel.com wrote:
>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>
>>>>>>>>> There is a need to include the GuC log and other large binary 
>>>>>>>>> objects
>>>>>>>>> in core dumps and via dmesg. So add a helper for dumping to a 
>>>>>>>>> printer
>>>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>>
>>>>>>>> why are we not dumping the binary data directly to devcoredump?
>>>>>>> As per earlier comments, there is a WiFi driver or some such 
>>>>>>> that does exactly that. But all they are dumping is a binary blob.
>>>>>>
>>>>>> In your v5 I see you mentioned
>>>>>> drivers/net/wireless/ath/ath10k/coredump.c, but that is a 
>>>>>> precedence for
>>>>>> including it as is from the device rather converting it to 
>>>>>> ASCII85 or
>>>>>> something else. It seems odd to do that type of conversion in kernel
>>>>>> space when it could be perfectly done in userspace.
>>>>> It really can't. An end user could maybe be expected to zip or tar 
>>>>> a coredump file before attaching it to a bug report but they are 
>>>>> certainly not going to try to ASCII85 encode random bits of it. 
>>>>> Whereas, putting that in the kernel means it is just there. It is 
>>>>> done. And it is pretty trivial - just call a helper function and 
>>>>> it does everything for you. Also, I very much doubt you can spew 
>>>>> raw binary data via dmesg. Even if the kernel would print it for 
>>>>> you (which I doubt), the user tools like syslogd and dmesg itself 
>>>>> are going to filter it to make it ASCII safe.
>>>>>
>>>>> The i915 error dumps have been ASCII85 encoded using the kernel's 
>>>>> ASCII85 encoding helper function since forever. This patch is just 
>>>>> a wrapper around the kernel's existing implementation in order to 
>>>>> make it more compatible with printing to dmesg. This is not 
>>>>> creating a new precedent. It already exists.
>>>>>
>>>>>>
>>>>>> $ git grep ascii85.h
>>>>>> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>>>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include 
>>>>>> <linux/ascii85.h>
>>>>>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>>>> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>>>> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>>>> And the list of drivers which dump raw binary data in a coredump 
>>>>> file is... ath10k. ASCII85 wins 3 to 1.
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> We want the devcoredump file to still be human readable. That 
>>>>>>> won't be the case if you stuff binary data in the middle of it. 
>>>>>>> Most obvious problem - the zeros in the data will terminate your 
>>>>>>> text file at that point. Potentially bigger problem for end 
>>>>>>> users - random fake ANSI codes will destroy your terminal window 
>>>>>>> if you try to cat the file to read it.
>>>>>>
>>>>>> Users don't get a coredump and cat it to the terminal.
>>>>>> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8 
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Lucas De Marchi
>>>>> They might. Either intentionally or accidentally. I've certainly 
>>>>> done it myself. And people will certainly want to look at it in 
>>>>> any random choice of text editor, pager, etc. 'cos you know, it is 
>>>>> meant to be read by humans. If it is full of binary data then that 
>>>>> becomes even more difficult than simply being full of ASCII 
>>>>> gibberish. No matter what you are doing, the ASCII version is 
>>>>> safer and easier to look at the rest of the file around it.
>>>>>
>>>>> I don't understand why you are so desperate to have raw binary 
>>>>> data in the middle of a text file. The disadvantages are multiple 
>>>>> but the only advantage is a slightly smaller file. And the true 
>>>>> route to smaller files is to add compression like we have in i915.
>>>>>
>>>>> John.
>>>>>
>>>> PS: Also meant to add that one of the important uses cases for 
>>>> dumping logs to dmesg is for the really hard to repro bugs that 
>>>> show up in CI extremely rarely. We get the driver to dump an error 
>>>> capture to dmesg and pull that out from the CI logs. Even if you 
>>>> could get binary data through dmesg, pretty sure the CI tools would 
>>>> also not be happy with it. Anything non-printable will get munged 
>>>> for sure when turning it into a web page.
>>>
>>> I think that's the main source of confusion on what we are discussing.
>>> I was not talking about dmesg at all. I'm only complaining about 
>>> feeding
>>> ascii85-encoded data into a *devcoredump* when apparently there isn't a
>>> good reason to do so. I'd rather copy the binary data to the
>>> devcoredump.
>> But the intent is to dump a devcoredump to dmesg. It makes much sense 
>
> It seems like an awful idea to dump hundreds of MB to dmesg.  When we
> talked about printing to dmesg it was about **GuC log** and on very
> initial states of driver probe where we didn't actually have a good
> interface for that. And the log wouldn't be so big. If we can already
> capture the devcoredump, what would be the reason to dump to dmesg
> (other than the non-valid "our CI captures dmesg, and doesn't
> capture devcoredump", which should be fixed).
>
> If any sysadmin have their serial console flooded by such garbage there
> are 2 reactions: 1) someone got in control of my machine; 2) something
> went really bad with this machine. It's not "fear not, wait for it to
> complete, it's just normal debug data I will attach to an issue in
> gitlab".  And I'm mentioning a serial console here due to that
> cond_resched() added, which is only needed because you are trying to do
> in kernel space what should be in userspace.
>
> Oh well... looking at this the main reason to use ascii85 I can see is
> because we already have parts of *our* devcoredump using it, and
> userspace relying on that. That's new to me. Let's stop bringing dmesg
> into this discussion.
You are missing the point.

The construction of a devcoredump file is the best form of crash 
analysis we have. There is no point trying to re-invent that with 
partial versions that only include some of the information in random 
different situations. No matter where the crash has happened or been 
detected, a devcoredump file should be the correct way to debug it. 
Conversely, that means making devcoredump as useful as possible by 
adding in all the important things we might need to debug a problem.

In other words, we want everything in the devcoredump code path and we 
want no other code paths that are duplicated sub-parts of devcoredump.

That is part 1.

As a follow up to that, there is the problem that not all hangs occur at 
points where it is possible to get a devcoredump out via sysfs. Module 
load time, kernel selftests, presi, etc. There are many valid reasons 
why sysfs is not the best answer in all situations. For those 
situations, dmesg is the simplest, most convenient and most reliable 
option. Therefore, we want to be able to send a devcoredump capture to 
dmesg.

That is part 2.

This patch set is addressing part 1 (add the GuC log and other useful 
stuff to devcoredump) and is preparing the way for part 2 (there are 
still problems with not have an xe scheduler job meaning you can't 
actually create a devcoredump in the first place).

I absolutely do not expect to ever dump a devcoredump to dmesg when 
sysfs is available. A sysadmin should never see a devcoredump being 
spewed to dmesg whether large or small. However, there are many reasons 
why developers and/or CI will need that facility. And it is infinitely 
preferable to have that facility available in the driver ready to be 
used than to have to carry a bucket load of patches in private branches.


>
>> to have a single implementation that can be used for multiple 
>> purposes. Otherwise you are duplicating a lot of code unnecessarily.
>>
>> And I still think it is a *very* bad idea to be including binary data 
>> in a text file. The devcoredump is supposed to be human readable. It 
>
> no, it's not. devcoredump doesn't dictate the format, it's up to the
> drivers to do that. See their documentation.
But *our* devcoredump is supposed to readable by a human. We put lots of 
things in there that developers want to quickly look at to get an idea 
of what happened. So why would we want our driver to dictate a format 
that mixes binary blobs with human readable text? That is the worst of 
all worlds and a right pain for anyone trying to work with a devcoredump 
file - developer or end user.

John.

>
>> is supposed to be obtained by end users and passed around. Having 
>> binary data in there just makes everything more complex and error 
>> prone. We want this to be as simple, easy and safe as possible.
>>
>>>
>>> For dmesg, there's a reason to encode it as you pointed out... but
>>> no users shouldn't actually see it - we should be getting all of those
>>> cases in CI. For the escape scenarios, yeah... better having it
>>> ascii85-encoded.
>>>
>>> What you are adding to devcoredump also doesn't even seem to be an
>>> ascii85 representation, but a multiple lines that should be 
>>> concatenated
>>> to form the ascii85 representation. For dmesg it makes sense. Not for
>>> devcoredump.  We should also probabaly need a length field (correctly
>>> accounting for the additional characters for each line) so we don't
>>> have an implicit dependency on what's the next field to know how 
>>> much to
>>> parse.
>> The decoding is pretty trivial given that line feeds are not part of 
>> the ASCII85 character set and so can just be dropped. Besides The 
>> output is already not 'pure' ASCII85 because the ASCII85 data is 
>> embedded within a devcoredump. There is all sorts of other text 
>> about, including on the start of the line. There are multiple ASCII85 
>> blobs in there that need to be decoded separately. This is nothing 
>> new to my patch set. All of that is already there. And as per 
>> comments on the previous devcoredump patches from Matthew B, the 
>> object data can many hundreds of MBs in size. Yet no-one batted an 
>> eyelid when that was added. So why the sudden paranoia about adding a 
>> couple of MB of GuC log in the same form?
>
> I suppose you are talking about commit 4d5242a003bb ("drm/xe: 
> Implement capture of
> HWSP and HWCTX").  Probably because I haven't seen that commit doing an
> ascii85 encoding before, otherwise I'd have similar review feedback.
>
> Looking at this just now, so I will also have to balance the previous
> users and existing userspace consuming it.
>
> +José, would it be ok from the userspace POV to start adding the \n?
> Then we can at least have all fields in our devcoredump to follow the
> same format. Are these the decoder parts on the mesa side?
>
>     src/intel/tools/aubinator_error_decode.c
>     src/intel/tools/error2hangdump.c?
>
> From a quick look, read_xe_data_file() already continues the previous
> topic when it reads a newline, but the parsers for HWCTX and HWSP
> seems to expect to to have the entire topic in a single line. But I may
> be missing something.
>
> Lucas De Marchi
>
>>
>> And again, arbitrarily long lines (potentially many thousands of 
>> characters wide) in a text file can cause problems. Having it line 
>> wrapped gets rid of those potential problems and so is safer. 
>> Anything that reduces the risk of an error report being broken is a 
>> good thing IMHO. Robustness is worthwhile!
>>
>> John.
>>
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> John.
>>>>
>>

