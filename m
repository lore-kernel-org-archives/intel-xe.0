Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F519F36B97
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 23:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B98410E150;
	Thu,  9 Apr 2026 23:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gc9DLYE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CD010E03E
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775778892; x=1807314892;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wO3OMvITZWfi6uwuoWlGYvb3E8G/KqKh5Wugru6wDgE=;
 b=Gc9DLYE2RQwOBeWeYPb11vJjUFM5LFLRDoEBNoJojwig4M7O4VF9xWTt
 KlVubsBkWqZSvUPAtGc26MpXE+RqKnfAaicHoCPEGgb4Hl2298gY7zQGd
 QBmQepLNDMZg4IYzSOVKumRsinYlTfGrXpVHnsQbNgh6BIQpmrOBmsU8Q
 690PYxkGBFdM7oSDIRITnKHn4kD252zmgx1/gvMxDpKlIof2GAWI4gETD
 4CJYVCthXeXUyjpzV0fx7G4EXQNznXnKapufWLRtkEIjZCmus6TY7E6qO
 +JzAH2UQNp5NTqAk8iBCepY5gS5CU8SE3ZE8bpz43pFX5Z+zOkXZ9Icko w==;
X-CSE-ConnectionGUID: qQrSvFvfThmrvh2hHAuz/A==
X-CSE-MsgGUID: 0EMa5AiWR5yey76aaZDJ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76672557"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76672557"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:54:51 -0700
X-CSE-ConnectionGUID: nyZ8CsyyTwmb3D54Eh+rcg==
X-CSE-MsgGUID: tRpD6EuZQUSq+LfLxRPzWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="228807987"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:54:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 16:54:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 16:54:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 16:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3kAsJmIqdkESRc4TSNLo5tpHS5bgs1cl2u4LVfCcU0Gtl2RMLzN2+9TKbxCpsi9m+thbGR0oimZ49klB9eN/f1NEm8swNRzEqux6BzGhW7A4125/QzX2XZ8d1nlMkeQBwS+KCAFwZpnxdZEwC5FaoZyT34xqJHQ8J7Vkx7X8B+nvyzeWv/XuTV0Eu98WYoGiUSEwsZcjLObLIrMK4o/eizlXFCdHmvI6lvyw9BOmOMimrq7BEaXZXrM+I2K/6KCVnuocrL8GL/o/24um3pdxjfw4crQF7l2lMSLRllGnEM5jwtugsTBtvjoZt/hIXxQjWKpSdDSzxbqVPkZ/aXE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO3OMvITZWfi6uwuoWlGYvb3E8G/KqKh5Wugru6wDgE=;
 b=XJClTJwZH2pARcieabMAe/aakTMWhP92YDKLoPPZGZNZIHYu26x6NrFVoNcvkBnGNnlmAtdrZYKaAusROLHsm4/HP3/ubfX8xMR8lClPQzSAw83d491nTw6P6UmOmk1g/QiGnAMpilIQ91fNwV/5V5y0cER2EzzbTNZLGU+7AeC1W129XvTqLzl3I+goZWy+0ac3fIFpg+u+uA6CwNruRchjxoTuFkSWh9Rmob5L51lFqmOhkaybIZ1KuTJGcI1ljUczIcQtq3PPKT81RkzfHIdmBLcDdJJIGK9nZDDYp3BiGkddYkKjj9SWr9Cq89X8VOWjBESRLPmT4xHCXda94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 23:54:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9791.032; Thu, 9 Apr 2026
 23:54:46 +0000
