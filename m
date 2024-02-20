Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8272FC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233A710E331;
	Tue, 20 Feb 2024 16:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfrjN8jN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0932A10E331
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708447477; x=1739983477;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=AAyHL4dsJU6SeOduDL8Q8fKoJA+mv7vlgsfjSv6XtSM=;
 b=jfrjN8jNPJvqtNgsYa06nvmiuLQmvjZGJIAopJ0SyTUvteG+Sw5M3EsX
 JLv9C6Z5KZ+AxMTSL4pwBWbHQOVOTFyA/PKJK0Q6A7ybca08MQnSTilx8
 K2zOAlfifKNWwG6e16FxoZ+o+sfTQqp9eSt0WLI/Mb/KAAetVYQOruB/c
 qLp0D0XetInKMIXm1OXpFgFUE6Q0Nf7ZBVQmoEBs8I6YH+se2U4GqHyX1
 W5dmp8Jpc8ILm1i6fTmjUIUhs+bDFqOGL9Pnw5p2KziVgb8Cam0jrqS47
 GSLPC/ayqSrk9n8INlGnuQHT69eQ6GeO2JjSJ937KxOzJOcCoo/M9N7ts w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2468478"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2468478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9405635"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 08:44:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:44:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:44:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 08:44:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 08:44:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnUaj16RL8VnzKNTCI0PoPM2OVZIflrvfxkaXHeHLBjfzNj1V/8kWMex1HxFMJ3cNgbw5h2xBTJvpBK93TXsO7xyR2GPXKDSAb26I7LZLxn3we57i+hAsvCVNdOVuGLOe5Hp0wfxXp+UZ9EeZjBpkLQk4jtV5di5RDuAh5he4FUm+Xy5esOPgzN2BsO5PWCIiPT3YGQ/vhNGXOzDT1Y2rUyRmc8n/sWkOlsDmoomzoIjSaqzeazO7fBf4Bpx7C9pMfPrmPaL0CEsabsPGjAAgIY2fT+n5hJ4l95tDvLse3RHuUmVouD2uBctm1olozzS+Plm0PSzIakjaGRl6C3ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwExwM9Czj9AALW+JYkvERLFyR79Tc24NUSiM5ZaNek=;
 b=oV5Cg940ohFcUpZ0oi9raHQUTEvtXilablxnc6MfUh0hDruc8gtj8h9FOyEjsqYx/YS+vAMotruo5kQOvlYiwBEP7iqBbmpcvQVioto+UFhlt6TRWMz7OI8yamYy5Y6qYEJKJhbFQfUYWh5DoyJKk/QFbR5112YtnUm7UJl9UMgMTu70wsdv0u2i2WMbdh2iS7tfth/+JNg9naIaFiz+DroDRydsUjjHqZBWhlI5pFYoTlqNfoCnWzmqm6fFTryi2GblqhmZbqijTnIcTGzTBCuf2kaNuowi75g4AuPFNHOcfF+ov0YVJCvsGxCYq1XtLs+Qvslpc+IeNDQdHCIMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 16:44:31 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 16:44:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240207103007.665367-1-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
