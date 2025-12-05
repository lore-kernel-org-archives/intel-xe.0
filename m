Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ABED37497
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 20:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E170310EBAD;
	Fri,  5 Dec 2025 20:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YieZGyzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04810EBAD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 20:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764966446; x=1796502446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MHbDTNFizKxxGgRRsQoNzvsw5RcY+JcfSli6ep47OMM=;
 b=YieZGyzsj2EGii2yJSf4lALNPvQFOHR8pGuXytGy7eazUEhqLpCNxYKI
 JT/yCJfxSxYkEb972PxSzSeuOorqroegxCzMRSiIpFwlWuJG11idApJjH
 NrBMARXOtMDgTw9zgnrmF6bEOJl3ld6vB4ujVAHd2sHNWAvICyWWDt1Nz
 U5reZkl13KEz5WTJ7Ul1KsSbTZCHr6I9FZLx9nWJz91R8/yCrYlzYcOkT
 GyB//JIwz8oOi0suloVI90VzWWbzTcijrrFixXY05zEZVs7+FnxR0+1eQ
 PyXckzWOH1BQLBtDWwSlRnrbKT1rJTzD8lEhlR8zw/OnufjAembMy60Xl A==;
X-CSE-ConnectionGUID: FtG4MJsPRSmvJ3x6shGmeg==
X-CSE-MsgGUID: TgzIzLnWT2ykx4BOm+2B3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66890613"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66890613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:27:24 -0800
X-CSE-ConnectionGUID: 6q0zDyhjTQCt3AMT8O2lfg==
X-CSE-MsgGUID: BAkRp3KIQzyt1w9rrTSdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199855860"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:27:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:27:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 12:27:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:27:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOZrgPf/FU76JS02GKyGyqsmg8AreXpF02ZD5A47hKcR3K14WYADLWRLILmDxGoYzzltMwJR98fBtpVf2nW+qRRF29OAlOkU1CgfV22zsUmjXYbTJSwwS75i3xekPWs4muZ4MqYHVwgAyH2+GjcfwHjn5dkIK1Fch1FPe3gtTII5ls/rMvDJ4I9smCirw5XN2yS2iULiiz7O/fmFM7DUJh9RtdlaHROFKj4p4vvl8Vv087ku0dZ7SmI+aiBzXhK9zUoCOlW1hO1I7kRfeVXqMMRQ87Xqtm4WchPbIBa7eRIEOF+CjcS6EXlGnkVbISG6AyQXY/bpcFNR3pwGxnTIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd8SWBdC2kPT+FIsMqb8B3nzfN9lj3PHe7NDjdl9K38=;
 b=CBwxRbNR0jNpYkx9ORJ/700UYr7C6Ol+AoCt+sbIDPyqDbIImuVGWSiD5fnGSM2elEKTQeI571LDnp2F8UPLidQaNkExs4Hc2wxsl4VlK65F4QIRnOUmrtm2BNfU/8e9PgkiP0Kbk9tVqLGy14zelIgLRCU5W1MXYvGKiMh8n2M6OOTXg8eyyT5WwMO4OU0IZA1aO7xYND5NIyEbybF40qoR79coDFpqIKCgexj9sLJvaib43c344t5rj+Xsmy8lCsxnmnBeT6O7Dv3h4AF77uPI9F391HgEelS8pF+KZM9xyWpWY9CR4ipKVVHfOQb//O6n3Ig/i69mgEeXu3UyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6390.namprd11.prod.outlook.com (2603:10b6:930:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 20:27:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 20:27:21 +0000
Date: Fri, 5 Dec 2025 12:27:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/vf: Reset recovery_queued after issuing
 RESFIX_START
Message-ID: <aTNAJhQk60odM+da@lstrano-desk.jf.intel.com>
References: <20251205082615.154649-3-satyanarayana.k.v.p@intel.com>
 <20251205082615.154649-4-satyanarayana.k.v.p@intel.com>
 <6f4a0e2d-0bcf-4f19-92a8-bff2949b63c9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f4a0e2d-0bcf-4f19-92a8-bff2949b63c9@intel.com>
