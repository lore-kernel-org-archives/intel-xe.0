Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D432C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2954110E6AF;
	Wed, 21 Aug 2024 19:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lO0377By";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EFC10E6AF
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269162; x=1755805162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MxFZf7tAR/gOGOQ4YfcAywFM0xXHRIrqX4/jkr1wVMc=;
 b=lO0377ByDCTe/4lFQg1YJtPUj8XIHjrtb9L+rDsjt3MsiduMB/htRGUC
 7H0oFKkYOvvQbUROCdWIp4Rr+AiPCFv/IBFuxCNlUUTmwCtuVSyrqEdya
 a4EvFa9vbcKx2iNxJ3KjT5uP06OwrB7kybTPv42CFOKIH/iUSm9GkPP9F
 Ifh7HibZo587E9VQS8kJuWvaFoVrv/1h9jcj8zSRd9VG6pL6p39n4uyAk
 Ab1Kwv69zVu3IURm66Mzhy/HGzMhe1VwvdszgnzT0B82OBc6XUB2bqrC3
 OnhB4EUICyIy6+E0fdwzRfjlD0Rpn35ndELqEdtO7/kpa6U/RrvBsAEDP A==;
X-CSE-ConnectionGUID: 7pxtStcUSKCRgHxbiuJnXQ==
X-CSE-MsgGUID: N9Bz2DCMTLuwnIa0rW0hfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48048156"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="48048156"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:17 -0700
X-CSE-ConnectionGUID: QnGoOI2RTmyKyjWmEaDweg==
X-CSE-MsgGUID: O2fPznkOT5KvoxlKqfBYZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61191386"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:39:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p52GB7Egx54aPHlKwv3qaZJ8Ldl4L5pIu369EnJ6SygWh/PnRAH2XfSwDad2mnfwnQpLYn7Wi6sPm9U6Hr1B3LXvFPkz5pUwUvbswfgND6K9K7XLI2SaEb1lmQ/p1tCXFpFtsaPwgJPXA4X7nahaCRqIyOHBYtyhvptuIxkUO+se0cmNF8OviyfxW0zDv0NvaEmSznihcPUx/ydeuvbyaoOBemfrqGQjuk1/SPPElpc76jCQ3dRstolhHaUdxjiiMmJxLwSv54cp7cHYCaGxqna3c7U041elioX9u4D7frP7bK26XQSiP0/OPecQdDO7zJhOIXJup/nAdBOPXgqLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8g9enwFjwXsRvDtspC22Y/lSAcbpMdPFT3UdyfWi+G4=;
 b=IsQSB/rReYS11sxJ+z/lKBBviVRdgrvqws85oEQe4NsU0LAnCQyUZ4VwkbauhC6rnvaNjrTW5c9P6puSQK2kXevPkaEanI+sr2/iY+2eDCYzVzMUak3jb1MyYU5P0rB2BzbC4XQk61H4//yiSn+DzH9bMdVgSZyXsQdTVoK5LEsX2AnxtZGHhGxJWP27vXGIYZ9VLc+JsBc1mE+Tvyi3HyCQj6vRcO8zT/1V3R13Qtotj1Fx4CcTxGv8+i5k95xkX64D3TsXlTaLVU0jHWeEgeOSXqHOj2+FznFUdygF4n/6uJdG/b9+hxZxs4zyQpW53yGzySYlz3hOfsJbK12YqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 19:39:13 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:39:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew
 Auld <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Wed, 21 Aug 2024 15:38:42 -0400
