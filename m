Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD31BC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 13:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8428A10FB61;
	Fri, 19 Apr 2024 13:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFndaXWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2010FB61
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713533114; x=1745069114;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NJmMNf/Pi3xgmiqEORt9j8agrsTYkaPbEd2ccoYPJ9w=;
 b=jFndaXWM9yG10e2LKgH5MLVRdYn7Sh/6J3PaONTsn8FHcMtOr/co697O
 oACJek1dXAPD0MNeMGM5C8FnXlw71yo+dMZ4lGyT6qnXjv8Tzwg+a68Lm
 ua2fcywiP4CQcPh5tFHh/WR8OAT7vjTcV3KF+S0iW+vDpt0vzcvW64zHW
 9XDP7zfVAEh5R5gn8XpDUSgrUGUYCcQXfN5Yr936yEcyAdEq/QSB3Y1pX
 /vfS1ecmD+x86M2a8ImNr6BnO6i5cCFwBfplHiLxfL35eIPjDvEP90kGC
 eVn1rrFyvGO1dgdXTM/S8Tn4g9PV5a0jELhQJoJmC6gv/BgfPTVMzIRr5 w==;
X-CSE-ConnectionGUID: 2BRizXjwRxaqpfW7yItDdA==
X-CSE-MsgGUID: mBvkvSxRT0qrzTs11U4nIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="34531703"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="34531703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 06:25:14 -0700
X-CSE-ConnectionGUID: kf5jkWKUSZaUOgmo0n7W2A==
X-CSE-MsgGUID: rH4S2WwVRiyipDLAQt41Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23311824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 06:25:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 06:25:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 06:25:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 06:25:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 06:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUTY6ayZv+zG/VBUkbYrNUVHyADTVN19tWjc4k+Ozqqa6GGfDB7svwlm+b4kwBlouBMngQyoRZIflkRVPZ59zzTo92E4sjH3Vi6Pz4nDMZffN+j+6zvD/Dg+LHgl2MXixG/sZ6BdzhoUuBzGyCdGmo2PHJBKX/Z4wht78s3Ln99HHrxCGCdg9xGA4dOtRDzKGQwDTePvffdLmauNla1d9+UgOZe/j6Fy1/skemDeUe/HCGb2FOx39+vaxYRq8aLuVqJekYMedwtfqCpmVZhGzU+a5VTWKSYIr5OiiLmadjn6rybh7uHPqflzPXCgPuJJo5KsS8RyUO6TRcpgM8G0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zl9VHoUSXHo0E9c57WI6Z+ZC8IvHAEO/IJ3zL+USNk=;
 b=VVLz4McvOBmG8Ujb4/JF5QM6BY/6wyiwtngix/RuIfetld8EcJ3nbo3VMnuVCFiCw2iHr4bYkOgrl62l2irtmrHrf8OR+80utxOTbdj6k7Gw8IjaK3KJH8eTXFQIxzyt2cuRAx9f1AidOOORprEGy6IxJm7RgFXFlh0WLS4ipi9VyrZsIZ1Y+oG9/8Gw2gcuOoCk1hJSO5pLGrUcIua/0MSnlEICMvRXJGnTw4IvGcq45svM9wWDng4ozo+8rKZ+pfc8xdXKyJB7OQD4rDJoho7hr35KSNhy2jVi4e3lw3mgqK9bURlrB8AXPjlCCOOtqTm9MZnxAsMTtN9kVV8ViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Fri, 19 Apr
 2024 13:25:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 13:25:09 +0000
