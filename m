Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1775FC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 23:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B166310E497;
	Thu, 18 Apr 2024 23:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEPxKp0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3495C11A08E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713482046; x=1745018046;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YTqtb3VtiIIKywBgKurXWNJA0XJsfILDEK37OmGEJ0M=;
 b=fEPxKp0eGgKxnqKilWNCwBTrV4k5bnx1uwFOjMIgjeFtEiqJDs0GqiNA
 XPeIOpT8vGKGe0M6CNIrP10hKBvyoxaF5XQVQwRrTbB9glNjbVJPic0nS
 P1L/akK/aYRzsX13PZqbS7EYiNgKcp+e3ROf24e9Rzj5GfWye7aXYiUdI
 mfa7QgUfvXKuFkDaeGSYo3RhewuDPsmjGJHV/lLrGydXA3mP4GcYXoTSw
 mlveIX4DWhwAXaY5JBU7x+g7SYG4IlpcVQ0TCc78jGe+fAqgKJHhHzjIL
 L3Z9dn2PSS8Qr8NRFpUIcECpKhPq6AR0L30hHAKXyNhdKy8iOiiz2P6xX Q==;
X-CSE-ConnectionGUID: bI7p/99USMeOoWgP+IakHw==
X-CSE-MsgGUID: vFXNIIVnSum4sXXlnJDn8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9189061"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9189061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 16:14:06 -0700
X-CSE-ConnectionGUID: NtZzsm08T6WZDNmKesiASg==
X-CSE-MsgGUID: J59u5FZ5RJCu5Sva1CQhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23194303"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 16:14:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 16:13:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 16:13:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 16:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiZMETfQ+CTI2BffZ0fTqcYoNNYe4p2YmzbMcAeaYYHXzc1Y4BwA36uRbNHPgA+HOid4JH/1NGVTPtl94PFvnwUbSGVSqGWPB0gPVd5G54QDlep0Oj6+BZYcR79wgNg95qCocRb2kCOD5yXRalQbjCMfpL170eJomhY5MclOblEdp9qrjyI3aAHHyU6/LC6bxzVrum3WSXoAY2tPE1tm0g6gUoglaWSc+pMPSy/DkPSLn6XmwBjsgO2E+ReYeb3LcNudv7HjurQPSRobmuFxGw+cpS8ji8JnWB9iTfRaWh74+50Ns7n7GvWvXIwfMlz47dZ+SIbHNgNI9XKaav9dig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Hw4H4wiAjKIsg0ZkN7xxUe3+kasTrm6nc4iNisTTTE=;
 b=Xtq0Uf3cUc5KhKPr7PWuZTsSUsXgz35r1/Vb6CYZbN40MS9wgR+Zpei/gfALXsACxtujxW68IJRLVL/a2VL3mjEJisTjjOkkA8DtHb2xFvzhDGnsP2zZ4yEIx+pRwgYY6VgiP3aXxfIzq4/P9RVhhgefxV5p/s4q4QcDNL4AMryHveGnO9el9JsjY5oJyMJ2qDPxPyUl3dEH4z5RedplSlc3UrvFb+yi249/16gupCimBkczYriq/Lp3OELivvfL5qsfTHq4tP8mc22Z6V8cHAA17WoxJv/LDF4PakAX0/Pt/tmQoVJzls2bpfeZR6iXyDCRAUJPby341s+iWuFIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB8347.namprd11.prod.outlook.com (2603:10b6:a03:544::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 23:12:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 23:12:49 +0000
Date: Thu, 18 Apr 2024 16:12:43 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 6/7] drm/xe/client: Print runtime to fdinfo
Message-ID: <ZiGo61GB5NwOsPUV@orsosgc001>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-7-lucas.demarchi@intel.com>
 <Zh8H1t7gwFUFkQtn@orsosgc001>
 <i6hvr534dzqnj2ihee6jnsyahtsfnek34kumvxhvw3jtvifzsz@lh7p3rq3662c>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <i6hvr534dzqnj2ihee6jnsyahtsfnek34kumvxhvw3jtvifzsz@lh7p3rq3662c>
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 0646d0bf-a905-4c3e-855d-08dc5ffd10e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KKhEZ13MIsoQ509vgWYMy0bXNjJ9JxjW0oeiE/nUU32GE5KNtd1H8SNCdXCV93Y1Ox9gmuqgx5JyFnxRzVBVcDflNqOg+cJ5woHannf3KPh/V7C+vzuipW2ZWlF8m9ndSaaHrCeyCmzAQvmoA5m7OXo28SDS3SdaRAw4QVLHc2zHKWeXdMYL5mJRWu1U2bQghpL8ZUV2eVtOZ/VJQuNBWHJ19cSunQow2o2foRuQieEYN3mXBe1o5BnV+/qk/X2BqKdnq1LHz0AiGheRDPJttcugtrRQBZf0eoKs5Khs+LRWpCSYnE8osk775JS7bmllOHlo82EBUpI8mS4gcg7KltD++99/oXvvFymJEDLICB58E3trBDU9+djq8VLPp1Wfia4LxVy4CfETANT2dNErWRbMbfzkltcovcmzneBD0N6VjzG1MpK28DMr6bZUnCj93/c4zCPSoj21SVCB7pBpWzcEBp8gwFIgr0XwIwbJxL36gHpJHjN81BWn4JsbmHAkbjcHCblkwL4WHzh4VHnjdYTvWbmN0OiuPDBwsHmv7WFsAS7ZH94Gmi7e8ncXmn3WtGpJ68ZnTnzJp+7WL8u3z81mfcr9WDXSJzLZ5ak/UahvgXRxGj2nKshykLRlIpcGiiQyNO+qlQRqaouz5ytafj9/ybnVn8bT/57iKNT0tw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENHOGNzaU9IVW1DRi9JdVlncTF3YkM0Tk5teGhwVWt3Zmt6Q3BvU1NiZENa?=
 =?utf-8?B?Q05ScVVmZWlSM0s4OFh5ditYTHA1eGhUY3dXM1dWN1NyVXhJSWRZQnJmemVC?=
 =?utf-8?B?RTdnNnNQWUJCMTVESTZ0UUZaODN6cmRCQWtkMEVaelo4cXFCRHJSc08vMUFF?=
 =?utf-8?B?c1lja0ZSMTQ3VldsVi9WdGxKVHIvdVU4c1FtS1FyUWdSemtXejVubEZoaEZS?=
 =?utf-8?B?UXYyeDljbFp6TFROZUJ1bWtvSURDLy8xZENaZkp3V1lxRFJBRHJSUHZrZWph?=
 =?utf-8?B?UEM4Z3lPOTgxbVczeldpaTlOS05BVmt2a2xpWEhxMG8yWXlxVThQZHFEK2JN?=
 =?utf-8?B?TWZ1SUFtTXZMejExTC8wZnhIRUcxZXB1MG1mSVRybWRoeXZWRUZsbjN3cFcr?=
 =?utf-8?B?N28xOGE5dVZobXgrRk11cFArNTloR3dqS0Q2cXV1N1hHLzcwWmowWXBrdXpl?=
 =?utf-8?B?MDBES1FWc3U1UUcvbHBpTUJUdENDWmRuUUY1MHlsdXBxQlFqYnIxSzhlcWdE?=
 =?utf-8?B?R2cvZTZicFdGTWh3RVNlMEtzZERkL3IwQlNMSG1NQXlWTk9zVzlQL3VsR2hy?=
 =?utf-8?B?Z0h0ZFNyQ1RQNVJ5NENQRnMycWRUQWNOeVp1QVdXcGRKNlc4VGxCUU9ZMzZj?=
 =?utf-8?B?VitsbGNxclZMOFpRZThXaVhYVzVsN0p5b2NzdnFFSmpEMUZsMGxIemxrK1Nq?=
 =?utf-8?B?V0s3azlCRmp1N2Q3V1dhWVFKYU11VjdEdGJWcEZaeXM0NllnL2NpSDVHNEg2?=
 =?utf-8?B?TTBLUG1BaDNTZ2pkTG9kMEt4eVBMVlJ1UUFBdDVGdnpNeVhWM3ljVEp3cmR2?=
 =?utf-8?B?R29OeDVGQ3pCdCtnR29UYmVkaG9vajl6R1c3WndYdVV4RXhabTIwTHdGNjBP?=
 =?utf-8?B?U2pGTGVPM3c0WEtjUDJYczk0VGovUFQ0di9OaWxTR3FOeXM1dEpWU2d0VmRY?=
 =?utf-8?B?aHZ3SWlYM04xUlNRMUZ4azRVajl6c2NjREpkYm5RdDVZcmZTU2l3azFMb0pk?=
 =?utf-8?B?VTZMVnNXTks4MVNoTTR5R1hQQ0lmdGpkZjB2ZE1pQ0tFZXdzdlhZaDdGSEE5?=
 =?utf-8?B?ZXNpSlZIRWN4dDBhN3AwU0FQZEZ3VDdzMzhLUDJxSzB1SE5lM3V6aWVheU9G?=
 =?utf-8?B?MWJvVE5NbUMvWWZPUFVtRUtCaDJoTWlkUDRDdFFsRjNsQ0VWTXVNcHkrclVN?=
 =?utf-8?B?eUtTQ2t5TG0waGFyS0NZL0lLY21Ec2QrckIvUzQ5S2NCbThPcjhvMzlsQTEr?=
 =?utf-8?B?RElMQklZYmQ3LzU0VUtCd3dxTDJuZXh4SloyRnZTRG5FTlJ4WVdibEVJaGY1?=
 =?utf-8?B?ajVaaXZ1WmlLRXdDRk1wREEyMXJkTytUbEpGMEQyNXVxRWdvZ2xiNUZXcTVU?=
 =?utf-8?B?VEFpYnBmOXV1cXd0ZUp6MDltWjI0dURuMEpGMW9aM1h2d01iUE5EQW1ZNXM4?=
 =?utf-8?B?RnZxYW1ZS2Y0VWVTajk2N1l1SmlGdlVpejEralQ5RXUwK0RDamdpdG1Sd0xQ?=
 =?utf-8?B?V1JYQVZXa1dLaUVwSFNkTkNhK0dmNFRTNGNKNDNiT2V4ckcyYlhsWE5lY1Rw?=
 =?utf-8?B?bUZoQmdYYkdES25adU1wbnRRQ09pdmUwVjdEZDljb1BjUmVRaXNnOURZc0pk?=
 =?utf-8?B?a2RyNlR0K292cW8rZ3pEcXJxU0JNQkR1WmExUi9uaGVhdkdySGord1B4amx0?=
 =?utf-8?B?WnBVWk85MlNhQ0tNR2hFREd2VExNSEJhMGs5WmtsdGZ6bU55c0VLSXdVMVVj?=
 =?utf-8?B?T0EwaVpFTFRpY01waHhKL3NhK1NWTE0veG9iUzNtSExCZTVIMy9KQXkvUHk0?=
 =?utf-8?B?c2Nzc0VYNFlHMDQrN3FUTlVIYmppWDM3bkJEL25hY283T1J0TFk1dHA4UGg4?=
 =?utf-8?B?MkRRRTJaZEU0VktNcXc3ajliTGpHU05YMkI1Z21LamdrWmRpVGxXUHBRTVA5?=
 =?utf-8?B?YjJzbkpjSUFvdmorOGlKTWZ3SGZiZTRmL28xWWdYZFhUVXdHYTBpNDdiaElh?=
 =?utf-8?B?cGFHS1ExK3dncGQwY0ZKblRpZXE4eEI4ZmNZRlBLRUpoNDE1Q2JpL1M1cFVL?=
 =?utf-8?B?RXRwT3ZzbnlkU2pOMER6TmFHdkVSZ2MyRlpMTDkxdUJEZ2FGYVIvYUhVbEs3?=
 =?utf-8?B?WmZNZ0ExNzlxTzBCMHYrTThVcHdpRkxhL1UyMkVzNlhLZHU3WU9YSEd6YmZv?=
 =?utf-8?Q?bYWbaDXvVeObltvZqtFBGI0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0646d0bf-a905-4c3e-855d-08dc5ffd10e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 23:12:49.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4xyorYLb1ZLCTQrVwR9BWq00K7Em7mdkUAoJoBkvJVjI4AHM9u/8iaqPcExQSUNKv68kACc8KMchF2rLE8TcX0aVe2wJ3yAI5B+3VsSD2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
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

