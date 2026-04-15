Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FCCF43848
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94BE10E165;
	Wed, 15 Apr 2026 16:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAA8n5iq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C585B10E165
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776271720; x=1807807720;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l2v4gqZUdmsIK5d5Kkyd6ieSt/jVrI/tfFdXRtcTH8E=;
 b=hAA8n5iqGJRM+pV21OYKHuSpjdHcQ5SnaldHbTC12/JrmzEkKyL1pmiT
 eU8DZbuuy9hDZQQJFHnaKMiQDtmhmrrB4NfUGn7DtrjOECg61oKHcUiXg
 YyIz6dAoyR6/r3wPYXar32dMVYxDl7pAoQnXnzSMq3j4zD5QFltpwkp09
 C6+58Kqv/uMHFh7GV2nqzQ1uD3QVHbqqCE6OyUAhD13l8l3xTg/dhGTIZ
 2EFpKe2OSK5VCpRo0rqRyG0mhp1ANSJhiFs4P84l8/dHmU/tIPZURMCTo
 FwkgQ9xf5qFlYXk1s7FkQN6x6y1kafdGSxhwaU2m3Pf5IPPwHSYBxrWfE Q==;
X-CSE-ConnectionGUID: NxPOIhbLS3m/ZHxcJP3+pg==
X-CSE-MsgGUID: sTTRj6SFQqWBbZ6uj/BtpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76422954"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76422954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:48:38 -0700
X-CSE-ConnectionGUID: YCP6CvRMSeKkUxy2vZtlog==
X-CSE-MsgGUID: BdeI/FZSR9GriltYsxO1Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235421642"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:48:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:48:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:48:29 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwbeBBEtrT4cIId+pp3wgeTAWFF3Q9a5VOgYZScannfUw8c1AwoYveEM6Bgo0W9nJLmTO2pyjs4p0wRm9O2avynQ9zmr9nHCKli3IT3Mq0zDIFfq6Yc9XhAFM9KibhgZEVnP/yLx/EnXFeTSE+Tj16ofZ81eilyRkmUWep6dha3A7epFQ+wYIu/szTGSF+NM/XKx1I2PUvKjIx4sEFinT8FIwuuK4dyqRy81GpQ64FEa2uYMpvEi8k4nYbid+3P1oiYYJen5aX/EAGMVS3k+qztfKJi/s2QyF1Adk7sjoefK0te8gHYDhVLQPqKq6QCDqDnZzKlFUZ2FE37J5FxR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GfEowC4W7HDG0oirR8kgU1uxASBHOXP3FXTmOyymws=;
 b=JLN8owAgw+kVgJ08uOppty55fjcyOFFy5fXtnvCiiaUy52/I1hGsTSXQxjxib8r0thegs4gY0QXFoWQ2yFT6fd0LqW/5JNCW0J7CXrvo7zer9dojZfzkQF30MyfuFdFQo8Jz8o1E65RFeExI7yN9E6YbA7rT3aNjCZZo+qgi9i+MwrcZkFLQ6tWxCLar4qCPtRlcF+MZtBkjA7Kp181sn6ZwhQ8xCfmIWG82bab+7/6yNmHSFODyxmaqmEKKtAi7CQNNBrT1T7fdY4qUnCMig/W4t8GLnRg2SfvxSH0UpCA6miFSAeh8C7gzVSNrSRpVsByKubzfBszMzpVIQ+XJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Wed, 15 Apr 2026 16:48:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:48:25 +0000
Message-ID: <1f83cf41-b901-430e-8583-49f2a94b64e4@intel.com>
Date: Wed, 15 Apr 2026 09:48:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-8-raag.jadav@intel.com>
 <b30043f7-9143-4cd9-bfbd-38b6c5077153@intel.com>