Date: Thu, 9 Apr 2026 16:54:43 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <adg8Q6WOq++dqu1o@soc-5CG1426VCC.clients.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
 <8e9414588d7a8761112c6c623957961da89bfd18.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e9414588d7a8761112c6c623957961da89bfd18.camel@intel.com>
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd55648-7b58-4875-6670-08de96936126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: NP+nnOWDJuapBogu3+r2GaGzNF775ji0mpPoPRjV7m85TKkvNnkVF45EA/lIY68pKTHJxRJ8eCeksXKv5+rq49rDNDTGSUWkG4IEJ7B2hLpXVG6bES85v486KlMbwZ9KoCRbSxb4Ry4IxkxGOPgSAeYoNShtD3fSNdH2GO1EZUJVBtqYeglL6bNJ2DGlodISIac/JHZf61tP8fA2TqPf2Kui7zwHO99o4r6Ivx9pzgXLrlGDw7Pe02RZXHZCfazHYdEWeXKXAVwrPeA3M1EgCKLJ15Akf5ivJt6kX9Ogr2xuGOXE49dF7FvpQljdA8miwz1MGgNuY6UXJ4DNx/D20nvr4gmcGjy4l4IglbtKwSnu4EtGiAopHeQRXfwofksJ7Ana/VMonzlqmjSrJPK7vA084cXxvAilZV2cUPjrmbAx06+w0SK8s7ez3OY2Xfp2lJyDUUNgcMA4SbRdbTkyLZQPZ+YPqCFt1kPdx5MoFelUAt9eWXtC2SME26yFmjDZ/w7Qf5NouL7Ogaq6I23KPi++1TZa/cphUgUjWlE6D9Hm94RtMqesBF91EZ1ylIRLywfiE5IV+rNApKtGhvp0Ibn0zNUh8whsPo6br4T/piuAl7wo8UN5SRcCsZ6qI4KAjXhsSdnCqDLkBBTDRDHsucONYVUKodRdepNL3iw6YhlfYRs+77DaCC2F+X+hQ0NN1tLFLW3QkDDDDsJ3sAhH0ULb56gaY1TKyceA2JY1f/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zng0R1dVQXNwNk5RV1EvMk9Wck5HajI4a0JYbU54cmF2QXFka2xMb0FPU0ts?=
 =?utf-8?B?YW03VVc2RDFldHpMNTBUZzVIWHl4TGVZbTEwWklnaVJ5S0h0bU83U3FkNHpM?=
 =?utf-8?B?Y3pxUnVJQ1hQVXh0djJTZ1hhYXJrTlN6by9FY2MzNVVjN1U0QzVza1VyaE1x?=
 =?utf-8?B?VTZaaGxPYlJpenJHRzVSNy9WTUE0eVFnaWF3bkpURW9TWi9FNXhkeTY5ZmV1?=
 =?utf-8?B?TlRRcklBa3ZxQUpoTEI1R2RTNHhuTDYwUzF2UE9XdWUyamcrL2lYbVltTE5X?=
 =?utf-8?B?dzRJdmprdkF1MVRrMGgwTFBJdFBHVjF2NkxGT2lFYTRpd05YekEvQmxEVzgy?=
 =?utf-8?B?VjBFTjMxRGZRb2dsQ2kyTEt0UzVEWno5R09nOWZnRTNUaG1RY1dPNnVWcnVs?=
 =?utf-8?B?NE9aUDMvTDMrSmh4MUcrOERkNWc4Ung2VjZabzZvSlRJOWVmR2lVVzV2TjVP?=
 =?utf-8?B?RHRFcVFkOGtxVkRDWGZRY3plVnJYTnNXMVlYQ0xkaGNzVC9wMXVXY3gxMi9u?=
 =?utf-8?B?YXFXWnJsQUNqV2p4SHNsZ0RPODhXRjMwVTZBRk5YQjdkZGRDR01kOXJpcktF?=
 =?utf-8?B?WTF4U1VxOUhUWVZwOTNydzc5ZE5DU1hNR0dCLzZsMlFQMm9Qckw2ajJPUGFh?=
 =?utf-8?B?bWNKd09mbllOU1lwMlRqRStGclgwVFRKbG91UkhVSFY5bWJjbnZLMHJ2ZDZV?=
 =?utf-8?B?K2FTclBPR04vNjl6UThRQ2ZlK25VQ3IwZ05lMllBVUVRdFU3bmhvdGo1UzFv?=
 =?utf-8?B?cEEra0c4M1h2VzR5eitRaktjdG9xLzJCSnFhK1ZFek54N3lzRDVtVy9MRFd4?=
 =?utf-8?B?eFZhN2E0NU9WUW0ydUx4Q2ZRbzNMQ0h5a21DYWVyU09EdEZYWm1SRmRrMEsw?=
 =?utf-8?B?c2h2Z2U2dGxBUjNnVWhLY0FmN1dQTkVuY1lFUFcxL1J4QXZaMjNsVnNkR1M3?=
 =?utf-8?B?UVhDUVNlRGx4a1A5L2w1cHFFNTdXRGdyTjEyMStuZmpQajNyaXJnSjhVWm5G?=
 =?utf-8?B?RXptQmtSUi9nWmpXMktGUzF1Tkc4Q2RkOHdQZmQ1T2hBd1RmZ1NKS3lnWmpQ?=
 =?utf-8?B?bHp2bEpXWkVJVFArQ016bzNvMUdob1lVMk9tUmxBOHpUdnBVZVduK0c0VzNQ?=
 =?utf-8?B?a0lhMi8yVXBDeVFCYWpSSjgzTWd3dEVTYUdqMms5bGdvd054YzVTV3FITWZ1?=
 =?utf-8?B?UCtFVVErZ1hkNkliWFlTb1BXRGVOcEM5YWVmbkxjVW1SdWRraE01ZVR6aWlJ?=
 =?utf-8?B?cjZ3UHprWWZrbW93WlFDUHNrK2F0YUVzbnhUYjBnTzUvQVRFaEtvOE9iaEFI?=
 =?utf-8?B?Zlc4aUVlWEJRak5aUUxIZGlXWklQZjhuYzlWbDFyYU5ESm1ja2Y4b05pblpE?=
 =?utf-8?B?WEwvTGVud0JyWmlPN205d2FwbkM0TkdPSndjeWRra3VTVTZHVWU2TUJxQlk1?=
 =?utf-8?B?SjZrL3BRQkR3VGtWTWpWZU5KOEpHYW5xWW9QYjNNN3dENklhenc1ZDhyRzlt?=
 =?utf-8?B?d2ZEa3NsK0g2SE4xYW9EYytaOUc3Z2dLcGpHL3lNS0lJZnlpVlBBSTFTeFV6?=
 =?utf-8?B?c2tGeTR0M3V6ZDBpelFtR2thbnlSRmtQTkZqRGlrSnVVYTk3bzFwbEd5SXN1?=
 =?utf-8?B?VCs1SENYaXhraENGMWxDamFIbGtraTVYRFg2U0R6TzNEVWMxeWdGOUVYSWdN?=
 =?utf-8?B?YU5oc3VtVGhkejRtRXpNamJlaEk0eXBjNG9kQk5XZnpOU1I4d0RaT1UvMlkr?=
 =?utf-8?B?U2t0anhuQW5IMEh5d25DVG91UHRHZTVLOVNqck84Z0xXYlJEdEF6NWVsL1h4?=
 =?utf-8?B?QUg5WHRrUG5tNkVCdEFUbjh6MDI0UTM3ZHRtSHl0VmZHTmVYMEJNZDZmanVm?=
 =?utf-8?B?enYvN0I5eUs0Y0RwcVVQSVc4ZjJ4QWV3TTBmTEdmbjM1OEQ0R0RhaUVjdUxH?=
 =?utf-8?B?Z0lLbFE4b043SzVvaHBEUk1VR3JjV0o5OFZydDBOUVdtcmN4V21keGorOS9r?=
 =?utf-8?B?ekw3ejlyZ1dubUs5dURKUzN4UDVCZ2tSYlp5QVBVM2E1WktZa3ptWVdwT0tw?=
 =?utf-8?B?ajA5Y2NVUkRoT2tQbkx0bVRma3JQNWFuaGxYMlJQT25HNHl0NGlFSkx4T1ZH?=
 =?utf-8?B?MWNYZlRnRkJVVnlNUEZGT0wvaUZxVnB1dHFrZ2pwTTVVbVp1NHZWYmp3MndN?=
 =?utf-8?B?Rk9MUzlPMVNjM1FxWklqVUhLLzRvZHJqUWwyVjN3cHU1WStYYmZoYVpQdC9l?=
 =?utf-8?B?MHk0RW1VZVN0VDRXUUw0cUZtdXhtM1A0a24xYk1XRUI5cFdGd1JaT3BpanZQ?=
 =?utf-8?B?UjE1TU5XNkRiR2kvUDBBNHFKQmp4dkVETjlwYm9HWEdvdlB5UHJWK1NCYVNv?=
 =?utf-8?Q?SCu6dYN81nkAv1ShA2oK8fuBPzPfR5o4iZXS9?=
