Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746CBECD6D3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 18:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB3D10E02D;
	Wed, 11 Feb 2026 18:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBkwfObW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896B10E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770834147; x=1802370147;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s9/Dn+FkV0q8ye8olzMAh9Fa6cNoaHwSznqG+FI4InQ=;
 b=oBkwfObWyYncBlwaBofeXNIZyw7mHGi5ouj+Q2p2XmtNzKnL7zlnAmdP
 4a0NIkAxmLqR9zTmMftmF6VcwSQ7uLiU3enWXRymbuPMhSXL/vAdobC1X
 U/LZFyf/57FKLJ0DcpktXMKQlR59aFPazCt+CXp2Zad2xW0or9RBixmsh
 oVf8flS/bpg1cBdTIyPdKpZWWM5AoGagSfIjDW7CT+oZrbxnMPS0Kxm+Y
 gYsAzAc5fj15DrwQPjrF4TBIF49uaxT4KVNaPK+STtQ19xbrHLRKMtpRn
 By9fKAiVOEgdyhOIoCzTtu1nHhb9iZs+oRUDaPhbI8tJlIg3OKJ/4tT7d A==;
X-CSE-ConnectionGUID: DZKo5ycmRimcx/bYs5+BAg==
X-CSE-MsgGUID: ttIOOsFhSHOwVmxvcrjh/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71891807"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71891807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 10:22:27 -0800
X-CSE-ConnectionGUID: MVlnJ2ODT9G19kDypHJh4w==
X-CSE-MsgGUID: y5dhA2cAQTaIrXHbaHhttQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216476548"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 10:22:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 10:22:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 10:22:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 10:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLy9eAdq4lYFkrBVDRvwG0qv+99Z53o5IgIHE0juZLC3OpisGGvbmxrMi73pj1pRAjukFYrS0so81yBDXvz2agtnCWxvM/olh4+KAvxXXiWRvsAycxuTpUbE9Q3TiI35RLhVTGN+xVDsoHYMeUb1dSePh9VqV3O0qf4RiL+/ytm6+yiBbNtPdcHnaVCEvMT28ALOj1ozw7uO6NpfJnOmkYPxeopnjfyUiizGT0FgohEo+VBGaVMvyjzxm6HMKWnHDIs0YTF2sQbU9BqfMUKc0ET3HsD8iH7hO4uTKoi713nfnSApuA/3PS69M1IpTpbtkzJD0VuhSuvNvUYK0NVWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqQziM7yidxpNoc4Nh4WWHY37AeO/5jV+wD5GmHgpV4=;
 b=ZSR6xRzLmd1maKfZ4Bldjsus3TKvWGZQ60OTlsaMKqr1WhteDTtshj2AJZ3trJ/0ZGcVka5U7CXd9Asl/zBt05k2enkaHXcq6WIcLaFjOKnpB+uKp37BVgZ5RYriNkRQUGFH0WFED75AINkhQHuYNIyX8FXPlYP0YsVHxO6SMWxfe1oRK3DL8sch7yzEczOumli3ui2KyR0iIkUvV7KGBKMCipOJY/pdmcBrFm1vUEWa1fgI1UIeieue+IrAPaChC97+IBFwNFYuWUrIXgNdfTIhK25m1hO1UunuI9n8eCf3PsZIvQ6sTpDM9bbaKqEgPmadHP1Zgm3YIjKjYmcksg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFA5F77FFEC.namprd11.prod.outlook.com (2603:10b6:518:1::d40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 11 Feb
 2026 18:21:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 18:21:32 +0000
Date: Wed, 11 Feb 2026 10:21:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] Revert "drm/pagemap: Disable device-to-device migration"
Message-ID: <aYzIqRB6yDKDkejE@lstrano-desk.jf.intel.com>
References: <20260211104159.114947-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211104159.114947-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:303:8f::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFA5F77FFEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e315c9-b5be-4b7c-0087-08de699a61fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXN6QWd3RlRuOWI4RDV1QU9EcnRVa2lndFZjQW55SEE2TlBiS1I5Wms4clNJ?=
 =?utf-8?B?enlTaERTUUp0OEZ2TmJ3QndENFR0TFBUc3BPK2Z5REN2ZURoeFU5ejZNQmsr?=
 =?utf-8?B?S0F0ZVhBRXYxRFV3cnRWNzVVUTVVa0VKb09mWHpJeVZHMEVRU1ExOW9JWG5j?=
 =?utf-8?B?WmlUc2dNUi8wZ0Nwbkk1N0o3MkZmcmpkTEl0RXRDUjkrK1IveE45ckw5clcy?=
 =?utf-8?B?V3dRQ3VEbldxcmZjMkJsOFJjc1pHTUwvdHVGc2V5UzQzbW9OSUU0Tm45MXhi?=
 =?utf-8?B?R2RGRkxEcmpnS3M3QnhqSlJBem51TlVRTVJzNXRlVUFSUjJwaytZelpQcjRM?=
 =?utf-8?B?YjhuSERnWU01aGF0WllWSlQyZXNRLzZ1S1dwTG5xRGF4dE1KdU1pWWNmU3VY?=
 =?utf-8?B?Y2ljSm4zWXNOZnV4aldyMFJtNFFVMUN4RUJrcDN4RjRNTjByR2JvNmdiTkx4?=
 =?utf-8?B?T3ZEcVhiSEhqeVIrNXQ3b2NaMklwSEFxSEgrN2V0VkVsVG4rY3ovSkVqRFFE?=
 =?utf-8?B?dTNGTWdVTmljdlcrVzdzQTJQdFZDUUdPdW9jeTFwY1E3dmV5WFBUVWtVNVJn?=
 =?utf-8?B?QWhKQ0FoTEtMdExCUjF5VFJMTzFEQ1VOZU05eDNLVVVjQ3FBVEpEekVRRmVM?=
 =?utf-8?B?bXQ5d2N4Z3VKTGZVTi8zQm5iYkNxY0lNMm81bnFOZXdZd0toZkxRd2xPekNP?=
 =?utf-8?B?ZzhBaGRmSnJqWlEzOC94MmxlZ25ubStoTW5iQ0pDMjZYMUdvM0VIWVBHdnRG?=
 =?utf-8?B?UndsZHptOFVNUTF1NFFva1BHZUh4UnV1R2cyV2sxbVpwSlprZHgycVNKVENq?=
 =?utf-8?B?YVZCUW81cGgwV1l0enJSNmdiR1R4R2hDNUlVVkR5S2RiZWovbUlqazRCeERk?=
 =?utf-8?B?RzJuZ01NQ0tHL215K1RlOHIrNlF2S0V5VEE4RkJpQjNUMFJGd2FUS2o4U0Vx?=
 =?utf-8?B?MGRsc2xjdWorMWhQYjZLOGR3V2t4NXk2RDVuV1VvZGNSblJMbWtXczJVb1NY?=
 =?utf-8?B?ZUdCR1QvTUh3NzJzenNwa0hJNWFUeDFremVRaWRKMjBqVlJ5RVlLRDV0RHpG?=
 =?utf-8?B?clVZTFBPbjd6WG9rZXQvUUttWWhUU3hka0JsUHlFTk1JWnhxRnI5a3ZZRmoz?=
 =?utf-8?B?VGM4Snl2czFFOGFSTGtPbE0wbVRGeTZNeS9oa1FKbXowZ3RmczVicmtVclZk?=
 =?utf-8?B?eDN5N2hkMzFQS1ZpZjlhemhiKzBDcVhUOXFxQ2xLY2t3Mk1TOWE2NFo3YUNi?=
 =?utf-8?B?ekg2ZFJFYjF5czFNV3dxbnFmUmVReHJnUkYrMHFIbWtSTUJBUUdZZjdKeTBo?=
 =?utf-8?B?VG10eFYrZ2E2YndFUzRGZnlvWk1VSU1RcFNuajQwaVVBeVZxMGdZdGlLd0tr?=
 =?utf-8?B?dlRHVjRWSFRob2pLS2xsdWhmdFMrVm4ybkpPODQ5amEwZFp2ZExHVUIyQ2xr?=
 =?utf-8?B?QmFuN0RVSmV3ZFBIWDlkcURKUlBUWEZVT2o5NC8ybG9lZTRNUUhkYUlyQnBy?=
 =?utf-8?B?SWlYa3JCbEhMaFllTWJ6dFdVNGs1MXpDOFZCZHZCYkxWNjNTVXRFMExnM1BM?=
 =?utf-8?B?NjhSRWF2Wm9mMXVNUVpYdUcxUjZIbHRxcjU2TDV3ZVN1d1B3Wm1oQlFVeFVM?=
 =?utf-8?B?czZVVUJMNXNNT1pyWWdjVjNkTlUzSFA5Zi8zazhydmVqbVNSNXdLd3Q1NUtQ?=
 =?utf-8?B?bUdoTWxnYyszM2JURi8wbXdKSnptTmlpOGt3QTdBakMvVE1mcWtYNTVCZnBj?=
 =?utf-8?B?aCtsQzN4NnVCMUxqK1ZNTGdwZHNUUHh3Q3lhK2JNQkRQTWVBdDVTNCtzeXNp?=
 =?utf-8?B?bWhPTWNnZnBXdUl3RGRQVGxtVU1IdUdZcjFnQjVqT2lHZElGN1REU2VjV29N?=
 =?utf-8?B?ZmdXZm92dWpvWldtTVhyNXVaamU3ZXFTNURneENqUms3dVVtZGRTTzBYTDFQ?=
 =?utf-8?B?d2hvWGROUHBIa1p0V1BMcW1PMmRmRmZmcE9kUjk0N2dVTUNCRzVFS1BXU1Fo?=
 =?utf-8?B?dkE5WVkzN2JPdS84N1VMdkQrL1RML21ZQWp1aFdWMkN6UmpXL3Z2Yk85S1JK?=
 =?utf-8?B?ZmxSTEh3YXZFQUlpNnN0MDRRVFMzbGdKazN0Wm50WDk1ek41MjcyaGRmRHNv?=
 =?utf-8?Q?UDpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3FQVHgydWVxQXRjbXBxRGdNVml5R05SbDhaU2JnbEVMRTVZWllwUDBUQXlp?=
 =?utf-8?B?Y3lyOXlqRndsQWEzMitKTnNxeTE3WjVyTGdyOUluQzVSdjExNDNDWitzb3kw?=
 =?utf-8?B?cCtWeXRzaWVhNTRheXlrN1dIMEIybXB4dE8wVmRkb25sUlZjdzZieHRBVzM3?=
 =?utf-8?B?VFhrZko0OUtWbzBRbnF6WHZYTmxjMk9rc2ZUL3JEQXpyL2RvZWcwNE00SW5j?=
 =?utf-8?B?SkhPRk5EL28yaG9hcXBJclY2NFFoR0FWNnlnYnhrWnpGTE9OQk5neHI1TDVP?=
 =?utf-8?B?K0hWVURXM3VTNytnckk5V1l0WWRJbDUvOVQwSGNHTWM1aFBMeDJ1YkZwTyt2?=
 =?utf-8?B?Yi9sNXJ2a2taUlhnckNVTmIzUmZoRGFtNHJJRlBwYUZvL2VkOFNvSG1nZ1dQ?=
 =?utf-8?B?d1VOcGpTV01XNmdFODRObUhSY3FlQ2ZmaWlIaTIzOW4zV3pFWGJhTFVzbHdm?=
 =?utf-8?B?ekdEbVRtTzdrem5COXRRMTJKUkNCN1Zxb1VvblFjQmVtSlBRY01iVEFENWJI?=
 =?utf-8?B?K1FQS0N2UVBvU0RwUk4weTBsVEVMa3EvUkVDUTBnSkh3b05ybW9VZnIzSkQw?=
 =?utf-8?B?aTFzY0s5bncyWDN2QlNDbjRyYjJBWXh6Wjc1TURsRVJTQndITWw3YWVYOUdW?=
 =?utf-8?B?RFlHajhLcmFNM1l6VnNUWlUyRkVEYXZwaVZrM1NQeHIwQjY5Nk9MV2QvaS9Z?=
 =?utf-8?B?UmxQMmpOVFVHdXBNUURxOWM4cUFveVJyb213YjI1V1RJMUJjL1BVbFpUSHEr?=
 =?utf-8?B?Qmh5M3FwWDlwWXNRQ2l4VWIwT3B1TEs3TmV1UUpRTkR2QWUyc0dodFlSZDBX?=
 =?utf-8?B?TU5RQ3JGUjg5bDh0RnVSZERENjhYYzB3MitkRm85bk84SDlGbkU3YTVYRHdV?=
 =?utf-8?B?SHVtZGVWaXRjaGtvVisvRG9wTUxvWjE0STBZQjBlR0FoVURQT0E1K3Z1dXJk?=
 =?utf-8?B?UStYUHZYK3lqRWplbTBiSkhVWHBzVGJac29tVFFkd3ZXcER2YS9oN1pHdjRP?=
 =?utf-8?B?R1A2NEh4Z25nWWp4WHFQbE4zdWsyNDRKL2w5TVFCd3lIY2J0YnA3S0dwUmpZ?=
 =?utf-8?B?RGIyVFRoZExyUjA3UnVkUTZ1YmZZdXErU3IvbjNndmNXTjF3bUVvTkpUWnE4?=
 =?utf-8?B?cmhQS2V3bnFWc3NZcUFyUTUvU045UWZzZzRwcVhsejE5d1FnbzJOUGsyOHho?=
 =?utf-8?B?U3kzZXlPdTVrYWJnRHpjVjJYODhYalJDVnJUeXpFWEFkM1NKOG1KNVpVU0ZN?=
 =?utf-8?B?YU41VDRzUFVRNEJtMnFxbTVRZkFNMEMzU1oxbFBDVDBidmVNaUh6YWtYR2tn?=
 =?utf-8?B?WVIvcUhKZWk4aThIQVJUMnJLZmJseTFTV0d4eFQ4V2lLalNpTW0yQjV4cllL?=
 =?utf-8?B?SU5OT2NZKzV3Y0hxajA5YVZjeFVvcTZnRVc0VkZBZUdPTE9iNXdvQVpQV3pX?=
 =?utf-8?B?Z3JKbEhXaXlEcDVWNU9KSXFwOFNZOFg3emVmMVpEZGlJM240cVNhUmpBUFd0?=
 =?utf-8?B?cXNsUjVSM1FzallPM3AvcUowK1RFNzJFS2hvTUVYUzl5MkR2N1M4OFR2ek5H?=
 =?utf-8?B?UjJGd3pvMGVLaHp0S3NMbHF2K1VuQWpGSndVZ1JkcHhVa3NxZmxLRlpYK1dK?=
 =?utf-8?B?RFVaa28rSmd1KzRHaWkvSkNVSUdsY3lZR0RLWTV2ejJhMzdWU0pxL0wvbDlK?=
 =?utf-8?B?ZXpEcGN5Mk16TmdTNWhTUXkzK2g1cEkxa3dMOTYwV3h2NWxBRmp3eDF2MUYr?=
 =?utf-8?B?bnh0L0F2ME9ON2JxY2lDSExRSmwwTkxnWk5NYURoZnF5OEF5bUo4dWQ0MXVZ?=
 =?utf-8?B?ajAwT0t4bFdDbVN2SG5DaE1yN3BtSlBGVmJOb3hsNkRGTDQ1ZWNDWmh0R01F?=
 =?utf-8?B?ZlhJUnZ4ZEVjaVFpaUcvM0l4NXFrMXg1dS9jSGg0Ymtwc3VVRmRCYkIwOHAw?=
 =?utf-8?B?aU1QZWJCTUx0WlNpamJXaXJrS1Y1VEZoL3VOWW83VFk5djY2eXB6bm5Gejd6?=
 =?utf-8?B?WHpoVHcvRXhIQ0xIdUlkY25kWDd6bnEwbWdQV0dlTzRQTk1hQ0RoUm0vQ2Fh?=
 =?utf-8?B?S2tlb1RDMkcwcnEzQ1A3Ykw5VHo4S3A0RzhvOUZMQVAxUk9JdFZGNkZMWWps?=
 =?utf-8?B?MDd6Y0UyWDNQcENpV29rOFhZSitLa0VzbkQ5Rk9ESWZRQis5Ykl0V1VWUlNo?=
 =?utf-8?B?cE0xK3d3eVlsd3ZTUkhTVnUxNHVjQThyNk8yTWtkUHlaUDJHUm1ReHRXQVhY?=
 =?utf-8?B?alVONURVN1RyM2U5cjBTN2ZvbXVQYmR1eXlvK0E4YzhCRFllZnBIa2dMemdM?=
 =?utf-8?B?OHVDRXRJK0lkZjdFaTlDSGJoL29kL0ppSXFGdE5TU1pkVElXVFhHR2JqOHNC?=
 =?utf-8?Q?xXE9dv539gHdi9oc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e315c9-b5be-4b7c-0087-08de699a61fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 18:21:32.4451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxwAv1NLnTBP07o56pBPw9hRB3HtQd7gJxWLX2DuqYFxLhQbhtwzvqMg6SwCPw1ZmCEG3aSIB9Y8QIXX5ARJvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA5F77FFEC
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