Content-Language: en-US
In-Reply-To: <b30043f7-9143-4cd9-bfbd-38b6c5077153@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c009b9-baa0-4124-7b22-08de9b0ecfd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: NPMIXpIkhbbHvoKhvenypWF/Le8LiZQe51M6+drh2yJPndC70CirX5PdtFKSO4MKRTKxdo3lU0EAEYImB1rqqes9M32n3lZl8Ne8KZ5+H1PuArIfUmx6ZbS2yftPw7svMEvi2IukZDNdMPs6kJS+otSzGEZqyDsHL3kr/39zTxCisO7jJkhVYol8ueI3Zpy/AfGSbBbYSWJGZBB+r9CvsjCv9KMui8Rsrqoqr8VENINfPx6HcQhxMaBLQvfy+uebs3myzg/KRdddM4qzTrfKagg6zZYrKa9LQecJOdgoX0LKWz1lWuGsfRgW05wujMIHtN5n4T9tZOLHx3HgrqeCIkhWwpo/Wjda0JWj1Aqs5pwuuxDUfL2S+V/BHl0fKtnQLxeZPevLZHU3XvOxETZC8jxPxdGnnQfB93EOFa5cBEkuCCzpLBNP85z0O00/ieB5cmNPZSZwMERIh6CfzQ1ksCpxJeD0ahuCAzeMiT+tvz8U4YHKyS3PdsilTobrpN7YhS5h1lmtDrccMSEk9iuxqQBAythb8WYtm7LqfJH+2Q5oQ0dORwGLRYDWBbNyv7cvnA9gUB83o9S+k2k3vEEycDt2q8oMSgUdIN7ZhwLzufWG6DaKokC5fX/Rvcl5YAqlUtGfEJCH70pO1a4iM1q4/L20qir9oJU6NC43i/Jp2EXAtJX+pF28605G0bqbzA0mIT4KVc5HBcqyNXPsi7gQvTSbQ6lQNhwbX31/4HkKT2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRkSDU1WWczejBiakhmRFB5QktMV1E1bzFrQmo4czhRWVdLVHR5YXowSjFx?=
 =?utf-8?B?RjdwQjZJa3pSNGZ4aHhUU2phZFhwckpUdDRzaWp5U1hpN1F4UmNHQkxMdDZj?=
 =?utf-8?B?V2dzR2poeGxUQVNLMG9mOCtKaU00SXZIL1NiKzJUczkrMTlLdTdtR1B4cHFY?=
 =?utf-8?B?Tm5qZjlQUkJlOFUxSi8yRSs3U3AvZGpqdUpJMEpXWVFNSjZhcTkxM1hzZnMy?=
 =?utf-8?B?Rm9OUWdnVVJRdzJUQlprbHEzUkc4UHRZeWxrS1Qva1J6bXVJaDVvMEUzRENn?=
 =?utf-8?B?cUlKYW5ONGxUQ2pnYUZrZG00bVdYMlhhWUc5TGluaGI1eFcvNkI2amRNQkpY?=
 =?utf-8?B?VXNGZTBWVnRFaFV6aXZzcXpnQW5HM2V3bkZ6M2FCb3lkWkozcFFBSGNQZTl0?=
 =?utf-8?B?OGY5ZThEK3l5QW1wU0FWS2FGb3JoL2ZWcEdMZys2M0thU1JXUmFidmljZlVJ?=
 =?utf-8?B?eWdzVXNQcDZHeUpCU2VZUGZKQ25FVE9jZURJWFIzN2tnUG9peDhOVGFPUnNt?=
 =?utf-8?B?Q3RKNFNrS3dGQkFjQmp5SGM4Tnc2QWp0NmYyZ0tqZFV1bWloK0pqaU9ZVUZt?=
 =?utf-8?B?MTZCdm5mWHFUMWxuS3pPbCtEdERYaEZ2N3Bma3RIQ2tPVW5DdVpYV2dpM2pz?=
 =?utf-8?B?RVlEelppVmJkcEZkU2d2c3JpZFpITWpkNkJtNTdPRzNvWDNPd0FLRVFybkJV?=
 =?utf-8?B?LzVvUVBUc2cwNWFVeVFETHowVEtYT2ZRVFNRTmJxRzlXTXdqZU9pbmJKUUNO?=
 =?utf-8?B?amQzOTczTitoZFZUeDAwTVgyQU5XVkZOUkpoUnNMeERITnJSekhUNk5SNGlm?=
 =?utf-8?B?dzFiU1dSWnROS2tSU1R3UzhJNGt1eXY5ZGp6ZjJLRXUvSHBYU0l0RzRneUM0?=
 =?utf-8?B?ai81dWR3MjBhbzJQNjZUZ3M5L2ZwaEY2ekdEbzBDVzJxL0JvVFQxeTlHR09i?=
 =?utf-8?B?V1NIVE1KL3lmMUMzaTg4TFpmdmpkOStwOWJOVHVCaG1SbExDdlZUTDFWbytE?=
 =?utf-8?B?NHh0UlFCT3JBS3ZUTVl4UkhCcnVTN2RCLzRBT1pvaGpQQlRSOURmSjVxOUg0?=
 =?utf-8?B?WE9jMUZDdHZyN2ZhTkxzaE1WM2lwL0tPYllaaEkxbi9zbFZuOWNyb042Zk96?=
 =?utf-8?B?cGJCZndSR2xvYXhsYkN0S1luZzBVdE9YaG42OHg1VGI4djFhaFoydW5iK2xI?=
 =?utf-8?B?Q0xMS2t0R2owSjI2dzFWajd4T2dOVXlNekkwU2l0a1A3bk8veVlEMm1yaTBt?=
 =?utf-8?B?NitxZU92QkdQRFFPY21pRmdETG1jTC9LVGN2dllZMGlNRzMva2xBdktxdWYw?=
 =?utf-8?B?cUJQaGZ4V1E2MjIrdm1FaDdRMUNtOW52YVFLZlcrQ3RFRHh2YVl4ZXVPOWxO?=
 =?utf-8?B?TU0rNlk1NjRtZGI3ajFZSkQzS3VJMWRwZitzZE5KbTlsSkpEVEhGVkI5anlv?=
 =?utf-8?B?ZFlFQmhCZnluQlRKVlRIczBNR1E0K2p2MURzbmJzbVA4d1FTeXZkcm9mYW9z?=
 =?utf-8?B?bVpxdSsyYzMxQjFvRnVzbEM3VEdYNk5PNFQvQU4yVjg4MVpsdG1UTWNUbUZw?=
 =?utf-8?B?eEQ3cERBQjBHL2p4eThOaG9MWnBXbjFYVlJNdkVZRGVGUW9VenpmVU95TDlL?=
 =?utf-8?B?dTBKWjM5ZFZydGxmRHZTSVpSMFRwRUI5NDF2bHJ3V1crUHdIKytiSnZ4OHpD?=
 =?utf-8?B?YzdKVElsNENtVVVzU2U0aUFQTEwwSmhoZEVDbCtaOVhRanhFWEVwQndYN3lr?=
 =?utf-8?B?ZXgraERlU0dDMkFmbkk4Ti92aVpCQ29pY2ppUkFtODdFK3c4OTIrbjltVHB5?=
 =?utf-8?B?R25VYU5lWFVvVVl5NnJXcnZPOCtUT04vbytpMnRIa3RqOGRaN0NUc1UyR3V4?=
 =?utf-8?B?aS95bzlENjdUazZkVklDdElWSjVaV0V6MXRkbWxvWjZnbEc0cHpYMkN3b2Fr?=
 =?utf-8?B?OFo0NXpONEFQUkpwWStaNUpIN25GWm0xc2lqTWNoV3p6Q2lGT1NyYVFKRVFy?=
 =?utf-8?B?WTdNaDJlZndoRG8vRG5pVnEvalJOUjZRSWJhZjFBdExZc0lwOFJ0NEZOd0Vn?=
 =?utf-8?B?eFUyYXJTYXlRc2dwZU1nTi9EblUrYjVDYUkyTi9yeXB1dDMwaW02dW1FNFc1?=
 =?utf-8?B?RWJ0MGpzUDQ0aTNKNElna250OXFFT3hUNzN3OXdzeXVYamRWTEd5NlkvYVdu?=
 =?utf-8?B?cjBURXJOUHdzMzlraExTUnZMeWdqcUFkZTJCZW02bytUc1VncEZqM0hNM0Za?=
 =?utf-8?B?NC9IU3dXRG5YbmZVaEsrMVhGcDlXMW5mSzBieEZLOWd5TERHMUlVOTdtcXJs?=
 =?utf-8?B?Y2FRdkFjUDFEcmtrMVMwQnJhOHJMZnAya3l3UjAxcTVuY1grY0hIZ0h2WjJM?=
 =?utf-8?Q?FvpO03SYKLFFb0IA=3D?=
