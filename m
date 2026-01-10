Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1870D277CA
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 00:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359EA10E238;
	Sat, 10 Jan 2026 00:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUvf2MS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537BF10E07F
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768003761; x=1799539761;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iyl/gDTTLDJ7nzlXTmbshHdiY7NNkN1L8Z+/5N8XfZ8=;
 b=NUvf2MS3i0rrP6vPspZe6hVI+dO73cbfQvOER7FIIwtzny1vOjEEPSPI
 PPdyJMtRd3yIoJ8QliRawbKIeBbgK1Dwz10h3BBqAJHSqMZQUlJkRHvbX
 38mXj4nhU58sqb8mPmZwD3BX3LPTrSzBZ1ZTE2vSK3hNeysbtPj9du0N5
 cKn3h6XdDXOlgQ6WyusnadClvJzmyBjycNPuPSbbPB1M9MXtI71WjwPsH
 /mj4wtBSQf/GUpeYsagUnpq4EKnh4xdRZA7XNCUj4v4oYOty++rlluX5x
 to1nYHwJPTpgFAkznVhJX91n7p/QHmUCu4141/TgIVaQI8bfaJs0f7z/m A==;
X-CSE-ConnectionGUID: SyzdOjHqQ/+EhGirT/bBRA==
X-CSE-MsgGUID: c0JuzMlbTaWjgrjpMO1smA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69315633"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69315633"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:09:20 -0800
X-CSE-ConnectionGUID: /pRuIWKfTju0B7omV9J2eg==
X-CSE-MsgGUID: HUfXfhYLTCKYVlc7NvjM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="226942115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:09:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:09:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 16:09:18 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:09:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIKP23TRIgFUhw/cN58Ptsw6VPZx1hup3Gr/mgjNRWdKBCzprVTHcR5dFjMy8LhY5yfkbYCjYtz+EZruVYUZ+3LoKlvjaJzOQogMzX3JzRLNl04YWexmzII22Ro79/Tf97VV54SXICx9wufKIOJlkxh9bMjdNFx7HvtHjTyaqCzl7tSJMMnavbfxrFoTljw9c5XBQhuhMVLR2oIhF7y1lQ+TMKB4V/uSNrk0G3cfz/cdJ3T+8VSpfjrHOgFxVp2SjwYyIOOSx3sm1vtpRQ51GfnXmqQvCH7fBlKLTU4fAkgzS5rNyWpqJvZ5KpEUFSsOafPJtCLR8Nr2zUsGbOeE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJp2xQJ2s7RLyysamFdxZagIvSo8S9AZNWfeG/vRjuo=;
 b=lSTelnuPjfAQLkRUvfTJlgFN8M0b1o8ZQFGI8wXTPhUgknPvt5mtlIUhbTjdE0Z9nevdYpTJcsa9p/FtNA4JiW+4rJPsjHfvYInNNZQB0ytceYzzoacJoJPIv8aCAilmpuJaRySrFtnmSisqcTYGku5R5CPGhQrNBG7e4vJ6jTnySs9bFyRHsz+usEZ1w244BVOMn5MjttGV9+dwTDXZnIaGcjoqwnbYlzIPipoZ4xzNxe4ha3LXjx7gXu6NXPZhEaA/cPz/rcvWsHhELZtGDRIC/EEaD3SrKVWc0XGYagga87vLzcmdzFUAKDHq0zr/ZUudd6xADHW6oOp/TVlG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 00:09:11 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9499.003; Sat, 10 Jan 2026
 00:09:11 +0000
Date: Fri, 9 Jan 2026 16:09:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 1/6] drm/xe/sysctrl: Add System Controller register
 definitions
