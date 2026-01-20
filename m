Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D92CA5FB9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0510E63D;
	Tue, 20 Jan 2026 17:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fN+hAP4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFF610E63D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768930888; x=1800466888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FS4I+QyGoqGsnSdH7quks9x8HnNy0spooQi2+ds8dwE=;
 b=fN+hAP4dHkMavXPSb8CyTYPuoSGybhpHIlelvCSqe35p2k4uGuf4Df1A
 w5nWM1RJNPiN/1vTEhbmnmi+ttqOdV1i521Comimgdie48ARDmDmRTkz2
 T5bdNHxcDHJ8qVztSYQ6OLb0AyJr/GS7gENnlMXM38GY9QCFebeiWzMh0
 lE5zQ+RKjyWddLfk5lyDHJBrz++neTHFm6CQcSX6hIBv48jMy5i+d+fnd
 ikYJrfNJeHlnRdDr4+/4yeNp480nODoGNp6dSuRE43q/X5yeMp5guq1fC
 w+RVeqn+TeE6bBVKNqFf0fN99Y5helyyXDGzooI2y6G+bLVgf7CVEg/ID w==;
X-CSE-ConnectionGUID: oxMDam5tSQioQmXb8OqWdg==
X-CSE-MsgGUID: 5U2sNKr1RiaS+ZR/Sl+iLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80451051"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="80451051"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:41:27 -0800
X-CSE-ConnectionGUID: BPCVIzB+QGiFbrsznbK/Gw==
X-CSE-MsgGUID: MRIxKVYXRIGZjOEZ2N33PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206100328"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:41:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:41:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:41:26 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:41:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLTV2FjY1YfgFLyP0rVXT0LSnj8YBBbQG/nZ4wZIIaRG5XFohmFP6kCCnyDXBzkc9fdKrBYuVdgpZ/Ou6u9jutnkK8cNjvybjfCl/QQLznFwzY+JhD1hcjVE7pJ5qdRVK8w+M7hyF+dsp+8eVut7gj/Qwaq7X63mkzvwgEfll4SC5othXMiFjQX768eX8AkKtFyH6+jpcZCzXjnCYJBpcHxV10AOk9BxtA5YAV67P2HBuk/bCi/leF1CG8GNztuh1RDJPa+XzAgeVPCSz1R4f8o4pe509+b8p0flSLC2t2CDWNWV5cXrzc0IllemyX4+Ob9oAGxiSumKGpCnTENvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+N/Hj+yCCp41IavJmCM/3bmX2khnCShxvX9gdHnokg=;
 b=ldU1NiI5eRZ1oNe1k9KbzdeahnjzbUDX5wYrRnyxi6COZeNG6RIqSgvqFZzzgJ+2jP7HeXIqef0dHchU2SBah5XM842xqxezW1welXXztA0Ldj+K0xNynOTIBOeUzERJonKA5y54ZP3ZMMfZV0VzjshbfLQX9dE6AR7nyekhkCtEQwTEET0zBN9PTIMkybUamPUEOnkx3Vih6QUS+qYXbosJZhDme13J6OvottOzbqqVXz9PDGn0oQk6fSM8t9BNSmEc49aT3JHHPEQLrWBoOCSrGNxcY2BGaA5GBGpNuIs9qDp1JXzCYYc/RahgBlEP33oduTY7Eka0ojf26VCi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB9462.namprd11.prod.outlook.com (2603:10b6:806:47f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:41:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:41:25 +0000
Date: Tue, 20 Jan 2026 09:41:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 6/8] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
Message-ID: <aW++QuG51rGP1Ru4@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-7-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-7-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0113.namprd04.prod.outlook.com
 (2603:10b6:303:83::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dca687c-be57-4849-af68-08de584b21e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czVIQXBURGxWRHFnS1J1cWYxK0pPT3lWdSs0dmtySDFQc3hORGZ4cHYzeGV4?=
 =?utf-8?B?dWo3eUNIanVYMjNwb29sVS9Wc2hKUXVyMFBFcCttRnNrRFJUTFFNd3ZhU3hD?=
 =?utf-8?B?b2pyM1dXck9oUEhvWUFnY0JQZE54VVd3Y2s0WEg3S09UdlZUN1dtNldzNHZk?=
 =?utf-8?B?c3JIZTl0NGQ5UXhVQmk1d0M5TUFhTEJKeWVmZG1lZEM4NXFEMGRTU0VFTW1u?=
 =?utf-8?B?cVk5YXBzdzFKRG1PM0YrK1hDTmpMbUFzMHNGY2NpSGNoalhYS0NTOWNZc0dt?=
 =?utf-8?B?bzBjK3RBSnI5dFZESTdHVWZyd3VQemU3MmN4T044TURkV2xMTjZISE9XaXc0?=
 =?utf-8?B?SnJQVnE4azliVzAwZzFvQmtoWmNlS1pvbVpiTUxEeEJvR0Z4cGtXb1dLS0ZP?=
 =?utf-8?B?bmlmWHU0TFE3QVJ1dFEraDdOam9od0FZcnBJaElGMVdRYkdOTnRLUXNJNzhi?=
 =?utf-8?B?VlpaT1JtQ25JQk95aTVhb1lqNWVxdHh3WUxZZkwwbHRURVI2bmZkSW1wb0t2?=
 =?utf-8?B?MzNFNi8waHpjT0pVWCs2eUJRRitJRXlSL1l1M3JTcGJYbno0RlJJVStmVDRL?=
 =?utf-8?B?bjl0aUtaM0xSUlVwYlZFdWNwUkx2eDVqaTl6c1RmeDFqSTMraklVTWxWMkNi?=
 =?utf-8?B?VzNBbzg1eTU1dkJBUzdvbUhNY0luSjNoRG92L3FNSzk2MkpWWTA5Nk5VYWFm?=
 =?utf-8?B?UFZSRDhRd1BtSzd2YXlhM3kxTmp4QXBHN2dUK1JWZ0dUclR6SExkUC9LbXRv?=
 =?utf-8?B?Y2ZWV1VzU256d0krVHRJajhvVFowb0IrbjJlSC9RZzJXNk9aVktJdHB2TEpi?=
 =?utf-8?B?Y1ZLbGhpanlMWFZsbnE0RmE2a2RQbURNcGJxYWlWZXdIOXo3SVhQZGpPK2Nl?=
 =?utf-8?B?WkliTUl0S3JnZHJXbXBkcXZZSlhkVXNwcVAya0FOVFMzdFpvemNuTktWYzZE?=
 =?utf-8?B?M1FJL2F1Y1IvL0xET0dwNy8vdnNKN20zUWtGU3FobEVIQ2haT0k5UzRORmg0?=
 =?utf-8?B?MkdXYXZhTFJNcTk4Y0NkbTZHcCtpUzhXVUM4S1UwR1dyVzJrSTk2L3BuYUdP?=
 =?utf-8?B?YTkzQ1ZiVTFRWWQ1ZHN1LzhhS3RxVW9VU3M5a3pSakp5ZDB1VFZRZXdWVElO?=
 =?utf-8?B?aFVKRW5WdDJMc1JicUpCN0lJSjNVYzFxajdUdld3R296cloyOUxFOFRKUlBJ?=
 =?utf-8?B?bXFidmJWRzBjTG5PalFHSkFXWHlvbnliTUg0MWRSUjl0Mk5wOHYycWFtTjNl?=
 =?utf-8?B?YXBtazlNNGh0dnQ4WkFoTUNNa0RFWXIzYTB3MGpFQlczdUhDdlAyWi80MlBO?=
 =?utf-8?B?cVFUcXRZcmJZZThxRk1wa1daeGQ1QkMxVlBvOE5HMXRJUzJmZmJoNFZ0ZDFC?=
 =?utf-8?B?cjVrWUJtdlRvUmNqOFpLYXA1cWk3V1EyNHh6UmYxY0F4ZDRIMXY5UlFHSjhC?=
 =?utf-8?B?eVQ5OFJ0RWJ6Mi9OT3BmOW5RaWxNZ3Z4ZEpkbGNVWjIwRkJuS2xoYldUWG1u?=
 =?utf-8?B?U0hRMDFZSnhNaVFwNVdJcTUvSkh2OGMvY3hGSVJjNXNCUFFRS3BWZVgyVUVy?=
 =?utf-8?B?VUJXS1cxbVNidXF6b0QybEphTXdBcy9YbFlpb0d5Qlc4QmZDQU5LYk9qUnYz?=
 =?utf-8?B?SlRSRFJlTUUxVUoxS0lJUWlIc3ZiQlIxano4aDhDZG9JNUdNK0NLZGdZQ3VJ?=
 =?utf-8?B?dUxVMUFTR2Fva2JjQno4MEw0NWd4WVRxUVVkQStHUExqN3RSWnFnb2hZRFhE?=
 =?utf-8?B?SlRma1VTSXFQVXFyb3duREdsdUlrdWhZcFpIUHRucHd0QktTYzY4QlZzaHJ6?=
 =?utf-8?B?b0IxQUxRVVNkY0lJZlcrUFJ4SmRqSjk0dkNkS0RNRXluMnZNT05PN3dxQW4v?=
 =?utf-8?B?N1p4dU9aRTJoY2h5bVVGS3pib3dySTZxM1ZqZXpORk1DWWVIZUJkN3hFZHhm?=
 =?utf-8?B?c2xMUm9CVUpadkE3L0cxTkJJeHViVld6RHprbHpVMnhzZkZPZzZwaU1MUHBt?=
 =?utf-8?B?Z1JxVXY5UjluU1I0dWhFYzliTzh5aWdpZE1PbHFPOFJ0d3ZGMlpkTWtGUW9a?=
 =?utf-8?B?VXhWc2M1K1F4enQ5ZitnanltcnZub3BpSWFtOFJPWitLcGxMam1qVFhBcHlF?=
 =?utf-8?Q?GGdY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjJRVlJ5VmhFSDI0ZW5Id0FLakh0ZzRjZW81dWNBcTdrWHBGeS9QMzh4QU0z?=
 =?utf-8?B?NVhkSHF2S2NUSFJJRFBJaStBZUpBQTBzZTdvWEJkdGlpQTlSNFczbzVvQURw?=
 =?utf-8?B?VWg5ekoydkU3eTFJOHU2aGNpNHYzM3diOG5nV1F1VFFiQWRlYi9JaXkwSSto?=
 =?utf-8?B?b2JHQ1dvYkJ1bTc1bE9aYUJwbVNPWHRiSE15cWJhaVhFWTlwMkFTeEk5dHZO?=
 =?utf-8?B?WFdrM0tic3N4V3IyeUI5dDZPY0pZM2NvR1d1NiszUzVucTdwTUl6S3A3U0hF?=
 =?utf-8?B?Mk55dnRTYTRvemRnNWp4czFUdmhEQitjbnhNOElWbzVGYVdYMUFjRndTd01j?=
 =?utf-8?B?M3M4VHlqVEFWeWFuSEhjaDNGT2RneHJlTEhpbVA4WWJpY210MWRyM0gvZ2xF?=
 =?utf-8?B?eHpkTnJTcjZKcUk1a0NmTzlubmcwK3pUMUtQU0RxdFRzT0xZRUhtSE1od1Bk?=
 =?utf-8?B?UzZUelJsNUp0K25NMkpZbm9mUW9vL0dvdHdGMWxGRUdvcyt5MTZhUEdDQnZz?=
 =?utf-8?B?Z3VCYll2R09xZDIrS3RpVFgvcXNmRzdmSFJBK0xpN0UwTFExeTJoeDliTFlN?=
 =?utf-8?B?ZGs5cmdVTlp6Q3A5R0V5Y1hSMVljeExsVEdkN1R0T2t5S0tWeWZDSFJJN1lo?=
 =?utf-8?B?dWo3NHdMdWtXYmNVQ1Zkb0lRZ0g4eDFad0VUY21MbnZNUTA1N2J3V0E3K2c4?=
 =?utf-8?B?RmNJR1U1NzVaN1oxNEFjeHdUcnpTbjQ3aHZ3QkFHVlM2c1hkbm5xL3dBVnRJ?=
 =?utf-8?B?QzJDU1NWSnZadG1NbGRESkJwRVdpU0Zzd1YvbFM3N1dKUUpWczEvQXZJTE85?=
 =?utf-8?B?NjFWVGpPU3JkNm5qWkcxWVplSjl1M1JidG1LNHoyWGxrYVB2Wm44aVgrR2Jh?=
 =?utf-8?B?UUFDNG5pbTVJLzZWZ1cvb3plbkdaUm50S2djYWhmeUI4YUJBdk1ZSWNhL3V1?=
 =?utf-8?B?emcwU1A0QVZ4YWJYVzhuVW9BcldUVGtrT1k2a21kbzdwc0JuQ2dtd3Q0dEZN?=
 =?utf-8?B?MTVzVlRFcFhWTkFnTG1nbnRiajJtd3hlMHpsTTU4T0RSdTVRQnZrMHBnY1Zq?=
 =?utf-8?B?Sk9vb2NtZVlXV05nc0xEdFhLRmQrL240cCttcmZ1SGFoYS84ZDJWUW4vNDB4?=
 =?utf-8?B?UWgwSnd2NmpjT3psUk5XZzNTamtjeW9lb051OStsajJaZFNPenovcU9oTTJJ?=
 =?utf-8?B?TWsrR2RMREZHd2VqUW81QnIyUmlUZkIvajVBNlNDRnBuRnpkNlJJbDBoWnFv?=
 =?utf-8?B?NVpWZTA1NENtdFh0dGkxRTNKS3dnOUxTa3dkaGZYbzV4Z29NUmZ2VWtyZE9q?=
 =?utf-8?B?RTBaQ2lBVzBlcFFsSkwyU1JoT2ozNVlITUJVakk5NnlHOWQwc29pSFBBZm1O?=
 =?utf-8?B?NUFybFFKSjFPeDNDZ0Q4L2llTzNKeGNqeWlvcVM2c1RBZlhHYzZuQXVqb284?=
 =?utf-8?B?eldodERIdkJrem1oY0lnNEIyTitIVnJTWFpWOXI0RUxKT3RQVVl5ajVTaDFi?=
 =?utf-8?B?K1JodTlNMmVyekZPMTk2YUthSTBpdnh1aGVneUZldXVjN29GMFNQZ0pKSURs?=
 =?utf-8?B?aFRwaENxbUpqOE5NYW15dFV3bnljQmcrbUF4c1A4K1J3cWl5ZkxHaSsxcE9M?=
 =?utf-8?B?VnRrV2Erd1ZHSGthOUJsbVFCOXczcytnRmE5UnI2RWlPN3owa2NuTU1xYWgw?=
 =?utf-8?B?UExkRkJQekFhYkprMHg2QTRGMlZaT1hnajJ5eWpVTDBhVUNRVWdnOGFWbU1X?=
 =?utf-8?B?QjZIMFM2dENHejBaYmMvZG5hYVV5MjRVVlJQaGR5WXozYnBmK0JIUnZIaHJs?=
 =?utf-8?B?amxWaFE2Qnh4U09yQWpsaWF4djl2dExRVXhPajNZRXhIR2ZhUDNuZDVnRWI4?=
 =?utf-8?B?VytVMFdQREV6SnlFZWZRWG1vNStBemo0cWw2VkpDUkw1T0VjOTRCa0Q0djBG?=
 =?utf-8?B?L0FqNnRweVB3K3VEeGZtR0cwWTdDZDgrVTExSzIzVVphTi8wTWk2eHRuZ2FS?=
 =?utf-8?B?VnBDNU52Tjd3L1l6cGM4czNHbVJxQzhvMkxGWktpaWdHUy9CaXNCc2Q0REtv?=
 =?utf-8?B?ZlNraDFUZURGU1IxaXRmNEJWUndWakpYcjRlcEdpbDlnWjZjYU9iRkVza2dz?=
 =?utf-8?B?Y29KU0ZJYmZ2cEdSaTFwU09yL0xlNDNvZTVRNmhVczNpVWQxM2VDcUJ5TVVz?=
 =?utf-8?B?cmUreENPeENzcERvdGlHeEJBMGJnR1c1UDkrSHpYQ1BLUjB4NkxrbDlBMDQ1?=
 =?utf-8?B?QXRWNGNLMDJOZlR4V0NDTzZkV0tXRFJ6QmRaQlZIT1RvM1ZMaHR5Sy9kY0VB?=
 =?utf-8?B?MHpOYkY5Y3NrUmRqN0paenJxQkRSYkVKVzg1M1lFcEIyZWduREZHcEF2RTdV?=
 =?utf-8?Q?uUVkGcO1FSNQPRrE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dca687c-be57-4849-af68-08de584b21e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:41:25.3299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8Meml4qDElhsZKCvbpgkhthnMv1tzekKPuek1ovb/wb2epMgbu2RLxHWri/DnLVtw51gUnJe8d4Ow/5vjiazA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9462
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

On Tue, Jan 20, 2026 at 11:38:52AM +0530, Arvind Yadav wrote:
> Track purgeable state per-VMA instead of using a coarse shared
> BO check. This prevents purging shared BOs until all VMAs across
> all VMs are marked DONTNEED.
> 
> Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
> a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
> handle state transitions when VMAs are destroyed - if all
> remaining VMAs are DONTNEED the BO can become purgeable, or if
> no VMAs remain it transitions to WILLNEED.
> 
> The per-VMA purgeable_state field stores the madvise hint for
> each mapping. Shared BOs can only be purged when all VMAs
> unanimously indicate DONTNEED.
> 
> v3:
>   - This addresses Thomas Hellström's feedback: "loop over all vmas
>     attached to the bo and check that they all say WONTNEED. This will
>     also need a check at VMA unbinding"
> 
> v4:
>   - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c         | 15 +++++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 84 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm_madvise.h |  3 ++
>  drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
>  4 files changed, 111 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f250daae3012..9543960b5613 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -40,6 +40,7 @@
>  #include "xe_tile.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_trace_bo.h"
> +#include "xe_vm_madvise.h"
>  #include "xe_wa.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> @@ -1079,12 +1080,18 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_bo *bo = NULL;
>  
>  	if (vma->ufence) {
>  		xe_sync_ufence_put(vma->ufence);
>  		vma->ufence = NULL;
>  	}
>  
> +	/* Get BO reference for purgeable state re-check */
> +	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma) &&
> +	    !xe_vma_is_cpu_addr_mirror(vma))
> +		bo = xe_vma_bo(vma);

