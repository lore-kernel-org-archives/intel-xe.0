Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883E5C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF5610E286;
	Fri, 28 Aug 2026 15:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY7VbxPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4DC10E286
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930140; x=1819466140;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W/hdOO12ESQbY3QyyTJapCnKmAw2iu07NN0tZ6bz/cc=;
 b=BY7VbxPXkAEwAGzAo8FcvTmXyUmMdg2yDP4VSR0ucM7CLhG3WZxt2B6S
 E4G/R17KaSUs4HhXcVhbwMxV+Y4IfgVDY/HaTq9lL/njicOX/J70lcsRa
 pEUOFn7g9S2au9WTfJAi5wPsoFlk7RJy0pY5LoImflsDY+WkKWoVs0xIM
 yLMx9MMF19fIxnjScpk9QlCIaySkapXAwYoeegnPWmKmoG4e0UuiVcn60
 fdT0bflLVVkNVCpHwviQeLgfU5bYQXC00OCX6JV6EUR+iUGgFLbvmg9Rd
 a7PEGaF1HqRJ0iXarGQKnCB99F/wa4SvztgSk8ls6Hy+PpIgoA4SPLgbQ g==;
X-CSE-ConnectionGUID: BI8XvFrvSw+gyU1VHRGFSQ==
X-CSE-MsgGUID: WfDw0abrTtuMO8F7JyMscg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88564925"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="88564925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:15:39 -0700
X-CSE-ConnectionGUID: KhPwXMQRR++m2muHNqR3Fw==
X-CSE-MsgGUID: 2agecao8Q9S/7S2Zp4Ru/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="271721404"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:15:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:15:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:15:38 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KB9RdnoYGvkQikP6+QXDtH5IWck99ZnnLGyQ26OmO66rm5CJj3kyPuevJzRUUNa2mE5B3PDqgMcLP1hv6kmGX2zjy+G2eiQGC/v0HQz/hpk/1DYnqrQWn4sWuI+7dqJIAivYoarGdT7nreDzCp2dVuBFTKMMH5HtFiHn+rf9cK2t+6E664v+FJVeoiv2CdFAJvdWVKqmd0cQvCB89nJ4rhDp1ph1ckXSohkAWoCVdkHv3WONos5bT51TBPohb8KxEFbxR5TNCirCAwARuFYTVyg8EWFS8Ymv8mLAWZiijPRCJKW9R99049o2U3kPl5naVhCiIxGE5BPsPovq4d23ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk7ybot/fLdnYIf6a7N2vRp0/r4qVCgt1jpxnWzx37A=;
 b=LV2Fq5U34cuAiSxYTtD5GpzNe/Y/StcZqdc4SI1+PGQMQeJmzvXZiAu0ZCOHUsPp6Um1rltzZ433/62+xI1Pc/WQteDfQkGtXMEyATCQGCcaHj2SL1yWZI992BH09Zm4L3mB9CxAhDyx2JZGsd7gfxaS+hZ0yKxYUcDvUd2umY3r+ltHvdP+RXY76XCYPhVzEOOt8l/wjOH/FqqStspqc2qosb0d13MlK7/mI2w4KKI9bCjm371LJ1JHctGS064RDLGYSZMr259o3mYF8/YZv8MZRfmwaEQaQXp+8SjJNEZFJagpwT++3hmTiX4NQ6owqFjUM+ALAjQPkG9ZySZ9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH2PR11MB8779.namprd11.prod.outlook.com (2603:10b6:610:285::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Fri, 28 Aug
 2026 15:15:32 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:15:31 +0000
Date: Fri, 28 Aug 2026 11:15:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 0/5] Add support to handle memory double-bit ecc errors
Message-ID: <apGmDrnJ3bqpX7Yu@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825063615.3697317-7-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH2PR11MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a04c07b-4e01-478b-d263-08df0517336c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: Apyv2owDn4ZZdlti++lp4MT0gODg2ynkeCBH2h6nwZTy0e3BOS0jzdvGAuw33vytnGD/rCsmEzjIANUzJ/tQHC26/itJJCUYKHu5oJaYaDdjX7jv+l5hmJga/KhLWMPvWpA2+EvenC9MJoAgE+ZBIz87wgYUKNWVQr2QfaMG1B58J8YoXpkaLUhbhtLCYmsE9D9jJ0up5d7CUraA2yBO5BclWK68kDblRB0pSDpxY7Tc57RuThNr8SkDfmyHDs8ppCMEiQoeMSJsYWAmVQ9L0SGejfnmD7mbbji2wQTYzpdTn73c4HeZ8K81MjRza3crtF9DlHzleAMVWqqrHTHzV5s+l2r9psla2U3Mv8tNuVjpSSkSljX/ZeO1XYSs1hWUhdhhKP8Z5bUNoesgfCcX+XdSRL4uLLkDQUCGmqY+L3v76n3RvISC3wrz+1eJMjjpNK+Vj39P5ldOYgdnrxit6jsIY4c+52kMfZ8Nvdgh8yGXvMefbc4ay5km8g/84BblgI3IQvQRQlB5scbpRIn6slrCj7M38niDG+Srwn8tT7GXJ8W51wKrxJslrI93DV0Fz9tllKDU98fDOcu/uu03wr2qu+NdqW1gqvnbmCbl0XrEfV7J2FCwLzVUaOBc1xlO50ABaFXEvEZDy27KsZPXPM1TNLPFVUg5ejYRvXNWJFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UCMuP7Ant/QSXDr4HTPvx5ahOyPLscZQAYGHkzHDMT3JGyZ2HG6jRokqOwlf?=
 =?us-ascii?Q?Zd6fpa88Cirreo1M1MRcZfcWz8X+XIjRYjmnuYvZ7qfXpCoSOilTpft7Dp+D?=
 =?us-ascii?Q?hYA8RIs02+xrQ3Pxyl5oAtSquE4FS+vM1I8n79bwoIidjhahFWhjuePr+zEV?=
 =?us-ascii?Q?qN6vLW9UaeMlIpIdrTwzyMK+XMlQmYailmMgXAnLQEZhXEk/mt4GK6YwWYkl?=
 =?us-ascii?Q?UDNuAMeIDPF3AkpNRqEKKITsYoVYTyEdf+qiQZehpX4IBFgmInxGiZVEqlqk?=
 =?us-ascii?Q?JqaasMOT2D3Gbd3TnbdkIZmQr5N1lWjWmRGKnDTleugmoNfQJ7UsLrv7U5MN?=
 =?us-ascii?Q?KEmHiSkt9WYEuySoBWcFq9jMo+jTe1xQwgZ8Xo/0ySOYUwtrPgr4WSs2/d0f?=
 =?us-ascii?Q?jTPlVDB7ftFhosDc7w1T8in9uLc41LDpguV/tI1AajwhSewukXfAp0WQfN1M?=
 =?us-ascii?Q?mjDWpeNnS2P+IEilH9qzQdUEsrbOvpozLn1i4S4/hg5Uv/EiC08fEP7i9S1F?=
 =?us-ascii?Q?eGStL/SPi1N2hdFq4lVzzhZeMRiGRQSn1qXzxWrlNTNWFaUgwIBSDzTHlT0K?=
 =?us-ascii?Q?d47eCaOHCO5Sw8wOAGswcineeBynDleu/XTNtOwPUmOYk/ID8+rsmXhES9LE?=
 =?us-ascii?Q?3Lvug+vQO4jDP+nDEuC+IORYQazZbjUDuo/OUdgeQmQcB7Qss7FzA5BO3Nbk?=
 =?us-ascii?Q?DTv+8b0ZGobVgZ4XbC1eGHP7AwcncqRzjN0Sh967Itu33yMOV11BB0GgCfOp?=
 =?us-ascii?Q?A3em/ls9ZWT4jqiBgHorsVLqbdplhSIQAG4iBTP0qIFCg4YBdk+2OuRowWS0?=
 =?us-ascii?Q?AIYhX+Ql+pZK7JiMiKleOlczG/6S3NoLbpbJBC1ym6BJNujVhmFhr+yKjCfg?=
 =?us-ascii?Q?NbzgBGIPUg+nm+x9JN9oXvyvg8wLtW+De3Ep+XrJYTtntyaa86QA/Euuh3Km?=
 =?us-ascii?Q?ie9nQuSHUy/R3NiNhpnrXWU1f+ri7Fv6X2S8L5wIKbmPvqNtad/sQ8j666gQ?=
 =?us-ascii?Q?Hk/6miMIrqqv3w6pgfKmCkLO+ZE4+q3TAlzzOWideSj74dt9w5NuQ6Wsu9l8?=
 =?us-ascii?Q?ReerQBMUyP23YWbs5+Z2WpSUhKS8IPkesF67MbsPw1DQUPO7PdzqCukcVimX?=
 =?us-ascii?Q?Kyy/v1IKP1jDJoiAxUjkmwwX0tVXALf/XuQsBt9v06UtLhD2rX+AvY/noYOY?=
 =?us-ascii?Q?WtuSBE7GFNM/jg9TNbhKroWyVkJTqtvZbhz0H19R5DznKglg73USuMi2Mh+B?=
 =?us-ascii?Q?mM829/P8vHVJWeDphshBVCcTQ2SAPTM9ylBkKfMvKTPYKejLCDND4fv8iUcj?=
 =?us-ascii?Q?+8+nLXutiLXU6s1qOG6a6ICpqZrDjTGT17gbQ4/XwtkRw3HidlIF6ihC6JAm?=
 =?us-ascii?Q?bwnqoqdLx3sJH+9fEgol1ng+4NdIdyyLC2wxdpjhB/oR8TwLDkIbw4TGnxKi?=
 =?us-ascii?Q?jKMg39Oxtd8UB2N7cyPdPltpbkPYkS/N172dkIzBuiMkoyQBh2Fn4mzbsR9u?=
 =?us-ascii?Q?F5sehzQiVdp86TjwHIv3p8M96GMaW6m1lSTkaGr593PLk7h33V7D7RyPGZEm?=
 =?us-ascii?Q?QYYeamhlvryor3W+/WyG8DozrRXUdou0ge5TjsCBB8iSDeFyCaobQJedNUkZ?=
 =?us-ascii?Q?UEBDD49OjnoGCuE8K/lS+mJ5Gn0B/3ApNWsl0qyezLU2ZHQe7VojGll+ZYOw?=
 =?us-ascii?Q?MtKXhXEQwsdESlGtBpMUHRvjYsgKES1ZEhVnTjb5+0CYVDMSoxAD8GWGdc+C?=
 =?us-ascii?Q?uTOLd3JERQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: G6b0DkTXli0DNDjEAlQZtD2zI/4WpVDOW/xMOPyE3EWKpzrSKeiVK2x8PGPxm77W2cwZlOpi1MmEKdPpy7qpe3HzG6G3LCjck0IpnsfS79/pA+uVUAfj/6EhGjNNeAWMC8Z4mbyvzmDzBcE2qLN5eafxyTF00CX2Yqoa7ZccezObNjEU8+CY9V4aOiwRM9m429fU6/yyhvXf+4h59utT9iVo7B1vPYAOOX8JAA1DeIZfYu1BMjVvb75GsXBiMX8/hJqKcThvjC7INhP/kHvZ3xCEIm4DzpW+uejflANmFvwcyjHWovFkhKNe1VeeIA/nUr0dVp9xPJs8B/BlyEx92g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a04c07b-4e01-478b-d263-08df0517336c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:15:31.8433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4icUXruA0MG/Jn7J2hQsYA7RBWWnGOWicuHCySQDh8xE+upJGX2JISx+dtaJ/MC0m2ZsTqA59P84tfxTxZ0UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8779
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