Date: Fri, 19 Apr 2024 08:25:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 6/7] drm/xe/client: Print runtime to fdinfo
Message-ID: <feomvo7s7wx6eu7f2uggsvjzyifmcfihpa2lspxqjmbynuiyuw@x2ofxcuh4a6w>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-7-lucas.demarchi@intel.com>
 <Zh8H1t7gwFUFkQtn@orsosgc001>
 <i6hvr534dzqnj2ihee6jnsyahtsfnek34kumvxhvw3jtvifzsz@lh7p3rq3662c>
 <ZiGo61GB5NwOsPUV@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZiGo61GB5NwOsPUV@orsosgc001>
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 18087241-735a-4373-6900-08dc60742283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: RUrCnWjgKrSBxbGPLAbK6uG3UL6vtWaZyEtX8EgF2SbJt7sIlsrDPU05r6Rm/lUAiKVpBBS7D2EjjztulvO/yL/kg+WYexXhtFyfUaICm09xZsddmZdHGArikzdfCknhhRFtC4eGd1U+MoeLqGN7ADMRn0a+7JaXGevyZKhj2ei055oj8cmyZG9ZeGEIWaKmWXAtSc5FmFJuHHm1kbKbFVuZ4xdVb5YS7uDzv7lIbSkep48Iewn0nqp4WJTClr/kR3ZJoYeXuUxf5PvOSwFrTc73mak7GXxmKDKLIcuQXMg4lFuv9pdLQuvVblOALcetVyzY/ZftXFdzw7UTJqfo0/nhUFVESKJgyAiigqzaOBmKpcwbtaN0iYBuWBexqtXmPSpiJkcdzUicnpnK7kv5IPHVzPEAfeI53dywCVlZWsuJK7hCk+8ERMrlHmXDHb9XKDvf1b+9L/hOg7AWKDJ55lkPck29ZgQ2WeNAK45HrgAYiI0HqslDo2lUiabr/lb/v+iJA8dxY6T9/Kq5VoTjFhOeyqhnw7IdEZkb4MInQdWGAe/q01qPRHDP4D/KTvzmbpV1LW08CBmFeSnJAtTPaq6b4XXYsQxcaBdrYax2snxYQ2s7PuuLSNG6/D8OMbsSJJ2Vby0LSN6wRRTQKMj02HE3Esf1iicBK/sbR2oNCLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEozZ0Z4QU42eFJxdzFabkRmZ2RBdGg5aG9jazNEc292MldIMjZIT084dDB0?=
 =?utf-8?B?enQwWlRnRWZiT3dvWU5Ya3YvVWN6cEs4bjZZZE4xNHVCSDFBUit0UjczdWx5?=
 =?utf-8?B?MjNPb3VBdk1iM2YwN3cxanA1TFFibkdEMGlOdGRPSTVNWEwxYkpKNDB1dG0y?=
 =?utf-8?B?RlJvRzlyL3RpZnNrSThBdjYxTkdMdzFYM2RuanVHREtpWGJZUDVlcmJ6cGJ6?=
 =?utf-8?B?c0o1VE1jTjc0ZEJINTJJbnA1RjFwVU9kS1AwRkR1bUhnelgrd2tHU3BvbjhY?=
 =?utf-8?B?TG8zVlBXT1lvc1F5S3N4ZWpKSHpDNEJjNTVKbG9UamV0M2hBV1ptSnlqNkZp?=
 =?utf-8?B?UGs1QXYrRENYS0JYUUZOVUYwUm5XVVo4amxuSWdmdmQ1TGIvQXZjRVFUeGtS?=
 =?utf-8?B?Sis0SzQxQ1I3dUQzakloeVlOVDVjSEV2Zk0xZnk1bTNPbVU3dSt1MXZTVmFM?=
 =?utf-8?B?eXFWNC95SlEzY0lYa2pFOFNMNlE5NE9zUWJ1QnlqdUp3dUJnY1FFMkpXbXpX?=
 =?utf-8?B?eis3OGZUWUM5SHpoM3ZSNXFUazZMN1BaMXczaERkU3YxR3h4ZThFdE1pSEFM?=
 =?utf-8?B?VWc3Mzhtc0JpU1o0WFVBRlNXZ1YvV3FXMGJvSHFkRFdLdXZ2TEpYc2xZVitx?=
 =?utf-8?B?aDJwZ3E5ZXVOanpPelRmc3Ewd3VOclRxR3Y3R1dOUVdvOHFSSGErdWMxaVBI?=
 =?utf-8?B?MW03WUoxYUhXbGR1MVgrQjNHSk9zaXBMY29oQzJleVhsMlorb0xGY0UraW9y?=
 =?utf-8?B?Sy9WMVAxeFRwY2hWMk1TeThFVXo0bTREdjUxSDdjaitwWm5mUjNUYTY0T1Ix?=
 =?utf-8?B?SGowVUtiT1ErUm1ieVRKUXZGV2pZTVNXREtTWHFrcGlTUUpoZWU0ZTBYVUJS?=
 =?utf-8?B?UUJMeEpldFFWbVRINytBQlFMVGt6czZPTFJuSVJVbit6SjhMRCtoQWxqK2Mw?=
 =?utf-8?B?dEZoTlVCdTRHRHMvNnBCOCt4cFZpQjZpdEJVNXd4enZJL0h2QVlUMU9sdHpQ?=
 =?utf-8?B?aWJWN0puQU9xM1BjUE5kcWZjUWgwZDFyTkNxVytzdEJKVXpjNW9SZUFQUit0?=
 =?utf-8?B?Z1hTeEZKM0syQTBCZkRQbFh1WnZtdGRrSGxUN1J6ZE1Wd09UaURBd3gwWC92?=
 =?utf-8?B?ZHhwUHR0amtyOGFSaVptaG1xcEowRGhJamEvVzZrbDY5VE1HaWU0cEdHNi92?=
 =?utf-8?B?bVpwZnBqYzA0WGgxQWZYRHgvaUQ4Sk9DaFZ2cTJERW5wUDJqUUs5SHFRdno1?=
 =?utf-8?B?U3YwU2l3WHRpV2RtQVFMR3VLV3h6VTBqcFJZUUhsTTMzNG4wbE96a2I0aHhJ?=
 =?utf-8?B?YlpESGg5SC9yUXdOcFRwdEFwR2NRRkRaK2FtMXpHa00xMmIxZGNxYjBFQ2ZL?=
 =?utf-8?B?Ulh2YVhNS0t4Y2FpeTlqdjNrRFE4Sy9rcW45NUE3dlUyTVI4R1p0V2QwcWVK?=
 =?utf-8?B?VTFZZFNRazg5c2lDb1hEbjRMQXFveG9CK0g5cmhPL1JqQ2xpK2xEY2FsSFU1?=
 =?utf-8?B?bGQza3VDQlRhWFdQb2lmdFdBLzEyblpyWXJnZ2lxY2FvOElHTmcrc0kvMVRM?=
 =?utf-8?B?WUtJeHRPUDlPNFMwd0hma2lySjJEdkJqNlg2T0FnaUc4RXBqYWFhVEZ5a1lm?=
 =?utf-8?B?eFFYRmtaYm1ySGhLMWlPNC9XTmhpRjdYdElNaGh3MFc2RUZuWEpYWlpKQUJJ?=
 =?utf-8?B?UVFRaTFaQTZxcjhxc3RmWUROc0dXNWpZNmQ2WThFcmp3S242UWphV215MjVO?=
 =?utf-8?B?aERkNUtNWUtPN1VTNGFmd2tJYjVWSWFBYTJYbTlYY1BROUg5M1N2OTR2bUNx?=
 =?utf-8?B?a0xnbkZOdEptLzFrNHNTRTlTYXVOc1JqTTZRMHNiT29FM1NhVWhENG1QdTZz?=
 =?utf-8?B?aTRXY3RCRGU4Mnl2aGhsaUwyeUVPV0pQRVNvaGRlZU1xdnF4MGhoNXgrd3Fr?=
 =?utf-8?B?ekdNai96bmZOSTgwclJZOGE4alhPTFRPb1dwNUtXN1A1aWpQa2dNMnRXVmpr?=
 =?utf-8?B?TXdpSHVEa0M3WnJLTVZnNDlrMUpTTTE0VWtYTXo3TjZ5ZnFPZzlKd1h5Z01y?=
 =?utf-8?B?enpyVzdQRzdYSFYzbEg3bGlPUENscWVhM1FrbGZNbXpBdzBoMnhrVHcvWnF1?=
 =?utf-8?B?ZmFGS1V5dG9VMTJ4ZVlyRVdnN081cjE0SnIwSXovNW1LMXRPSHpjTzlOOWNz?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18087241-735a-4373-6900-08dc60742283
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 13:25:09.3221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77XzuurHKfg19Uv8VymUCIQjFGpGe7yodZrqNrGAyJmVrAUcVXisTqQ2B8IzlFKQZ5lIXntMhRXoB44NnMqeCxbTBZh41juVQjXQSkqeaI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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