I think xe_vma_bo just returns NULL if any of the above conditions are
met, so I believe is ok to just blindly call xe_vma_bo as you have a
NULL check on the BO below.

> +
>  	if (xe_vma_is_userptr(vma)) {
>  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>  
> @@ -1093,7 +1100,13 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
>  		xe_vm_put(vm);
>  	} else {
> -		xe_bo_put(xe_vma_bo(vma));
> +		/* Trylock safe for async context; madvise corrects failures */
> +		if (bo && dma_resv_trylock(bo->ttm.base.resv)) {
> +			xe_bo_recheck_purgeable_on_vma_unbind(bo);

Also I don't think the correct place to call this.

I believe you can call this function in xe_vma_destroy after
drm_gpuva_unlink. You also have BO lock there too so no need from this
trylock path.

> +			dma_resv_unlock(bo->ttm.base.resv);
> +		}
> +
> +		xe_bo_put(bo);
>  	}
>  
>  	xe_vma_free(vma);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index dfeab9e24a09..27b6ad65b314 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -12,6 +12,7 @@
>  #include "xe_pat.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
> +#include "xe_vm.h"
>  
>  struct xe_vmas_in_madvise_range {
>  	u64 addr;
> @@ -179,6 +180,80 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> +/**
> + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked DONTNEED
> + * @bo: Buffer object
> + *
> + * Check all VMAs across all VMs to determine if BO can be purged.
> + * Shared BOs require unanimous DONTNEED state from all mappings.
> + *
> + * Caller must hold BO dma-resv lock.
> + *
> + * Return: true if all VMAs are DONTNEED, false otherwise
> + */
> +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> +{
> +	struct drm_gpuvm_bo *vm_bo;
> +	struct drm_gpuva *gpuva;
> +	struct drm_gem_object *obj = &bo->ttm.base;
> +	bool has_vmas = false;
> +
> +	dma_resv_assert_held(bo->ttm.base.resv);
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +			has_vmas = true;
> +
> +			/* Any non-DONTNEED VMA prevents purging */
> +			if (READ_ONCE(vma->purgeable_state) != XE_MADV_PURGEABLE_DONTNEED)

You don't need the READ_ONCE as purgeable_state is only accessed under
the dma-resv lock, also there isn't a WRITE_ONCE anywhere.

> +				return false;
> +		}
> +	}
> +
> +	/* No VMAs means not purgeable */

