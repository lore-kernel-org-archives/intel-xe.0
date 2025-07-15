Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CCEC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2300910E69D;
	Tue, 15 Jul 2025 21:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JR4Yyqso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09AA10E69D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752615279; x=1784151279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Vy+ZhUAoqY7QbIcrsQXx58N0w65XFcVMGwq13kOeNeA=;
 b=JR4YyqsovXcWk2yqsundLF9hAZfGqcOCNSwD8LCLSyFK1Ymm1du6bz8L
 G0nbVkx2ska/Sg22mTCDTqpGW9asSYDazZQEumZC6vZP3oAC6ADEq5+ze
 0DqQt0lFA/SNOqFMhYwQyyoekEDDXTWKdTTAloSni/Wvt1ALjxbsqZ0DT
 sPL8nvqKKR6tUu4e5cw26Ho/k0ctJsSxlO8exKJ08auewhoHYbH46pTtf
 NBhF9etz708SfOv0MuY5A3ehfVWLHmlTtOFqA6ipXiIupbr/gTh84WbKN
 21AlqkbrgOkspO6SxLZEF+dTMSRGZtqs7gtoP1Lp4PcLUqSPMUMYJBVgN A==;
X-CSE-ConnectionGUID: RpnztYOQTzmdCsWSR/bDPg==
X-CSE-MsgGUID: E5Mm1R8WQN+cu1pmsbOj/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55000319"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="55000319"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:34:38 -0700
X-CSE-ConnectionGUID: Y8Gm3eP3RMKevm5QlqXHcw==
X-CSE-MsgGUID: c4lsjRDNTc+gcdcvEM3Utg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156734712"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:34:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:34:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:34:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJyFfW1P9+5FHkrvBLOuH4u1OYE31tT2wqqByYkcVwG+oONJL6fmndPNJrobTLTrgvPmpAubzKANwJq4x/JLI0rv85+ORUgbHbMREQ8wYpr0y1+QiO0thbVmta9ioSMOpSG+PZ+cXI2hRSPw0leaTQB//ZPAz4vr60aTz5FnpusH3oc2T59hNFisonXfN85oUAfQcWxmWZiBsy1UyB7UQRMvzP/bV7LkLzhANsjrMtZSwM4VHhchY+bX6cOGF/Ucdhj6zLX62hmqHGkyvYQdacgzjAl1a7CtH1+WYzJOP+Cxv4v6YpqI6HveRIVctsAGXT9sPqKeodo/jJu42LC/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vy+ZhUAoqY7QbIcrsQXx58N0w65XFcVMGwq13kOeNeA=;
 b=tQ9+LvD5s+wDBV1ntRz0gio9nXaMJFzjbHSslVYZKJI77XKPZ7E5k0D6lUwmiOH1GdJ8Hl61LPD50Z0dQxusmN1+SCH3i3ad1mbzo2hekEI1ILCzPQsakKMDy3XYz4AfImBlgBDDm2/+6x2utmuCVHpKYbjYxHj282m9aCWe++Dq7XSTXTM2e6abSxEpR8jfLN9zmLzQeYBx9qRqUiSwJJWKZjC39glB31iTGEYVYTK+FFy8HcrfqmbVdslX3TT3fWwTapAKg6ZzuqzKS2SJSKkopAeh0BWebKGvQTHScV9HC4AuxFMHNtobPKSZmndgN+Rm0npKxlVbBBbkPZyYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 21:34:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 21:34:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Thread-Topic: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Thread-Index: AQHb66rFqWVNaJhCZUCtVTNEzEJrsbQzySWA
