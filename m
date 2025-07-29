Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B539C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 19:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F29010E02F;
	Tue, 29 Jul 2025 19:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kavL77gB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD56910E02F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753815903; x=1785351903;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=1lzL2WWM5jdgaG7RMYpVREmPk1lK3dUMApBChiT4XFE=;
 b=kavL77gB2EzsRyeKFjhq9w1eYF3bzOaVdq+PuK53p+duO8CWXDV5sDOD
 Eevyz9QX8/ctdeiHXnovSm2on3aEu+36afu6Hzjeecu5Q4bqll5qY4LCl
 iYX7gwlmjJSd1eQItNmPe04qR3H1gkZRyQPsjYcc2dzdNYwt2TKSuphZE
 JFx5rDmcxEZgdtqDdrI+9S6ww0/4FMdKo7khDBdAAyQDJgbg/wl+8cY1I
 lbLDru32SdKN2QGqec4VMKUoF63uTMKog9K1DtsO8Z4cd/6BshIHgHVNW
 mDDud/Tzyzjf79KZu1XqTvgW4D+tDuVzJnw0q9j/1gc+89rqIWxGeMQEW Q==;
X-CSE-ConnectionGUID: qNkpnAMPSmm6mTe5mPStQA==
X-CSE-MsgGUID: BTixnr2+TpCNKGlThQRV4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56180271"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56180271"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 12:05:02 -0700
X-CSE-ConnectionGUID: BS1W5gaLTVunOXoUucuMEQ==
X-CSE-MsgGUID: 4Pqp6/rmSXakekEIG3z/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162046421"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 12:05:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 12:05:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 12:05:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 12:05:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZBYyL/0mcTHPEUYSgBmz5aQnKJEIyeGfGpawsZEBiqMyFHGLecFvEgv5RDPRuW8l6ILRWkF8wo/+9/XK7SAZ1DdAZce1JMONATUsI5UpU7IOljXA9GTfMgXvQZNMjHDkZ0zx5dma+weRbOHy4DEJkrEUcqOEly6BMpePM8czmPFOhRa9D9fzDnurg7SRPgMWmnvkkvlo06Cb502RbboJXwWo/oLGuKy+ZzcgOeqy2IBFD84TaaxSIDCHVf5v9qVymAccsrgyBXuPZoB1h7m5Zp3EYe/7xEy1j+j+hOnzomQk6AI730v51Vu8SJvF2KgAIBV71MKA+QF1ozIxhlhPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/exxn/496m+ykM7yHVFEUOb/Y8qOMarCvykGNOQ+x4=;
 b=ZTgw/k8hKIRdOYXlEdHz7/rmk8sgvVe4CBCGC/3BEW33O5juTyIE+klHDqQd3KyCsxWnDhkAl7XpMwrCo5Teqm+p+/dlri2rNE5f6zmqpRDb1KDweaKc5rdP8KbUUk4KEwkDOA3oEUjRbPSCMktvPczkBFVirRBkDX2YLw6KicFIzwj7hxbOXXasLAFZpcvDTEMBPHUYAEUF9WX3WhCGoVEjAfbqW2t+5tN63Hg2nJWWh6mfihj6tVZ9OrjgGIttaucFGpPwMhveyFXKfJbguCjd9zjNJww1ZKdl3ZFnItR80KP5acmG3yvfJkQEhC42Gd9+OD+KMmJbczy1oSTkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 19:04:45 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 19:04:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BL1PR11MB5445886773D62D4506352692E525A@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250729-skip-residency-debugfs-for-vfs-v1-1-3c5edec08c8b@intel.com>
 <BL1PR11MB5445886773D62D4506352692E525A@BL1PR11MB5445.namprd11.prod.outlook.com>
