Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCAED65C47
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 13:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB0A10E357;
	Wed, 17 Dec 2025 13:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+n8k/Va";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0620D10E357
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765977917; x=1797513917;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PwFf31Fx5w4Fg5VwgHrIXTDmgW08txL6HOnCOCMOk9U=;
 b=U+n8k/VaImTdPR7OyJOPHSosqMRO7WE+lhhHqeN6TLwFtYbgW2xXrYQS
 8ObbqGQcbwnDUCMoJFULSHOMsHOAd0+sa5tLozoQXjXeHnI3yYMz0yzkd
 1JPMGVLHoxkpkKLz6FWpKrbPE35WnINVgitiw6amVhb8ohPLOqFnsNAYY
 tadu78wIPuDazBuUywU1wTUpfruFmZFOHAFQTBzeQhEelAnHfyy/Yjsl9
 PcK9ArO7nScoYACPtEbT86BHl7fOS+3Wz2UCD3BCjWyBPGFlZwxCRVxxT
 zqrHdXrLH4wnNjsYWMekCZ2ADsLo7VB2Jkmg4c+HRQr93X48mlqdKOAZD w==;
X-CSE-ConnectionGUID: R/rDJT6AQDOuH34C3PlqRQ==
X-CSE-MsgGUID: FTsQNNMnTSO2ojZOALKTcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67802644"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="67802644"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:25:17 -0800
X-CSE-ConnectionGUID: id11En2pSUu/K1RtkxlLPg==
X-CSE-MsgGUID: GNK/0PBgSQeNnE5WTN6ufg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="203401601"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:25:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 05:25:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 05:25:16 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 05:25:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adkuFbaq8yPiGl9su7HZbo4Llh6VEeaaLEOadeh21t2xvY313tCGDrA8JpJfKqsI1JnUdB/IR2CkPUup3KrtKH5FkP0Nr8qouzfk7tKcidrEoAUOT2z1BbqmvSWhpgx/NTv1zMPfAmAm5lEEmprlJ3agBA8+iMMEh80T48pU+hgi/VKG3IF2XT+TIZtSI3pmgSZI3pqf0v2mNxy3P6wI6i3jCLeV4ii9qFke1DpD2xmTOGFJvSQ6SEEnySQV8VR16huims1Ncog7/POF0QXAfF9jFJZh5gWUCt3LECgBuy857VeCag4uStCACDNXZuPUy2LO3GjQ48GOcyLFH9xJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9wNbJIyEUT/7G1PWJ8bP+5OvqfLJqPMjjkOey2/53s=;
 b=GZ5IB3tI19X1Ju9YOB6iQxEFIQkNrZsZn8vXSXnatgyXDMhDvs08JpppYFSLeX8H+fDuy3Ci/sMODV6gxFlwcd4Q+xEDQKF7zt9zcbIcaqLB6uZJr6m8/UvmIlvU1tJd56zD++SJJggBfTYEm5gjDd+KsbTmBXCEO5nwvy5tqYA+X6cdIU3q+e84J6bcbb7eTYpurp/CtsjTaFou/tDIqQ1CoB1kMv2qtqErHCsLqwj3UyG9mpC0DqEdClcyldK/LrGCyEM2i1teHe0IYz5myLBt1N1074inkvwWVkXI9ltw0RJhJ0tbaP0SD2Z3x6+lo//fvhJMkaZZWMu3A0LO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 13:25:06 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349%2]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 13:25:06 +0000
Message-ID: <6f9d860f-f95c-4b3b-9d5c-1a0c295bcdd6@intel.com>
Date: Wed, 17 Dec 2025 15:21:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <f1ae6465-3276-48a5-8dc4-e3caf2b9e2b8@intel.com>
 <20251217123209.430427-1-tapani.palli@intel.com>
 <dc533a8b-ad80-446f-a3f7-1fdde195a0e2@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