Message-ID: <20240821193842.352557-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d9c15f-e251-4713-2310-08dcc218ef98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWVCSmpiMTlhb1loY0plQjAxTUJaY1JJaC9EMjZjV0NucXVLdEtFZXFPck9x?=
 =?utf-8?B?ZmVSNzQ0TURheFRLdTkvdmR0b0FMai9zSkx3OVdyYkd6YjZwTFBHaHBmdjF3?=
 =?utf-8?B?NWg2RXFzeHA4VlVUeXZKaU84VjlreVBkN2t5WUJBN1JDT200YUF1eFh0R29w?=
 =?utf-8?B?Nit0K25TZHlHU2VnMTR0bmgrWWFlbkg1bm9TRWw0UWRDN1plNGJSU2l6TUQv?=
 =?utf-8?B?Qm54SElUSnc1bHVaRlR5US9nL2V0VU1OejVzc0dlNGdtdUlsc3F5bjNMWGNw?=
 =?utf-8?B?UTlGalQrNjU4SnFlNXRzeC9UN0xzZXFkaTd4VTROYlF4MWJyeGxSb1FYa2Y5?=
 =?utf-8?B?TDZmRVQyVU9NSmptSy9rTWZnaEFMZHlwNURuUnpFck4wdkF2V0M4ZUNaZFF0?=
 =?utf-8?B?Y1IrYm9zT2YrVERnWUF6YUFkRFA0ZmM2Nnp0bUJoWEdkeStBUmc5QUFzbytv?=
 =?utf-8?B?U2dkSkl5cXhCcklIOFJKbUN2N3N1b3F2RHEzQ2hxbTZBTEV6YkgrbjFrTEE3?=
 =?utf-8?B?ODZEbEY0UVhNUVNXVE9ibmNITVpyU3dEbTJSSU5Ya244Q1pNZ2pGeEZaWkdh?=
 =?utf-8?B?dk82VnY3UHF3cFN3MXloS1hMQUtEUWRpL3Q1Vnd4SjR4NFN3aGtlVk1ZTU9z?=
 =?utf-8?B?a1NZTXUyRkZHWDM4TzMrRkZRVUpHcHFmTlhsZTF3S1BKRXIxRXdYdVJFT3FJ?=
 =?utf-8?B?U0pNMjI4ZWM1a2tYVGp5aitCRUF3RTRUcjUwbTdpSXZVV2pmKzlWemRkUDR2?=
 =?utf-8?B?cWozdnNkWlR5ZlRKRzd3MDRNQkYwY2RpcmE2YnlFY0NtaXFuUGxYV1dwVEpV?=
 =?utf-8?B?djNSNVRIWWxwYVhXZ3UwRzhwMG13WE9QcU9Rakg4dHYvVEd0S2JCWnUyOUkr?=
 =?utf-8?B?N005a0ZaSkIrcGtFMzZBWnNseEhueFdDSFVDYnhMRGV4SlhERzFwcjVqK0Y3?=
 =?utf-8?B?aitOZmZOTjRzQlF0R3RhZXNxS2M0Wm1QNHRkTVFHZkVQK0JsOW1rMDRmU005?=
 =?utf-8?B?QTBaN1g3TWVtYTdXY2FCTUJCZW51QjJWS21ZdWtkbFFUMW5FYmtlMWN4K1ZW?=
 =?utf-8?B?SGZaM0V3bjloc05DRlB6VEVXWFpqbzJSTUU4R2x3aC9KaHNoSEVTUjArbThl?=
 =?utf-8?B?enovcWdtSXU2aE13U0FOaUJuZ3pzUGVrenV0SGo3UUtZcVdnVGE0NG1GS3VT?=
 =?utf-8?B?emVaTnlrd0QvSUFjZHBScXdHcDR5RFFIdEdrTmsxVnlTTjB4cFBZL1V1NG9H?=
 =?utf-8?B?VFA0dmcwNkpMbnA2T0MyZnV6MFVaYUJMaWp6eElJLy82TUNpVzNHcUtDTXZO?=
 =?utf-8?B?TVMrOVN1QVJDQkZ3eW1CN1ZHamp2SmNFSHpoWDNDSUREdXVPNGEreDBSNFk3?=
 =?utf-8?B?SEVQNVhadG9pT3F1SXlsQ3gxdCtua3oranlXdjVQZ0FMc1ZBTnlBeUttd1VE?=
 =?utf-8?B?TVNtcmpDRUMyKzlFNk1wOU1qVkoyM3psc2RCRGZiQVVDeURYeklXemxlVUQy?=
 =?utf-8?B?bmdxajlxZXplek5SbDV4eWI3RlZVTzB3L09UZERqMDVTZEdTbVNLaDFHQlJO?=
 =?utf-8?B?K2YwUlBxZnJLWFF0OE9PMVRkdytKY2RxUlRON0s3ZW9ZUSs2Y0hRV2JYYjU5?=
 =?utf-8?B?MXd6WEFjRkdqWVZOWVNCdkpDU3I3ZGYyelZyNjFySFYzTHAzMldzZXRlS1dE?=
 =?utf-8?B?Wk5TYW5iUHV1UDB6bUxNbG4yZkYxRE0zNFZxS1U4V2tobGk3aW1ZVllmM2do?=
 =?utf-8?B?c1I3MDdtQWpEeEZxa3pXQWFrNVdPTDVFaTN3YU1JOERucW9qZ3NYQjVJaDJY?=
 =?utf-8?B?VHFPalQ3TkM3ZW5RSnVGZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0JQSkx3Vk9hU2hxaWZKblJiSGl2NUp0SHFyUG5GV2poRnUwYUlaYVVVZFJu?=
 =?utf-8?B?UjZDYm9IUDlrUXA3dGxibWV1Nk5MUUljWmtXWVB4UjZKREpKRDIwd2pCSXp1?=
 =?utf-8?B?T3BnVStoT3EzUDcxbkhoa0NJQnhseWdtQ2F1bFd4dXdQQjRYc0pPemxXUmFU?=
 =?utf-8?B?RnpuS0NBK1pJME9qd3lUbDRxWUxyM0Zla21scUxNdTRhcEYyc0JvQUdRQ3lT?=
 =?utf-8?B?bVN0WUdPTytyeTh6bUNOSjViQUlFY2U3d0F5NmdhZmgzRjFVd3NKRnJEMjVZ?=
 =?utf-8?B?a2ROZ3dmenJaRnhOMmVDbmsyVE5oSGNmTnBwaitVSTRIenFDOXZ4YTQ0R0Nx?=
 =?utf-8?B?SlpTVnZmNjkxNFkwTjhIdlVxRGNXaXdUY0J3N21tRDZ0TEJoTHM4UWx5Z1My?=
 =?utf-8?B?NW8vV3hCc0x1RnRPVVBUL1BBRDRCN1YzUzZ6OWdxMlZUdXhQSDBLbmt5MW1s?=
 =?utf-8?B?SmVoRGZYQVpNa0Vjb0FzSEJrODFIZmtzTURnTWZsSnhwVEtuS2JKMlo0OUN3?=
 =?utf-8?B?Q0J6UlhPbC8yV0NNZGhyNjFUTzgrQ3RlMTBnaHUyMmxxaFhKMStud1o1d0hT?=
 =?utf-8?B?clJIbVR0YlhGSDVHWjNJVHNOc2ZtYUlTZVo1M0xZS2IreXJ4WkMxaUhhdFVH?=
 =?utf-8?B?SU80WE0vRWhCTmEvTXVrci9sNjE3UUNGdnIxKytyTjBEVElUemZ6T1Q5UjVJ?=
 =?utf-8?B?ZGJMbm5HWjdaOHM3eWYxVExJRTBXVG5WcUJiM2NjZ0ZDUHl1YlpCNjBGT000?=
 =?utf-8?B?Ym1aY24xekdUWjF6b2tRc0JpY0dYZzVvUHRKNHU3SENMSzBQTUhxRzRJYjVW?=
 =?utf-8?B?UWV5c1B5YlFjOEZRTE9JcXNPM2pjRUxvV3FpZFBQM3N3Y3AyT3VtU25QLzVs?=
 =?utf-8?B?MFgzY000eENaSEZsNXVWL1F0R2x5UlZkNEQ5SXl2TU5EZTNQdFp2cmxtRmUw?=
 =?utf-8?B?OW8yYnErcVhha0xyTGZva3ltNFBLTThaVzNGeXlPOE56K3lhUXk0b3Y1VGtw?=
 =?utf-8?B?cDRWT2tEaHIvQW80ZnFpQ0pjRUJCeTE3VUVjcmNOUzVOd3FOTy9ZOGlEeGVC?=
 =?utf-8?B?c0xrVUVPeDlFcVZNRXBGV3JmVkczZ214czlpbWd6azZJMTlzMUZLcmdwVmpJ?=
 =?utf-8?B?aUZlWHdQN2xXMzlXWE1weS9OOENHeHVra3htL3lpb1ZVbEN2bUxidktDZmFZ?=
 =?utf-8?B?czNoMWcyU29SUWJMbnNSR04rSkticFJUQlRaVGF6ZHE5NFFLbkY0U0FaVWlL?=
 =?utf-8?B?NkNKbU1YZW9Famt5ZzV2TjJYSmtBM0dpck8vc3YrOGVDV1lPK2x2d1ExMGxn?=
 =?utf-8?B?VG1Ma0s3U0o3eVR6T2E4ZjdSVmMvTWxUSnFwN21XR3FrYlQ2bXhvb1N2VTZW?=
 =?utf-8?B?YnlHOTFMWTJ6V1NsK21BVldaa3R0YmhpYmhxQyt2MjdaanlQenJVTUZOdVBD?=
 =?utf-8?B?Zk9BbGdRMmNLMHJlSGhYUys1VFBxU1JQemc3dnkrcW5YT1M1Zm5aTDMyUnRG?=
 =?utf-8?B?Nlh3dk16TlZTTkxKRERRck9iQjU2czRpZ2VlN0NwcXJhZTB3dUVobzNvVTZB?=
 =?utf-8?B?dU5Mb1dmNTFoSTkrdGVQbldmdEN2YTltbHVQL1A0TzN2MzlkSUlpc2pCUWVx?=
 =?utf-8?B?ZHdaZllnTEFJUkREQkJGOUFEQWlzODJ1UXdnbXN5dUI1Yno2U0VnbTdTcnVp?=
 =?utf-8?B?NzZqTzd5WC9oV2w3Yzh0SWRKSnhVNzlCSnJqQU1RbWF5MXJESWM0TSsrdmEv?=
 =?utf-8?B?ZEZHajhXL2Fyc2lreDdaM0Z0UFNhZ2ZHS1o0VGxnNkpjRURSNDl6SURqa3VJ?=
 =?utf-8?B?SUJORG80UENyQkUzQWxUcVdzV29YQ3Q3U3Npb2ZWSERad0h6UmdkeE9FLzFl?=
 =?utf-8?B?ZDZodGtUOXA3ZW9xb3lkMDk1OFoyREN2dWNUdkZpYkFEVXRIRUZ0eisyY0RC?=
 =?utf-8?B?S3JnNFgwcnBHemJmWlRlQ0lkcDA0VlpWeXA5NThPdlFQZDY1cE15QVNtSlJl?=
 =?utf-8?B?VnZCV0pCdGlSVzIvNmg1WE9XOHQ1YTlydy9UbnpldkdBV29rUzNYU0tIMTAy?=
 =?utf-8?B?bm9WUGc0WlFsbURPeTlZVUw5Y0JoZW5tRkRqcDVKSmRDbVBvaTJib2xqdkF5?=
 =?utf-8?B?K3VqazJvR2s0M3AyRncxck5wK0pZS2tKR1BnWk5HRlZ6clVoazNDSS9sOHYy?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d9c15f-e251-4713-2310-08dcc218ef98
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:39:13.6364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+IehIh/8fNIYVqLcwYmdnIWOJysL/vK+tRyquu245wLm31vTvNT7+kfZiWPKCGaYPT3mj4+m7DdmkfPeRQ6qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)
v8: Address the null deref (CI)
v9: Based on the new xe_ggtt_node for the proper care of the lifetime
    of the object.