On Tue, Apr 16, 2024 at 10:11:30PM -0500, Lucas De Marchi wrote:
>On Tue, Apr 16, 2024 at 04:20:54PM GMT, Umesh Nerlige Ramappa wrote:
>>On Mon, Apr 15, 2024 at 08:04:53PM -0700, Lucas De Marchi wrote:
>>>Print the accumulated runtime, per client, when printing fdinfo.
>>>Each time a query is done it first does 2 things:
>>>
>>>1) loop through all the exec queues for the current client and
>>> accumulates the runtime, per engine class. CTX_TIMESTAMP is used for
>>> that, being read from the context image.
>>>
>>>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>>> time has passed" and that has the same unit/ref-clock as the one
>>> recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>>
>>>This second part is done once per engine class, since it's a register
>>>that is replicated on all engines. It is however the same stamp. At
>>>least for the current GPUs this was tested one. It may be simplified,
>>>but in order to play safe and avoid the cases the clock is different in
>>>future for primary/media GTs, or across engine classes, just read it per
>>>class.
>>>
>>>This is exported to userspace as 2 numbers in fdinfo:
>>>
>>>	drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>
>>>Userspace is expected to collect at least 2 samples, which allows to
>>>know the engine busyness as per:
>>>
>>>		    RUNTIME1 - RUNTIME0
>>>	busyness = ---------------------
>>>			  T1 - T0
>>>
>>>When calculating the overall system busyness, userspace can loop through
>>>all the clients and add up all the numbers.  Since the GPU timestamp
>>>will be a little bit different, it's expected some fluctuation on
>>>accuracy, but that may be improved with a better hardware/GuC interface
>>>in future, maintaining the UAPI.
>>>
>>>Another thing to point out is that it's expected that userspace reads
>>>any 2 samples every few seconds.  Given the update frequency of the
>>>counters involved and that CTX_TIMESTAMP is 32b, it is expect to wrap
>>>every 25 ~ 30 seconds.
>>
>>I think the worker I had implemented in my original patches (as well 
>>as i915 implementation) may have been confusing.
>>
>>32 bit counter ticking at 19.2 MHz should wrap around in 223.696 
>>seconds. The worker on the other hand was overcompensating for it 
>>and running at 1/8th of this wrap around time.
>
>now I'm not sure if I did the math wrong or if I replicated something
>you told me :)... What's the reason to overcompensate like that?