X-Exchange-RoutingPolicyChecked: d9vYkTGdB+3x4t9Uyp2QNw3b4H8KUQxHws8lXbaxuqSVfvMr3cVRTcuBbojH1w/tt7t+3gZfx2XMRJH2JCdF5s2Qp7Ol+TvBQbW2NI5l1OmxA82pxNeCR9BgsK/dBfJEBVUHCRRIg97yRMuasHaagFIzLnN5MDFnWwTMWpwyL3Ody/hjPJmIM0oWbZRbWP26jwEZsCNpXK6pC89IgKX769Dh3RZ1beG/RHP4h3xTpRX/F1hwPz7eA8ZAvBdz30GE8iIVsEmgNpjloCMGiMooKF+F89Ot1O6lJnxJ+/sdqduPwyZT4Vj5IjrosYKyMQIeQUoiHkhn7ka81LyLZOPqHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c009b9-baa0-4124-7b22-08de9b0ecfd7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:48:25.4620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEWlnJjMW+SJ3OOJNHLWhwQkbJc/lcIeUEHKKSgduJmA7aQ26gRoek8EB2HBVzdGJjjxY5gCrUE6tKnw2RoZqwUIbuQvzmYNRkcC2PL63Xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
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



On 4/15/2026 9:10 AM, Daniele Ceraolo Spurio wrote:
>
>
> On 4/6/2026 7:07 AM, Raag Jadav wrote:
>> In preparation of usecases which require re-initializing an exec queue
>> after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
>> queue LCRs already exist but the context is lost on PCIe FLR and needs
>> re-initialization.
>
> Isn't this potentially problematic for userspace? If they have state 
> saved in their LRCs, that state would be lost without any way for the 
> user to know. New submission on those contexts might end up giving 
> incorrect output without explanation.
> IMO it'd be better to just kill all the contexts and be done with it. 
> FLR is a full reset and I don't think apps are supposed to survive it 
> without noticing.