v10: Redo the lost v5 change. (Brost)
v11: Simplify the invalidate_on_remove (Lucas)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 106 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h |   6 ++
 2 files changed, 73 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 58d7cad2425b..b4a0cd2b62ed 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -276,6 +279,68 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_remove(struct xe_ggtt_node *node)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	if (!node || !node->ggtt)
+		return;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto free_node;
+
+	if (node->invalidate_on_remove)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+
+free_node:
+	xe_ggtt_node_fini(node);
+}
+
+static void ggtt_node_remove_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
+						 delayed_removal_work);
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_node_remove(node);
+	xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	node->invalidate_on_remove = invalidate;
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_node_remove(node);
+		xe_pm_runtime_put(xe);
+	} else {
+		queue_work(ggtt->wq, &node->delayed_removal_work);
+	}
+}
+
 /**
  * xe_ggtt_init - Regular non-early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -471,7 +536,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 	if (!node)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
 	node->ggtt = ggtt;
+
 	return node;
 }
 
@@ -488,45 +555,6 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-/**
- * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
-{
-	struct xe_ggtt *ggtt = node->ggtt;
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	if (!node || !node->ggtt)
-		return;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		goto free_node;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-
-free_node:
-	xe_ggtt_node_fini(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 0e8822ae13fc..cb02b7994a9a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -47,6 +47,8 @@ struct xe_ggtt {
 	struct drm_mm mm;
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
 };
 
 /**
@@ -61,6 +63,10 @@ struct xe_ggtt_node {
 	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
+	/** @delayed_removal_work: The work struct for the delayed removal */
+	struct work_struct delayed_removal_work;
+	/** @invalidate_on_remove: If it needs invalidation upon removal */
+	bool invalidate_on_remove;
 };
 
 /**
-- 
2.46.0

