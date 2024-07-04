Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D24CC30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 20:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD2310E089;
	Thu,  4 Jul 2024 20:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjeizQmL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C102D10E089
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720124877; x=1751660877;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OsbkIPAxCF25LSuV3Blf1hpJxmAJqdbnABHTRVXwHk4=;
 b=UjeizQmL8AAa/OtVH61zOqHrINyPyk/S518ePn/4l/EHZFQa84iOozYE
 0o+5K8oYjjDH4soLuxz6p8GlvFFgI1BGi/W2iJ34igAszvs/Y+ZRIDUXG
 YyXWwxkfhjdBrZ9beEvx6JWJKkd+jYv86L6UF3ZwKGwAnXliz99nTrsru
 QF20E3D6ic8E5PmBzP1dqeqL7sctoo8dG1nbrAK2g7WTKmMODam0hsoE3
 7AEq4NpGVnJDzCo92yHcEBqdWSzx/HSSfDtsiZoHgoMyU+3v2UgIq0NpT
 ZFUpdKO8oSsOM87XCTJZbrx6FAG/cpfVpHTWQ8LvZ98PYA4JHM3IWUANy w==;
X-CSE-ConnectionGUID: 1cueUvPDQfaD5MAPsgYUxQ==
X-CSE-MsgGUID: Z39AF7mhS0ai1ksj6giPzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28091901"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28091901"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 13:27:56 -0700
X-CSE-ConnectionGUID: HHbTgIutTwqYv5lA1DK5Gg==
X-CSE-MsgGUID: 15RYnmKCQT+IStE3w5i5wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="47336197"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jul 2024 13:27:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 13:27:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 13:27:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 4 Jul 2024 13:27:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 4 Jul 2024 13:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsAty7NX221X2DffvNIrTwxlYUf/5WcG4ZsjXEqfzXZ47mfH6FpSIng1TFD55XO6Y9oku+5KD5JAYUTY4nUPWGJlYJbBbD46YDCoW3BtLhQmlXaI3npTAcw6qyniSiT0ZeZkK0NMh68KStFcbUWawyRyNUmCVKgvrEJijSo8sn6kfsR5E/cBU3Mlvxbx6qw4u9sFI6ePaD/JLmH1xCxiYXOQE1v3yFpjZLVP+KNXJ11Fc56thZedVPrmQZ3ZmlpGF3IrosOi1BIh8ivNnFCLfqdqZFtS9S+nAILyLIXICORkX/Yb40ipbke079f2pvdlKF+z9sQdoEiw0Hsy2TlyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJyUIOCNE9emDspFN5STDI5TQo4Uck/0Df86S3y/Tx4=;
 b=FYZf/610JqwcViD3jXwB+5kx7plqwZ87SvhxRiBZGIPW42j+6+7pk2uUDfkNJHz4f1+uYqbnLiAVFGVrkF0umi3AS499uGa2xnD276zJzlgMbQPWkw5RKEOYrEEyQ8cmorTzo42wj50Tg2uHegOMyo/OmfvayGJcOS8vULKeSu1QAP9u74ZCHeQZNoxKndb2vvJty311hW4hKYt/3bosxFiRQhWBgjyUiAN6jUB3sMZW2W1+OATNKQIIlD8rqK8mkKrnnbGTIgcwjzKpH999z4CO5mHqNftQI2liidnjo7X9tBiQe1CoAIfVPh8DnKwzpfNFpmGaCdf3yITt5ascKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Thu, 4 Jul
 2024 20:27:52 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 20:27:52 +0000