Just realized looking at the follow up patches that this is only called 
for the migration queue, which is kernel-owned. If we're only expecting 
to re-init kernel queues that needs to be documented and we need an 
assert in code.

>
> Daniele
>
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>> v2: Re-initialize migrate context (Matthew Brost)
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>>   drivers/gpu/drm/xe/xe_lrc.c        | 17 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>>   4 files changed, 53 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index b287d0e0e60a..dd99bf766926 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -331,9 +331,8 @@ static void __xe_exec_queue_fini(struct 
>> xe_exec_queue *q)
>>           xe_lrc_put(q->lrc[i]);
>>   }
>>   -static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 
>> exec_queue_flags)
>> +static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 
>> exec_queue_flags)
>>   {
>> -    int i, err;
>>       u32 flags = 0;
>>         /*
>> @@ -356,6 +355,13 @@ static int __xe_exec_queue_init(struct 
>> xe_exec_queue *q, u32 exec_queue_flags)
>>       if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
>>           flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
>>   +    return flags;
>> +}
>> +
>> +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 
>> exec_queue_flags)
>> +{
>> +    int i, err;
>> +
>>       err = q->ops->init(q);
>>       if (err)
>>           return err;
>> @@ -379,8 +385,8 @@ static int __xe_exec_queue_init(struct 
>> xe_exec_queue *q, u32 exec_queue_flags)
>>                 marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>>   -            lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>> -                        xe_lrc_ring_size(), q->msix_vec, flags);
>> +            lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, 
>> xe_lrc_ring_size(),
>> +                        q->msix_vec, xe_lrc_init_flags(q, 
>> exec_queue_flags));
>>               if (IS_ERR(lrc)) {
>>                   err = PTR_ERR(lrc);
>>                   goto err_lrc;
>> @@ -402,6 +408,29 @@ static int __xe_exec_queue_init(struct 
>> xe_exec_queue *q, u32 exec_queue_flags)
>>       return err;
>>   }
>>   +/**
>> + * xe_exec_queue_reinit() - Re-initialize exec queue
>> + * @q: exec queue to re-initialize
>> + *
>> + * Returns: 0 on success, negative error code otherwise.
>> + */
>> +int xe_exec_queue_reinit(struct xe_exec_queue *q)
>> +{
>> +    int i, err;
>> +
>> +    /* Re-initialize submission backend */
>> +    q->ops->reinit(q);
>> +
>> +    for (i = 0; i < q->width; i++) {
>> +        err = xe_lrc_reinit(q->lrc[i], q->hwe, q->vm, q->replay_state,
>> +                    q->msix_vec, xe_lrc_init_flags(q, q->flags));
>> +        if (err)
>> +            return err;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * xe_exec_queue_create() - Create an exec queue
>>    * @xe: Xe device
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h 
>> b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index a82d99bd77bc..445867d4da26 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -34,6 +34,7 @@ struct xe_exec_queue 
>> *xe_exec_queue_create_bind(struct xe_device *xe,
>>   void xe_exec_queue_fini(struct xe_exec_queue *q);
>>   void xe_exec_queue_destroy(struct kref *ref);
>>   void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
>> +int xe_exec_queue_reinit(struct xe_exec_queue *q);
>>     static inline struct xe_exec_queue *
>>   xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 9d12a0d2f0b5..a6421ac3765b 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1593,6 +1593,23 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe, struct
>>       return err;
>>   }
>>   +/**
>> + * xe_lrc_reinit() - Re-initialize LRC
>> + * @lrc: Pointer to the LRC
>> + * @hwe: Hardware Engine
>> + * @vm: The VM (address space)
>> + * @replay_state: GPU hang replay state
>> + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
>> + * @init_flags: LRC initialization flags
>> + *
>> + * Returns: 0 on success, negative error code otherwise.
>> + */
>> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, 
>> struct xe_vm *vm,
>> +          void *replay_state, u16 msix_vec, u32 init_flags)
>> +{
>> +    return xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, 
>> init_flags);
>> +}
>> +
>>   static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine 
>> *hwe, struct xe_vm *vm,
>>                  void *replay_state, u32 ring_size, u16 msix_vec, u32 
>> init_flags)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index e7c975f9e2d9..514355ce3d6a 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -53,6 +53,8 @@ struct xe_lrc_snapshot {
>>     struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct 
>> xe_vm *vm,
>>                    void *replay_state, u32 ring_size, u16 msix_vec, 
>> u32 flags);
>> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, 
>> struct xe_vm *vm,
>> +          void *replay_state, u16 msix_vec, u32 init_flags);
>>   void xe_lrc_destroy(struct kref *ref);
>>     /**
>