X-Exchange-RoutingPolicyChecked: n0MX2qzHI1ULyUcXNx4ONiEru5ZpVVQ6UmXHuBTzo6Pj+cvDQ/u8ejWyLTbhG4XEMqBR3w94syiThc/DL9LVHZVN+YvPr9uN5ntQqCM9twoprUvgL4fXH7vLehQ0ZI+Zs1cBMI9Q3TvcTIxAUZLQylvvmMHOITUYBmJWeJI6Y4T+5GRtWejzoqCjaessccSt/IoXufMWBmLbHp/l2Z9YddDlQmQM/ahPHD/TAzhc8Huh0uTcOvAGfoiNESWTdlye/9vWWyjRSTIUIOVTE8dc+P6aE52u0uxX8ZcYcSLbZwzvmM6LB/r/mX36HarWAtMC0RaW0duUj/+gI1X782XFMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd55648-7b58-4875-6670-08de96936126
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 23:54:46.9281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7X2UrVD99LD1sMmwPeekkItbWoIbTOS5IFP0VMaMaDVokzL7CXdRDjSGc5Q2xPYPE7pVlY7d+yBlnbF61ZB2ppuLHRxOf0Z1pekIshKeISE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
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

On Thu, Apr 09, 2026 at 03:23:56PM -0700, Summers, Stuart wrote:
>On Thu, 2026-04-09 at 13:37 -0700, Umesh Nerlige Ramappa wrote:
>> If a queue is currently active on the CS, query the QUEUE TIMESTAMP
>> register to get an up to date value of the runtime. To do so, ensure
>> that the primary queue is active and then check if the secondary
>> queue
>> is executing on the CS.
>>
>> Signed-off-by: Umesh Nerlige Ramappa
>> <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
>>  drivers/gpu/drm/xe/xe_lrc.c              | 122 +++++++++++++++++++--
>> --
>>  drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 +++++
>>  3 files changed, 133 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 1b4a7e9a703d..af6af6f3f5e8 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -170,6 +170,10 @@
>>  #define   GFX_MSIX_INTERRUPT_ENABLE            REG_BIT(13)
>>  
>>  #define RING_CSMQDEBUG(base)                   XE_REG((base) +
>> 0x2b0)
>> +#define   CURRENT_ACTIVE_QUEUE_ID_MASK         REG_GENMASK(7, 0)
>> +
>> +#define RING_QUEUE_TIMESTAMP(base)             XE_REG((base) +
>> 0x4c0)
>> +#define RING_QUEUE_TIMESTAMP_UDW(base)         XE_REG((base) + 0x4c0
>> + 4)
>
>I'm looking in bspec (73988) for the queue timestamp vs the context
>timestamp (60318) and the description is identical. Why do we need to
>use this instead of overloading the context timestamp? These multi
>queue queues are still contexts from the perspective of the CS. Does
>the queue timestamp give us something unique for multi queue? Where is
>that documented?