In-Reply-To: <dc533a8b-ad80-446f-a3f7-1fdde195a0e2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::12) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|CH2PR11MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 8388114b-c828-4c90-151d-08de3d6fb178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akxTdFJOYzZjMUVBQ1F5MjM3TllJVmo2WmF2WG5wc3FzekpTOGlGV0VsMFMr?=
 =?utf-8?B?R1NjajdZWTdUSWRKUTY3cWdGM1NxYVN2U2Q4OTZoRXNRNHduZnBLUEpEQTZP?=
 =?utf-8?B?cUZRSG9WaGQ4cVdTZk5jaklJYzNlbkEveWJMWUZiZGJoQ2JISEQ3Sm5ITGc1?=
 =?utf-8?B?RUUxVnhXK3FjSjREQWdLa1dJZDZkYlhPeHIxK1lNOWg3aDJoQWxnQlE4U1Mv?=
 =?utf-8?B?aVFuMVV3UENoU0o5d0NnQWhxckt1UGRHWit6Wk1zYk5uc1YwemsrcXROam1Z?=
 =?utf-8?B?d1ZKSUNZa2R0cXRNSENidHNSOWE2K0tQRHhMclR3c2lnVGdkYldaVGYwTWMz?=
 =?utf-8?B?VnVib04rNjZMem95ZzNkTTlhQjlieWUyUjNTVExFMTF5MzBqT0ZSRmp5T3g0?=
 =?utf-8?B?dWNpZVc0VktHbGU2YUVFaW0wSlh3QWc5T0ZlKzl4R2FmTjZJemVWYkg4UUJ1?=
 =?utf-8?B?SUdWWWlkc21IQ0piTXRMOG12ZGZNVVNnRTJ5eFdKaVlMNXVZczUvYjNTVGl0?=
 =?utf-8?B?SURtbExCdzRvcDliWUZMQkJmSUQ1SzI4M1ZEQldTcjJDcFU4a3dVQ1VUdVRr?=
 =?utf-8?B?WVFUU3ViWGp6aUtYc2xMT0phdHR1RllOcndERzJZejJoeDNGc1pKNnRONU9u?=
 =?utf-8?B?VkdLbU1DclRYVFZSbVFKc1VYUDUwNXNPUGRmRi9kUkNHcnNjOENPMmxOZ2dw?=
 =?utf-8?B?QnUyRHBnRytyYnUwNWl2OUttZlJVTVBIWEJmekFHcFBGdHlCbzNHRjBvOHVT?=
 =?utf-8?B?ZUh6STFqK0pxTlVUaXhMRGlURnBmeG5CeGhZaURVdDBnYkNzV1RGNmxLVG5p?=
 =?utf-8?B?WUk1alFDLzNWVTZtci9ydnJaWXh1YVNzY2R6aGRYVmxENnNYckVPbEJvYitu?=
 =?utf-8?B?ZzJKd0JhOEpRd0x4b0VmYU9rOFQ1OWFrczhCUnpKQWZBYjZxR1VoQUxSS1Zi?=
 =?utf-8?B?a3ZlRUpFaWNNTWFvc3B6ZTdBM2xSRkdQVmFkM0JxZ2x0YlIzZ3NnS3B6amZW?=
 =?utf-8?B?K09UNjV6Szh0WVdYTGx0bFplWmZ0bmx3eWEyVTFCdnp1d1BLcGJLNjJpcXJG?=
 =?utf-8?B?ZlN0b3VJUDhYVUNSMmpkQzkrR2txd1RiSWZOUFlVdEkzMU16WjUySXRmS3F6?=
 =?utf-8?B?UUpucmg0eFlpQWpuWGt6ZEdXWnlOWDA0YUNEVzY4bU0wSDF4ckU1T0VnWXBC?=
 =?utf-8?B?Ui8xSThBQlBEUlpJcHhENU9hNlhCNC9oelRhU0p6ZFB3YmZMMzUwVXhRcFZ3?=
 =?utf-8?B?bkowMkhuNFl0QTBmNGVDNEV1WC9hREJ3blBnRHQyZUwrSjBYSnM2UmdaOUdt?=
 =?utf-8?B?clk4K1JGc1NIODNIeDlOSjg5TVJhdnlsRUo0VmY4YmlFQXowU0tsS0hrdUVh?=
 =?utf-8?B?REg5a1d3VmZ6Yks0TnlVemFOdmY2U3UvK3pXRERtVXNjUjQzelp5YTZ5Qzl2?=
 =?utf-8?B?OFpKSzViY0gvUjQyS3BHWUpRQ3pJRUpFVHBsalRnaFF4Y3BiRDZyaUs2cDU1?=
 =?utf-8?B?RStFck5mTWtjczVRY1V5bklZY3F3dEJtd2VmdEZlQVgzRmZHQkxxQlZpM3B1?=
 =?utf-8?B?T1J4T3JPTnYrMHM4cjA3RTVhVWFjZFUrV0NlbnRLNy9xYlF4azBiTmJXVTNo?=
 =?utf-8?B?SzRnanFISUFGekhuRnJMdGpiYmhucFhMeFNZYXNDaFBqNTZYMHF5ZHRTaFB3?=
 =?utf-8?B?TmtvRnZrdGRoYWRTMUpjYWFuay9mUzhMQU45ejAvbHRzTTNLTmRNb0ZCdm91?=
 =?utf-8?B?M3VCZUt1U09SS2VHKzNOZ2xVcmRpOWFhblorekx6T2RXYTBoc0ZTbDU1SThH?=
 =?utf-8?B?NFNySDA3aVd2YVB5Q0s5TDFJMVEzblk4SXVUcnhnQnhHalMySW9JTWE5MFd2?=
 =?utf-8?B?aFgyYWVJK3g5UVdQdnYraVlFNDZmV2ZnZ3p2ODZ0OFFwRFNVVFc1djZtMUhC?=
 =?utf-8?Q?TVL0xJfxjTKOg9+QA0Y6WqQOgP++c0CU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkJiM2sySXFueFY5aHp1alVudy85Y2wxdmswTGFXOEE4Lzd6Z2d1eGxjVE4z?=
 =?utf-8?B?bzdFbDlVRVd2L3hUTEpYMDVsdlVRM2wyMlMzZlMrQzNtckUyQ3FIbEdIRExY?=
 =?utf-8?B?dy9xeWVVUThIdVpnbERYRW11UVR6cDczZDdTUG1OQjVadStkcm1lKzR2cnU2?=
 =?utf-8?B?R1JwL2V6U1V0UWlTVDhlRUFTdklkQWVvN0tmbzE0dFhkWStoNFJ0dUovNFc1?=
 =?utf-8?B?aGVhSVdrOUZDSzBOMG9HZit3cjAyUjdGa0w3SkdWOUdyeTVNeEJLbzlNNThl?=
 =?utf-8?B?b0VUT1F4b0M5ZlhZYVFtY29SMmVuU2JDRzI3dE5IbzBSYXBlcUwvMUFrSmJ3?=
 =?utf-8?B?ZUtGVGVhbzVzaU43NG1ZajFlNzlScmc3dStncWJROTBSVFYwdDB4RWJxVkV2?=
 =?utf-8?B?dHFDcm9jVXp1dml0NE5ROFEySVpCSytpMGIyU3FRQzRzZEtmbmdnWE41ek9n?=
 =?utf-8?B?ZDkwQ2tNdXBPRmxVUXJVS1BEaFpaL0h5K3VUaUE1QlVGUlFPbnprSW1WcGRm?=
 =?utf-8?B?Y0Y0WXBNM1Z1R1NhWm5mRm13TmxIOUpsRHVFWisxa2htSjhsNjNHb0srSkpl?=
 =?utf-8?B?ZUJBUWVLMTc5bGNoelF3SjBRQnE5MlpFYi9OQmdzY3RscTh5MVJDblBwTlVx?=
 =?utf-8?B?WnA3RHdTSk1TMmF0VXVFSm1NaEFBWlM4Q3BSeTYzMEtUd1ZIdkZFV0hPUysv?=
 =?utf-8?B?b1d2RlQ2czNCTHZtQ00wdWpMTENGQ0NiV2dFRll1M1R5WjA4UmthVjhBZWtr?=
 =?utf-8?B?eHBIb2hGWlovZ2x0bEU2ckpnWmd2TmlQK1o4aHRVQzNUdmRDOHZJakZIdmtq?=
 =?utf-8?B?YWVmdTJmblVBTW1JRjU3WGxvakZwMGMrb2dVVUtDWXI3Vmo5S1RVT210aFF1?=
 =?utf-8?B?RFpkVzZrODYvQ1FRbENGeG8xWmJRT2xHbFB0WStjdC9ZV1hHTkY3UkdFci9I?=
 =?utf-8?B?ZGJPWlFXcEVrNGxheG9MeGZCSCtVME02ekJwR2NIUHltVXhlNG5xSy93WE10?=
 =?utf-8?B?VTFOcGFobmVsaFVsdmNPZkpLU0VSbDNlcC80YThPdFlmV0ZqRlA4NGNJNHFZ?=
 =?utf-8?B?SVM4QVQxRDlzQlZkWWZ4TVVDUHB2cVJocU1jTEJuZFA3SUloTVZNOWt1OWMr?=
 =?utf-8?B?UjFaSTV3SWZmVktkdUlVL0MxR1d6NVF6dllKRXZ2ZTUxV3R1SVpQNk1nV1gy?=
 =?utf-8?B?aGJqZWdsaWF3WlpudFhXT0FZN3JKRUdvaTRickk1M1M1REI5R1pYdCt4Y09M?=
 =?utf-8?B?eDQwRWl3L3IxTDY1WVlxTHEyTEVjZDJXYVhoN0lJc2Zsc1pXOGNmYmlDM3NI?=
 =?utf-8?B?cURvZm9QSDRrSHYraXRPVUl1VFpRT09EVHR2Ni9KSitkWXdRQmI5ak1Wb2pN?=
 =?utf-8?B?bmFoWURLV3FmMUY2aE9NOFZnakkrSHJvOUFpR3g5TTk4VFlyZVlML1hVYXdT?=
 =?utf-8?B?MS9OMlc4bUhGZ0QxTDhIR3VQOHJWTXpzZVN3ckkxSk5SNEFUbkZwTUE2R2tR?=
 =?utf-8?B?eW54Zk96TG8wV21PR2p6dVhzTHFSZDlJeGpjV3NTdTRkdDV1ZVZLMC9wT3Y1?=
 =?utf-8?B?MkdCZWZXRzlkMFlzb3FTZ0xHdktGTzlIWlk4NWVPalJKMGlmdWh2NjU3eFRD?=
 =?utf-8?B?cjk5YTlrNEExWHVRV1l5OVZYcmZROXpOR1FSbi81d1FpWmZHS3pNN3FaSmdu?=
 =?utf-8?B?VHlzMFpIWmNtMEs5QTEyWGtqWXVia2FkdGtEUzlKaE5OV2gzSjBzNXJEVE9P?=
 =?utf-8?B?TmlBRE9RVXNyMnVuUFlWaFRTdlppSFVtK1dSWXMwa2dFakQ1Vk0wdWpibjlr?=
 =?utf-8?B?VjZEc0ZhdWpwYUZGKzNpeEpPeTJPeTB5N0dEZFZ2VFZnam5XRWJralQxRE9a?=
 =?utf-8?B?d0tvTnhXelBxWmgyZFk2ZXlheWJ6bkw2Wlc3Y0UrQ01DZEp4S2E3cTNqOEln?=
 =?utf-8?B?VWIwY1RwOG8yS3N6THAxS3BZRVBxSlJxNmpPR2FuUlNPa1p3NWthVElRVzJO?=
 =?utf-8?B?cXBsVU5wRHBEMkxOZi9RaWtGVHJXSmRveU9WTjdycUpkR0xuTWJZbGw2RVNw?=
 =?utf-8?B?UTU4bFlCcmhmWlJvVk90WVZnNWViS2lXeGZPQXY3SFgzdzhNd1BvRW4xbGFI?=
 =?utf-8?B?RkVTOGFBTFFZd3JZRmRaeFpNQ3U4azlJQ0ZhK0N0cjh0bm1WakhBMkxzbXVY?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8388114b-c828-4c90-151d-08de3d6fb178
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 13:25:06.3619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNbcvuhuhUBEjTIKY+KABDc1d1U79zzWFyw5cH8+h30g9237AZr4TLSWDgN5fEE3bCtF84DQ8RY3EkdTxcEL2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
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


