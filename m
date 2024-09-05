Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5794ACD5BA9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 11:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0773A10E0D8;
	Thu,  5 Sep 2024 11:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDe9nNj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B53210E0D8
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725534975; x=1757070975;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Iam75VccOzJ6xc5vJNyTFm++mePoXMOWyEj5shE4uTc=;
 b=dDe9nNj647IP59wDg22d+pHjdQwfoiQ4Il9RFGrfhCIdzIXh+83fH0BF
 ouXzyI/OveSNubTEUIF3wHJXrSdJdLRQFHD1Qm96FuYrzIp8hB+HFcWyP
 p1lsJ1Udqohp9ra9qlVafZRQmPdJEEimJcEfl/b1HipMI1fqv7KLHf1DV
 d6HzAU37i17pfJ4iHnFDoHRdrka28RkeNt+n/EbLqHnD50sZ5ajekaBZf
 01ePYKoJ7cghISX/g/kNwkKN1xaEvB6634y5h/4hWsO+NiWhv6YdRW6yy
 oqgRAzuvk6Ga2QZOcKjcL46xPsz2FTxOXh1zAARBdHfCEA2aYmBWbfjKo A==;
X-CSE-ConnectionGUID: VQjGIkBvRAixTnFphx1FJg==
X-CSE-MsgGUID: ogTcAIOfR8OS3Yi2mU9cnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24437474"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24437474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 04:16:15 -0700
X-CSE-ConnectionGUID: YfCnXavpS4eLCuP72lSKOQ==
X-CSE-MsgGUID: rrthmyaPTYCbCII3Ts/Qiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="66333052"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 04:16:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 04:16:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 04:16:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 04:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl1QL+9icVislj4OhJxbkryDuWfaWDHvOTqL3WDN/eY/Wo0LwkKbzIc1G6M8q1HTM6vC1eyiRSBgMHQFIQMO0RBP4vIyGFUWxuDQRnDHH7e6lAYSVrwggJ1USyKFzR19o9LlBKqVaoFMkszO01RpblXSk9pvvRq0Rj8E2V0VYSRGEzc7fPdX4Brs4cwDKA1gsEWLitU0MS1mOcIZd0pRtwBm0g6HJsDFouKWlV81jPtZhXWt6nLGgpnPkwDOXMTPz1+G4EeGPPCFSw+zgqdamhizJoDIWOW9hNjH5+13LUzzudoKa7FlVbdlMmyYZxONhcYjGami5g3N2PsXK6ahMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3H/GmxIzlaUwbHYM7U4A/lSXmwgLPV04cfrFL3HRPU=;
 b=eBF5/CRotFxp/HeiNxJBeBw/AIKcKgB7qEYQrGCpeoAAcVNqYnI9I6crDTf7nfjze1l7Nf/4y10R94DjgHivjzbrkWIADu+gmTfaW79Ju9Jt0tc6TZVWamUGH/bJh4ueQm8Nk7XLTQsk6xyxLOdKGtW5m9du3wMO0RDYHFLUnbHa+AJDC2xjhuXmwIAyI23LXSyNVCPrzXiqJs/qXgV7rsooYC6dqPiEBy79x4JvjrTfMtClMcB32/2jA74obPhq6YUx5tldiKqfTohUPFzaK/ZU9ZQgfn9Hkey3mTgkv+fPK1Fu709yqpHRcbj0HIoAQ2zkv1PT5mzfSxJO1PGzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 11:16:06 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 11:16:03 +0000