Date: Tue, 15 Jul 2025 21:34:29 +0000
Message-ID: <f70aa0a14c0a4c0e3fdc1570f42ca804705191c4.camel@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-6-matthew.brost@intel.com>
In-Reply-To: <20250702234222.3278264-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB6716:EE_
x-ms-office365-filtering-correlation-id: f0720c1c-6db6-4b3a-5feb-08ddc3e76144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QnlzNmdiaHV0QjRFaGMzamNCREFTeHFrODVPRmlNTzZMZ2kxbDBwcFhIK21k?=
 =?utf-8?B?NzAxRjRLRm8vZ1JIUVBnZGloM3ltME5xN0pEWDZLV1V4QkgveEV4Tm5LelZ6?=
 =?utf-8?B?VHBNWFhoZ0hvMGF5QUVXd01oQ2NnUFBSSzZrbUlTR1ltcXpXLzNwMlJEM2sz?=
 =?utf-8?B?NlFDUGZxQ2U3UEVjdENPeG5YZ3Jmckd6OXRVMkFZTzY5bEhDMlJKdTlvbktC?=
 =?utf-8?B?WjhGK3RuOWRjTC9mV09mMDV2NDlSYkhsNHF6YjhlaXp4dkZ1dDNTRjJzUVht?=
 =?utf-8?B?SGFMOTZud1pxT0tUSnowMnRNLzd1ZkhGVzBQaHNUa203d2JJTWwxQ0ZlR1ds?=
 =?utf-8?B?UmlzdWZHVHhVaXVUUXJac2JFQ2NwWVpQVDUyYzdhTVlWRTFVZUpCQnh3Szdh?=
 =?utf-8?B?bFphLzFDcW9tdGRHODZ6U3pwbmZuNmh0eURYME1nY25TUmpJUVVpcUZxb2FL?=
 =?utf-8?B?aHVIMTl5TTlWWUpaU2ZDNkR6NXRvMDNHMEk1WEI2a3ZucnhvYTJiTjhhQlg1?=
 =?utf-8?B?b2Z6c213R1E1MzBwTDAzTHVMc29iQUpmL1c4b1IxUVJFVGFranRVVW1WS0dr?=
 =?utf-8?B?dGlxY096TnI0QXpYd1ZMUnVQV2tmbmdUNUEyajJaWGtvTktqVWMvYU9BMW0y?=
 =?utf-8?B?VTlRR0NQSjAzbmVmejNTcjhzNkJWczdtVUV0NWh4czJwT2lXNld4enJ4cThU?=
 =?utf-8?B?ZnZoUmUwdWFLT1hsR29ISmJPMzdRQUNqWkRqS3djMlEvYjJLSmJPQ1dJTVN6?=
 =?utf-8?B?R08ybTMwWVB1WUpXMnA2a3dqbGdldTNJM2N3ekNDNUxBVGgvZ2JvYWtVcFhr?=
 =?utf-8?B?TlN0bENEaS9heXdCaVZLZTFjUkUyamo4VFdWTTVYNFpqWXBjTUh3R2JMa25H?=
 =?utf-8?B?ZDBJY3dHTVNYT2YwQ2xkWEhHemY1WHFLY2tzd3UzVmtLWFRnZlVnTTFWU1hi?=
 =?utf-8?B?a2NTZm12cUo2ME83emVPWG9OTnlaajBxQjBVQVlTbTFlWW1FbDBIMHFVdTdk?=
 =?utf-8?B?cjNUZDFOb2JqWkoxRUhJOFlKSTlxVElLa1VhaG13ayttK080eWg1QkF0a3ZH?=
 =?utf-8?B?TjJEQktyeDR6M2NMamtBT3NTSzEwTVk4NUtZdW4rVmRvanA0Ynp4Zk1WSE10?=
 =?utf-8?B?ZEtPTzhZdUhEYU1Va0F3M1VwL1dyODQ0Z0lwVyt3YUVPL1NwbFdlV3hudzRN?=
 =?utf-8?B?MHl4c1VoaVJQam40a2Z6TEVCWTdSN3g3dW52Z2J1OU9OUlJSdUluTVh5NmIz?=
 =?utf-8?B?SWFRYzgxQTF5M2pBYmt2K3daZnZNblZVSHp1WDJRY3VkODFhT2YzY25nTFRz?=
 =?utf-8?B?REgzOCt2TDJOb0c0VmxQdUdCR2lpZXMxOVF0bWdpak1jL3dlV29ZN0E5SE0z?=
 =?utf-8?B?S0tCTEE1UEN6bFpLVXErQ3cvL2pkQXdiQmVsVFltcEpzRis3bjV5RjVRVHhz?=
 =?utf-8?B?cTJPenFTM0YzT0pZWXJZc2NTczNpcEF5R1FZekF4c1N2a09rYTZQeVJlOS9S?=
 =?utf-8?B?T3FQTnMzR3p6R1VmVkJZY1I0Mnd4RzVteHcvR00wNWFtWkZBVXNldlY3YmFW?=
 =?utf-8?B?VnppRCtsVm9YeWk0cDF0S3VBUHJhdE5FL2R1QlRCR0lyUUJzNVkwdHo1Vi96?=
 =?utf-8?B?blVyM2dTWklEeFVoUFlJMW91dS9UYnJnM0YweEtlR1dCSzlzNkxHZ2ozUjRK?=
 =?utf-8?B?REZGVzAySk5zME9WS1k4dUhoRTdlMVpRc283YTluUElFTVdPWVlZb2F3TzlG?=
 =?utf-8?B?cHlzNDA2TVZDMllYelFrdE1ML3g5Q3JoS09lVWt3U3ZoSElycDJidXF1Yndo?=
 =?utf-8?B?ek5TYUJ3VG1kUlIxWnNUcXYwTVJ4ckE0eUh3UTdFcDEyVnpPbDdyNEhwWVZu?=
 =?utf-8?B?UGFTY0tNUWpJR2tXMVlKdm1RT0RKcG81RUlsRCtBdmNEUnNzQkxtbVdaenZD?=
 =?utf-8?B?SDFlVTM1VFNjamVYL2FNK2IxWGZiRS9SdVFLSFBPSkwrVE90aFY5RUV1VTlP?=
 =?utf-8?B?NGQrTHEvemJBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWFIN01GMy9icWsxb04yQmZhMnV0NUc2eFNrMVhSSDlVVkxZUTZGUWU5aVVU?=
 =?utf-8?B?TVE5aE9xUWtiLzJ2TjNwTXI1Qy8vTGxVVDF3VmROc0ZMSWdVOWlkWm8rSFRu?=
 =?utf-8?B?ZU1tUVIzekc2ZHhyY2VSek05eUdVSVQyRjQrejYwWkhkMS9kY3AzU0FIU2g2?=
 =?utf-8?B?ZjZzMUY5UGJReEdmcHVVUjRHby9BM0h4bk9vS3AxMUlvUnVUQUhrREZNYmlt?=
 =?utf-8?B?WjdRY3NwY2dYb3RwNVQ5YklvVUdnb3NhY1ZlVDRtSTdoOEVjUDdNS0RCVGgr?=
 =?utf-8?B?RzM5RnFPWEx6bTI3UVFjTGo2UnlneVdWNGl5M0V3K0RycythRU9FVVdOdXQr?=
 =?utf-8?B?MTVmbmxxTk1OaWd5ZVkwNHc0b2NkOERUM0EvTkF0cUVUTFFwd0VYaTJKQkMz?=
 =?utf-8?B?aTg0TUwzbFd2L3RKVGI0dHc3bnpJY1V2cmtlby83WjRWMTJwNmU2K21ha3lI?=
 =?utf-8?B?cDdpWHZsMUtISjR1bzU1WmE2TXE3dW9ZNlBMcjBXK0UvNUE2ei9WVzdUYnI4?=
 =?utf-8?B?YzBQMGYwOFVQYXpXbnN1YzNYQk5NMGlONnY3M1plYmtlVi9YSitqaldCVmZ3?=
 =?utf-8?B?cGU0NFlpdGV2M2VPck1DYXRaaWJSVjFJMTdkdmJ0aG1aSlBtc1JtdEJNZGR2?=
 =?utf-8?B?aWtUOVhhVE1tUmpBbVFBSDNkbUYzMGthMkJNWlhrMHFjV0tUWnBIR1RBcXFF?=
 =?utf-8?B?aEtQdXBBc3Y5R0dFdVNrUS9rR3d5Mis5Z2JJdGhQeHJsWDBPMW5aYXhMRTVR?=
 =?utf-8?B?U1R5NmZXZmJmRzZQRmhmdGxqaEFFZ1hUVENWUW15RHBIakVhOWNUUTREQmlV?=
 =?utf-8?B?b01iRC9wcFlHSC9xQXNMUnQ4bXUrU3o2SVJWUnhjb0RWczJ6anNNMFZ6NU5s?=
 =?utf-8?B?R2Y2RXFobFBTbjBDd3Z2QTZYMGVSTU5HaGszVTJJMCtmQmJja25FWFlwVCtT?=
 =?utf-8?B?cFB2Z2EyWitUeEg0a3RISXpoZEpWOXZBVTI4VFZDSU1BQ3k0Q3QvVkszTDBY?=
 =?utf-8?B?SWFiNUNoSmw0QUNFYk5YZElZSkxxdWc0Vk9jOGJ4Z280WHJVOVQ3dVhxSHQ2?=
 =?utf-8?B?cHhQUzVNMzJQdnJ6YTR3YTVzRmZtRFYxNyttb0xaY3lQME9HZEtubVVacndH?=
 =?utf-8?B?NjBPbUhRVnR0WWJ2b3R1d2grRTFIODcvRmVndDhuRzNtTHJ1ZkpBb0VUczUr?=
 =?utf-8?B?cDJtb24vcUZSc0hQRmNta2orNWxReFUvaitmV1gzUTh1TSsxSVhwRGswbkVL?=
 =?utf-8?B?WnRFWHM3aWFZV0duQi93dGYwRU4vdXlYaXZYa2c1UVRLYU82MndYQ0xad3Zv?=
 =?utf-8?B?UWJaNXk4ZUkvMXduVENGZVoxSXMxNDRxQzRqRlNmL1ZleUpLTTUwRjFZOGZV?=
 =?utf-8?B?NDlFeVRydGs3dFNrT1BiSWZRM2hZTHY1SlBoQjVQcmtzdDZGUmlIck11aGdZ?=
 =?utf-8?B?SXNnQjJwbUNJT2g4a05ESU5PUmx0YTMrQWg0bTJSVnRlZ29tUUViQnMvV2ZN?=
 =?utf-8?B?OEMzZ3B0b3hmSWtwYXJER1dtYW9ac1NQcDZQVjExZ0podW9TeGV5VlE5WTZ3?=
 =?utf-8?B?Wk84a082U3ZGb0s1c0RNUDNZajhxZEk0NGhkckhOTnlPRmJLaFBQSDhjcUhU?=
 =?utf-8?B?SGlsWWp2STVhdUxxdUVHaUdaNkJiUnJxaXM4WXNQRitaQm95M0xqWUNWUE93?=
 =?utf-8?B?c004cVYyajZpV1lpWHVqR085RWxMYjBjK1RKL0M0cHE4Y2NsUis3bjZkNTJW?=
 =?utf-8?B?RmtqSktBRkljb0Nsd3Q1ZVFubUoyTjRqbllmMW1MdmI2UU5QWlhwUngyRjZN?=
 =?utf-8?B?VXpjTnpTejhhNFJ3RDQ5aFFEU08vaVFvaUNsWE9PdjdGL2pOdHhOQmxBWllG?=
 =?utf-8?B?bnZBRzc3ZkZKSzc4cmdmbXVyb2FUTTA3elcvT1pGVVlSN1NpYlVaeGlvOHp0?=
 =?utf-8?B?Q1BPOGdTL2d6NkVsWU9pbkRvbHBZRVFxbUNVTWY5M3BPSmQ1ZWk3YUpZYkFz?=
 =?utf-8?B?OUphNm51b0FiUWJHeFB3Ni8zdWliamlhRzlGRk56cE1ucFRuYWNoOVpENENB?=
 =?utf-8?B?d2dlZGlLUFVJbnZVTmluc1dkQlhFVnhIVm56VmNTVXRoQmQwb0hzVlUweGxu?=
 =?utf-8?B?RW55STRMK3BZK2tMSmJ4Y2lsNSsySTNVeVpiTUVIVnlUU3E3eDhrY01MNUNU?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82EF9D2B920CD3468EBC2B7175945F64@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0720c1c-6db6-4b3a-5feb-08ddc3e76144
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 21:34:29.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSCd9+kmVw9S0J2W3E0JagqLfY0m5EBMh32dOy0bE9qxcVq1l6+7ZApq+DOp2VzbFepiqGPY9+86BlQt7QTosA0r7zw1zs6qHe+qmYWfMWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

