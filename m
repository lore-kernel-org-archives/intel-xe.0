Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3957D3CC84
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 23:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E97710E280;
	Wed, 14 Jan 2026 23:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/V2aA5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1608510E280
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 23:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768435030; x=1799971030;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1pg9fnbILV3zEaqCeqofllDsQa+TmZxAjKvf2Rc3M70=;
 b=b/V2aA5MmFJzwCTwifBmsOUkR3PoJ7Xaen33W0omwsT7rEgpJa9TG/95
 XiguI1VWkfRuCwNzp933HelM/3XUbyoT0/D/cl2DbSxnkQyF6h2Ns+kBv
 wTs3DijQgMSrudQGWOmIZMk5x/qTmjw8VQGTR+yk7kgkzzToCXS6UB28/
 Z9/kWTV4Ds10L5CeM15vymK1Baq5oIlBgYrQ+vh+1sCp5m9phI5xTg8KH
 tkjawaplZITPT0Kbdml5r0pPSByQ22IpmkRzV0BhCxQ87Py2WBJLOSVBn
 FnKfgGJ4rfY6gEyawAmIK7SzMMV2QOgv/utHi648qWa4GsygfqW9X7Tv9 Q==;
X-CSE-ConnectionGUID: 9ZfEksIiRyajjWaF3AH/cw==
X-CSE-MsgGUID: OMNqZ3I1Rj6X8qEOeGGgsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80389585"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80389585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 15:57:09 -0800
X-CSE-ConnectionGUID: D73JCLwzS/uwRpsANjV8qQ==
X-CSE-MsgGUID: +4jwdUjxTVGBoft+Yzjvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="209317387"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 15:57:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:57:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 15:57:08 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3e6xT4Bb0+49cINl87SbKRWErg2QWQxT+FFHtp2+4kKUWBAcK/mC8a3qszL8gMFtVBO3Td38GJDwe8gfkXUPneR8TYyRLBAsJOWhtfwteXKvcK/9lb0tXIwGCMANanE0Af2y+DBrDLfb4oix/9ibpsyz/JVcXR5o2wvShTyQu83emFmu114/N4cdw3ZSNUmPF5+tUP2QNUDpYmvBSDhC+IhoEEDNLunlacv+xO9av9AyVGY5J4uRvLBCXUWUrJfO6lKUyQiFOpfJQ3F82zUXG3cfr4JF+TVz5JhbQw7t0LEVwOIW8OB6+YWcDNZCFvkGb7sPBdNpIw7rwCo1QmoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PShPZve2IRI2uTVYv5DHbdUKfNjHeekzOJyJx5ix1e4=;
 b=X5BEoJXv+BMrUuHdegCacWp0xvQcfsMf5JCCMu9szwzb1/aeeIF4HR5/noc/xwND9xtVaQ7vo1ACLSHXybDNmaKybSwJIOiGLgyWKUAnF7bnwhZvAHVgWcOIjA3jy8fh24OwO13mMhM8uixUsljCsrw0nlXsCYJStGE0G2b61sSLTwRn0TF7Uh/4cNh5qvA2UNTYlbm3pBFirJHCcyf/19RzKwDNhZFHemSeknXKf2weOX2F1ulsLMERLReW8ybG9kHA3MamP8YdRyT9KfK5laXM9TjTj2dOIMIngY3XXP6Fc4b5a3BoZB6fL6DsmihMfhIE9hVuS3xxHAnxFC8ZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 23:56:59 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 23:56:59 +0000