Subject: RE: [PATCH] drm/xe/debugfs: Do not register residency files for SRIOV
 VF
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Purkait, Soham" <soham.purkait@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Tue, 29 Jul 2025 16:04:38 -0300
Message-ID: <175381587860.6473.5932932822031100952@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d37dd4d-5fd0-4af1-4b83-08ddced2c7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVJvV3BZalRXQ3IxS2x5UnRqRExYQWFScTgyVWxjUGZHWmlFOVYwaUJQSEtC?=
 =?utf-8?B?Qm43TVY3RHp0MWplNWRHUEZNYkdkQ1YwY1NDc0JsYk9uMDg0SExFN2VLaUlM?=
 =?utf-8?B?ZGJIS3RNeHBod0RCRWZXVG5rcS9ZWVNvTDA5dXMxUURNdWkyMzB2WmowdHBw?=
 =?utf-8?B?dGZ0RkFMYWJrc0czeTVWQUEybnFoWnh1VG1nei90NTBDMkVYSUphc3krT2Vo?=
 =?utf-8?B?Tjdsem82M3VvaW0yQ25qNmJ2U3pPQmxZNXREdDh3emRzR0JxQlJQSXJwRERF?=
 =?utf-8?B?dVRnNWJRTU5kbmROd0twYkpUckpyemx2enJZa2U2WkNhbi9zMmJGSFp0NnlH?=
 =?utf-8?B?ZkNmMms4Y3VBbWVXQ0hnM0x5eHBzY0MzNm5TQ3JxTTRrMjZnbC83cUQyWFho?=
 =?utf-8?B?cm1Qa3paM1MxWXk1TzdUWXFqWkNESUUwWjA0MjhJUmlNYjUzZm0vLy9ZZ2pZ?=
 =?utf-8?B?TkVBNThiK3QxVGw3anpIOUJGQ1NrS3BmeFJuQitOY2dtRlB0R0RpNHFmS0o4?=
 =?utf-8?B?eldKd1BkbDlIZUUwNkdkZzBvVG5KOXhkbGZWalcvbG5XWkxvSUlJb3JqNVJT?=
 =?utf-8?B?L2xOYno2TlFZVWFaU1RSS2ZjZ3krRXYrczJNcUlrVmxmcW1TREVUL1dZY0VZ?=
 =?utf-8?B?akZxL01MeVdRSDg1NldSYjdLY3RUemErbmJEaFgzNFBSNlQ5NS9lT01TVy9r?=
 =?utf-8?B?dy9lWGVRVm81R21VeDJkeXduVFhIZU1QaVNzcXNHRmQzQmgxeWtabmwyb2RV?=
 =?utf-8?B?Z3VKVXUwMkpGWjZhaGJKSkZTT3BRVTA5RFhHanluRTFEYVlyWDhMcTRhS052?=
 =?utf-8?B?bEo5NTNhU1ZjRXZhcFlJTWoySEVOaWVOa3F2UjNOZ00vaU8zVStNZDB0dE50?=
 =?utf-8?B?ZmtXd2F3aEtHR1VkSUdubGp6TlI5UHJvanpJYnZxaDMwM05VWXpCeDd1eE1Z?=
 =?utf-8?B?dkt4L0s1dXVQY2RvZWFsb005NmUyREVCRkpMQ25hZmh1SFZ5cysxSWxJcFpl?=
 =?utf-8?B?czU4RVNORThreXFYalRRaXlZanFsalo1ZW5yUGoxZWdaRG9PT3FSVHhkYzBX?=
 =?utf-8?B?RElCTEVIbWErMDRSZGk5M3RpWCtEK3Rqbk9mWXVtbWczTkJvc1BmWDV1SWVZ?=
 =?utf-8?B?d1Y2cGlHd0pVdXEzYkgxR205bzlHUGtJeDN0aU51S3haNFZya0NYRlZkVmZM?=
 =?utf-8?B?bXFEcjZSOHRXbjlKTFE5cXFjVXZCdFJlOVQ3eFllWlMwekQ5dkc3bVlWMDg2?=
 =?utf-8?B?SEF1cmRrMXkrRi9nbEowZ3ErcXZDYTl6OU10dDM2M3h0a2NXbC9HbG9YNTFI?=
 =?utf-8?B?UFdWLzNLUFdZV3dqSHljTWVuTVJrcXRFRHVyMWtONVR0ZWkrSnpkbTFqY1NL?=
 =?utf-8?B?N1VuTEdkWno5WW0wbHFZWmhESWdHZzk5cHFLd2pIczNvQ1RjS21tSGg3bWlX?=
 =?utf-8?B?elhneWRhZEw5NzhBQ2x4L1dNelU0WUhKWWs5MmVmM1JIQzQvSHNiMWVYMWEv?=
 =?utf-8?B?emNSUGsyU3djaGF2UHdzbHFoSnoxUzhIeklRblUwNi9CV1RxOTRXeEpjWFJy?=
 =?utf-8?B?KzlQWHF1VnRRZ2NXWTd2cjBaaDBrTVVVRVBvbzJJTjh5Zk5QRDZld2VJc0M4?=
 =?utf-8?B?QWhLQWdpSlRGREhpNTRmdVJFcFpSekhiaEtzUUJFcEc1YXZUVU5GUEplSjhZ?=
 =?utf-8?B?b3V0U1hZckNMMkYzZVFDTm0vWDJWUFVZVVpQQmU3azhXN3FzdGRQdEYxUHNj?=
 =?utf-8?B?b1FFWFZnTmxJVjloallHQU55UTJORUtvRmdJZHNwMXpFcTh3TkxGOThIWkZJ?=
 =?utf-8?B?Um84aDRlMUZRdGw0c3FWdktXY01HM1hpb0dKcXVOTFFUQTFPVWlLZzNuU0tu?=
 =?utf-8?B?RlBjYWZwS2NTNkNKQVJMbUw0SVFPN0pXZFp5d3FXQk5CcHVhN3JjVzM3NjU0?=
 =?utf-8?Q?KLKb4BYNT94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2toU1BHdmEwN3NOdmMwbU52enRuU1FOMjllZ3gzVG4xOE5iQzBMcDZKaDha?=
 =?utf-8?B?a2ZrWWpFcHFhNzh4WFd1MTdXRUJCcVNIeks2MU5zV255cjQxNkRQdkRhY3Jw?=
 =?utf-8?B?anNiTHhOK3pnZWY2RHNYMTFocDZzcEJXd3lyUk11NVlneGk4aXhFOXJLUGNz?=
 =?utf-8?B?OGMxSXJtRXN2Z0tpOTBtVTNnQ3lQcjNVNlJ0UjNZNUN5UFUwU1J2czdVQ2s4?=
 =?utf-8?B?OEptbTlCdWRoekpPWUM0ZC9GMitnYWFmdnJYSFdYZ1RZeUwvTW5lMlhTWlRi?=
 =?utf-8?B?R2IyamlBaDZNaVZlNVdNeVg3VDBmaHZrc0thMnNVZ1lqcDYrWC9JSzZTdWgy?=
 =?utf-8?B?WUlhc3lQWnNuRnUvalFyMDdlQXZvN0dwK0pVZE12RWNMRmE2OEFBaFNzSVF6?=
 =?utf-8?B?MnhzVnpzaDYvbW5qNUd3bGFSNmwwazF4NlhHTmh4OXB5d2padGE4elRERkhJ?=
 =?utf-8?B?Z1VWSHZqYWVxWUlKMTF1Y2RZUnJsTWtiVEsya0hlL0tCMDRKRmZLU25ETEpj?=
 =?utf-8?B?eHFHbmxaZDY3SGhsU21aYTY3OFdzcEMzMjVqR29MNDVWZlNEWkxJTzJQcG9D?=
 =?utf-8?B?TkxpSUFCTmo4OU5jN0tzSjlURFBXSzZBYnZ2NFkxalErL1FsTmJ5c1pNUUN0?=
 =?utf-8?B?UmhPRlJxM2hRblo3SVh1QThjd0dVenBUQlpGMmJRUlYvTURuK054Y3Q0RUx2?=
 =?utf-8?B?bmJVVTNsNmlGVWRuWEhCZHJYK25ydDlSQzY4VWZqVnhTVmI0TThmemtPdTFJ?=
 =?utf-8?B?VnVibXQybG50cGFKU21TNXJZeWs5N21oQy9iRXN6bkJTQmtHdlBIMUM4bXRC?=
 =?utf-8?B?cUpNT0t5Q1B4UlFYbm4rUTVEblp0Wm9STWVXWk1yL2tUSEZoWTNMaTJKRmpP?=
 =?utf-8?B?ZjZFbVdMY2J1YzZzZ0hMc1l6RWNSbHU3ZTNHMHl4ZlFVcHFsU0JDd3drZVpG?=
 =?utf-8?B?OXpnMFpCWllCVXFhdm1mUEpNSDEyQ3VRWk9Hek8yOWxTd3k0ZG5PbDJWNW9K?=
 =?utf-8?B?VGJDcjUzWk5PVjA3b0dhaW5kc21aU0ppcWhtRW5jZzgxcEsveXl4MktSM2xp?=
 =?utf-8?B?bGpIK0E0WXY1RkxSdDBicERGcDlCWlQyb0FvU1kwWU5lVnRoUjY5ZXkremRw?=
 =?utf-8?B?VXJyNW5Ha1Z5MkxrVUUrZWdKMUFGYkpzL2hnM0pJZjM4TTVCMlNNUVlKUE4w?=
 =?utf-8?B?SjgrRDB3cHJXSEJJaEtqelZhUXJMbE1mbWpWcFFwL2tBRHNwd3VlTzJkU2U0?=
 =?utf-8?B?d3N5ME5ST21KUlAra0pmcDMxV2RwcldqVXpYc2UwNVBNU0VrdFgzZ2Y5cjJV?=
 =?utf-8?B?Qlh6VnBnTUNkb3NVUE5xWVRDTk12akYvNWhJWnRjL2JHeFNVdUYrOU15NWhS?=
 =?utf-8?B?SXVFRERnZWROUFEwS3lXNUVzc1BvVGZVMTFXcXRrdVdJMUxwZXRHWGNUdEhI?=
 =?utf-8?B?aGhsUlVucEhPRDVuUnFZNFlnQ2h3OVFoYXdKYkNueDVIRzlCUE0vTEcxLzRl?=
 =?utf-8?B?ZlR3L3AxQ25DSlhSZFVBT3l3M0c5ejE5UlhEMEh6cHAydXJoRmpkK1VlOVlR?=
 =?utf-8?B?OUw1RmxlcTJSTTBXWkxEclVGOGJKSm52UzJxaiswZjhTa0l6UjNnVjRhZndx?=
 =?utf-8?B?YTd1TFpPK0MrZkpVdk9Qc2R5WW9aaXBFbnl3TDlDK2VodVZ1Z0pHNmdsZ2ZK?=
 =?utf-8?B?Vk44T09talEvZUxhempJTExhZjFZbUZLQnZPamlxcWpqamVXQjBNMjhCZGJH?=
 =?utf-8?B?TEt2Y0hOWE1KKzQ5M2twTEZMZmdxN2tqQmc1bmtBNFVldGtBejlrRXQ5NjFZ?=
 =?utf-8?B?QlQ1N1VPRGxScGlDdjRZV0Q0UWRNTjFyU0Y3M3g5OG1YY3oyc1NJM1NqTU53?=
 =?utf-8?B?VU54ZjRTN2xYVDhYN3JXdk9pT293Q0dFc2JkQzFtbDUybzF4cHkraSt5Q2Fu?=
 =?utf-8?B?V3VGVjBQb1JOZWl4eldLdWZJMDFCWEQyL1NYSmhCTEU0dGJRQTBiZ0pGY1Fy?=
 =?utf-8?B?eUptbUQwejJNbXRzc29OOE5xOHZiTWpZcnFNOVFIbnhXY2RkZUwwbk9aakJX?=
 =?utf-8?B?UWhFS0RHUVBpaFloQTRVSCs2VW03RDQ0REowcTh5c0VvdzQxazdncERqanpL?=
 =?utf-8?B?THV6cDM5ODYzL3JTMlFmOTl1OC8xaFVFZFdFV011S1VjejBXVytrQmswOFla?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d37dd4d-5fd0-4af1-4b83-08ddced2c7d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 19:04:45.0255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jK2J37/N05aBLOD86X7xj5YUA3eqZIvPbGS4SPJokVjjolBGdfUcthjPtUaXT/U3HD5BnpZLQxiGAaJL/+v/tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
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