I think I left it as is when I got the change from the original author.  
Anything less than the overflow time should do.

>
>My main issue with the worker is not to have the worker while we have a
>gputop-like app running. That should be totally fine. My main issue is
>doing it regardless of having a process querying it, which would account
>for ~99.9% of the time.

If the use cases Tvrtko is mentioning exist (low frequency queries), 
then I am afraid we don't have another way. We could try to tightly 
control when the worker runs. Assuming worker runs every 200s, for 
example:

1) initialize the worker on first queue create (or first job scheduled)
2) reset worker on every query from the process. this should prevent it 
from running when there are frequent queries.
3) stop/start worker on suspend/resume (I don't see park/unpark in XE)
4) stop worker on last queue destroy (OR last job completion)

I agree this can get hairy very soon and we have had all sorts of issues 
in i915 with the worker. If we can get the UMD tools to compensate for 
this, that would be my first choice too.

Umesh
>
>>
>>>This could be mitigated by adding a workqueue to
>>>accumulate the counters every so often, but it's additional complexity
>>>for something that is done already by userspace every few seconds in
>>>tools like gputop (from igt), htop, nvtop, etc.
>>>
>>>Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_drm_client.c | 81 +++++++++++++++++++++++++++++-
>>>1 file changed, 80 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>index 08f0b7c95901..79eb453bfb14 100644
>>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>@@ -2,6 +2,7 @@
>>>/*
>>>* Copyright © 2023 Intel Corporation
>>>*/
>>>+#include "xe_drm_client.h"
>>>
>>>#include <drm/drm_print.h>
>>>#include <drm/xe_drm.h>
>>>@@ -12,7 +13,10 @@
>>>#include "xe_bo.h"
>>>#include "xe_bo_types.h"
>>>#include "xe_device_types.h"
>>>-#include "xe_drm_client.h"
>>>+#include "xe_exec_queue.h"
>>>+#include "xe_gt.h"
>>>+#include "xe_hw_engine.h"
>>>+#include "xe_pm.h"
>>>#include "xe_trace.h"
>>>
>>>/**
>>>@@ -179,6 +183,80 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>>	}
>>>}
>>>
>>>+static const u64 class_to_mask[] = {
>>>+        [XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,
>>>+        [XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,
>>>+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,
>>>+        [XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,
>>>+        [XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,
>>>+        [XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,
>>>+};
>>>+
>>>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>>+{
>>>+	struct xe_file *xef = file->driver_priv;
>>>+	struct xe_device *xe = xef->xe;
>>>+	struct xe_gt *gt;
>>>+	struct xe_hw_engine *hwe;
>>>+	struct xe_exec_queue *q;
>>>+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
>>>+	u64 gpu_timestamp, engine_mask = 0;
>>>+	bool gpu_stamp = false;
>>>+
>>>+	xe_pm_runtime_get(xe);
>>>+
>>>+	mutex_lock(&xef->exec_queue.lock);
>>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>>+		xe_exec_queue_update_runtime(q);
>>>+	mutex_unlock(&xef->exec_queue.lock);
>>>+
>>>+	for_each_gt(gt, xe, id_gt)
>>>+		engine_mask |= gt->info.engine_mask;
>>>+
>>>+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>>>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>>>+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>>>+
>>>+	/*
>>>+	 * Iterate over all engines, printing the accumulated
>>>+	 * runtime for this xef per engine class
>>>+	 */
>>>+	for_each_gt(gt, xe, id_gt) {
>>>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>+		for_each_hw_engine(hwe, gt, id_hwe) {
>>>+			const char *class_name;
>>>+
>>>+			if (!capacity[hwe->class])
>>>+				continue;
>>>+
>>>+			/*
>>>+			 * Use any (first) engine to have a timestamp to be used every
>>>+			 * time
>>>+			 */
>>>+			if (!gpu_stamp) {
>>
>>gpu_stamp is not required if the intention is to read the timestamp 
>>once per class (as per commit message) because you are already 
>>setting capacity to 0 below.
>
>yeah... I think I changed my mind and forgot to update the commit
>message.
>
>thanks
>Lucas De Marchi
>
>>
>>Umesh
>>
>>>+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>+				gpu_stamp = true;
>>>+			}
>>>+
>>>+			class_name = xe_hw_engine_class_to_str(hwe->class);
>>>+
>>>+			drm_printf(p, "drm-engine-%s:\t%llu %llu ticks\n",
>>>+				   class_name, gpu_timestamp,
>>>+				   xef->runtime[hwe->class]);
>>>+
>>>+			if (capacity[hwe->class] > 1)
>>>+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>>+					   class_name, capacity[hwe->class]);
>>>+
>>>+			/* engine class already handled, skip next iterations */
>>>+			capacity[hwe->class] = 0;
>>>+		}
>>>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>+	}
>>>+
>>>+	xe_pm_runtime_get(xe);
>>>+}
>>>+
>>>/**
>>>* xe_drm_client_fdinfo() - Callback for fdinfo interface
>>>* @p: The drm_printer ptr
>>>@@ -192,5 +270,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>>void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>{
>>>	show_meminfo(p, file);
>>>+	show_runtime(p, file);
>>>}
>>>#endif
>>>-- 
>>>2.43.0
>>>