Message-ID: <a49113d0-5ae5-4c23-9917-5a1550581f6b@intel.com>
Date: Wed, 14 Jan 2026 15:56:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/xe/guc: Recommend GuC v70.55.3 for BMG,PTL
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260112180809.1474677-9-julia.filipchuk@intel.com>
 <20260112180809.1474677-13-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260112180809.1474677-13-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe29537-a140-4023-cc13-08de53c89b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTNTVkZkZDN5Tk94eXpOUURQZHBIWFZDcWIrWThROExQNlNGM29UMHlYVyt0?=
 =?utf-8?B?Unc2NmV2Q2dIcEV5VVBOa0hCTWNaMjRROTZTTmp5TVhORmFMdWhidjcvU0R6?=
 =?utf-8?B?L0U4UHJXS01VSC9wTk5EOG1NM3FYM1JGZHRqbXBrUXl5N3dmSnZLYk1qV1d4?=
 =?utf-8?B?V0JlNnFNMFB1dHZiOFkyRnk3UFJVZkkvUytXN3RkaXRkdzJhRG1uSWlqSmVE?=
 =?utf-8?B?OHpCejJseGxxSlcyWnVCb3BVRnM1Y0xodGVhK1dwRkpyQmxXbmZpMmE2dW9D?=
 =?utf-8?B?T1pmZEw2SjMxYXg1Unk2SlNaVmVvWmhES0EvTG1wNkJpMEt6U0VmSnlwbGNU?=
 =?utf-8?B?VUk1V0M5dm1JQ3FpeVdtdHlzMStycTNrS0RKbXZBNFdoM0xyRTU4V3VhVk5D?=
 =?utf-8?B?TkVhbEN6TUpZeHVMZmZmSk1oZnlDcGJTTmtLOWd3U2dvY1YxZ3djeEJDc1Zy?=
 =?utf-8?B?YkNHb1ZlTHJ4U0doRENKQmNrcmc1VFdMNlV0cUQ1Skd5aFAxeCtOdVBRSGVZ?=
 =?utf-8?B?enljU0FINUczakFiQkVCU2FmNUZaUWNHYXQxcHMyUU81NEpSOFhoK3phcVQz?=
 =?utf-8?B?Q2RiSHhQVkZHTUNhRytaQ1ErQzBBMWUwcm9JYVVLV0FjMGQ5S1djZ3BaK2tp?=
 =?utf-8?B?aFBETk9weWEwQ0t6RmtVVGRLL3NxUmY3dnFQenZjS1YvR2M1VU1OdlB4Tk5x?=
 =?utf-8?B?eFNuUjE3Y0ZBMVlHT0d4ajI4ZGVSWll5ZHJZVHowc1VqSS9rVVlzOG1nd1Nt?=
 =?utf-8?B?allCWXBHdWp5akJwaGpJOTZMMlB2MmhJTW1jUDNQZU9jTlZFbFJWYXBzTDdG?=
 =?utf-8?B?Sk9uVG9XSFZKUzhqUHZRTXdVMDNMT2pzUmZrdWdxQ29NRU5iMkx5OEJFUjJr?=
 =?utf-8?B?OE14cTRRNnI2b2Rjd1FWSG12VFo1ZHhxVGhXcjhHaGEvTjFoeVlRVzlmZW8y?=
 =?utf-8?B?RUZUWkl3aEgrMXpIcDk2bW81WGdBakQxODdTK09GaDBkcEEyMUk0aHA3OTlK?=
 =?utf-8?B?VlVibGFtQzFCa0Nxbjl1QnowTUc3amk3dXJmYXhCRGhOR2FROVRvamd0Y3JY?=
 =?utf-8?B?MUhZekJtbUwzTE5MTjhzcW9UQWFyWmdqL2F2UTVDWFR0WktOTHNiTmVLSW1v?=
 =?utf-8?B?aU5PWWlKUGs3T1dBbzBUdk5ncjdxdFlHb2VTRFYyZFhlckp5T2k1RVdpTjdl?=
 =?utf-8?B?N2ZTRUFVc1QvSUwrZVloeFQ3L3VBQWJDZ1hYOUx1MmNlZFNZcENOR1ZRRXZw?=
 =?utf-8?B?LzNIRkVUNUNFdUNTM1hpWkZQdFlUaDdrcGg1NlZjTnlMTjYvTERGQlBpcFlz?=
 =?utf-8?B?LzY4TlhFckpBcmo0bmI3RU5QUkRrUUtUdmtTQnNkUWgyRzZvNXJ5WE83N1pt?=
 =?utf-8?B?bU1vZEdqSE5yYVVidkk4OC9KVWNKaFd3dnhTaDJoc3dKNEx3azU2V2hlcnIz?=
 =?utf-8?B?RHV0YUMvSHRYZ2kwaVVQRmV4RGI2YVRBQ3d6d2I5ZldKbkhESFdzRmRTOUcr?=
 =?utf-8?B?YUpuRG00V0NMMXl1UWhOYnFvWVFQb0plTkdWemZKU2cvRERjZFZHdjBwekVX?=
 =?utf-8?B?V0hHUWJMd2cya2NuTkQrQnB6akx3TVF1aVA3b1cvOFBPeCtpNWMxUHNSMEpo?=
 =?utf-8?B?ZVo2QWgrcmJjZEZJZHRNckFXNUZqWEM1QjdMYy8vNHlKbHp0MXoyUDcrV0Vo?=
 =?utf-8?B?Y3lTckNaeE1vQmloMVMvUzRVdkRsSUttYnBUWWtQZGo3REQyWGJwK2ZOTnhO?=
 =?utf-8?B?RlRpd1RLem9QdkNib1BpQmRBOVg3NkVydEFIRHhjV1hDTHhXbS9weUM4MVp0?=
 =?utf-8?B?Q1NGeU53R1k5UGxTN29aMGQ1bm1STWpXdjJXVUZFWE5sQ1JITFlGcXAzQnc0?=
 =?utf-8?B?QWF2TXM0bjM4QU5LaFhwQ0N4ZzJqeFFWYXUzcVBySUlMdFVnVkpUNnZhbGl3?=
 =?utf-8?B?N3l1L2FZQ1ZlSWYwcS9zbGgyMER6YXQxSzZTVnBDYWpXbUNDcnBzNEVGSTVL?=
 =?utf-8?B?OFJhaFo3OWhMWGg3Z2tIaXZZbjFjTTh0eFk1UVVCVU9wQ21vRGtTWlRXREVv?=
 =?utf-8?B?ZE1OMXNMRVVodFZnTmh6RHA0eW9ITldaR2VTUlFZN21lazdmbjFjbmJTYVRT?=
 =?utf-8?Q?rvqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVEWDlqS2pKZC9qbFdqMjRNVncwSVcvQjlDQjNNeEpFZWlIZlBPK242QzR0?=
 =?utf-8?B?bDVzcDVUKzVYU2hseDZvcVJyaVkyRzNiUy94WFFkeWN0alVsTXNGUldxVEh4?=
 =?utf-8?B?NnBCelBNb2ZrRnQvQjBVZElOUlZrT0NyTjhOVFYxOFdEbnhwOHAxRmpQRzlZ?=
 =?utf-8?B?LzE4dC9FY0pEdVZjK2pNQlVXUWJDT3U3NGxHUEJhTkhSaWY4RitSODJ2MzFR?=
 =?utf-8?B?anJBSElmdHBicXFXVGVZNThVVDB0T0JWUnd5QVdJQllQWVVpU2Z5b003SkJy?=
 =?utf-8?B?b3kvUmwyZXVHaWxWVTJmOTNZSDR3UjdLakVWZGsyTGtlWCtDS2FuOEt5OGpC?=
 =?utf-8?B?SkxaYml4MUczRzBjcldxZUFJdGZxZ3FNd1lKNnZCSzdLdXdqOXk1L05zVnYy?=
 =?utf-8?B?b2g3NVluVUxEVWxNK1IzL3hmaVhYZktjVEkzcjdORFVVMmNtQjNIMXpPZmNY?=
 =?utf-8?B?eFJGWGhtSTR5eHYxVmNXVWh0b3Jlb1BLMFZab2NkL21ia014WUVEcXFkSE56?=
 =?utf-8?B?azc2eDBMM2RML1ZPaVNhalpxOFlQczVqMFRjWEdjUGxYd3NjSTloWkdpUzJD?=
 =?utf-8?B?OHkyVTMveWc2NHFPZkdoMEZ1bVkwbkU0MWEra3A3SWRkOE1FY3BYQ2wyd0hk?=
 =?utf-8?B?VEZPSHMwZFRkcXlocWlWWW15ZG1sbXkzOWxZL3VudWdqWS9mTFNWN25JMC8w?=
 =?utf-8?B?ZXh3eUFmendreWtqTmpYQXRSdXFaalErdVhKRFk3cU5MT3NGcWxhLzlXRmpJ?=
 =?utf-8?B?ZnRIWDZ6cTc4VEt3OGtCNW5id2xPUE0vTTBLNVl6eGkya1lZT0JWS01HSlZo?=
 =?utf-8?B?dElZWG14Yk1mcmhLMDlBMS83dUdpMmxkR2xrVjhjdjZoeXZhZDNScHNVaDd1?=
 =?utf-8?B?ZzJZMVRseEh3bC9qSlBUZ2drZlF4aWxpbm8zeER0Ynd0ZGRWb2dHM3VYOU1U?=
 =?utf-8?B?L0JnM3VoUFUxRXkzRUFMNS8reTFEV3FoZlYvZms3VjhLbzNNQ3BVVGI1bjlO?=
 =?utf-8?B?dUFFaFNzM25rbi9rcWF3VkJFMXlYamo0TktaSzdWYXYwRTJodUw5d08rWDRF?=
 =?utf-8?B?eXdLQVN4bE1OL0lmSWpVaUNmS3hvQnZDeVNHZnl2RFpPMkhkWkNBOGNuTGM0?=
 =?utf-8?B?LzNXendMc2tNTTE5dHBzTUk4TmhBdTNsc0Z6aFdVMzdVK29ubDdpZXVoTFFn?=
 =?utf-8?B?dEpDazhua0E3RmxtK2ZMREFpUlE1cDRzYWdiY0wvY2NvOWNxaGNCWkxEZ1Ay?=
 =?utf-8?B?WDRnU3hRY2h1TEJBSExGSHBSbWl3OGtTaDFQbTZCWklGeTVaSzFKMDlyby9N?=
 =?utf-8?B?SUg5bW5WUzNKVVgyYzZsT1lwTElVbUhMUUkxcDkrR2I0L0JlTzJKakF3SHhR?=
 =?utf-8?B?MmVHSGd4Q0JsZlNENEdubnkvSFpwWVRLUU1QSXpDSXg5aHFMU2ZmT2RIRFM3?=
 =?utf-8?B?U3hiQjFpWlhsZWJsL0V2bGh5SHk2M2FSYUpUc2R1QUo3ZkN0YkVsWXhzUWor?=
 =?utf-8?B?dWhqWC8zVjJtcVhiVW4zWFJ4eXd4R3pHclZ0QSt2dWNCdXF2bVhLaXo1TFVY?=
 =?utf-8?B?TjdUOFFnR2lGTEEvR0YxeWJNT0N0SW5aOFhmbWZhUG5LQWlCYnhSc0xNRHZW?=
 =?utf-8?B?TjRvM0RUZzBTVmROMG1JNnVnUmZzbUVTRE1peUhkMHBkMmxpUzNwV3RqeHNr?=
 =?utf-8?B?NDJ6d3RjVXkvWHNLcmNjU0hqRXFCL3NtTXliekxFSkZ3b2pzeExCQ1dGY2t2?=
 =?utf-8?B?amhvcmhBckh1aHluUlZ6OG5keFVkd001anljWDNQQTdjOERzSWk4SXB0VTIy?=
 =?utf-8?B?OVlIL2hGYWUvdUZWeWUwTDFPY3lLRnVtYWZmTjhrNkU5Um82d0UzUGN6RERX?=
 =?utf-8?B?aWkrcm9OdzFMU05xUU1hZFp1S2h2M1g2ZTdLNVhaUkcvc0NMQXk2c1NxcDk1?=
 =?utf-8?B?aTI1VnFxcWlOcmhUckViVmRkRmdzRWxZdTNJMklTY0VGV3JuaUpwbStGR2lH?=
 =?utf-8?B?cFdTL2Q1UnlsemtQZk5kSXBhWkFsTFNyWVhqT0xnUmJqQzdGLzZ1LzFoeDRY?=
 =?utf-8?B?UEpScDJwbVByRk5JWGdrdFNwVjY5enhOMUhzc2FYTnE3Zk1mS3FOcHFOamtT?=
 =?utf-8?B?dzVpMEFjeGQxZGZHUEZRalhmSnE1VWgySnA5L1NPM0w1NFBCN1lJVzl3U21I?=
 =?utf-8?B?MEszakw4d1lDemg5OGMrUmd0TWt6a0lUVEQ1bC9aUXpUZExSWUlQei9HV05i?=
 =?utf-8?B?YXFCZjBSN1ZiQUtsbkJUS2V6eVV0bXhyT05xbE5CQWhyUWpFNitIVlh6NmYv?=
 =?utf-8?B?Q3VnWmxuRWNqVnk2NEpVVnErSzBkQkhNbDJpdHZwYmpKUjh4MmhRb0E3Ylpt?=
 =?utf-8?Q?bIq4xaqCK7F2We5s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe29537-a140-4023-cc13-08de53c89b23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 23:56:59.5878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGTBzS/I68XwRes/bxAKDHsJO2crzmj6OZYRPmc8qFihfC0W8OdOFxPCJWfiOuXP2txU1AMTzMJFE9fq9jo8KQOLDYLgOJol4kYb0haKIhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
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



On 1/12/2026 10:07 AM, Julia Filipchuk wrote:
> UAPI compatibility version 1.28.3
>
> Update recommended GuC version for BMG,PTL.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index dcb4a32e7a64..3bff84ab4b5d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,8 +115,8 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> -	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
> -	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
> +	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 55, 3))	\
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 55, 3))	\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
>   	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\