On Tue, Aug 25, 2026 at 12:06:15PM +0530, Riana Tauro wrote:
> This series introduces the firmware commands required to handle
> uncorrectable memory double-bit ecc errors.
> 
> When a error is detected, the driver determines whether the affected
> page can be offlined and sends an offline/decline request to firmware
> via sysctrl interface. Pages belonging to critical Bos or stolen memory
> require a Secondary Bus Reset(SBR) to recover.
> Pages configured for log-only handling are declined.
> 
> For the rest of the valid pages, the first error is a poison error and a
> decline is sent to firmware to avoid marking the page as bad. On the
> second occurence at the same address, we request the firmware to offline
> the page as this would indicate a Double-bit ECC error. Any subsequent
> errors at the same address should be because of memory scrubber and a
> decline is sent to firmware to remove the page from queue. This is done
> by tracking the firmware offlined pages by Xe KMD.
> 
> At module load, the driver queries firmware for both the offline list
> and the queue and processes them accordingly.
> 
> This series is sent as RFC because it depends on the address fault
> handling function which is still in review

That seems to be trending good and we might get a drm-ras node RFC
as a replacement for the sysfs coming soon...

Meanwhile in this one, Sashiko seems to have some interesting findings that
we should address...

Thanks,
Rodrigo.

> 
> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
> 
> Riana Tauro (5):
>   drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_device
>   drm/xe/xe_ras: Handle page offline requests for device memory ECC
>     errors
>   drm/xe/xe_ras: Add support to query page offline queue and list
>   drm/xe/xe_ras: Add function to get maximum pages firmware can store
>   drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates
> 
>  drivers/gpu/drm/xe/xe_device.c                |   4 +-
>  drivers/gpu/drm/xe/xe_device_types.h          |   6 +-
>  drivers/gpu/drm/xe/xe_drm_ras.c               |  12 +-
>  drivers/gpu/drm/xe/xe_hw_error.c              |   6 +-
>  drivers/gpu/drm/xe/xe_ras.c                   | 269 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_ras.h                   |   3 +-
>  drivers/gpu/drm/xe/xe_ras_types.h             |  94 ++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   6 +
>  8 files changed, 381 insertions(+), 19 deletions(-)
> 
> -- 
> 2.47.1
> 