No VMAs means it is purgeable, right?

> +	if (!has_vmas)
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_bo_recheck_purgeable_on_vma_unbind() - Re-evaluate BO purgeable state after VMA unbind
> + * @bo: Buffer object
> + *
> + * When a VMA is unbound, re-check if the BO's purgeable state should change.
> + * Destroyed VMAs may allow the BO to become purgeable if all remaining VMAs
> + * are DONTNEED, or require transition to WILLNEED if no VMAs remain.
> + *
> + * Called from VMA destruction path with BO dma-resv lock held.
> + */
> +void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo)
> +{
> +	if (!bo)
> +		return;
> +
> +	dma_resv_assert_held(bo->ttm.base.resv);
> +
> +	/*
> +	 * Once purged, always purged. Cannot transition back to WILLNEED.
> +	 * This matches i915 semantics where purged BOs are permanently invalid.
> +	 */
> +	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> +		return;
> +
> +	if (xe_bo_all_vmas_dontneed(bo)) {
> +		/* All VMAs are DONTNEED - mark BO purgeable */
> +		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED)
> +			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
> +	} else {
> +		/* At least one VMA is WILLNEED - BO must not be purgeable */
> +		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
> +			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +	}
> +}
> +
>  /*
>   * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
>   * Returns true if any BO was purged, false otherwise.
> @@ -213,10 +288,17 @@ static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
>  
>  		switch (op->purge_state_val.val) {
>  		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> +			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
> +
> +			/* Mark VMA WILLNEED - BO becomes non-purgeable immediately */
>  			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>  			break;
>  		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> -			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
> +			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
> +
> +			/* Mark BO purgeable only if all VMAs are DONTNEED */
> +			if (xe_bo_all_vmas_dontneed(bo))
> +				bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> index b0e1fc445f23..61868f851949 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -8,8 +8,11 @@
>  
>  struct drm_device;
>  struct drm_file;
> +struct xe_bo;
>  
>  int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  
> +void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 437f64202f3b..94ca9d033b06 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -150,6 +150,17 @@ struct xe_vma {
>  	 */
>  	bool skip_invalidation;
>  
> +	/**
> +	 * @purgeable_state: Purgeable hint for this VMA mapping
> +	 *
> +	 * Per-VMA purgeable state from madvise. Valid states are WILLNEED (0)
> +	 * or DONTNEED (1). Shared BOs require all VMAs to be DONTNEED before
> +	 * the BO can be purged. PURGED state exists only at BO level.
> +	 *
> +	 * Protected by BO dma-resv lock. Set via DRM_IOCTL_XE_MADVISE.
> +	 */
> +	u32 purgeable_state;
> +

I think xe_vma_mem_attr is a better place for this field.

Matt

>  	/**
>  	 * @ufence: The user fence that was provided with MAP.
>  	 * Needs to be signalled before UNMAP can be processed.
> -- 
> 2.43.0
> 