On 12/17/25 14:57, Matthew Auld wrote:
> On 17/12/2025 12:32, Tapani Pälli wrote:
>> Helper function xe_sync_needs_wait expects sync->fence when accessing
>> flags, patch makes sure we call only when sync->fence exists.
>>
>> v2: move null checking to xe_sync_needs_wait and make
>>      xe_sync_entry_wait utilize this helper (Matthew Auld)
>>
>> Fixes NULL pointer dereference seen with Vulkan workloads:
>>
>> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
>>
>> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to 
>> dma-fence mode")
>> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sync.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index ee1344a880b9..2b6c2e2527ae 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -241,7 +241,8 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
>>       if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
>>           return 0;
>
> ^^ I think we can drop this bit, since below will now check it?
>
True, will drop


>>   -    return dma_fence_wait(sync->fence, true);
>> +    return xe_sync_needs_wait(sync) ?
>> +        dma_fence_wait(sync->fence, true) : 0;
>>   }
>>     /**
>> @@ -252,7 +253,7 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
>>    */
>>   bool xe_sync_needs_wait(struct xe_sync_entry *sync)
>>   {
>> -    return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
>> +    return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) && sync->fence &&
>>           !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
>
> Here I think we can maybe simplify:
>
> sync->fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, 
> &sync->fence->flags)
>
> Since sync->fence != NULL must imply an in-fence which will always be 
> !signal for the flags anyway?
>
Makes sense, sending v3