Message-ID: <e9d56b8d-e2d9-462e-9442-4ca85823aded@intel.com>
Date: Thu, 4 Jul 2024 16:27:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] drm/xe/guc: Add capture size check in GuC log
 buffer
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-4-zhanjun.dong@intel.com>
 <f1b80bc5fc330ffe7ffe96992855860308d228f8.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <f1b80bc5fc330ffe7ffe96992855860308d228f8.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::22) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d3c65e-f112-4eb3-18b2-08dc9c67c77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2Iyek81MU5ZSXEvaEJrdFdzanNrTzdzbXllMjhORHAyQy8xZVNtTklIdkNV?=
 =?utf-8?B?NWc5U1NhVDJNbzBFZUx0QjBUUndxaS9abjhBcmhkQVc4c3l1bXhNZlVaN2lO?=
 =?utf-8?B?cjJFYVZITFVwa1NDLzUvc0prZkpJQnUrcVNXbWl4Ym1uNmIvdE1nUndMQitI?=
 =?utf-8?B?RU5pT1hXcitFN2FXSnNtRmlPQm1NQllRUFpXdFRkQkhYdld2dmgvc2RIQ2Mr?=
 =?utf-8?B?ZEk5cTc2bWNqUUYwM085TUdMZnlpOGd0NGZYSUNuVjIwT2JyTHUyL3RtckJo?=
 =?utf-8?B?NFZkMFNPd3BrRjJtTWE0ODFoN1E4OGR6dWxDeGNmNnl1d0xkSXg0aW1uT3hV?=
 =?utf-8?B?d2hqbXU4anNUeWsvb29GSHcrREVWa3FyTVJza29obkp3Z3JtTVFPbEtrUjB0?=
 =?utf-8?B?SG0yWHorcU52UWc1RXJ4YmtBSlBaR0tzSjVQa2tZSzlxc1RMMW5nV05DTDVQ?=
 =?utf-8?B?Z3Z6dnJSSzlOQlJodWVsY21OQk9ZSk0xODRXbGdvL08rWERBRWw2MDY0S1I4?=
 =?utf-8?B?U0twTmxuQ2NOWFN0OVB2Y09aamN6cE44dC8rVDg3Z1RFVHJ0czdoMUY4UkVU?=
 =?utf-8?B?bGJsblgzUzJBZUpOWkJDSm1KU09ZeERqbS9FN3dSSjA4WWsyN2ZHNXhzTFpp?=
 =?utf-8?B?N3NQcWdSMGJSZ3AyNmNNcDAvWk9rb1UzV2hTcCtZa3FaWS9Yd0Q4eFN3aGU1?=
 =?utf-8?B?WVBTRnM2M0JmdXhSVFhTOVoxWmZUVEhrTktXUkNGY2xoOUVXL3J2cGQzcmVk?=
 =?utf-8?B?RVZMVDhZRGw5MXBQeDFUamYxUFl1ZkVMSXZuVjBMN1hDTkVwVkl5QXFOYjk0?=
 =?utf-8?B?anlodUs0aVFiOS9uakFSMi9YbnpFcTdkS25yaDIzSjVpZU85SVhESEVMMlcx?=
 =?utf-8?B?bFpMT0ZHc3JraUNnWnN4d1U0NG15bG9sVHNaVTNycEFKdmlqMnkvdU03M3Y3?=
 =?utf-8?B?N1V4MGI1ZlBSVy93NS91M3NXZ0FMMEFWR1kxNEUraWEvaFk3Q0x6Q1BjMGN1?=
 =?utf-8?B?U2xGZ095c1lHWDExN0xNeXZmUWFCNkx2Qm9iNGpHWFdydmpwU1lhdHZwNWhY?=
 =?utf-8?B?aTlDSjM3cVluY3laOHFhUjlodkREa2Q0ZUpKZEpCcVZqQzZzaExiY05uRlhB?=
 =?utf-8?B?V2RsMmdzWDhPUUtvTUZkYmxoWEE5MHJBNVVPdkd3b2VXOHhvSlZvaGY1cUwz?=
 =?utf-8?B?di9RREpZRTRaQWpvWW5RQitjWnJuTXRFd3Y2MFNiRWVCTURCOG55MDF0OHBr?=
 =?utf-8?B?SHM2T3ZlM0pqc3Y1K3pQSjgvdnNRbWpETzg4WnlTMDRHdjlyMkl3K2xvMDFW?=
 =?utf-8?B?NldVckZLUnhMaHJEN1d3MXhTdGdpWm5BamhoakliOW5yMEtoK01WR2tpaEhk?=
 =?utf-8?B?Q1JuUGdkLytJaGUvVmN5Ry96WVM3MllGaUlKVVMrdU9Kb2xVekJVRUYzcFpK?=
 =?utf-8?B?enUwemYyajA4QmppSW9ESVBMQ0FPcEk3VHFNYktYYkg0U2dpS2hMTXQvK2Vz?=
 =?utf-8?B?R1JaM2xiblluVzY1OXQvKzZabWhoMk4zWmZjRFV0ZzdtWk5paWVQbmtXVnNC?=
 =?utf-8?B?RDNjekdoUWM1bGMrdG5TaWRVL3I3WFhIM1NwR25mWFRyRTJ5b0VjQU4yQmZz?=
 =?utf-8?B?Y0IwbWRIWjA1a1hPbktrc012dnFkK1N6QXRnTk55alJrWjFQeHZtTFB5eFVF?=
 =?utf-8?B?N0JCc3VMTFZ4M2pSWmxmRzRmdkNqTk9XUGZ2S3JRTTJaajdUM1h2amh5bnBX?=
 =?utf-8?B?cjYzUFp0VElXczBUVkFFcnhBbnhwOWFlTE5wZkthRjFHbXl5WXFVNzgwc1JF?=
 =?utf-8?B?T094bDluaVZwRGN1dkkwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azhtWWM0cHdLWVpBK094T2wwcno1aW5yTWh5UWlWaDNRQjRQVG9SVVJiZkhN?=
 =?utf-8?B?YmZZTEhONGFzM3pEcWQ2cnQzOWhrTEg4ZkpjN3pyZ3Fua2J4a3Z6ZGc4aUVX?=
 =?utf-8?B?VGZETXliVHhoOVQ1QUozcnNubUVGNkdhTjBTV3RRakJsWnkxY3E3UHNHcDV2?=
 =?utf-8?B?ZW5TMmh6UlRmNUlFRlRUYVFkUDRvNFBVVEJva2oyYTh3YTcyL29yd29wQkhh?=
 =?utf-8?B?cGVRTG1OMmU5dlJ4NnVJamprMDRjdEU1eU92c3NNN3BSRmRhV0FhYzBjWVp2?=
 =?utf-8?B?cWQveWJHaGV2em5rbGdZdmQ1NkRNZnlDYzBDM2M3WnIxZ0ttd2o2czZhMEhm?=
 =?utf-8?B?cG0rVlByRWFBTDhLRmhNWldnZHFiNE1JMlVhck5kSFdyTGlvMWQzdndmeTln?=
 =?utf-8?B?RlFHZ2JRQXEzb3dYT2prMXRWRzd4UitmOXRrU05IOXB5SEo3VlovQytWblVC?=
 =?utf-8?B?MWVqaU9aT1h4NWZiM0hIQnk3Y3NwcmQwS1NUR2tDemV0VG9wUm5Bc0FHdzBh?=
 =?utf-8?B?Mkw4L01hQTZsekwweEFneURFS1A4b1gzY0FTOE4zYnNEL3BKVkYxNGZhelVl?=
 =?utf-8?B?MDNUVUlpcVg5VkFqald2WG5JUTlyTmNjaGhCRkF0dzM5TU5MVnI1aDBveEds?=
 =?utf-8?B?QjFPY3ZXczVpcll4UXNKY09neFd5Mm52UFYwUC9hRVhJQWFocjFZZGx6Q1B6?=
 =?utf-8?B?dUdsVmtaVDlIUDMxbmtWSzBjcEFFQ0xZNmhHNC8vUldueEZ6bS90REhyeUlF?=
 =?utf-8?B?Qk92WVlFcWFkTjFpQ0pRYXBiRUpyY3NLNzhwaG5YU3hkbVZIOEZJYzNzSlpz?=
 =?utf-8?B?VkZPaGpMU0RtRWNEOGlFRmdQV2NMSy8ycm9Ib1hPeEpqQm5oSUhaLzcwOFFj?=
 =?utf-8?B?WlJoZmdINGUrb1N6bUxWMHByeWZIaUNZS0tkMCtMTEtyQTdZNnEzeEVacCt3?=
 =?utf-8?B?eWNBbWhsL3lQUGV2cklnS0p5OTJxcXR1emd1WWlDc3BkajVEM2pLdmQwTmFj?=
 =?utf-8?B?UFpxNGZ0dEpOZmtiOUhkbkdjQzhmU0hhd3l3bXlsalBQaEF6Nkx6cE1qWGQr?=
 =?utf-8?B?QlVEK1I2eWNYeFFpb0NNdzVSQzRQMk5zaTRRcm1oWjJHMm5OMU1wQjN0b1J4?=
 =?utf-8?B?dDgwODltWkxFNmRIVTVoSWFnMFVuN3NnNVlSYWRjTmVpbzRyanhuYUppR1ZK?=
 =?utf-8?B?UzVSR0tva2JHb0FDWXVYTWVXaDhXYitPNGtrd2dub1BJWDVROGRRY25pSDhS?=
 =?utf-8?B?eUFPSk4wcERjM0p0V29La3pxTjVnL0NtQjVwa2FRaDlqS2FtUC9YbXhxbUEz?=
 =?utf-8?B?Qk8zcnN1U1VrWHEzdGhZNmlKSytUdUwyMUFjdlJjNkFBWHM5Z2U4dVpRTXdw?=
 =?utf-8?B?bm1rVTNodU5JRGZXbzFJNkF0NE1penRhQWdVQ21nZVBtMlZxUWlxL3dwUXRQ?=
 =?utf-8?B?cFM1R3VxSVkzM0xLQmpqOElVN3ZEQmc1M3V5MjVTUHE5MnQvZ3hsMG04V2du?=
 =?utf-8?B?T1ZES3pCOHY2OElXTXYvRjBnd1k1Qzd4N08zcE1sZno3L0tWckE2enBZd1hj?=
 =?utf-8?B?WmxWRm5YRDAyVlphcWFXYVBOdFVpMHZXYTJLWUwvV2wxb2NGY2R0QUtDdnQ4?=
 =?utf-8?B?TGh0djBHWFV1UGdMQTZvY0ZXUWhtNHlxMU54UmJON2ZRTmN0L2prSUZHai9C?=
 =?utf-8?B?OU1DV3ozUnVxendWSU02a1h0QnYrajI3VnRqdDVVUjdlK0pDS0NQU2k4K0Fl?=
 =?utf-8?B?RXY5QUFNUkJWeGRSSDNQTmNPRTlQM2NRV0MxUFBqcDY1dUNLSG41SE50VEw1?=
 =?utf-8?B?MkJoQVhXZ2QvcnJTbXFNUEZsRXBlWk5mbXNBZGFpNkNGR1JVSFZHandmR0xR?=
 =?utf-8?B?WlQzb3MwN3V0MjA5UHN2c0wzWDE0L1N4dEhGTDVZN3VYSVZkN1V3bUpJSFRY?=
 =?utf-8?B?UkRzMWtwcEFMcktHTEN1SXd6ZEI2VEZQTWxhOHBHSWFBWFF2RDlwbFNSTjJJ?=
 =?utf-8?B?MVduM1drN3gzZkQyb1dEeHRQQzlXYXJQYUhQZzlVa2RXbDZWSEVWM2g4WnhS?=
 =?utf-8?B?TDBaZEhwK2NWNjNIVzNRL0UwdWpTQ0NaWkJxR29mK2piYVg1ZTJHdU9Pa0tH?=
 =?utf-8?Q?oZrgI5HStRh25/3RtOvYZuB7m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d3c65e-f112-4eb3-18b2-08dc9c67c77a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 20:27:52.3586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmL2L3yFey99/sNfy09FhlocGz/Yf9AWHAig3SvneF7AurCrbG1b+gRErtVinTIvRdZ2DOVsJ6FuztzAeKb+7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
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

