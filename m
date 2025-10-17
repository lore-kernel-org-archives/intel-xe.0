Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B099CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 14:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20E110EC44;
	Fri, 17 Oct 2025 14:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6gfK58B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562C910EC43
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760712501; x=1792248501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zuFPpvkvMdFKl5lT4nVyXjj35pY8NDjvshwz8o5C6yc=;
 b=L6gfK58BADKp0HAuxWDNDuDj3Up7ZfNUulG5DQBIGeOVSDejX5NDGcWF
 9hubvkotdH+gIpO5Q8wOydgm3G/EbJ+CoWJxCjRmFrhzHHt08LE+eRXOE
 i9BagQBGdFb8V4hQwcuGfR9wCUPmJ+rGGyW49LRDJCxdB6K1976B+qPNn
 pMczZ20oYXaDj00SrpI8vQwwspGJ27WK/M4wj1koi0Py7QAQ+UfZ7K+6O
 YgLTGtOKBtSGqClyRDxh5klbsxeyJ/kNWqUCglSt/qiCcVNdlAPWU5jnK
 AjBmFRNo7ikaUTYQbC7mkLZvPvKrHDKYbam9F5XUtQPGvDLsdL9EYtbv5 A==;
X-CSE-ConnectionGUID: Jc/vqrUHQ2eeiqS/+2x+Bw==
X-CSE-MsgGUID: Opifn2jtSGOc0sB/RnmoiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="85543118"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="85543118"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 07:48:20 -0700
X-CSE-ConnectionGUID: 6g73kkqvRqqM1UJtKP7HIw==
X-CSE-MsgGUID: SBooz4QERsezE5whXzNg6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="187844560"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 07:48:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 07:48:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 07:48:20 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 07:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov68OXh8TaY4fkupFsDZ7aRIBlDgW2fKuAaziFeREwHSkYE2m4VyH5zFpJOIyde4uwKcvHo77isjemiOePSmP+y3JOI7TctRDB6NlJuqsi1WJr00wpfb3mEFQnzt3myyCuGV+qCrMAvju8S+41xKfE9RBF020HE27rB0l5Fcntphb79axfYoiN+6bB2J1BYAbhW0QhxZYjPCaJ76BCNqujXvSZJdTC+CbbYyIoAWABEbYBuyC/yIEKp9ltt1drjnTaiL6p/P+ZrYs0gPXID47Apz9ZdE2j7nHe9OO79l/og+lDr3wlWQOVwQMwnnMIGGa3Q6+ltN8jaDZwF+3Y3wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuFPpvkvMdFKl5lT4nVyXjj35pY8NDjvshwz8o5C6yc=;
 b=qZ5EOWVWOJEbNayFRC0f6Y+VMVptsRkKHcFqqpzXbSfaoWYsAye8xiM6DZ/UfWGmelaN01xvvBQEHKgvbS5d2iqKMwW2rgIPMYqr3CyhewWOvstK/u5GMWff+ukzCajDnUDu8ExLE6R22DPOJU8BEeint7uIiFabUPc9yo3UEhGMO1DJ0/KDfKhW3rIa+eBgwVuc8G8uf7wbAeHTVjOMjComz0iNK6bPFqR2q8fMrvn2a7bpL/Wz8nyhGcYjY7smOKq/tQgEZJlCuzSJL5bNyu3bHKqLlKAQ7loPzn5yCO+MyW3pU/GyczYuzefuedPFQIkD5rtTWaeoH6NVtD7p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 14:48:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 14:48:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Thread-Topic: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Thread-Index: AQHcPTW52nNpkmZQjEa6el8c+p1XyLTDnh6AgACFKYCAAO0WgIAASKEAgAEWswA=