On Thu, Apr 18, 2024 at 04:12:43PM GMT, Umesh Nerlige Ramappa wrote:
>On Tue, Apr 16, 2024 at 10:11:30PM -0500, Lucas De Marchi wrote:
>>On Tue, Apr 16, 2024 at 04:20:54PM GMT, Umesh Nerlige Ramappa wrote:
>>>On Mon, Apr 15, 2024 at 08:04:53PM -0700, Lucas De Marchi wrote:
>>>>Print the accumulated runtime, per client, when printing fdinfo.
>>>>Each time a query is done it first does 2 things:
>>>>
>>>>1) loop through all the exec queues for the current client and
>>>>accumulates the runtime, per engine class. CTX_TIMESTAMP is used for
>>>>that, being read from the context image.
>>>>
>>>>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>>>>time has passed" and that has the same unit/ref-clock as the one
>>>>recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>>>
>>>>This second part is done once per engine class, since it's a register
>>>>that is replicated on all engines. It is however the same stamp. At
>>>>least for the current GPUs this was tested one. It may be simplified,
>>>>but in order to play safe and avoid the cases the clock is different in
>>>>future for primary/media GTs, or across engine classes, just read it per
>>>>class.
>>>>
>>>>This is exported to userspace as 2 numbers in fdinfo:
>>>>
>>>>	drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>>
>>>>Userspace is expected to collect at least 2 samples, which allows to
>>>>know the engine busyness as per:
>>>>
>>>>		    RUNTIME1 - RUNTIME0
>>>>	busyness = ---------------------
>>>>			  T1 - T0
>>>>
>>>>When calculating the overall system busyness, userspace can loop through
>>>>all the clients and add up all the numbers.  Since the GPU timestamp
>>>>will be a little bit different, it's expected some fluctuation on
>>>>accuracy, but that may be improved with a better hardware/GuC interface
>>>>in future, maintaining the UAPI.
>>>>
>>>>Another thing to point out is that it's expected that userspace reads
>>>>any 2 samples every few seconds.  Given the update frequency of the
>>>>counters involved and that CTX_TIMESTAMP is 32b, it is expect to wrap
>>>>every 25 ~ 30 seconds.
>>>
>>>I think the worker I had implemented in my original patches (as 
>>>well as i915 implementation) may have been confusing.
>>>
>>>32 bit counter ticking at 19.2 MHz should wrap around in 223.696 
>>>seconds. The worker on the other hand was overcompensating for it 
>>>and running at 1/8th of this wrap around time.
>>
>>now I'm not sure if I did the math wrong or if I replicated something
>>you told me :)... What's the reason to overcompensate like that?
>
>I think I left it as is when I got the change from the original 
>author.  Anything less than the overflow time should do.
>
>>
>>My main issue with the worker is not to have the worker while we have a
>>gputop-like app running. That should be totally fine. My main issue is
>>doing it regardless of having a process querying it, which would account
>>for ~99.9% of the time.
>
>If the use cases Tvrtko is mentioning exist (low frequency queries), 
>then I am afraid we don't have another way. We could try to tightly 
>control when the worker runs. Assuming worker runs every 200s, for 
>example:
>
>1) initialize the worker on first queue create (or first job scheduled)
>2) reset worker on every query from the process. this should prevent 
>it from running when there are frequent queries.