Message-ID: <aWGYoBK32dbDm8D1@soc-5CG1426VCC.clients.intel.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108120548.1015154-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:303:8f::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 22582bc4-fe7a-41dd-28ad-08de4fdc7b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2lndXFVNzEwOGxtVUxWVFRSL2x2VjRCcXIzVXQ0bzU4Y0QwSHQ3RVpuTkc2?=
 =?utf-8?B?Vkx4SmJVWHpuVkNMWTArRVlqMi9JWTAvQ0g2Z2hIYXNvcGtOL3IvTm9YTmRV?=
 =?utf-8?B?emRMbXUvVlhLRGJXK0lVaVhHSlYzNHZUUnB0aG9iRThMOUFFbklwZHlyNzMx?=
 =?utf-8?B?MmVWNURKTi95YlA1cDA1SEhWcFRCcmcwK1hrTXRaTGUyajA1U2RPZ2ZTSlpn?=
 =?utf-8?B?eHJGOEZaZDFaTVYvbWducnB5SzRYMEdjRjExZWNicXdIRXhCWGJWNWt3b3U0?=
 =?utf-8?B?bkJEUTJpaWZYUWY2cit6SGVKSDZRMDN3YWhXaThtZDAvTlQ1Zlp4WUpNMWY5?=
 =?utf-8?B?MTloVmZrUERKZXRudllhUjVveXRxVmdvaTR1bkNBSlpHaXhPbWhzbmlnYlFL?=
 =?utf-8?B?Vkw0a0I2aVhlNXRQSFROcjV1WHNrSVBMYWtxZGQwaUJXYlNGOW5uWnhzTkJk?=
 =?utf-8?B?NXQxS0JyRU4wNHVYWFFjYjFJQ093Mjg4OFNxZzhvSi9VdTNnWm9CanNnZGQ2?=
 =?utf-8?B?VExOVlZ1SGczTnd4eEVXakJGNFNmWFNVSnh4eTM0NjBBNzBrS1JPVHZCOWpj?=
 =?utf-8?B?ZERoQ3dEU1hpODNhR21STEJtQkxwOGplRzhoZHhUQ0hrdXVDRnJXd0hheEVE?=
 =?utf-8?B?YTdBWXJSaWRaRUtFWit3c3o4OVN6bXZEODJ6U3Z2WGpzU2RhKy9SWE5PNmRK?=
 =?utf-8?B?NkdvRVYvNjBmaEt6Zm0rd3E0b2laakNSL1ZHYmgzYVR0SWoveE42bmwrQTkr?=
 =?utf-8?B?eUhOUE9QSWVwUFduM2E3Ujh5Y1FDTVJhaEdGZEYrQmViOXFpZ0I4K0duTkI0?=
 =?utf-8?B?bmFUUW56VTlzNEVjWFB0aHNjdDlJZy9sdnV2UjlLaGJ2WmtEaHByUHVKUjdn?=
 =?utf-8?B?NG8vc2dBY3pyb0k0WE0xQ2JqNWwrbTE2TnFOQmpHbWFraUF5SmRXY2xPVDBX?=
 =?utf-8?B?UHM2b0JhZ0xaL0ZJT0ZmNXd3K3VPVEx2dmpkVHl4V2JVRVF0TTMwMy9mejJy?=
 =?utf-8?B?L1F2dW9naDR2bzRjZy9aYmttTldJM2dSVTAvS0hlOWIwcUcyc1hjNUpXSHNL?=
 =?utf-8?B?TysyUHN3dFBRdTZhV200VnRIVXZsYmdtcytoOUZjRWFmMjV1SUNXNTdQc3Uy?=
 =?utf-8?B?TUUwWDFjaEwxM2R0dUwyeE5qaGZJSEJVb1h1dEpoZ0N5YnZ1bnZWd0wvbXhQ?=
 =?utf-8?B?Nm5GcUpob3A2Q3cxVUNhZkppcmM5bHZZZ0MxbHc3OU9VODQ5WVVBZG5aVUMv?=
 =?utf-8?B?blUyTTcvMkI5Wm5QS2dXSEw5RGFKVWhRd1ltOU9HTWoxeFcrYW9UeDFRN2pl?=
 =?utf-8?B?QVlhQm9uem82aWl6OTZyaUVZQW90cVhOSFhpb0RGUC94aitDV3BENCtwclBI?=
 =?utf-8?B?MGw1bXdaZUFXRFNEV3lad2NLTFdTRVpKbzhPNUdVZitMbkJSVGpSVkw2YUtK?=
 =?utf-8?B?dGtERTlkc1AxaUUxMXJ4NE5SQTdoejVmOXNCRE02V3JHSDVmcm8zNW92a3lS?=
 =?utf-8?B?WnZVRytNOFRYYmFTMUhRNVNtSitwendmaExtYnFFYnZ2OFEwREZmakRtOFdD?=
 =?utf-8?B?UUdzK0ZYSk9PR3F6RlB3ZXdkTXNuVWMyTlpxQjNodEpjMDE5cUJvUFFmQ0ZT?=
 =?utf-8?B?OGh4NWt2Tm55a3VMMGx1QStpNDhTSjAwZkhrelRFRFJsSE0wVEl2c1VLUjgv?=
 =?utf-8?B?eGE3ZklMd1dhMEk4RGVQUFNZRFBOQlJlVmdvbVVxTlRnL0U3bGxFRmwybG43?=
 =?utf-8?B?REw5OVJkekkySEc0WmY4RC9nOWtFL2t3RE1lNEVMWTdnSUtJNGdUL3BMZkx0?=
 =?utf-8?B?UldDeHJSUlN0Nm84ODlQbCtyUVJlU1A5aVE4R3VIWXRHa0N2am00WjZBNUx0?=
 =?utf-8?B?ZEUwZHlFUGVzRTVzOWxHeGRtQ2N1cjVmQXB3UVlrTVFaTWl6YkNCT2ZNZ0FO?=
 =?utf-8?Q?fELvizA1NRSYBiJNXAH5i6++AMPRUPIa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFjcEl2elFTLy93V2FaWE12WWprS3dTTGxtYjh1dUlGaXBvV0dNRXVyNnMx?=
 =?utf-8?B?amtVdG4rbjFZZGJhZUNML2FYVElsODZMb043amlIVEVWNW43RFp1UmxNYm12?=
 =?utf-8?B?TW9Ga2lBbmUzUmpaWHdNWUxXbjFESnpWMGdEcWlhOE9UTXRKRWUyS1ZzOXdR?=
 =?utf-8?B?SE1SUkNtQVluZWdHOHcvZk9VdW5lSXlwcENaTHVvVVdDZm02SEd2dzN3MmlV?=
 =?utf-8?B?T0psVWo0MjNhNnNFUmNLSGZPVWlJbVcwSmtKcC80K21zSnRYT21vdnVxMy96?=
 =?utf-8?B?VTBxRlczUUdzMFkydzN2bjlsckFMWCtlcUpGdHFpaGtGdFdPVzRVWmkyR1hy?=
 =?utf-8?B?ZXJsU2NIdXMzeDdHZndRVGFYT1h1Yysza3JGOXg0eVFIbXBTKzVKdE9tV3Js?=
 =?utf-8?B?Zk01My9oM2JMVHhraEp1SU9oaS9lWENoZ1g5NWt0dGh4QlhoU3NBR0p6bDFa?=
 =?utf-8?B?NmVaVkRVaTdNSWV0bGtyRWFCNUx5RHdCL0g5RHhvRVlBM3prc0RQU2t0d3po?=
 =?utf-8?B?aXExWnFibjBPS25HMDZJejBpdUlDaHZhd1plODF6SVFJM0xQenJXNndzMHlr?=
 =?utf-8?B?aDliRHVYbExPbWdYaDc1cFExZ05zWHgvQm04TXp3NVpSS1Q0YnBFa2d4VXdE?=
 =?utf-8?B?WkYxelJUMlIvSVBLV1BQOEVQTnl3RGI3a3ZSS1hVVWZMM1psd0VzbVdIaEts?=
 =?utf-8?B?UmlLVWNMVWVmWWxsNFIwdk8rcElUdkw2ejc4MlJDemhwcXRyOWwxVGhXalVw?=
 =?utf-8?B?UVVqeHhlY3laU0lvaE8zVjBEYlBLOWxPY0EvTzFxZUJodEJOYmNHdzdVTEdM?=
 =?utf-8?B?Vjk5b3IyWmVwZ0dSMVZraWxyUXFDeTh5Sng1MzNXMENmMVN0YTlmWVRxVnNY?=
 =?utf-8?B?cU85a25aLzFsWlNYWTFCb2tNSjd4YUsxUHB6UEU3d3BvU1hXU0FiWDc1cmpw?=
 =?utf-8?B?ZTdlQnV3K1NoTHBONzlyQkRqRmlDRkxhc09haUdPcThyY0NTdGZlejkxem8z?=
 =?utf-8?B?OXoyUHh5dklyN21LRVEzR25FdzN3WFJDNGNxcFVzcGtEdUpkTnp3VlNCNkwz?=
 =?utf-8?B?T0FFMUhqNzRiUFJBejZzSEJya0o4VW1ubFJ3dlEvSzEzNEh6Q2Njci8xaURT?=
 =?utf-8?B?Q2IrZzE2ZUk1aVF6L0FodXV4SmJnci81dEViaXVBY0FXODlaSkNMMnRDMU40?=
 =?utf-8?B?UUdBak1qb3lsVCtGZFVvK1JpNERCSzJhMGpmL3FZN1VjampOSFlOdTZVVG0w?=
 =?utf-8?B?SndTMzYrcDVzWFdOSHBnVVJ4WWVmR095NVNQOG9Rb3RtdE5SNVBSZUpSUC9q?=
 =?utf-8?B?UWVqUUdRMTFhVXJJcDIyaUN3ZVRud0lDNjZ6bURmY1hCR2IwSkcvM2RtZm9O?=
 =?utf-8?B?aldTN1VGcWdvUWFwcE1hQzZHNFFVNmpETXVTZ1piVzZSTk1vaWdnbnV5ZHdB?=
 =?utf-8?B?NnRKYkZtTm1aQXpHMVlDSlY1V095MzZHc1NPemU4Y3VZQW96anFVQ2E3OXVr?=
 =?utf-8?B?R3ZNc3loNVd4dzZOaG9xekEyenZxNjRlcWhjZU0wNFZ6ZU44c1pGMDFZTE84?=
 =?utf-8?B?SVFKNlI5UGgrUzhnMDJxaXZxdkRReWpxelZDQVNRTGpBbExvRWVRS3hVdVVC?=
 =?utf-8?B?NlZVaHlSaFhqYWpWS3ZOL0hBYWFBdDl5WHVUNld5cVVYc09FWk5vcGovR01y?=
 =?utf-8?B?eXFhWXNLemVkL2Z1aHdhOUdwUHFpVGhHQ0RkUHcyVENLQXFBNDZ3dGtyOFJL?=
 =?utf-8?B?NFZMSWFmak1sYjFxVzdmWTlPZlVXbUNwZDJtTkZwWjIvSW9KbXU1bSt2YXRK?=
 =?utf-8?B?WkYxOGg4L0pkQ203TFlCRSttMnBENDUzbDh1U2pqYWRQdWpJSXRaaWk4cDli?=
 =?utf-8?B?UnhxRlpXRjd3Q3JSTHZWSDZFUlNpenZpZzA0Q2VBa25yYU5MUjlITEF5UnI1?=
 =?utf-8?B?bmpGclhMZGRXY3FxTldqK1BuWmU2M0g3N2h4VlNVUVNwcTI1aE42OFJtOThy?=
 =?utf-8?B?U0hFbEZGZFJEWEtZQzNjQ3JIZ1lnR0F1amg5WU51SWlONkR3emhYUy9sdGtY?=
 =?utf-8?B?QTNoY1doMWQzV3BzT0xLNFRiUXAwY2pCVzhuL3lNMmJ0MVpLYmdXaVNlU2dn?=
 =?utf-8?B?QnY0ai9zb1V1b0JIOGlmbThhd1RuVlRtNlBMbUYxZHJKT3VWZ3VPVDNLSlFC?=
 =?utf-8?B?MUFwYkFFS1I4NWlFQ1VUMHVHZXQvY05ja29RVGQ3QWVjWjQ4TGJsMjZGZzZ1?=
 =?utf-8?B?Q2d2eEtTczFXTVl5ZUN4VU9uSDVPdk12dyt6SDdmSGpTS3Uwc0ZqZEFLYU5Q?=
 =?utf-8?B?NkN4RXorNnlXb0hrMFZJN1BXUURCdUNnc3VPRWd6TG9laVoxbHdOblA1TndT?=
 =?utf-8?Q?58b0SN3ytjSfxpoFuUKWPbXV38Oq7IuW5IhM9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22582bc4-fe7a-41dd-28ad-08de4fdc7b4d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 00:09:11.5313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXi5YO7rchFyJIci4wF9N3ZQbfWuUtXx9TdPERY2Kn7wwXrj1lO8YZoRM9bxcCu8RK5iOlrpxkpAohBK7Cm+3D1O2TV2Saq64rU1FaFbTEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Comments from other reviewers still need to be addressed though.