See my comments inline below.

Regards,
Zhanjun

On 2024-07-02 11:10 p.m., Teres Alexis, Alan Previn wrote:
> On Mon, 2024-06-24 at 14:54 -0700, Zhanjun Dong wrote:
>> The capture-nodes is included in GuC log buffer, add the size check
>> for capture region in the whole GuC log buffer.
>> Add capture output size check before allocating the shared buffer.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> alan:snip
>> +/* GuC logging buffer types */
>> +enum guc_log_buffer_type {
>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>> +       GUC_LOG_BUFFER_DEBUG,
>> +       GUC_LOG_BUFFER_CAPTURE,
>> +};
>> +
>> +#define GUC_LOG_BUFFER_TYPE_MAX                3
> alan: nit: not sure why we decided on a separate macro, just putting
> at the end of the enum is better for future code readability /
> maintainability. Just a nit, so u can ignore.
> alna:snip
> 
>> +struct guc_log_buffer_state {
> alan: Btw, you are not even using this structure in this patch
> this structure is part of the extraction patch, right? should
> move this there.
Right, to be moved to extraction patch.

>> +       u32 marker[2];
>> +       u32 read_ptr;
>> +       u32 write_ptr;
>> +       u32 size;
>> +       u32 sampled_write_ptr;
>> +       u32 wrap_offset;
>> +       union {
>> +               struct {
>> +                       u32 flush_to_file:1;
>> +                       u32 buffer_full_cnt:4;
>> +                       u32 reserved:27;
>> +               };
> alan: agree with Michal, please change to GENMASK
Will do
> 
>> +               u32 flags;
>> +       };
>> +       u32 version;
>> +} __packed;
>> +
>> +#endif