X-ClientProxiedBy: MW4PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:303:b4::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 56398fc9-7991-4301-9913-08de343cb16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1lEc3JRUG5hQjB1cnVzeGJpRUhzdWk5L0Z5WEFzaWE5YlBDYllVcXVwQWla?=
 =?utf-8?B?QXdMWFlYMnBoWnBCdWVDZE0wU1VlcUhFY3Q1SktyS2p1bGlDMjU1R3o5T1Ur?=
 =?utf-8?B?Zyt0elhNMXlicmFjZi9DeVcyeTVET3JzY1pickNxNWhwY3BHanBObHZ0Mzh4?=
 =?utf-8?B?VVRnRE9pM0thSkVsNTcwbThzQ3FpakwvbUpRUjZHTjB5bzVycC9NUk1YRm9Y?=
 =?utf-8?B?TEFsblZoZGV1SCtZcDVvRkVFVy80MjFQTEo2SW85cUZCNEpKR2tEMWYyUnpi?=
 =?utf-8?B?cjJjd1ZPMFd2QVp0WERycHN6L2p5YitvNGV4aVc0WFBtTit1ZU4yYTZUM2ZX?=
 =?utf-8?B?dTdlY0JuSTFRdkNpOVFKNklXbnVZYnFpbnBHUThGTjRjNFY4dWZ3ZzBsdWxw?=
 =?utf-8?B?R1lzdVhTSGtIRHlGcFpNdXlBc05vUWc0TW1JUUJiYVhqVzBVMVhnbGJQWWEv?=
 =?utf-8?B?TldKTEpSOFJRU2h3RUxpYVBDeUZnWFhTUUREdE41b3VGUTQ3VFJXTytiejFG?=
 =?utf-8?B?VHZpcXBJWlN5NlRSU0VCWkwzMDVDTEF5YVdKdVcrL1E4ekZhUmp4enBNTHV5?=
 =?utf-8?B?Qk9hblNRajN1NFhod0tNbU11bjV6dGozL3E5cE13UE96bzQ5WENhL2FqeXFv?=
 =?utf-8?B?SmxXL281N3dENG10M0NzU09ZdzNTN2ppSGk4dmIyK2lnK1JROUlrSVZWSGNF?=
 =?utf-8?B?eExIVWQySWlLZkZQdHF6QnBVd0xUS2NEYUhzTHdVQmJOMWlaenAwK1NBVFhm?=
 =?utf-8?B?aWIzYnVYT2F6bmFEZ0gzV1IwUTF3ZExjeHBBa2xBa1lNS1ZGZFUyc1piKzhQ?=
 =?utf-8?B?ZUY5ZzJwTmVtdGMvZFNmVVc1RDlLVE5RWnJpL1dsQlBaeTlXZWhBYmRHR3Y5?=
 =?utf-8?B?RWxoU2hjekRGNFM2SFRGSFp5OTFNeUhDQkhZRUpXcTVqNm9hS1owM0dLU3V6?=
 =?utf-8?B?Ym5qYUJTMTVXcW1jYkdJa3BXYksrV3BaUDRqa1ZRZjJXeWhBU3VORVBrV05i?=
 =?utf-8?B?OXpOQzBDZzNVcm52NFk1UCthT01pK1E5dlV2UHRncE5xM1lLbTRDcG8rZFBM?=
 =?utf-8?B?RHFNelFPNmM5YmZYb0w4eGNCUlFua2J0WVVYdHN4ZkFFUERuV1BBMFplbnpZ?=
 =?utf-8?B?dEdyV0V5bVNxUXJKVXBBOHZNdi9VU1RwWnQvQkk3VW03ZXN5WSs4clo3c0I0?=
 =?utf-8?B?b3hwR3d2RGNtN3VhS2NDbTNyUU9nOUcvYlY1U2xsRTJjUklHZWo1bVRtL0Fx?=
 =?utf-8?B?aFpsNmNZTDVTS0ZsYW0yRk5wYUluTHg5bVFwdXBGZnpuVWV5ejlVNUxtcHl2?=
 =?utf-8?B?UFl1YTJKTUZ5ZGhVTzJvUFdJWXgwMlV4S2pDbUFodFBaYXJ4dzdZT0F6YjU5?=
 =?utf-8?B?NnVnMzQ1MnhIYnlndFEzUHp5dFNRRDRrRXh6SEtzWWtTZWg1Y0VvTlk0MTNW?=
 =?utf-8?B?enZEa3JxdEFLano3VFp1c3NUNFE4dk9vREhMTE1nTnJBTGpMbUk1T0Y1SzhX?=
 =?utf-8?B?WW14ZUwwUXNGbGFMTUlBdUFFaWc4RkFFaElCWUFDNzZ3RnJmNnlTT3JtcUta?=
 =?utf-8?B?Mlg0YVJ3aExEVU9jdGlmSXRYUmpNdlZWb1hDalV2aDlXQU1NVERJbzFtVG11?=
 =?utf-8?B?Y1JxTnljVXFrc3FvdkJQNytwL0NJb2MzQndmZXIvRGs3Z3dOUE5NQ2UrVmFX?=
 =?utf-8?B?TTdEbUJEYVRVVWNUUHNxWHZSQTcyQ3JhclZHM2xSeFUvNUc0TGF6SXA1TEEz?=
 =?utf-8?B?b2xIeVBwQThkN3IxMmU3UGI5TTZBaDhENjJ1Sk1OZ09ldUp4UU5PRHJxN3Zh?=
 =?utf-8?B?SVNuT2hLODUxY3YzaGtKYlhZQWN2ZWFyTGhBdlYrRjNpQlBDVkFNajZIVzJW?=
 =?utf-8?B?bnR3OFI0cEdUZlFXYTlRUkFEVEZTTzg2TS9yODdUMjRrQUlrQjMrS2dFd2tv?=
 =?utf-8?Q?ShCR9m6dfFHfhfMGGfP5c1+zzBL4Y9UI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pIZERXMDVEeGZRMXJuckxIOEtYYW54dENQZ0F3YzhVRlZqeG91MmZSNGxF?=
 =?utf-8?B?TTJvckFvM28zVlQ2MFNZeTQyMi9NdXpXT3BieEJ0VXAzMjlISXdwSGNZdkh6?=
 =?utf-8?B?T3lLb2I4THB6NGdHdVJESVYwWHJrRElxVmFFc25ENHlReGpkNUZBQlZxTGM3?=
 =?utf-8?B?WDBlNUFncHJMSGUyY2hZa0VzOFUzRmJGRTQxUE54WG9CYnhvcGpUemJRaUU3?=
 =?utf-8?B?T0VXYjNLOXdCM3lSZGNZY0FVd3F3Ym5DUXpnUnFPT3FIekF0WUZIa21HaHpj?=
 =?utf-8?B?ajR3WWN1UENoSXBBdSthdmpRdVQ3b1VSMGtsWjlSUmdBNnFicEVMY0FoQzl1?=
 =?utf-8?B?WDFwVWJhRzd5WHlaSTRqT29yMTVkQ1BLZGRrL0EzUHRtbjZJcEdKSHdBekV6?=
 =?utf-8?B?M2gzNjlINm0wRVVWOGtxODV5WXYwVkJJeWQrZG9SY2dlZkYzU1l0czBKdnFw?=
 =?utf-8?B?V2huQndBSzk4d2xkSURDcnJYR2Z3aFJNU05lTXZnT3NLZXBGUnNKRFpxQVdP?=
 =?utf-8?B?aGRJcDJreXAvTSsyUjV2UUkrR0ZQNHJqamorZ1NJNnJBZHZXWDN3ZnBHclBu?=
 =?utf-8?B?M2NFSkNJNHF1THVyNTFhOStvQ1ZwOXZzWWxQbHB0U1RWY0d1YjdOOWF3U240?=
 =?utf-8?B?Skt2aVhvWSs3NHhJT0dZS2ZqNXBKelhYMnJUdzh2WmRCc2Jvbkx0SXRFay9D?=
 =?utf-8?B?aThZeWRYSFMrRHJjbmFCUW1PRFg5YjdlQkVLMUo0dVpONGFRZFdBNk1MKy9j?=
 =?utf-8?B?RVczSnBOZVBkS3NIbU4zQWRYcGFVS2duSGRiODErZllhN1hndFJnOWoxRzBj?=
 =?utf-8?B?Y3ExVklaMEZmR2VFaENjK1ZtbEVHRmFpWFArWWVoZmRGYW5tdWNWWmJ6OEhn?=
 =?utf-8?B?M3NQZmlyVm9mWS84bWlMZGNrbVVxb2J3ZDhGZWhjMW5CMHU1c0FEdTFaWm5E?=
 =?utf-8?B?TG1KUjlJTGRvSWovL0xPMlVCcVduQzdGS1BwUHVwaHh5amY1NVlFbHpNeTNF?=
 =?utf-8?B?SjUreVVGZDM5YzY2elNQZzRYSUd4NjlBR0NGc2V2NnJLTHIzeVZ6dnpia0RQ?=
 =?utf-8?B?Wldlc3p3TEJQVEp0eTVCL204OXdUREJwZXBpRTR2OHgxOGlDbFBUTmZjVkZF?=
 =?utf-8?B?aE1QWnJMQUdmQmZCZW94ZlVXaDJsUllkcDV6VDB2b1pTNjR3M3ZHYlBrcWE1?=
 =?utf-8?B?RmZ1QXBnY2ZOMUhIUitVZUIrbDdTRXAwMVRmR0czOXRhOUZsTWc4bVM0a0dB?=
 =?utf-8?B?ZzhyMVlPNWU4OEtJUmx3bHd1d0dQbitYWldRR2Mra3IvZzFVVmtuTHJ0bTRM?=
 =?utf-8?B?S1lwUlhLWU1KUWFSUng0Qm5MRjBjbzlacW5xV05MY0V1dlRqSjd2Mlk4TkFw?=
 =?utf-8?B?cWhiY0RuYXpEd2YyQ0NFWEZUQkkxc1NuTkxPODdtak1qeGtEZlRFelIyMDlW?=
 =?utf-8?B?ZWFDN2hKbEJDUDJNWExaUzJLUlB5ZTJwV1RhS3U0NWJkZVFSZnFUc0RmUVB3?=
 =?utf-8?B?VEZXTlpSZ2RDQ2pjejBBckgzTmFHUFBRMWJqMkFMMXFUWnd6N1JhY3l2Qzcy?=
 =?utf-8?B?cEp5UWxkcVhoSCtQYmp4THpUSFNsMDhQdlo0Q2FSUlJqd005QnFmYXZ5SGdJ?=
 =?utf-8?B?ZFYyZE4wNHo3cDhsWlQreUxVaU5OK1BLUThtRCtJNHYycWtyL1FWemM3QnE3?=
 =?utf-8?B?Ukt4TlFVbHMwVnU4NWRGZlFHbUNxOWZpbTJHck4wUS8rWWY4SFFST2k1dTJB?=
 =?utf-8?B?NmN4R2cvQU81dmk2R3ZLSzFIdU9VZ095TkM0akc0VFNoaDNSM0pndWh6bUdO?=
 =?utf-8?B?SS92aDBkMGxSZ3oxTnhUNXV3dEtOaGFXVDQ1VGdlWjg1RmFORTJGNXRZbGI3?=
 =?utf-8?B?ZkFUeGpxd2Q0RkdkaitUMTY4cndiWjhMZVBNaGNtTSswVG1IcmYvcTFFT3dW?=
 =?utf-8?B?Y28ya2pldWo4TlhSWUxNUnRDcjNyZno5c0J2TWhwUEVQTzh3eU5YZW4xUVB4?=
 =?utf-8?B?bmFCWWErWUxLWEFTOWJ5Smt3amtUTVovakxQcWNpSktaMXJ3VlRQNjc0RlZB?=
 =?utf-8?B?RzVxcGZuYjVSYmxhMkVENzcyN0RhM3FSSXN5RW1SOW4xVW1CSzNwdWxycTZO?=
 =?utf-8?B?RGxXS1ZhOWhuTU93SC9ocFdqVWxaN0Q2bFZMQ3p3b0lvZnI1dzZjVGsrNjZu?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56398fc9-7991-4301-9913-08de343cb16d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:27:21.5345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0gGWvUvo8YBjS7qe7X5DQ4qW5OpKEotpDDHzmW29TvVMSgfh2z/oRAmTisBNBUVwLn8rS3PGMPOyzGWz+0G2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6390
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