For queues belonging to multi-queue, only the QUEUE_TIMESTAMP value in the LRC
is updated when the queues are switching. CTX_TIMESATMP is not updated since
the entire context is not switched out, just a subset of it.

Thanks,
Umesh

>
>Thanks,
>Stuart
>
>>  
>>  #define RING_TIMESTAMP(base)                   XE_REG((base) +
>> 0x358)
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c
>> b/drivers/gpu/drm/xe/xe_lrc.c
>> index be1030c74e21..1e407a761076 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -21,6 +21,7 @@
>>  #include "xe_configfs.h"
>>  #include "xe_device.h"
>>  #include "xe_drm_client.h"
>> +#include "xe_exec_queue.h"
>>  #include "xe_exec_queue_types.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_printk.h"
>> @@ -2638,17 +2639,72 @@ static int get_ctx_timestamp(struct xe_lrc
>> *lrc, u32 engine_id, u64 *reg_ctx_ts)
>>         return 0;
>>  }
>>  
>> -/**
>> - * xe_lrc_timestamp() - Current ctx timestamp
>> - * @lrc: Pointer to the lrc.
>> - *
>> - * Return latest ctx timestamp. With support for active contexts,
>> the
>> - * calculation may be slightly racy, so follow a read-again logic to
>> ensure that
>> - * the context is still active before returning the right timestamp.
>> - *
>> - * Returns: New ctx timestamp value
>> - */
>> -u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>> +static struct xe_hw_engine *get_hwe(struct xe_gt *gt, u32 engine_id)
>> +{
>> +       u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>> +       u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>> +       struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class,
>> instance, false);
>> +
>> +       if (xe_gt_WARN_ONCE(gt, !hwe ||
>> xe_hw_engine_is_reserved(hwe),
>> +                           "Unexpected engine class:instance %d:%d
>> for context utilization\n",
>> +                           class, instance))
>> +               return NULL;
>> +
>> +       return hwe;
>> +}
>> +
>> +static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>> +{
>> +       struct xe_exec_queue *primary_q = lrc->multi_queue.primary;
>> +       struct xe_lrc *primary_lrc;
>> +       struct xe_hw_engine *hwe;
>> +       struct xe_mmio *mmio;
>> +       u32 engine_id, queue_id;
>> +       u64 reg_ts = lrc->queue_timestamp;
>> +
>> +       /* Ensure we are PF, primary context is active */
>> +       if (IS_SRIOV_VF(lrc_to_xe(lrc)) ||
>> +           !primary_q || !primary_q->lrc[0] ||
>> +           xe_lrc_ctx_timestamp(primary_q->lrc[0]) !=
>> CONTEXT_ACTIVE)
>> +               return xe_lrc_queue_timestamp(lrc);
>> +
>> +       /* if primary queue is active, we have a valid engine id */
>> +       primary_lrc = primary_q->lrc[0];
>> +       engine_id = xe_lrc_engine_id(primary_lrc);
>> +       hwe = get_hwe(primary_lrc->gt, engine_id);
>> +       if (!hwe)
>> +               return xe_lrc_queue_timestamp(lrc);
>> +
>> +       mmio = &hwe->gt->mmio;
>> +       /* check if the queue is currently active and then read
>> timestamp */
>> +       queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
>> +                                xe_mmio_read32(mmio,
>> RING_CSMQDEBUG(hwe->mmio_base)));
>> +       if (queue_id != lrc->multi_queue.pos)
>> +               return xe_lrc_queue_timestamp(lrc);
>> +
>> +       reg_ts = xe_mmio_read64_2x32(mmio, RING_QUEUE_TIMESTAMP(hwe-
>> >mmio_base));
>> +
>> +       /* double check queue and primary queue are still active */
>> +       queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
>> +                                xe_mmio_read32(mmio,
>> RING_CSMQDEBUG(hwe->mmio_base)));
>> +       if (queue_id != lrc->multi_queue.pos ||
>> +           xe_lrc_ctx_timestamp(primary_q->lrc[0]) !=
>> CONTEXT_ACTIVE)
>> +               return xe_lrc_queue_timestamp(lrc);
>> +
>> +       return reg_ts;
>> +}
>> +
>> +static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc,
>> u64 *old_ts)
>> +{
>> +       *old_ts = lrc->queue_timestamp;
>> +       lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>> +
>> +       trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
>> +
>> +       return lrc->queue_timestamp;
>> +}
>> +
>> +static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
>>  {
>>         u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
>>         u32 engine_id;
>> @@ -2680,24 +2736,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>         return new_ts;
>>  }
>>  
>> +static u64 xe_lrc_update_ctx_timestamp(struct xe_lrc *lrc, u64
>> *old_ts)
>> +{
>> +       *old_ts = lrc->ctx_timestamp;
>> +       lrc->ctx_timestamp = xe_lrc_single_queue_timestamp(lrc);
>> +
>> +       trace_xe_lrc_update_timestamp(lrc, *old_ts);
>> +
>> +       return lrc->ctx_timestamp;
>> +}
>> +
>> +/**
>> + * xe_lrc_timestamp() - Current lrc timestamp
>> + * @lrc: Pointer to the lrc.
>> + *
>> + * Return latest lrc timestamp. With support for active
>> contexts/queues, the
>> + * calculation may be slightly racy, so follow a read-again logic to
>> ensure that
>> + * the context/queue is still active before returning the right
>> timestamp.
>> + *
>> + * Returns: New lrc timestamp value
>> + */
>> +u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>> +{
>> +       if (xe_lrc_is_multi_queue(lrc))
>> +               return xe_lrc_multi_queue_timestamp(lrc);
>> +       else
>> +               return xe_lrc_single_queue_timestamp(lrc);
>> +}
>> +
>>  /**
>> - * xe_lrc_update_timestamp() - Update ctx timestamp
>> + * xe_lrc_update_timestamp() - Update lrc timestamp
>>   * @lrc: Pointer to the lrc.
>>   * @old_ts: Old timestamp value
>>   *
>> - * Populate @old_ts current saved ctx timestamp, read new ctx
>> timestamp and
>> + * Populate @old_ts with current saved lrc timestamp, read new lrc
>> timestamp and
>>   * update saved value.
>>   *
>> - * Returns: New ctx timestamp value
>> + * Returns: New lrc timestamp value
>>   */
>>  u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>  {
>> -       *old_ts = lrc->ctx_timestamp;
>> -       lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>> -
>> -       trace_xe_lrc_update_timestamp(lrc, *old_ts);
>> -
>> -       return lrc->ctx_timestamp;
>> +       if (xe_lrc_is_multi_queue(lrc))
>> +               return xe_lrc_update_multi_queue_timestamp(lrc,
>> old_ts);
>> +       else
>> +               return xe_lrc_update_ctx_timestamp(lrc, old_ts);
>>  }
>>  
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h
>> b/drivers/gpu/drm/xe/xe_trace_lrc.h
>> index d525cbee1e34..988d360143dc 100644
>> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>> @@ -12,6 +12,7 @@
>>  #include <linux/tracepoint.h>
>>  #include <linux/types.h>
>>  
>> +#include "xe_exec_queue_types.h"
>>  #include "xe_gt_types.h"
>>  #include "xe_lrc.h"
>>  #include "xe_lrc_types.h"
>> @@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>>                       __get_str(device_id))
>>  );
>>  
>> +TRACE_EVENT(xe_lrc_update_queue_timestamp,
>> +           TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>> +           TP_ARGS(lrc, old),
>> +           TP_STRUCT__entry(
>> +                    __field(struct xe_lrc *, lrc)
>> +                    __field(u8, pos)
>> +                    __field(u64, old)
>> +                    __field(u64, new)
>> +                    __string(name, lrc->fence_ctx.name)
>> +                    __string(device_id, __dev_name_lrc(lrc))
>> +           ),
>> +
>> +           TP_fast_assign(
>> +                  __entry->lrc = lrc;
>> +                  __entry->pos = lrc->multi_queue.pos;
>> +                  __entry->old = old;
>> +                  __entry->new = lrc->queue_timestamp;
>> +                  __assign_str(name);
>> +                  __assign_str(device_id);
>> +                  ),
>> +           TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu
>> device_id:%s",
>> +                     __entry->lrc, __entry->pos, __get_str(name),
>> +                     __entry->old, __entry->new,
>> +                     __get_str(device_id))
>> +);
>> +
>>  #endif
>>  
>>  /* This part must be outside protection */
>