...
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..0188bc0a2b84 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,9 +9,22 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_map.h"
>>   #include "xe_module.h"
>>   
>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE      CRASH_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE      DEBUG_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    CAPTURE_BUFFER_SIZE
>> +
>> +struct guc_log_section {
>> +       u32 max;
>> +       u32 flag;
>> +       u32 default_val;
>> +       const char *name;
>> +};
>> +
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
>>   {
>> @@ -96,3 +109,195 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>          return 0;
>>   }
>> +
>> +static void _guc_log_init_sizes(struct xe_guc_log *log)
>> +{
>> +       struct xe_guc *guc = log_to_guc(log);
>> +       static const struct guc_log_section sections[GUC_LOG_BUFFER_TYPE_MAX] = {
>> +               {
>> +                       GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
>> +                       GUC_LOG_LOG_ALLOC_UNITS,
>> +                       GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
>> +                       "crash dump"
>> +               },
>> +               {
>> +                       GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
>> +                       GUC_LOG_LOG_ALLOC_UNITS,
>> +                       GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
>> +                       "debug",
>> +               },
>> +               {
>> +                       GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
>> +                       GUC_LOG_CAPTURE_ALLOC_UNITS,
>> +                       GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
>> +                       "capture",
>> +               }
>> +       };
>> +       int i;
>> +
>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; i++)
>> +               log->sizes[i].bytes = sections[i].default_val;
>> +
>> +       /* If debug size > 1MB then bump default crash size to keep the same units */
>> +       if (log->sizes[GUC_LOG_BUFFER_DEBUG].bytes >= SZ_1M &&
>> +           GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
>> +               log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].bytes = SZ_1M;
>> +
>> +       /* Prepare the GuC API structure fields: */
>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; i++) {
>> +               /* Convert to correct units */
>> +               if ((log->sizes[i].bytes % SZ_1M) == 0) {
>> +                       log->sizes[i].units = SZ_1M;
>> +                       log->sizes[i].flag = sections[i].flag;
>> +               } else {
>> +                       log->sizes[i].units = SZ_4K;
>> +                       log->sizes[i].flag = 0;
>> +               }
>> +
>> +               xe_gt_assert_msg(log_to_gt(log),
>> +                                IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units),
>> +                                "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
>> +                                sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
>> +
>> +               log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
>> +
>> +               if (!log->sizes[i].count) {
>> +                       xe_gt_err(guc_to_gt(guc), "Zero log %s size!\n", sections[i].name);
>> +               } else {
>> +                       /* Size is +1 unit */
>> +                       log->sizes[i].count--;
>> +               }
>> +
>> +               /* Clip to field size */
>> +               if (log->sizes[i].count > sections[i].max) {
>> +                       xe_gt_err(guc_to_gt(guc), "log %s size too large: %d vs %d!\n",
>> +                                 sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
>> +                       log->sizes[i].count = sections[i].max;
>> +               }
>> +       }
>> +
>> +       if (log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].units != log->sizes[GUC_LOG_BUFFER_DEBUG].units)
>> {
>> +               xe_gt_err(guc_to_gt(guc), "Unit mismatch for crash and debug sections: %d vs
>> %d!\n",
>> +                         log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].units,
>> +                         log->sizes[GUC_LOG_BUFFER_DEBUG].units);
>> +               log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].units =
>> +                       log->sizes[GUC_LOG_BUFFER_DEBUG].units;
>> +               log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].count = 0;
>> +       }
>> +
>> +       log->sizes_initialised = true;
>> +}
> alan: something isn't quite right about how you have inserted the guc's
> log->sizes infrastructure into this patch. It took me a little time to
> trace through all the codes in both i915 and xe (since some of these
> concepts came from i915).
> 
> So the issue is this: At the big picture, (system level),
> we init multiple guc-subfunctions/subcontext: guc-log, guc-ads,
> guc-ct, guc-params, etc. After that, we setup other things
> and then we load the guc firmware. NOTE: guc-params handles
> information the offset of guc-log buffer and sizing of the various
> guc-log-buffer-types. This info gets programmed into mmio registers
> before we load the guc so that guc firmware init flows can start
> using the debug or crash buffer for logging.
> 
> However, i notice you have not wired up guc-params init to
> use the above sizes infrastructure. Additionally, this
> wiring also needs happen even earlier during the guc-log
> xe_bo allocation since the allocation size must match
> what is setup in guc-params and must match with what guc-log-debug
> and guc-error-capture expects the output dump ranges to be.
>     note: guc-params init ==> "guc_init_params" and
>                               "guc_ctl_log_params_flags"
>     note: guc log bo allocation ==> "xe_guc_log_init"
> 	
> 
> I'll pause for a moment here and state that both of the xe_guc_log_init
> and guc_init_params relies on the #defines of DEBUG_BUFFER_SIZE,
> CRASH_BUFFER_SIZE and CAPTURE_BUFFER_SIZE) when allocating the bo and
> programming guc-params. That said, since you have defined
> GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE to be DEBUG_BUFFER_SIZE (same for
> CRASH/CAPTURE), you are most probably not facing any kind of mismatch
> between guc bo allocation and guc-params vs guc error capture sizing
> expectation.
> 
> That said, if you look at guc_ctl_log_params_flags, you can
> see all the code there is using build-time checks to ensure the
> various guc sizes settings (size, units, counts) are all good just
> like this sizes framework you have added.
> 
> So now the question becomes, why did i915 even do all this in the first
> place? Why didn't it stick with just re-using CAPTURE_BUFFER_SIZE?
>  From git-blame you'll see that i915 added support for overriding
> the size of the guc log buffer. And thus the updated sizes framework
> will do all of the correction (clipping or rounding up) to get all
> that sorted out - and it would occur for the first time during
> guc log bo allocation.
> 
> So moving forward i see two options:
> 
> 1. drop all of the sizes infrastructure and when check_guc_capture_size
>     needs the size of its region, it can just directly use
>     CAPTURE_BUFFER_SIZE (of course we still do the size increase).
>     Then double check the code in guc_ctl_log_params_flags and ensure
>     everything still makes sense / builds alright for the larger capture
>     size. Then we can focus on driving the param for dynamic calculation/
>     correctoin of the sizes values as a separate JIRA later.
> 
> 2. Plumb the xe_guc_log_init(..), guc_log_size(), guc_init_params(..)
>     and guc_ctl_log_params_flags(..) to ensure its using the same guc
>     log sizes framework above. However, i don't see the motivation for
>     this without pushing for startup-time (module param) configuration
>     of the guc log buffer size and region dimensions.
> 
> 
> I would propose to just go with option #1. I do sincerely apologize
> for not catching this sooner, i notice folks spent time reviewing the
> coding details of this patch in prior revs but i hadn't stepped back
> for the big picture like i did today.