Message-ID: <9acd12c5-274a-486a-90d8-7e9232a3609b@intel.com>
Date: Thu, 5 Sep 2024 16:45:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240905052813.4169007-1-riana.tauro@intel.com>
 <20240905052813.4169007-3-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240905052813.4169007-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 16af936b-04ea-436b-3700-08dccd9c2111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0Q4cTNnZ0MxR1JMTTBsRDVsSHNVY0cyR0krMzNQcExIanozaGY1NU5RZmsy?=
 =?utf-8?B?NFBOWjJNRVdzTU8yS3lHSSt5M1A5UFFNYlBEbXRSN0V4c1prMzl3NGZDRWx2?=
 =?utf-8?B?L2tIU1pQdnkxbkI4NGRSODBlZmFuZ0RNR1hML1BBR2VqZjd6N0Q5aVNsbHZ5?=
 =?utf-8?B?RWxjc0UrU3hKSS9XeFVQem9LSHdmSHVGclZaRW85Q3Y2MmpKUVpKdFdZVTY1?=
 =?utf-8?B?bi82ZHdtZ2RYc1ZpUVcwenAwSW9ERnFuNjFicHc2ZGI1TElJT24rcmtFWG92?=
 =?utf-8?B?OWZnaFJheCtQZ081d0JoWFlQUzF2T25RQjdBVHZKT0xwU1hqOXNPVm03NXN4?=
 =?utf-8?B?dkJZd1M5VHhrUW9jNE04a1Q1M2FTbms5VzBJTjRnOXJZNlVPZ2xRVmxabVVI?=
 =?utf-8?B?em10a0ZFQ2QyenRyckUreWxuQmxpTVBzb0dsRzh0aC95Qm1aTERZbnNJT2s2?=
 =?utf-8?B?ZjJDczNyVGFlLy9DaXpsRE9QY1lrdVRubGFlcnVvUXBhT3FVcStQODUxM0R4?=
 =?utf-8?B?cmtYTjNLcEJEeWtXa1JYZWpFdnNXbmJieCtSUWFNUkxGd0xSMnBNSzhwaUhw?=
 =?utf-8?B?Q3Bub1JlMzNuV0hNeVVCZ25NSStMQ3Ruc0w0TDBVNFM0QzNSaEt0UkRHZWc5?=
 =?utf-8?B?aCt0dktXV0svTkU0WFlTQkdzN3UwZVlnbmRRYSt1TVBubGF0cXROcDdCZ2Yx?=
 =?utf-8?B?YTI2eGZ0ZnJMSGhKTnlqQk9CVWtrZVZnSTVXNlNOckRuTEs5OSt6eUJWeER1?=
 =?utf-8?B?ek5aRnQrOHNSMWtOeVQzVnIyQmpYSUV6TENzV0tTRUZSZlU3K1h2aTZsQW1s?=
 =?utf-8?B?dmpNTjN0NVFTNDU5UTBsL3Y2QkM2R28wdEhnYlBOTkdGRkFJRGIrMXY2ZnVT?=
 =?utf-8?B?VnJ2L2QxN1BRQlF2cHpqTUI1RGgyS2w5ZS8vUWhJekUvQ0JyOFNyaithK29z?=
 =?utf-8?B?V2VLeitwNTNyUHoxeXcwZjVHUGJvMUJiZ00rSXB4eGVLYVJYaFVwdG5RZWZt?=
 =?utf-8?B?dyszdnYyVGZLTU1ncERyNWY1TjJHQVdEcmw2TWxBQytLVGluOGJpK1JGa25p?=
 =?utf-8?B?ZDFpQ05DcjI1Tmp6NFVXUVk2L1ZRUkhNbUU3NFFsa0d1RHRXTXNIN1ZCQWUw?=
 =?utf-8?B?L1RiWjhMYzFpZmU5b04rTXNDQWtFQ2xvbXRHN2s4VEtaQUJpTUpteWhId21l?=
 =?utf-8?B?S1ErYXR2RDU0RW04eUR3U3R6cjJKZkcybUNlV1ZReTEzYkNwWGpCcFVNMEl5?=
 =?utf-8?B?VCt1ZUtwRGh6SnJmanF1Q2I3dWRzU0RDRHVibFBoRFBnb3JhTWk5Slp3OFhj?=
 =?utf-8?B?VnZEcHprQ3p1LzJCOVVPc2owRkFsaEJwRDI0TkV6WDhKUE43V0hRSk4wM1dz?=
 =?utf-8?B?OGY4QngwYTc4bjFHS2o5SWpLVzRtSjFVdEE3eUFZTTZmSHdqZW9QdEJqVFlW?=
 =?utf-8?B?M3hkWWc0TWVzb1hrY2RLdzNIQm1JZ2Q4ck9nYm5kK1J3Y0N1NnYxN1VYcXdI?=
 =?utf-8?B?MkxGcTF5VDF4bHJUa0VRcTdTUXVnejNoT0dTL2lBRUM3N1lRZjJnanpPVjBW?=
 =?utf-8?B?VS85NTA1d0NlbWJmcjE4cWYrRUlqUXorWkRFV0xGWDFlTmdCVjdxekRsTldj?=
 =?utf-8?B?K2l5VTZjZEJITXdabUdNNUJmd0l3bk0vYUVvaCsxWis3Q2tzbTBOcEJDaVFp?=
 =?utf-8?B?Yjh6bGJCdDRZOWpDSmwvVHRxRlJMWkV2YkNTSk9QZVFvcEUyeXJaenBnUk15?=
 =?utf-8?B?dG5LWkNkUnpnL1dtVnhtWStVMnQ2dnppL3l5N1M4QWUvYWV6VkhDLzJMbTBZ?=
 =?utf-8?B?dHhTTTBKNWNmR1BRRmgydz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHg2d21RRVBldkRDK2dPeGhrTEdoNjJuWEVxemZGaVlXZTZNTmxQWDZjVCtj?=
 =?utf-8?B?MFlpOUhnYno2VThlcWs4OWtqTURxMHdkRkh1b0M2MFBCZkRteVpkVWtJSy92?=
 =?utf-8?B?dzZHeUMycHJMQ1pSNzhrVmk3dWVibUtDalQ2bEhyU2xLTTQ3WjlCWHNjaVdV?=
 =?utf-8?B?QlBEdks1Z0pIejB1QzdueW5aOHYrS2JUTDdpWVpWNnhXV251eFFsd2tvZTRO?=
 =?utf-8?B?SDgyaVE4bVQxbmE0WjRrQ2NwdmdJazFDT2x4dFVLNVBpVFcvQ0R5Qm9wQ1pt?=
 =?utf-8?B?dHFXVVNmNTVsYWU2QWFuNHJ5Q1ZVZ1dBVXpDcUhmUDg5Y3RRYkhyQTlXV1RV?=
 =?utf-8?B?eEFvY1VOa3lIc1Nua3JZa3YxVFNCZDJ1NVRzZHIrQUxXbkgycTZmTUozZ0Nt?=
 =?utf-8?B?emdLK21mcjcyZ3VIZDhVQ3dycHVnYTJBRkMvNW8ycW40ZjZ0K24wdG9NSzdM?=
 =?utf-8?B?N3ZmWVpTNmdvdTEycFdSVVJCVmxnREwzVm5oSjBQd3NhWnRaSHpPaUhQRE9j?=
 =?utf-8?B?bXZCaEJkeWtUOTUrOE1WUlpVTS9QOUlkK3J4Smsya2psVDNEays4eGJVandV?=
 =?utf-8?B?Mm1hUUFwUDkyS2ZsaDgxV0gxS2JGTndwM0pUWmtwME9mNlBhd0I3Q2FweUVu?=
 =?utf-8?B?ZEhMcGROeXFaYzBTT091QjNkQ1JSNiszaHlNbWg2eWNWaE5zTFZjZURCek9o?=
 =?utf-8?B?UzZseW9vYXZqT09JNjdLNzN0ZlpjK1g3bVdmQVFDT1ZVTjRHR0VHcEpDRktU?=
 =?utf-8?B?dUxjZXhEVXlPWTk3cHdUN005UkZNblNCZDRCK040UzhFM3pZQXo1MVJiTWQr?=
 =?utf-8?B?V093ZEdqZXNVeXROVGhNREFCTDdWTGppZ1IyWlpKdFM4S3RtS1hOWmp2RWF3?=
 =?utf-8?B?ZGptd3IvK3UxN2ZLeVdJRjExbkVuNmtXZnNuamNxS3NZVy9NTVpGTDVselEw?=
 =?utf-8?B?aGFQV2tvNjVxbXVveCtNQXk3K1RBbEpZWGt2SXo1aUk3aWU4RzR6Y2cwUklx?=
 =?utf-8?B?U3BWRzNMQnFSakcwNVFUYmk1dzJIOC8xWWNlTFpORE9GUEVtYVhrQXRzMnFD?=
 =?utf-8?B?Z1ZUNlZrSEFOeWlPZlZsQ2xOeTNRUUM4RlBxeHNiOGNwd05WREk0U0tySDZt?=
 =?utf-8?B?Myt1Sm05UlE5N3MyK253NDA2RlJMMFlnbk9SMUFWYWp3YUpnbDcvRU5tZGRx?=
 =?utf-8?B?eXVUMk80WnFGbTV1YVE2eFNoRCs3T0Nxcjl0UUFrd2xoRDJtUmtyQmVXTGdL?=
 =?utf-8?B?Q0l5K0Ivd2xkR05pLzNaQkxSVHJDZm9HOUlHMnFhTEpnUGkybVIrS0hTTUNn?=
 =?utf-8?B?cTRuVGljVEl4RDRzSEs5VGhrTVYySTlGS2kvRmNBOWRtRlpyaXh3QkM1cEcz?=
 =?utf-8?B?NUdHTXNkZTV2cHJ5MVFyL3YvQ3Nmc2dBK3lIdVFITktnTjFHVW5KeHlmdFFS?=
 =?utf-8?B?aFVBdEsxenNYZThCZGkvY1dWbmkwaDFoZGFFbS9yc3pERS9VbDZXdkZiSUxV?=
 =?utf-8?B?REJEa0p1d3JwZXJ0Y2xJQ3pxV01zZDB2ZEt5Wkp4aXZOUE1WbVpmZlo2dWhv?=
 =?utf-8?B?TEtuTjdEVHVGNTc4TVpvclB1SjVkaUJRbForVno4WVBIS2xHRVNVOERnSDJt?=
 =?utf-8?B?LzlLczg2WS84RWRKNmxpMWhJZHVMeGRTMERtUTJUT3RETEVuWElnWCtPcmlp?=
 =?utf-8?B?dmdYSUV2QnNOZXNzc2VFZ0k1OWZoY0VoNzdXWlg0K3V2ZnJmd2lzaWNoZnA1?=
 =?utf-8?B?Vm1XUTVHTGQraVVxWWVWNWs0RDJRNXRXQ2diNGJlQTVOR1I2eVBpdk9MR21Y?=
 =?utf-8?B?UlZpUkxiQU1IbzN3Z25DYjI3d1VhSWdxU1hESmx0cjc5eEVaeWc0V0k2NFd2?=
 =?utf-8?B?Yk1IUmdJKzVoRm82Q2d1Nis2S1BWNDA2bTVhbmpMU2o3VjlZSkY2b3BBemhW?=
 =?utf-8?B?WGQ3QXFBcVR6MWJoTjM5eHA2YUhtckp4NG1RMlZZUXJhQVpJL1N5d1ZHZHo1?=
 =?utf-8?B?TjF3ZEppbTcxckhyWHdYSEtPdDJ2THZVK1ZYL1B3MkwwMzB4TW5SRDc3b0li?=
 =?utf-8?B?TTdLdHk4SUVaeFdkcmxOR3FqbFp4RVV3eFR1UWdYVy9sbUtnalFkaytiVStt?=
 =?utf-8?B?UW1ud2VUeG56U3R4RFZMU242WGNyM1U5a2tvT0J2UjFUZi9mcU85b2tlZUF6?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16af936b-04ea-436b-3700-08dccd9c2111
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 11:16:03.7048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrTCehhmitJdjN6aS5Nbt/grxSvgxDsUQ4CI5zBMH7IF+0bx/j68rBHjgRbPTK2xPBVzNWmzwHabvUwc7UGGIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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