On Fri, Dec 05, 2025 at 09:01:16PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 12/5/2025 9:26 AM, Satyanarayana K V P wrote:
> > During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
> > clears the RESFIX_START marker. If migration or resume occurs before the
> > VF issues its own RESFIX_START, VF KMD may receive two back-to-back
> > migration interrupts. VF then sends RESFIX_START to indicate the beginning
> > of fixups and RESFIX_DONE to mark completion. However, the second
> > RESFIX_START fails because the GuC is already in the RUNNING state.
> > 
> > To prevent VF KMD from queuing additional recovery work items when extra
> > interrupts arrive, move the clearing of recovery_queued from
> > vf_post_migration_shutdown() to vf_post_migration_resfix_start().
> 
> hmm, it's not about moving the code from one function to other, as this is
> implementation detail clear from the diff below, but rather we want to say
> "clear the flag after sending a RESFIX_START message to ignore duplicated
> IRQs seen before we start actual recovery"
> 
> > This ensures the state is reset only after the fixup process begins,
> > avoiding redundant work item queuing.
> > 
> > Fixes: b5fbb94341a2 ("drm/xe/vf: Introduce RESFIX start marker support")
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 3c806c8e5f3e..90f2ef1772f2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -781,7 +781,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> >  
> >  	spin_lock(&gt->sriov.vf.migration.lock);
> >  
> > -	if (!gt->sriov.vf.migration.recovery_queued ||
> > +	if (!gt->sriov.vf.migration.recovery_queued &&
> 
> this is a different fix that deserves its own separate patch with
> a proper commit message
> 

Yes, this fixes my original implementation of VF migration. That was
definitely wrong—I inverted || and &&. So your change is correct, but I
agree with Michal that this should be in its own patch so we can
backport it independently. 

> >  	    !gt->sriov.vf.migration.recovery_teardown) {
> >  		gt->sriov.vf.migration.recovery_queued = true;
> >  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > @@ -1171,10 +1171,6 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
> >  			return true;
> >  	}
> >  
> > -	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > -	gt->sriov.vf.migration.recovery_queued = false;
> > -	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > -
> >  	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
> >  	xe_guc_submit_pause_vf(&gt->uc.guc);
> >  	xe_tlb_inval_reset(&gt->tlb_inval);
> > @@ -1258,7 +1254,15 @@ static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
> >  
> >  static int vf_post_migration_resfix_start(struct xe_gt *gt, u16 marker)
> >  {
> > -	return vf_resfix_start(gt, marker);
> > +	int err;
> > +
> > +	err = vf_resfix_start(gt, marker);
> > +
> > +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > +	gt->sriov.vf.migration.recovery_queued = false;
> > +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> 
> we may want to use
> 
> 	scoped_guard(spinlock_irq, &gt->sriov.vf.migration.lock)
> 		gt->sriov.vf.migration.recovery_queued = false;
> 

It doesn't even need to be scoped as we immediatly return.

Moving to this function looks right, btw.

Matt

> > +
> > +	return err;
> >  }
> >  
> >  static u16 vf_post_migration_next_resfix_marker(struct xe_gt *gt)
> 