Thanks for highlevel review.
Option 1 is the way I'm doing. The log feature is not a small feature, 
so what I do right now is to take the minimal code base for the register 
capture feature, and that's why the patch defined 
GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE to be DEBUG_BUFFER_SIZE, ...
About the guc_params and other parts, that seems not a small topic and I 
would discuss with you offline.

> 
> 
>> +
>> +static void guc_log_init_sizes(struct xe_guc_log *log)
>> +{
>> +       if (log->sizes_initialised)
>> +               return;
>> +
>> +       _guc_log_init_sizes(log);
>> +}
>> +
>> +static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>> +{
>> +       guc_log_init_sizes(log);
>> +
>> +       return log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].bytes;
>> +}
>> +
>> +static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>> +{
>> +       guc_log_init_sizes(log);
>> +
>> +       return log->sizes[GUC_LOG_BUFFER_DEBUG].bytes;
>> +}
>> +
>> +/**
>> + * xe_guc_log_section_size_capture - Get capture buffer size in log sections.
>> + * @log: The log object.
>> + *
>> + * This function will return the capture buffer size in log sections.
>> + *
>> + * Return: capture buffer size.
>> + */
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> +{
>> +       guc_log_init_sizes(log);
>> +
>> +       return log->sizes[GUC_LOG_BUFFER_CAPTURE].bytes;
>> +}
>> +
>> +/**
>> + * xe_guc_check_log_buf_overflow - Check if log buffer overflowed
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + * @full_cnt: The count of buffer full
>> + *
>> + * This function will check count of buffer full against previous, mismatch
>> + * indicate overflowed.
>> + * Update the sampled_overflow counter, if the 4 bit counter overflowed, add
>> + * up 16 to correct the value.
>> + *
>> + * Return: True if overflowed.
>> + */
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
>> +                                  unsigned int full_cnt)
>> +{
>> +       unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
>> +       bool overflow = false;
>> +
>> +       if (full_cnt != prev_full_cnt) {
>> +               overflow = true;
>> +
>> +               log->stats[type].overflow = full_cnt;
>> +               log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
>> +
>> +               if (full_cnt < prev_full_cnt) {
>> +                       /* buffer_full_cnt is a 4 bit counter */
>> +                       log->stats[type].sampled_overflow += 16;
>> +               }
>> +               xe_gt_notice(log_to_gt(log), "log buffer overflow\n");
>> +       }
>> +
>> +       return overflow;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * Return: buffer size.
>> + */
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       switch (type) {
>> +       case GUC_LOG_BUFFER_CRASH_DUMP:
>> +               return xe_guc_log_section_size_crash(log);
>> +       case GUC_LOG_BUFFER_DEBUG:
>> +               return xe_guc_log_section_size_debug(log);
>> +       case GUC_LOG_BUFFER_CAPTURE:
>> +               return xe_guc_log_section_size_capture(log);
>> +       }
>> +       return 0;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * This function will return the offset in the log buffer for a type.
>> + * Return: buffer offset.
>> + */
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       enum guc_log_buffer_type i;
>> +       u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>> +
>> +       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> +               if (i == type)
>> +                       break;
>> +               offset += xe_guc_get_log_buffer_size(log, i);
>> +       }
>> +
>> +       return offset;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 2d25ab28b4b3..ea9e79ccd314 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_H_
>>   
>>   #include "xe_guc_log_types.h"
>> +#include "xe_guc_types.h"
>>   
>>   struct drm_printer;
>>   
>> @@ -17,7 +18,7 @@ struct drm_printer;
>>   #else
>>   #define CRASH_BUFFER_SIZE      SZ_8K
>>   #define DEBUG_BUFFER_SIZE      SZ_64K
>> -#define CAPTURE_BUFFER_SIZE    SZ_16K
>> +#define CAPTURE_BUFFER_SIZE    SZ_1M
>>   #endif
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -36,6 +37,11 @@ struct drm_printer;
>>   #define GUC_VERBOSITY_TO_LOG_LEVEL(x)  ((x) + 2)
>>   #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
>>   
>> +static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
>> +{
>> +       return container_of(log, struct xe_guc, log);
>> +}
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>>   
>> @@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>          return log->level;
>>   }
>>   
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> +
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>> +                                  enum guc_log_buffer_type type,
>> +                                  unsigned int full_cnt);
>> +
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> index 125080d138a7..67a9c58e7ed7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_TYPES_H_
>>   
>>   #include <linux/types.h>
>> +#include "abi/guc_log_abi.h"
>>   
>>   struct xe_bo;
>>   
>> @@ -18,6 +19,23 @@ struct xe_guc_log {
>>          u32 level;
>>          /** @bo: XE BO for GuC log */
>>          struct xe_bo *bo;
>> +
>> +       /** @sizes: Allocation settings */
>> +       struct {
>> +               u32 bytes;      /* Size in bytes */
>> +               u32 units;      /* GuC API units - 1MB or 4KB */
>> +               u32 count;      /* Number of API units */
>> +               u32 flag;       /* GuC API units flag */
>> +       } sizes[GUC_LOG_BUFFER_TYPE_MAX];
>> +       /** @sizes_initialised: sizes initialised */
>> +       bool sizes_initialised;
>> +
>> +       /** @stats: logging related stats */
>> +       struct {
>> +               u32 sampled_overflow;
>> +               u32 overflow;
>> +               u32 flush;
>> +       } stats[GUC_LOG_BUFFER_TYPE_MAX];
> alan: nit: my unsolicted $0.02, i believe GUC_LOG_BUFFER_TYPE_MAX should
> be kept in an ABI header because it is part of the GuC interface spec
> that determined things like the number of GuC log regions for both state
> and data.
Agree
> 
>>   };
>>   
>>   #endif
> 