On 05-09-2024 10:58, Riana Tauro wrote:
> Coarse Powergating is a power saving technique where Render and Media
> can be power-gated independently irrespective of the rest of the GT.
> 
> For debug purposes, it is useful to expose the powergating information.
> 
> v2: move to debugfs
>      add details to commit message
>      add per-slice status for media
>      define reg bits in descending order (Matt Roper)
> 
> v3: fix return statement
>      fix kernel-doc
>      use loop for media slices
>      use helper function for status (Michal)
> 
> v4: add pg prefix
>      do not wake GT if in C6 (Badal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
>   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>   4 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e11..cbead3f75fad 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -341,6 +341,14 @@
>   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>   
>   #define FORCEWAKE_RENDER			XE_REG(0xa278)
> +
> +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
> +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
> +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
> +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> +
>   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>   #define FORCEWAKE_GSC				XE_REG(0xa618)
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 8f95d3a5949b..cbc43973ff7e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -15,6 +15,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_gt_idle.h"
>   #include "xe_gt_sriov_pf_debugfs.h"
>   #include "xe_gt_sriov_vf_debugfs.h"
>   #include "xe_gt_stats.h"
> @@ -109,6 +110,17 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	int ret;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	ret = xe_gt_idle_pg_print(gt, p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return ret;
> +}
> +
>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>   	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 3924f9f3d0a5..85a35ed153a3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>   	return gt_to_xe(gt);
>   }
>   
> +static inline const char *str_up_down(bool v)
> +{
> +	return v ? "up" : "down";
> +}
> +
>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>   {
>   	switch (state) {
> @@ -155,6 +160,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
> +/**
> + * xe_gt_idle_pg_print - Xe powergating info
> + * @gt: GT object
> + * @p: drm_printer.
> + *
> + * This function prints the powergating information
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	enum xe_gt_idle_state state;
> +	u32 pg_enabled, pg_status = 0;
> +	u32 vcs_mask, vecs_mask;
> +	int err, n;
> +	/*
> +	 * Media Slices
> +	 *
> +	 * Slice 0: VCS0, VCS1, VECS0
> +	 * Slice 1: VCS2, VCS3, VECS1
> +	 * Slice 2: VCS4, VCS5, VECS2
> +	 * Slice 3: VCS6, VCS7, VECS3
> +	 */
> +	static const struct {
> +		u64 engines;
> +		u32 status_bit;
> +	} media_slices[] = {
> +		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> +		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
> +		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
> +		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
> +		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
> +	};
> +
> +	if (xe->info.platform == XE_PVC) {
> +		drm_printf(p, "Power Gating not supported\n");
> +		return 0;
> +	}
> +
> +	state = gtidle->idle_status(gtidle_to_pc(gtidle));
> +	pg_enabled = gtidle->powergate_enable;
> +
> +	/* Do not wake the GT to read powergating status */
> +	if (state != GT_IDLE_C6) {
> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (err)
> +			return err;
> +
> +		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> +		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> +
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	}
> +
> +	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> +		drm_printf(p, "Render Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
> +
> +		drm_printf(p, "Render Power Gate Status: %s\n",
> +			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> +	}
> +
> +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +
> +	/* Print media CPG status only if media is present */
> +	if (vcs_mask || vecs_mask) {
> +		drm_printf(p, "Media Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
> +
> +		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> +			if (gt->info.engine_mask & media_slices[n].engines)
> +				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> +					   str_up_down(pg_status & media_slices[n].status_bit));
> +	}
> +	return 0;
> +}
> +
>   static ssize_t name_show(struct device *dev,
>   			 struct device_attribute *attr, char *buff)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 554447b5d46d..4455a6501cb0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -8,6 +8,7 @@
>   
>   #include "xe_gt_idle_types.h"
>   
> +struct drm_printer;
>   struct xe_gt;
>   
>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   
>   #endif /* _XE_GT_IDLE_H_ */