Subject: Re: [PATCH 0/6] drm/i915/display: DMC wakelock implementation
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <uma.shankar@intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Tue, 20 Feb 2024 13:44:25 -0300
Message-ID: <170844746576.44184.5608234415090080403@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:303:84::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 49247d70-9d12-46d0-2f99-08dc3233361b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbblkQO+J6aNXevjgEHka40aLehUwdANoszclJufVhZ/QbKAFitGi2V1L/sJh4LiJd/QRaMtvgRXynX+0ujj6c8ii5Et7Z4fEq+Cy3zYqohgit3GN88FUs/psKaqGcCRY7wZDKHw8y4UFqdJyFEUJxUpRb/z/nSH8Qu5EWbok0I05ExLK4En9OEpk4RMvCGmlqZFvtNs4yzbaofGVK88UtzH3jdTNrBtxffMjjZiGotDE6QAxZA7PsutkZ6HZbCbfjXxqQV1UdjrbMVWPeBJF6KC7xHiIkijeO4aaV8oKzmxcAyiLd2knwItLQ35VAohcsuxT26zQpp+CsOS5EgFRL5n26KPI1YK+9VC0Kv6TJ0L7ux0akMyqqtg4I3hLOrKKWSaMmc8xBtq73Zpzng7KSfD9A/Ix+klRtmJ+yuPrJNV0VZ8SCVEdAsASNXCnXrNXolyycx12oYMbCFB2nMfhsMPje4iCqzJW0JMc6IkCLX6tjaLZBTanYdLUspzNDyyGB7zqLi5viSE+ABrmDIlJ+s+N9hWrKiyX2Q0lirB18fQObCKAkRbf5INsWY1/4dKXfOjLfIwO7x9Sq8DkdFdnS5mjGlgIJwv25/K63AvLEpHohKtmQ6myluCpkwEiJSS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(16122699003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVRMLzdubHVFd0Y3cE5EU0hqSlBaQXNqVE53MnppUkg4WXlxcWV4d3FubkRp?=
 =?utf-8?B?U1krbGZnTmY3ckhiN1dQeFhOS3ZVOTd1Rk4zaHdtUXJzeEdPUmtLcVlsVGl1?=
 =?utf-8?B?ajRLM1IvNzFHUlVEWW5UME1OVDVsTzNSc3RQSVNuVGZNeHJBdzBQVEhCYVY4?=
 =?utf-8?B?VW5MazY2SWRiczdkU2FIL0wwOFFuMDBPOGorc3QxRkF6NytTQ1dZV3FucFlR?=
 =?utf-8?B?eTNXNFgrS25BejdRTExwaEpFc3V3N1dEUDN3c1BYNDhVd2cxK0MwWmZnWUx0?=
 =?utf-8?B?bDZqQnRKdXZvWlN5cDNjNDNvUitqbnQ1N2t3bVJJL2ppL3FLa2pUdS93YmJG?=
 =?utf-8?B?UFlMY2VIZStxS293dDAzUVlnTVUwaWwxc1ZyYnNsNGlUdFRDQU9Nc0JBak9K?=
 =?utf-8?B?cENFMnBsUXBYZ2tyUGlhQkFvMDEwOGlHSnU5am9DcFhmQ3ZVaFZTMlJ3cVh3?=
 =?utf-8?B?bzRLaGZ0TzMrWXVvMEJFc29PbEJ0SGRZaDQ1N05HaVdjTzZqOFp4ck1NNnl3?=
 =?utf-8?B?d2MxdFU2bHdtSGJHU3ZiQU8vREQ0VmZvOHI2dHczUVE0aUlpSjR0bm0waGIy?=
 =?utf-8?B?RU1USmZNREE1VGZTUCtvT1ZtRUttek81bnJ3Z3k2WW5ETUxGaWVLeU1jVlV1?=
 =?utf-8?B?My9lTGQ4MlNjMmp3SHJpdHYyTjczajcrNHNvZXR4TFl3ZThXdXhZOGN1dHM1?=
 =?utf-8?B?RFdmNnk5SHNTc0JFVHJZNU1qcUI4czd1ayt6Yzl5U1V5R0FCckQ5eE9ldVJE?=
 =?utf-8?B?MDh6WjZ6RWY5UjFEVkVEODhNb0NSc3pXZVFWUGxLNlA0cDYzR3BSRnI3amxF?=
 =?utf-8?B?OVN4RlROSlRaU0ZWSDc5VllnUitjRVRvMnhqUnBELy9ITnM4MHl5Q3l4a0dq?=
 =?utf-8?B?UDNaK0ptSnB4QjE0eHRvM1k2bTU1QmpqVWZUcGZUVlFhVGl4MHJLZmxDMHBm?=
 =?utf-8?B?OWFHTnpHL1E2aUdMWGZXcURCUHNIV0JIZjRnV1FnUWtwb2ZGTktESG1LK0Rx?=
 =?utf-8?B?UDBoUzZLV3RjcWpBeExlM0hCQi8vWmRGNlQxOWlrQjA5SEt0SWJHeHRZbFRH?=
 =?utf-8?B?TXNqaHRtRHljOVZjK2UvdHlITjZSdE40a0JwQUQwelFKWWJCaFNWZFk5eVBm?=
 =?utf-8?B?Ly93UDRBcHR5OFIveXhFb0JsSlFYemZJM0RQYXR6bWVuS2dpcVF3ZG1Fb1do?=
 =?utf-8?B?SVZwd0pUYnlwbHl6TG1zYSsxOCtXRFlnQnNFcjNuYko2cjVwZXA0OFJPR3Fy?=
 =?utf-8?B?YkNldzZQVE5aUUtIMGtkaGozYXh4dW9xbk1Ia0hYcG1QR1U0Ny91cEEwaito?=
 =?utf-8?B?WXg2RUJncTZvcVJUbUZKQTE4S2RibFZDTWFJSk9TTXVuelJ6UGkzNjJoQTVL?=
 =?utf-8?B?Y0xMcUk2UkluRFBPMEhJZlkxS2Z2MHQ1bitkeDFrY1ZIdXFGTTB6cUR0QUlW?=
 =?utf-8?B?UUNWN3JoOFluNXZBQ3R6RjFUUDZIeE04ZmdaSENtbzlmVFFobG1xSWtscFVD?=
 =?utf-8?B?UUt3TWEvMTAxVEpjbmhOSWJPSCtlMGljNmVuczdLWDhneG52QTNmUEF4Mi9M?=
 =?utf-8?B?N2dkR0cwVElUNkg0MFNFd1hiUVpDQ2tPMkFaWElSamJrV2RaYnArajQ0WXVy?=
 =?utf-8?B?VzU2eG4xeEkxZ0dJaitaanJZL1F1QzBLa0tYS3h5TEE5TkhNb21DK01EUzYv?=
 =?utf-8?B?OWFmT0FLUStOS1p1U1ROeFlHWlhoaWNxNDFGQmkxUTdVQTN1RkZ4cko2Y2hZ?=
 =?utf-8?B?NlFOM3ZZWEgvMVNvOGdPMnNUdUdaYm8yQkw5ODhCekc5N3N3TUlwcTBlNXBi?=
 =?utf-8?B?djBYWXduT0pkeFBWdHpDL21qSTlpRkUzNGVvbGM3OURlR205d25EZTJrVDc4?=
 =?utf-8?B?QkpkejRKRmYrT0NnN3YzeUV5Qy9uZGJhMStyRDB1WjBwbGhVeFAzL0lYTEti?=
 =?utf-8?B?dWZOYUYxOWN5VHMxU3lmQVJ2dTNyVEF0OEc2eCsyUytGb3dkdXorREZxWGVT?=
 =?utf-8?B?dkM4UUtYcGErUTJrTk1wdWxSR3k3R0xWdXA5S1R4dUFLSEFONGFGdzRaZHcy?=
 =?utf-8?B?ZTRua2ExekNCZ2JrSEFFQjFvRkVGb1hUY0Zhc1FZb3ZjNE05TDk3dzdNVnJJ?=
 =?utf-8?B?UzFLK2VVeWUwYzR5aU9lY1BBVE1SQ1o1dFlFeVU1TmlpT0dZZmdSaXpkT1Bn?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49247d70-9d12-46d0-2f99-08dc3233361b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 16:44:31.4593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAJMPVragi3DqWvK9Qdlkzz8r6TVBsPoPrmO3U3FLoUe/Hc43p7VsrBvYtYoqJRtmFViz+Q0Py3tg3ycmR0qiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
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

Hi, Luca.

I have provided some feedback to the individual patches.

By the way, shouldn't this have been sent to intel-gfx instead of
intel-xe?

--
Gustavo Sousa

Quoting Luca Coelho (2024-02-07 07:30:01-03:00)
>Hi,
>
>This is the third version of my series, now not as an RFC anymore, but
>as a proper patchset.
>
>This is what changed compared to RFC v2:
>
>  * Renamed intel_wakelock.[ch] to intel_dmc_wl.[ch]
>  * Renamed all functions to match the new file name, intel_dmc_wl_*()
>  * Removed the excessive logging
>  * Added comment about other CTL registers
>  * Changed DMC_WAKELOCK_CFG_ENABLE to DMC_WAKELOCK_CTL_REQ for the
>    control registers
>  * Add disable function
>  * Add module parameter
>  * Moved the init to DMC load and added disable
>
>This is one item I promised to look into, but didn't derive into any
>code changes:
>
>  * No need to bail out on refcount =3D=3D 0 in the work handler
>
>
>Please review.
>
>Cheers,
>Luca.
>
>
>Luca Coelho (6):
>  drm/i915/display: add support for DMC wakelocks
>  drm/i915/display: use wakelock in the remaining read operations
>  drm/i915/display: use wakelock in register waiting functions
>  drm/i915/display: use wakelock in the last write function
>  drm/i915/display: add module parameter to enable DMC wakelock
>  drm/i915/display: call DMC wakelock enable when DMC is loaded
>
> drivers/gpu/drm/i915/Makefile                 |   1 +
> drivers/gpu/drm/i915/display/intel_de.h       | 119 ++++++++++-
> drivers/gpu/drm/i915/display/intel_display.c  |   1 +
> .../gpu/drm/i915/display/intel_display_core.h |   4 +
> .../drm/i915/display/intel_display_driver.c   |   1 +
> .../drm/i915/display/intel_display_params.c   |   5 +
> .../drm/i915/display/intel_display_params.h   |   1 +
> drivers/gpu/drm/i915/display/intel_dmc.c      |   8 +
> drivers/gpu/drm/i915/display/intel_dmc_regs.h |  32 +++
> drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 197 ++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  35 ++++
> drivers/gpu/drm/xe/Makefile                   |   1 +
> 12 files changed, 395 insertions(+), 10 deletions(-)
> create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
> create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h
>
>--=20
>2.39.2
>