On Wed, Feb 11, 2026 at 11:41:59AM +0100, Thomas Hellström wrote:
> With commit
> a69d1ab971a6 ("mm: Fix a hmm_range_fault() livelock / starvation problem")
> device-to-device migration is not functional again and the
> disabling can be reverted.
> 
> Add the above commit as a Fixes: tag in order for the revert to not
> take place unless that commit is present.
> 
> This reverts commit 10dd1eaa80a56d3cf6d7c36b5269c8fed617f001.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: a69d1ab971a6 ("mm: Fix a hmm_range_fault() livelock / starvation problem")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 38eca94f01a1..73438ba275bc 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -480,18 +480,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		.start		= start,
>  		.end		= end,
>  		.pgmap_owner	= pagemap->owner,
> -		/*
> -		 * FIXME: MIGRATE_VMA_SELECT_DEVICE_PRIVATE intermittently
> -		 * causes 'xe_exec_system_allocator --r *race*no*' to trigger aa
> -		 * engine reset and a hard hang due to getting stuck on a folio
> -		 * lock. This should work and needs to be root-caused. The only
> -		 * downside of not selecting MIGRATE_VMA_SELECT_DEVICE_PRIVATE
> -		 * is that device-to-device migrations won’t work; instead,
> -		 * memory will bounce through system memory. This path should be
> -		 * rare and only occur when the madvise attributes of memory are
> -		 * changed or atomics are being used.
> -		 */
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	unsigned long own_pages = 0, migrated_pages = 0;
> -- 
> 2.52.0
> 