Date: Fri, 17 Oct 2025 14:48:11 +0000
Message-ID: <f213a216ae227f0119f8a50cc968c728a26bb44b.camel@intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <20251014180927.105077-7-stuart.summers@intel.com>
 <fa2d3d56688c64f27baadda86bc1aa8be118179b.camel@intel.com>
 <aPBpkZCqyqgfGO4g@lstrano-desk.jf.intel.com>
 <6b77ddd884c30312f76ded9adfd1cfb79fb9f92c.camel@intel.com>
 <aPFtYIRh2Q/3Z64G@lstrano-desk.jf.intel.com>
In-Reply-To: <aPFtYIRh2Q/3Z64G@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB7069:EE_
x-ms-office365-filtering-correlation-id: 05f2e4ee-0785-49f4-c83b-08de0d8c3201
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WEw3c1B2ck9sSXFEdGZ3b1V6Z1o0NjlxcGFhUHI1WEdaTlgzR1lZd3A5cUsy?=
 =?utf-8?B?OFJnSnhPbWgwWUE2Njc1NU85bzdTQ2VheXJVVXcwbVpZU0FTcmVlV0xoZDZt?=
 =?utf-8?B?Ri9VNm1UNWk0TGxPbHZuMWNmNitDSmN1YU5DOER0TnhGYmlYVGYrVVFFZ2xN?=
 =?utf-8?B?ZkxzWFpXemFuandCWXByOFg5Q2tSVGltZEg3SmZWdHgrLzV4cllISEVvZnJO?=
 =?utf-8?B?Z3VsK05RbmZEUHVpZzZLQ2M1Wkc5NHhCUitPYlpCbHVJQWp0WXhJNVVsNit2?=
 =?utf-8?B?ZGd6aW1aUXN3OEc5MmhtMGIwcXo2VVdFUVhESVUrRk4xeVBVWGloNUl3NmpE?=
 =?utf-8?B?OWx3TnNpOFh4YUhzT0hHcUFBSWdYZUtnYU9peTBtdEVod21OQjFzRlIxeHpR?=
 =?utf-8?B?NEFtcGxQaFhQblpSeHpDa1J5V2VtQVhvSWFNOEVFSFJzYlJwaUNnb2VqaFVF?=
 =?utf-8?B?c29nUXBGV0F4Uk1UdmJveXl1c2tkRGtzZlFLQUZVdXA2ejZkTHhrbWhVdUtp?=
 =?utf-8?B?T3AxTDNPa1ZhSUp0SThpcUtMWTlRVWJBdUprdE9YY1Vib2pjNlhOM0ZyT0RZ?=
 =?utf-8?B?ekNWQnd0dnQwVGdUT3M0dGh2b1J3QmN0RlpDcERsUyt1NU9pZjJHbThnWTlB?=
 =?utf-8?B?a3FaOTVkaU1uOVBYanMzNVZDRk5uSDlMZGcrdEJ3TEdQUVdod3JyY3lYMWxI?=
 =?utf-8?B?NmswTVN5cktrMXVCMU5yT0l4UTFKdmJNMU1MWGYrck9jalFONnVDQU45YXFL?=
 =?utf-8?B?V3hwZXBKZmR4TlNpTC9HN3pPcnhuVXZYUGk3V2xEckh4blE3QVJ5NUZsYWl2?=
 =?utf-8?B?M0RMS0xUd3ZGcUdvaUFRNENZSXNxZVcvTzdFYTR3ZlhPR2ZvdzVlSFRadmpS?=
 =?utf-8?B?U3l6ZmFLaFNBMzN0RDJ1M0RMMjhMelBJNldUS1lUTUQ3aWtNY2Y3dFBXTm1Y?=
 =?utf-8?B?OWFxSGpJcWE4QmNtZERVbXljMlFNcDdCczY1OFVSeDVKc2Z4cGxDb0s1ZTdy?=
 =?utf-8?B?UGpjZmdMQUxkeEFzV2crbjlZaFVEUkVWamRqMFhDZi9TVko4a3NGMDB5Ylds?=
 =?utf-8?B?Sk5Oclkzc09TSTlkbWRHREhmeTlZSEFqZUJLUWRuMXJLaTh2YjNCSmUrbyt6?=
 =?utf-8?B?Zk5FM1k4QU10QjAyTXV2Y2M1c3JIYmgrRHcvWVVLaUZQTmZHNHZzSFlsMHZm?=
 =?utf-8?B?cHdqQVZoSHhUU1FzcWh3aVd6aXNzRFhLMklVOFVDc1ZHRUsvcWNHSmVNVVBm?=
 =?utf-8?B?ZVFqQ2FrNXgyZGozNkpJMmVxM2Evd2Z3Ylp6UE15WnJMVW5JQWN6b3k1Z3hV?=
 =?utf-8?B?amdIdjB5M2J4MkVHY211WTdFTmR1cGlyZlU2VDZpK1AyTXV4Z3VQcW9QRFh3?=
 =?utf-8?B?RDV3Q0UyeHlJY2k0Q2ptMnlib2IwUzVGWnRVZEg0WFlydjErSUY2TmZiYXk4?=
 =?utf-8?B?V1JvQ011QUFrSWdmUzN4YTJtNEZEYy9DQXNac0ZIK1l5bStRTTNORnpQY1hS?=
 =?utf-8?B?eHptQ2tja1NMOGhZRGFDdjMxU2lsMlBqRVlrSVNIMU04cHZtbytsTEVzSXA1?=
 =?utf-8?B?TVJ3aytZUzBaNTk2eGYvL1A3SS84ZlNZWXdISEdTaVgrOWRuMlI5WEpTb1F0?=
 =?utf-8?B?MnFzaXpCOGJ0TERCWnpxQlpYazRkNTJXK093Z0RjVitOSXczdGZOQnlxNWpY?=
 =?utf-8?B?RUZhK1lQQ3hrWGw3WW9mTEhxUnk5M1FLanBROVhRL1lzSEFkNk9pTTJiRTlW?=
 =?utf-8?B?MGNTMWFqSjR0azlBMm03R0xaTjNVNkNha2puaXRyUzJoZUFkTjRtT2RPYVl3?=
 =?utf-8?B?VTVvb2JMMXRJOHp6OUVxQlpTWnFVQXZuMFMwWHhNazYrL0tYbjNiNVIrOG9X?=
 =?utf-8?B?ZFp1Z0I3SUViMUZ1L1AzUVpvSm02TWVtMFJOUFRtNHhoZjhhTDFoSFdOSUVM?=
 =?utf-8?B?TFFLQTVhMzE5b1JTdmNkK2xleStyZEhrbjZzc3dud0tSYTE4N2xmOWF6M0J0?=
 =?utf-8?B?V1VpbUV2b2wxSkFjdU43S0hlV2NMRHNTZkdzM1REWlJ6Mmpsc0psYzA1bW9n?=
 =?utf-8?Q?+qpBX2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0hlY0ZXamQ0SUJGV1JYOGdaeFJuYnVYejdrRHFGL2FGUGJ1dXo4bEVCblUv?=
 =?utf-8?B?TWNGOWlSOUE5V1A5QWdiZGZDRFRkanVNaVU4WjJIVm16ZEVaSGRuMFZrNkJN?=
 =?utf-8?B?MDJadlljNFQ4NU4xNklndnA0SCtiRklEZkIxdHhRMUVUY1h0NHc5WGlkY1R5?=
 =?utf-8?B?WGhlWTZ6U3pLV2Z6cTJuK0xIVmJHU1AzYUQwL3hMV0lNQ1VWNXdIVkRBRWV4?=
 =?utf-8?B?T0VUZWxXZ0dXUDZXRncrb0JsSVgweFoxSUxFNkVYZkYyVFU3OFYvVVZJSVp1?=
 =?utf-8?B?TGk1OUZha2dFRWFzM1ZVdWhpeFFpR1Mzd2JLZnV4M25jckNvQUVLTU5rWmRK?=
 =?utf-8?B?akkyMWJtMytFUUoyb0V2a29ySGRzbTA1Mm85R1lyMTlqRFRxVkEzRE5aMytj?=
 =?utf-8?B?UVBBN2UyY08wdlFyVHFhV3kzeFo1TEoxREVRSHV3L3JjREFTbWQ0WWRjZ0Vo?=
 =?utf-8?B?QzB5L2kwbGtMcEwxZ2VhemxEc3VYVU91M1hxcWg4YUFZdVpTREZvTjBlMFcw?=
 =?utf-8?B?enZnMDFLTVRIbDFpRlM0MHh2R0xtWjd0ckZEQk1jdGVmUml3bE45V0g1SWpM?=
 =?utf-8?B?eGlYeks1NGp5WXFBa2k3aCtmc3lUMTVqQVdvTGRVaHdidEFoTHFzOHB1ZzZo?=
 =?utf-8?B?cnIwWll2VjRLTkVVK0JIb1hhcTByc0xUM2crR242TW1KdTVlUWRuMW8wdjMw?=
 =?utf-8?B?eDl3Wit5djMvNzcwTWdlaTdVUnZLSWJTVUVIcGpvZ0VFNEZNa1ZRdW40OXFL?=
 =?utf-8?B?R2lmMzhXNXZtbmdRUEFIbU9FWHQzQmgvbURQbXZQdHZPYVBsaWR4SlhjamtG?=
 =?utf-8?B?NEpLTVQwZ3BhWDhyQk9BdjNxNjd2dkVjWVd5QzRhMlM2NXp4aFpGV2ZzcWU1?=
 =?utf-8?B?a1dONk1PYXE0UEtwRGxvQ0FIUDJvL2tiUmlyWHhBMzJtRXBaTjVpZDBpb3Jr?=
 =?utf-8?B?UXN0cTM0OTRhWTQ4Mmp0MGhOVDk2QktnK2trUjBWNGZjcjgxYXNiK3lXOHYr?=
 =?utf-8?B?d1AzdHJmRDFjeFVqaHovT3FKYnArWFh0djZSYVBLNDRNckVRU0NxQUdYZlMv?=
 =?utf-8?B?OUhuU05CQjlnVkdaTWptMWZwYW9XR2FqbDdqNGdvN1VaaThaeHZnYjA5K3Ry?=
 =?utf-8?B?ZlRNMnlGVUdFQmk1eFZtVzUyQmloRTVnVzBSTGFnTGpuSUpTUnF4TFNBM1JK?=
 =?utf-8?B?Y000dUhKRUprUXVpV1NPdnJ0UjN0REwxVWtTQkw3ektheHNzN2xsY0JOYTNq?=
 =?utf-8?B?dHNPNjhlMWlRbVlydzZuSzZ2Y3pyYTltSDRUL3hUMFZONnJQcHFidml6dFRW?=
 =?utf-8?B?VGN3QWJCZU9ucHc3cDZHU1VVcmRpelZybXkvMjg4VUxkUVRUeU5iK25aV3RQ?=
 =?utf-8?B?QnUrUll0YmFhWktZRE9VVVFmL3VkYXVkcFF1dVNpem84ZzlTSFVuMm16WVF2?=
 =?utf-8?B?NFczcnVMbitHcUV5ZWZtRzBFTXpxclpzVjV2eWw2R1VYL1V5MlpEM0xRU2tJ?=
 =?utf-8?B?emE3a0NsNmx2aE93aUJrRnZFUW5uaklhb0Q4Q0h0MHUxbzBrU2tycmI3UmNM?=
 =?utf-8?B?aDVNVUtxMHBnOTlCUUZxTUFqbGt1cW5aSnRhY3AyVENKa2hPeE56YUs0ZlBO?=
 =?utf-8?B?RUdqR1BBZkgxcHZyRGN2dnB6SVNEaXRVbHRHN2wyczVESE9xcFRWZVpubHc0?=
 =?utf-8?B?cFMxREdtdjQ5aUZtT1lBNktYNGpCenl0Z0xWNS9pbmxBMlZKSXNybExMczNX?=
 =?utf-8?B?MVRMRHhVMHg4L1FZQXViN2pycnJVaDVHMVFoU0g0ZjNEcFFQOFFDdlFEMUEv?=
 =?utf-8?B?K0RlMjV6VGlSQm1UK3ZiVGxQTU1JYVF2SkJSU2lsSmY3VHJaYWc2a3BHM1Fw?=
 =?utf-8?B?K0Z0aU9ZdUJZZ3JrbVNtWGl4Y1Z3dllaN25yQjgxaWx2SS9PeDBoUlZSUHpn?=
 =?utf-8?B?aWtRdXFBci9DaU94U0E4N3lzQndJUEtuUnlCWmllc1RCQWxSbzUydk44N1RF?=
 =?utf-8?B?K2d2ZmkxWDFtdkdybDhoT2d0WHAwbXZjbkROb1JRVkVORTBpeC9BVmtyVlpY?=
 =?utf-8?B?S1I0ODhqQk1QVFdJOXp6UndGbnQreXl1eGFIV0svOHhQV3l2aVRuTkkwVTJs?=
 =?utf-8?B?UFFhQkhJSFlUY2tmd2taR3JSUjU5ZTZQSWU4UHhmYU4rYkJiUmR5Q3pkZlFR?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <333B19CC9AA50B41878A34DFDA48DE5C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f2e4ee-0785-49f4-c83b-08de0d8c3201
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 14:48:11.8457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yyQphbd1WyvpmtSU3D1uynfPGwQuqxtveBjt/xAWK4wj5kdW6YE4GGYZ6IJTZ1yfty3Q6fY0qscb4HvYDJN1Cht+8eKOVUKFMOUlwU9g3R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
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

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE1OjEwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAxNiwgMjAyNSBhdCAxMTo1MDo0NEFNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI1LTEwLTE1IGF0IDIwOjQyIC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMDE6NDU6MzVQTSAt
MDYwMCwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUsIDIwMjUtMTAtMTQg
YXQgMTg6MDkgKzAwMDAsIFN0dWFydCBTdW1tZXJzIHdyb3RlOg0KPiA+ID4gPiA+IENvbW1lbnRz
IGFsc28gYWRkZWQgdG8gdGhlIGNvZGUsIGJ1dCBpbiB0aGUgZXZlbnQgb2YNCj4gPiA+ID4gPiBh
IHdlZGdlIG9yIGEgaGFyZHdhcmUgZmFpbHVyZSB3aGlsZSBjb21tdW5pY2F0aW9uIHdpdGgNCj4g
PiA+ID4gPiBHdUMgaXMgb3V0c3RhbmRpbmcgKGUuZy4gZHVyaW5nIGEgc2NoZWR1bGUgZGlzYWJs
ZSBvcg0KPiA+ID4gPiA+IGNvbnRleHQgZGVyZWdpc3RyYXRpb24pLCB0aGUgZHJpdmVyIGRvZXNu
J3QgYXV0b21hdGljYWxseQ0KPiA+ID4gPiA+IHJlc2V0IHRoZSBzb2Z0d2FyZSBzdGF0ZSBhcyBp
dCB3b3VsZCBpbiBhIHR5cGljYWwgR1QgcmVzZXQNCj4gPiA+ID4gPiBzaW5jZSB3ZSBhcmUgdHJ5
aW5nIHRvIHNhdmUgdGhlIHN0YXRlIGZvciBkZWJ1Zy4gSG93ZXZlcg0KPiA+ID4gPiA+IG9uY2Ug
dGhlIHVzZXIgdW5iaW5kcyB0aGUgZHJpdmVyIHdlIHN0aWxsIG5lZWQgdG8gZ28gdGhyb3VnaA0K
PiA+ID4gPiA+IGFuZCBjbGVhbiBldmVyeXRoaW5nIHVwIGZvciB0aGVzZSBleGVjIHF1ZXVlcyBz
byB3ZSBkb24ndA0KPiA+ID4gPiA+IGxlYWsgbWVtb3J5IG9uIHRoZSBEUk0gc2lkZSAoZS5nLiBM
UkMgb3IgTFJDIEJPKS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBZGQgYSBraWNrIHN0YXJ0IHRv
IHRoZSBEUk0gc2NoZWR1bGVyIHRvIGhhbmRsZSBhbnkNCj4gPiA+ID4gPiBvdXRzdGFuZGluZw0K
PiA+ID4gPiA+IG1lc3NhZ2VzIG9uIGhvbGQgZHVyaW5nIHRoZSB3ZWRnZSBhbmQgZ28gdGhyb3Vn
aCB0aGUgR3VDIHN0b3ANCj4gPiA+ID4gPiBmbG93IHRvIHNpbXVsYXRlIHRoYXQgcmVzZXQgb24g
dGVhcmRvd24uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1
bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IFBsZWFz
ZSBob2xkIG9uIHJldmlldyBoZXJlLiBJIHRoaW5rIHRoZXJlJ3Mgc3RpbGwgc29tZXRoaW5nDQo+
ID4gPiA+IG1pc3NpbmcNCj4gPiA+ID4gb24NCj4gPiA+ID4gdGhlIHdlZGdlIGNsZWFudXAgY2Fz
ZSB0aGF0IGNhdXNlcyBpc3N1ZXMgYWZ0ZXIgd2VkZ2luZyBhbmQNCj4gPiA+ID4gdGhlbg0KPiA+
ID4gPiBkb2luZw0KPiA+ID4gPiBiaW5kcy91bmJpbmRzIGluIGEgbG9vcCBhZnRlci4gSSdtIHdv
cmtpbmcgdG8gcmVzb2x2ZSB0aGF0IGFuZA0KPiA+ID4gPiBJJ2xsDQo+ID4gPiA+IHBvc3QgYSBu
ZXcgc2VyaWVzIGFmdGVyLg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gU3VyZS4gSnVzdCBjb3Vw
bGUgb2YgdGhvdWdodHMgYmVsb3cgd2hpY2ggbWlnaHQgaGVscC4NCj4gPiA+IA0KPiA+ID4gPiBU
aGFua3MsDQo+ID4gPiA+IFN0dWFydA0KPiA+ID4gPiANCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAxNSArKysrKysrKysrKysr
KysNCj4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3Vi
bWl0LmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4g
PiA+ID4gPiBpbmRleCA1ZWMxZTRhODNkNjguLjBiYmFlMzM2YzcyMiAxMDA2NDQNCj4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiA+IEBAIC0yNzYs
NiArMjc2LDE0IEBAIHN0YXRpYyB2b2lkIGd1Y19zdWJtaXRfZmluaShzdHJ1Y3QNCj4gPiA+ID4g
PiBkcm1fZGV2aWNlDQo+ID4gPiA+ID4gKmRybSwgdm9pZCAqYXJnKQ0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7DQo+ID4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+ID4gPiA+ID4gwqANCj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqAvKg0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIElmIEd1QyBzdG9wcGVkIHJl
c3BvbmRpbmcgZHVyaW5nIGRlcmVnaXN0cmF0aW9uDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
ICogc29tZSBxdWV1ZXMgY2FuIGJlIGxlZnQgaW4gYSBiYWQgc3RhdGUuIEVuc3VyZQ0KPiA+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoCAqIHRoZXNlIGFyZSBhbGwgY2xlYW5lZCB1cCBieSBnb2luZyB0
aHJvdWdoIHRoZQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIEd1QyBzb2Z0d2FyZSByZXNl
dCBmbG93Lg0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqLw0KPiA+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoHhlX2d1Y19zdG9wKGd1Yyk7DQo+ID4gPiA+ID4gKw0KPiA+ID4gDQo+ID4gPiBJIHRo
aW5rIHdlJ2QgbmVlZCB0byByZXN0YXJ0IGhlcmUgYXQgbWluaW11dW0gYWZ0ZXIgY2xlYW51cC4N
Cj4gPiANCj4gPiBZZWFoIHRoaXMgd2FzIG9uZSBvZiB0aGUga2V5IGlzc3VlcywganVzdCB0cnlp
bmcgdG8gZmluZCB0aGUgcmlnaHQNCj4gPiBwaWVjZXMgdG8gaW5zZXJ0IGhlcmUuLg0KPiA+IA0K
PiA+ID4gDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IHdhaXRfZXZlbnRfdGltZW91
dChndWMtDQo+ID4gPiA+ID4gPnN1Ym1pc3Npb25fc3RhdGUuZmluaV93cSwNCj4gPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHhhX2VtcHR5KCZndWMtDQo+ID4gPiA+ID4gPiBzdWJtaXNzaW9uX3N0YXRlLmV4ZWNf
cXVldWVfbG9va3VwKSwNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhaICogNSk7DQo+ID4gPiA+ID4gQEAg
LTI5NSw2ICszMDMsMTMgQEAgc3RhdGljIHZvaWQgZ3VjX3N1Ym1pdF93ZWRnZWRfZmluaSh2b2lk
DQo+ID4gPiA+ID4gKmFyZykNCj4gPiA+ID4gPiDCoA0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBtdXRleF9sb2NrKCZndWMtPnN1Ym1pc3Npb25fc3RhdGUubG9jayk7DQo+ID4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoHhhX2Zvcl9lYWNoKCZndWMtPnN1Ym1pc3Npb25fc3RhdGUuZXhlY19xdWV1
ZV9sb29rdXAsDQo+ID4gPiA+ID4gaW5kZXgsDQo+ID4gPiA+ID4gcSkgew0KPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKg0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBLaWNrIHN0YXJ0IHRoZSBzY2hlZHVsZXIgc2luY2Ugc29tZQ0K
PiA+ID4gPiA+IG1lc3NhZ2VzDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIG1pZ2h0IGhhdmUgYmVlbiBhZGRlZCB3aGlsZSB0aGUgc2NoZWR1bGVyDQo+ID4gPiA+
ID4gd2FzDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHN0b3Bw
ZWQgZHVyaW5nIGEgd2VkZ2UgZXZlbnQuDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqLw0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9zY2hlZF9zdWJtaXNzaW9uX3N0YXJ0KCZxLT5ndWMtPnNjaGVkKTsNCj4gPiA+ID4gPiArDQo+
ID4gPiANCj4gPiA+IEkgZG9uJ3QgdGhpbmsgcG9zc2libGUgdG8gZ2V0IGhlcmUgd2l0aCBhIHN0
b3BwZWQgcXVldWUsIEkgdGhpbmsNCj4gPiA+IGl0IGENCj4gPiA+IGJ1ZyBlbHNld2hlcmUgaWYg
d2UgZG8uDQo+ID4gDQo+ID4gSG0uLiBzbyB0aGlzIHdvdWxkIGVpdGhlciBiZSB3ZSB3ZW50IHRo
cm91Z2ggYSBHVCByZXNldCBwcmlvciB0bw0KPiA+IHRoZQ0KPiA+IHdlZGdlICh3aGljaCBzaG91
bGQgaGF2ZSByZXN0YXJ0ZWQgYXQgdGhlIGVuZCBvZiB0aGF0KSAtIHdoaWNoDQo+ID4gaXNuJ3QN
Cj4gPiB0aGUgY2FzZSBoZXJlIC0gb3IgdGhlIGpvYiB0aW1lZCBvdXQgYW5kIHN0b3BwZWQgdGhl
IHNjaGVkdWxlciBmb3INCj4gPiB0aGF0DQo+ID4gcXVldWUuIFNlZW1zIGxpa2UgdGhlcmUgbWln
aHQgYmUgYSBidWcgaW4gdGhhdCBwYXRoLi4uDQo+ID4gDQo+IA0KPiBUaGUgam9iIHRpbWVvdXQg
bWVjaGFuaXNtIHNob3VsZCBhbHdheXMgcmVzdGFydCB0aGUgcXVldWUuIEkganVzdA0KPiBjaGVj
a2VkLCBhbmQgaXQgbG9va3MgbGlrZSB0aGVyZSdzIGEgYnVnIGluIHRoZSB2Zl9yZWNvdmVyeSBm
bG93cywNCj4gYnV0DQo+IHRoYXQgc2hvdWxkbid0IGFmZmVjdCB0aGlzIGNhc2UuIEkgZGlkIHJl
dmlldyB0aGUgR1QgcmVzZXQgcGF0aCwgYW5kDQo+IGlmDQo+IHRoYXQgZmFpbHMgYWZ0ZXIgeGVf
dWNfc3RvcCBpcyBjYWxsZWQsIHRoZSBxdWV1ZXMgYXJlIG5vdA0KPiByZXN0YXJ0ZWTigJR3aGlj
aCBpcyBhIHByb2JsZW0uIFdlIGxpa2VseSBuZWVkIHRvIGNhbGwgc29tZXRoaW5nIGxpa2UNCj4g
eGVfZ3VjX3N1Ym1pdF9wYXVzZV9hYm9ydCAob3IgYSBHVC1sYXllciBlcXVpdmFsZW50KSB0byBy
ZXN0YXJ0IHRoZQ0KPiBxdWV1ZXMuIElmIHdlIGRvbuKAmXQgaXQgY291bGQgbGVhZCB0byBtZW1v
cnktdW5zYWZlIGJlaGF2aW9yIGFzIHRoaW5ncw0KPiB3aWxsIG5vdCBnZXQgZnJlZWQuIFRoaXMg
Y2FsbCBzaG91bGQgaGFwcGVuIGFmdGVyIHdlZGdpbmcgdGhlIGRldmljZS4NCg0KV2Ugc2hvdWxk
IG5vdCBiZSBjYWxsaW5nIHVjX3N0b3AoKSB0aG91Z2ggaWYgd2UncmUgaW4gYSB3ZWRnZSBzdGF0
ZS4NClRoZSB1Y19zdG9wX3ByZXBhcmUoKSBhbmQgdWNfc3RvcCgpIGFyZSBwYXJ0IG9mIHRoZSBz
b2Z0d2FyZSByZXNldCB0aGF0DQppcyBza2lwcGVkIHdoZW4gd2UncmUgd2VkZ2VkLiBJbiB0aGUg
Y2FzZSBoZXJlLCBJJ20gZXhwbGljaXRseSBzdG9wcGluZw0KdG8gdHJ5IHRvIHJlc2V0IHRoZSBx
dWV1ZSBpbiB0aGUgcGF0Y2ggaGVyZSBhbmQgdGhhdCdzIHdoeSBpdCBuZWVkcyB0bw0KYmUgcmVz
dGFydGVkLiBUaGUgc3RvcCB3YXMgaW50ZW5kZWQgdG8gZml4IG9uZSBidWcgYW5kIHRoZSByZXN0
YXJ0DQphZnRlciBzdG9wIGZpeGVzIGEgc2Vjb25kLCBidXQgaXQgc3RpbGwgaXNuJ3QgdGhlIHJp
Z2h0IGZpeCBhcw0KZGlzY3Vzc2VkLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dCAN
Cj4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBNYXR0DQo+
ID4gPiANCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChleGVj
X3F1ZXVlX3dlZGdlZChxKSkgew0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmZ3VjLQ0KPiA+ID4gPiA+ID4gc3Vi
bWlzc2lvbl9zdGF0ZS5sb2NrKTsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9leGVjX3F1ZXVlX3B1dChxKTsNCj4gPiA+ID4gDQo+
ID4gDQoNCg==