that's ok, but we should be fine having 1 query more every 200s if the
user is query every few seconds. I don't see a way out of the other
side: user is *not* querying (and most of the time never will),
yet we still have to keep track of it.

>3) stop/start worker on suspend/resume (I don't see park/unpark in XE)
>4) stop worker on last queue destroy (OR last job completion)

on a normal desktop or busy server, (4) would never happen, so still
doesn't solve my main issue with it.

One thing I noticed while cleaning up the patches for v2 is that the
worry about non-monotonic increases doesn't hold: if we keep both
userspace-visible counters as u64, the wraparound is not really visible
to userspace:  the gpu timestamp is the raw 64b number; drm-cycles is
actually the  sum(ΔCTX_TS), so it doesn't matter that CTX_TS is 32b. 
It's just that if userspace takes a sample every ~200sec it won't be
accurate, which seems reasonable.

Lucas De Marchi

>
>I agree this can get hairy very soon and we have had all sorts of 
>issues in i915 with the worker. If we can get the UMD tools to 
>compensate for this, that would be my first choice too.
>
>Umesh
>>
>>>
>>>>This could be mitigated by adding a workqueue to
>>>>accumulate the counters every so often, but it's additional complexity
>>>>for something that is done already by userspace every few seconds in
>>>>tools like gputop (from igt), htop, nvtop, etc.
>>>>
>>>>Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>>drivers/gpu/drm/xe/xe_drm_client.c | 81 +++++++++++++++++++++++++++++-
>>>>1 file changed, 80 insertions(+), 1 deletion(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>>index 08f0b7c95901..79eb453bfb14 100644
>>>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>>@@ -2,6 +2,7 @@
>>>>/*
>>>>* Copyright © 2023 Intel Corporation
>>>>*/
>>>>+#include "xe_drm_client.h"
>>>>
>>>>#include <drm/drm_print.h>
>>>>#include <drm/xe_drm.h>
>>>>@@ -12,7 +13,10 @@
>>>>#include "xe_bo.h"
>>>>#include "xe_bo_types.h"
>>>>#include "xe_device_types.h"
>>>>-#include "xe_drm_client.h"
>>>>+#include "xe_exec_queue.h"
>>>>+#include "xe_gt.h"
>>>>+#include "xe_hw_engine.h"
>>>>+#include "xe_pm.h"
>>>>#include "xe_trace.h"
>>>>
>>>>/**
>>>>@@ -179,6 +183,80 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>>>	}
>>>>}
>>>>
>>>>+static const u64 class_to_mask[] = {
>>>>+        [XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,
>>>>+        [XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,
>>>>+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,
>>>>+        [XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,
>>>>+        [XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,
>>>>+        [XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,
>>>>+};
>>>>+
>>>>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>>>+{
>>>>+	struct xe_file *xef = file->driver_priv;
>>>>+	struct xe_device *xe = xef->xe;
>>>>+	struct xe_gt *gt;
>>>>+	struct xe_hw_engine *hwe;
>>>>+	struct xe_exec_queue *q;
>>>>+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
>>>>+	u64 gpu_timestamp, engine_mask = 0;
>>>>+	bool gpu_stamp = false;
>>>>+
>>>>+	xe_pm_runtime_get(xe);
>>>>+
>>>>+	mutex_lock(&xef->exec_queue.lock);
>>>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>>>+		xe_exec_queue_update_runtime(q);
>>>>+	mutex_unlock(&xef->exec_queue.lock);
>>>>+
>>>>+	for_each_gt(gt, xe, id_gt)
>>>>+		engine_mask |= gt->info.engine_mask;
>>>>+
>>>>+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>>>>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>>>>+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>>>>+
>>>>+	/*
>>>>+	 * Iterate over all engines, printing the accumulated
>>>>+	 * runtime for this xef per engine class
>>>>+	 */
>>>>+	for_each_gt(gt, xe, id_gt) {
>>>>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>+		for_each_hw_engine(hwe, gt, id_hwe) {
>>>>+			const char *class_name;
>>>>+
>>>>+			if (!capacity[hwe->class])
>>>>+				continue;
>>>>+
>>>>+			/*
>>>>+			 * Use any (first) engine to have a timestamp to be used every
>>>>+			 * time
>>>>+			 */
>>>>+			if (!gpu_stamp) {
>>>
>>>gpu_stamp is not required if the intention is to read the 
>>>timestamp once per class (as per commit message) because you are 
>>>already setting capacity to 0 below.
>>
>>yeah... I think I changed my mind and forgot to update the commit
>>message.
>>
>>thanks
>>Lucas De Marchi
>>
>>>
>>>Umesh
>>>
>>>>+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>>+				gpu_stamp = true;
>>>>+			}
>>>>+
>>>>+			class_name = xe_hw_engine_class_to_str(hwe->class);
>>>>+
>>>>+			drm_printf(p, "drm-engine-%s:\t%llu %llu ticks\n",
>>>>+				   class_name, gpu_timestamp,
>>>>+				   xef->runtime[hwe->class]);
>>>>+
>>>>+			if (capacity[hwe->class] > 1)
>>>>+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>>>+					   class_name, capacity[hwe->class]);
>>>>+
>>>>+			/* engine class already handled, skip next iterations */
>>>>+			capacity[hwe->class] = 0;
>>>>+		}
>>>>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>+	}
>>>>+
>>>>+	xe_pm_runtime_get(xe);
>>>>+}
>>>>+
>>>>/**
>>>>* xe_drm_client_fdinfo() - Callback for fdinfo interface
>>>>* @p: The drm_printer ptr
>>>>@@ -192,5 +270,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>>>void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>>{
>>>>	show_meminfo(p, file);
>>>>+	show_runtime(p, file);
>>>>}
>>>>#endif
>>>>-- 
>>>>2.43.0
>>>>