T24gV2VkLCAyMDI1LTA3LTAyIGF0IDE2OjQyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEFkZCBhIGdlbmVyaWMgZGVwZW5kZW5jeSBzY2hlZHVsZXIgZm9yIEdUIFRMQiBpbnZhbGlkYXRp
b25zLCB1c2VkIHRvCj4gc2NoZWR1bGUgam9icyB0aGF0IGlzc3VlIEdUIFRMQiBpbnZhbGlkYXRp
b25zIHRvIGJpbmQgcXVldWVzLgo+IAo+IHYyOgo+IMKgLSBVc2Ugc2hhcmVkIEdUIFRMQiBpbnZh
bGlkYXRpb24gcXVldWUgZm9yIGRlcCBzY2hlZHVsZXIKPiDCoC0gQnJlYWsgYWxsb2NhdGlvbiBv
ZiBkZXAgc2NoZWR1bGVyIGludG8gaXRzIG93biBmdW5jdGlvbgo+IMKgLSBBZGQgZGVmaW5lIGZv
ciBtYXggbnVtYmVyIHRsYiBpbnZhbGlkYXRpb25zCj4gwqAtIFNraXAgbWVkaWEgaWYgbm90IHBy
ZXNlbnQKPiAKPiBTdWdnZXN0ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0
cm9tQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVj
X3F1ZXVlLmPCoMKgwqDCoMKgwqAgfCA0OAo+ICsrKysrKysrKysrKysrKysrKysrKysrKwo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaCB8IDEzICsrKysrKysKPiDC
oDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlY19xdWV1ZS5jCj4gaW5kZXggZmVlMjIzNThjYzA5Li43YWFmNjY5Y2Y1ZmMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMKPiBAQCAtMTIsNiArMTIsNyBAQAo+IMKgI2luY2x1
ZGUgPGRybS9kcm1fZmlsZS5oPgo+IMKgI2luY2x1ZGUgPHVhcGkvZHJtL3hlX2RybS5oPgo+IMKg
Cj4gKyNpbmNsdWRlICJ4ZV9kZXBfc2NoZWR1bGVyLmgiCj4gwqAjaW5jbHVkZSAieGVfZGV2aWNl
LmgiCj4gwqAjaW5jbHVkZSAieGVfZ3QuaCIKPiDCoCNpbmNsdWRlICJ4ZV9od19lbmdpbmVfY2xh
c3Nfc3lzZnMuaCIKPiBAQCAtMzksNiArNDAsMTIgQEAgc3RhdGljIGludCBleGVjX3F1ZXVlX3Vz
ZXJfZXh0ZW5zaW9ucyhzdHJ1Y3QKPiB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfZXhlY19xdWV1
ZQo+IMKgCj4gwqBzdGF0aWMgdm9pZCBfX3hlX2V4ZWNfcXVldWVfZnJlZShzdHJ1Y3QgeGVfZXhl
Y19xdWV1ZSAqcSkKPiDCoHsKPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgZm9yIChpID0gMDsgaSA8IFhFX0VYRUNfUVVFVUVfVExCX0lOVkFMX0NPVU5UOyArK2kp
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChxLT50bGJfaW52YWxbaV0uZGVw
X3NjaGVkdWxlcikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHhlX2RlcF9zY2hlZHVsZXJfZmluaShxLQo+ID50bGJfaW52YWxbaV0uZGVwX3NjaGVkdWxl
cik7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfZXhlY19xdWV1ZV91c2VzX3B4cChxKSkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3B4cF9leGVjX3F1ZXVlX3JlbW92
ZShndF90b194ZShxLT5ndCktPnB4cCwgcSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChxLT52bSkK
PiBAQCAtNTAsNiArNTcsMzkgQEAgc3RhdGljIHZvaWQgX194ZV9leGVjX3F1ZXVlX2ZyZWUoc3Ry
dWN0Cj4geGVfZXhlY19xdWV1ZSAqcSkKPiDCoMKgwqDCoMKgwqDCoMKga2ZyZWUocSk7Cj4gwqB9
Cj4gwqAKPiArc3RhdGljIGludCBhbGxvY19kZXBfc2NoZWR1bGVycyhzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgc3RydWN0Cj4geGVfZXhlY19xdWV1ZSAqcSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0
cnVjdCB4ZV90aWxlICp0aWxlID0gZ3RfdG9fdGlsZShxLT5ndCk7Cj4gK8KgwqDCoMKgwqDCoMKg
aW50IGk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBYRV9FWEVDX1FVRVVF
X1RMQl9JTlZBTF9DT1VOVDsgKytpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCB4ZV9kZXBfc2NoZWR1bGVyICpkZXBfc2NoZWR1bGVyOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3E7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoaSA9PSBYRV9FWEVDX1FVRVVFX1RMQl9JTlZBTF9QUklN
QVJZX0dUKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z3QgPSB0aWxlLT5wcmltYXJ5X2d0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBl
bHNlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBndCA9
IHRpbGUtPm1lZGlhX2d0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KCFndCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNv
bnRpbnVlOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd3EgPSBndC0+dGxi
X2ludmFsaWRhdGlvbi5qb2Jfd3E7Cj4gKwo+ICsjZGVmaW5lIE1BWF9UTEJfSU5WQUxfSk9CU8Kg
wqDCoMKgwqAxNsKgwqDCoMKgwqDCoC8qIFBpY2tpbmcgYSByZWFzb25hYmxlIHZhbHVlCj4gKi8K
ClNvIGlmIHdlIGV4Y2VlZCB0aWhzIG51bWJlciwgdGhhdCBtZWFucyB3ZSB3b24ndCBnZXQgYW4g
aW52YWxpZGF0aW9uIG9mCnRoYXQgcmFuZ2UgYmVmb3JlIGEgY29udGV4dCBzd2l0Y2ggdG8gYSBu
ZXcgcXVldWU/Cgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXBfc2NoZWR1bGVy
ID0geGVfZGVwX3NjaGVkdWxlcl9jcmVhdGUoeGUsIHdxLCBxLQo+ID5uYW1lLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1BWF9UTEJfSU5W
QUwKPiBfSk9CUyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIo
ZGVwX3NjaGVkdWxlcikpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gUFRSX0VSUihkZXBfc2NoZWR1bGVyKTsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHEtPnRsYl9pbnZhbFtpXS5kZXBfc2NoZWR1bGVyID0gZGVwX3Nj
aGVkdWxlcjsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKyN1bmRlZiBNQVhfVExCX0lOVkFMX0pPQlMK
PiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gK30KPiArCj4gwqBzdGF0aWMgc3RydWN0
IHhlX2V4ZWNfcXVldWUgKl9feGVfZXhlY19xdWV1ZV9hbGxvYyhzdHJ1Y3QgeGVfZGV2aWNlCj4g
KnhlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHhlX3ZtICp2bSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHUzMiBsb2dpY2FsX21hc2ssCj4gQEAgLTk0LDYgKzEzNCwxNCBAQCBzdGF0aWMgc3RydWN0IHhl
X2V4ZWNfcXVldWUKPiAqX194ZV9leGVjX3F1ZXVlX2FsbG9jKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
LAo+IMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBxLT5zY2hlZF9wcm9wcy5wcmlvcml0eSA9Cj4gWEVfRVhFQ19RVUVVRV9QUklPUklUWV9OT1JN
QUw7CgpXZSB3YW50IHRoZXNlIHRvIGJlIGhpZ2ggcHJpb3JpdHkgcmlnaHQ/IEkuZS4gaWYgYW5v
dGhlciB1c2VyIGNyZWF0ZXMgYQpxdWV1ZSBhbmQgc3VibWl0cyBhdCBoaWdoIHByaW9yaXR5IGNh
biB3ZSBnZXQgc3RhbGUgZGF0YSBvbiB0aG9zZQpleGVjdXRpb25zIGlmIHRoaXMgb25lIGlzIGJs
b2NrZWQgYmVoaW5kIHRoYXQgaGlnaCBwcmlvcml0eSBvbmU/CgpUaGFua3MsClN0dWFydAoKPiDC
oAo+ICvCoMKgwqDCoMKgwqDCoGlmIChxLT5mbGFncyAmIChFWEVDX1FVRVVFX0ZMQUdfTUlHUkFU
RSB8Cj4gRVhFQ19RVUVVRV9GTEFHX1ZNKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBlcnIgPSBhbGxvY19kZXBfc2NoZWR1bGVycyh4ZSwgcSk7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoF9feGVfZXhlY19xdWV1ZV9mcmVlKHEpOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9QVFIoZXJyKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoH0KPiAr
Cj4gwqDCoMKgwqDCoMKgwqDCoGlmICh2bSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHEtPnZtID0geGVfdm1fZ2V0KHZtKTsKPiDCoAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlY19xdWV1ZV90eXBlcy5oCj4gaW5kZXggYWJkZjRhNTdlNmUyLi5iYTQ0M2E0OTdiMzggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgKPiBAQCAtMTM0LDYg
KzEzNCwxOSBAQCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgbGlzdF9oZWFkIGxpbms7Cj4gwqDCoMKgwqDCoMKgwqDCoH0gbHI7
Cj4gwqAKPiArI2RlZmluZSBYRV9FWEVDX1FVRVVFX1RMQl9JTlZBTF9QUklNQVJZX0dUwqDCoMKg
wqDCoDAKPiArI2RlZmluZSBYRV9FWEVDX1FVRVVFX1RMQl9JTlZBTF9NRURJQV9HVMKgwqDCoMKg
wqDCoMKgMQo+ICsjZGVmaW5lCj4gWEVfRVhFQ19RVUVVRV9UTEJfSU5WQUxfQ09VTlTCoMKgwqDC
oMKgwqDCoMKgwqDCoChYRV9FWEVDX1FVRVVFX1RMQl9JTlZBTF9NRURJQQo+IF9HVMKgICsgMSkK
PiArCj4gK8KgwqDCoMKgwqDCoMKgLyoqIEB0bGJfaW52YWw6IFRMQiBpbnZhbGlkYXRpb25zIGV4
ZWMgcXVldWUgc3RhdGUgKi8KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAvKioKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogQHRsYl9pbnZhbC5kZXBfc2NoZWR1bGVyOiBUaGUgVExCIGludmFsaWRhdGlvbgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBkZXBlbmRlbmN5IHNjaGVkdWxlcgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IHhlX2RlcF9zY2hlZHVsZXIgKmRlcF9zY2hlZHVsZXI7Cj4gK8KgwqDCoMKg
wqDCoMKgfSB0bGJfaW52YWxbWEVfRVhFQ19RVUVVRV9UTEJfSU5WQUxfQ09VTlRdOwo+ICsKPiDC
oMKgwqDCoMKgwqDCoMKgLyoqIEBweHA6IFBYUCBpbmZvIHRyYWNraW5nICovCj4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHB4
cC50eXBlOiBQWFAgc2Vzc2lvbiB0eXBlIHVzZWQgYnkgdGhpcyBxdWV1ZSAqLwoK