Thanks,
Umesh

On Thu, Jan 08, 2026 at 04:05:49AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add register definitions for System Controller mailbox
>interface on Xe3p dGPU platforms.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 44 +++++++++++++++++++++++
> 1 file changed, 44 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>new file mode 100644
>index 000000000000..e0b630654fe3
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>@@ -0,0 +1,44 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_REGS_H_
>+#define _XE_SYSCTRL_REGS_H_
>+
>+#include "xe_regs.h"
>+
>+#define SYSCTRL_BASE_OFFSET		0xDB000
>+#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
>+#define SYSCTRL_MAILBOX_INDEX		0x03
>+#define SYSCTRL_BAR_LENGTH		0x1000
>+
>+#define SYSCTRL_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
>+#define   SYSCTRL_MB_CTRL_RUN_BUSY	REG_BIT(31)
>+#define   SYSCTRL_MB_CTRL_IRQ		REG_BIT(30)
>+#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
>+#define   SYSCTRL_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
>+#define   SYSCTRL_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
>+#define   SYSCTRL_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
>+#define   SYSCTRL_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
>+
>+#define SYSCTRL_MB_DATA0		XE_REG(SYSCTRL_BASE + 0x14)
>+#define SYSCTRL_MB_DATA1		XE_REG(SYSCTRL_BASE + 0x18)
>+#define SYSCTRL_MB_DATA2		XE_REG(SYSCTRL_BASE + 0x1C)
>+#define SYSCTRL_MB_DATA3		XE_REG(SYSCTRL_BASE + 0x20)
>+
>+#define MKHI_FRAME_PHASE		REG_BIT(24)
>+#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
>+#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
>+#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
>+
>+#define SYSCTRL_MB_FRAME_SIZE		16
>+#define SYSCTRL_MB_MAX_FRAMES		64
>+#define SYSCTRL_MB_MAX_MESSAGE_SIZE	(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)
>+#define SYSCTRL_MKHI_COMMAND		5
>+
>+#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
>+#define SYSCTRL_MB_RETRY_TIMEOUT_MS	20
>+#define SYSCTRL_MB_POLL_INTERVAL_US	100
>+
>+#endif /* _XE_SYSCTRL_REGS_H_ */
>-- 
>2.43.0
>