Quoting Cavitt, Jonathan (2025-07-29 15:41:00-03:00)
>-----Original Message-----
>From: Sousa, Gustavo <gustavo.sousa@intel.com>=20
>Sent: Tuesday, July 29, 2025 9:47 AM
>To: intel-xe@lists.freedesktop.org
>Cc: Purkait, Soham <soham.purkait@intel.com>; Cavitt, Jonathan <jonathan.c=
avitt@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>; Tauro, Riana <r=
iana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Sousa, Gusta=
vo <gustavo.sousa@intel.com>
>Subject: [PATCH] drm/xe/debugfs: Do not register residency files for SRIOV=
 VF
>>=20
>> Registers accessed by the recently added[1] residency counters debugfs
>> are marked as inaccessible to SRIOV VFs. That causes warnings to be
>> raised when an attempt is made to read those files. Skip registering
>> those files for VFs.
>>=20
>> [1] Via commit 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and
>>     pcie link state residency counters through debugfs").
>>=20
>> Cc: Soham Purkait <soham.purkait@intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Fixes: 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and pcie li=
nk state residency counters through debugfs")
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_deb=
ugfs.c
>> index 0b4a532f7c45..53b89528692a 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -360,7 +360,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>                                   ARRAY_SIZE(debugfs_list),
>>                                   root, minor);
>> =20
>> -        if (xe->info.platform =3D=3D XE_BATTLEMAGE)
>> +        if (!IS_SRIOV_VF(xe) && xe->info.platform =3D=3D XE_BATTLEMAGE)
>>                  drm_debugfs_create_files(debugfs_residencies,
>
>It sounds like it's specifically these debugfs_residencies files, and not =
a property of
>drm_debugfs_create_files, that has troubles on VF.

I think we should not advertise something that we do not support, that's
why my suggestion is to not even create the files if we do not support
getting such information for VFs (at least not with the current
implementation).

--
Gustavo Sousa

>
>I don't see a reason to block this, so
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>-Jonathan Cavitt
>
>>                                           ARRAY_SIZE(debugfs_residencies=
),
>>                                           root, minor);
>>=20
>> ---
>> base-commit: b6a72d53a8082ee6ef701042e7cb8a93d6a2b678
>> change-id: 20250729-skip-residency-debugfs-for-vfs-4d707779fcb1
>>=20
>> Best regards,
>> --=20
>> Gustavo Sousa <gustavo.sousa@intel.com>
>>=20
>>
