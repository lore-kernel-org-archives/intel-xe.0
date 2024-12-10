Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D5E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 07:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0D310E7EE;
	Tue, 10 Dec 2024 07:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eb07zllt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101110E7FB
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733814572; x=1765350572;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u6X8P+uyS5Rt1x/jJr8k8yERJQuPEWMxFxR3ST2euIg=;
 b=eb07zlltShrAJ3G7dhYLlrSbqF0sjIIT74bpQiJWlcKnSRCd+Iunob+7
 aBCookdT9Q7xBVHuwS5L9XTY4+bcHt/tErC2t3EM9I5fRPYK4cP+mMR86
 pvCrsTDa/6smL9pTL7FqFV5qAHe7JpLdEMvcGnnhXrLqUuo1iv/rRavhx
 fGNg6JVEI94S0hLRuwzEC6kkNxVWJdGTmefOsOjQmm5h+Nm1+l5+MTRR9
 nR2w92FJSwYs+U1tZSxbw+YnqORFd/hFpEReaKWmYpn+VrlHQQ4Y6tOG4
 KANmP9I0FPd+Ew2UYHO9zxMHosdfRRS8GCYi5v/09eJ4pm/HhZp2yX9E/ g==;
X-CSE-ConnectionGUID: ROShjBdtSmWPf/8V4B0TNA==
X-CSE-MsgGUID: V6UJLbNvSKaBgplwDu6egw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37828054"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="37828054"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 23:09:32 -0800
X-CSE-ConnectionGUID: syMmCQS9QPqIlvSBWIe23Q==
X-CSE-MsgGUID: MbUGjimMSOWsfG3UJcQAaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="100357341"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 23:09:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 23:09:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 23:09:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 23:09:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd/85cQSbxRMg1zFCJ82thz0Nhoh/lFtNkRBjIgdUFkbpEegA3cY7silGJt/HBxViuBgxE4xER16gaIHzdZ/inkRFHvzd+7bjegkVrhMNP4EdC/99nVPrLa2tj9tvBygvIOOhh7dfzwizWhf5gTQEKIkq9ocRp4akBxksi8OIlb68aNQiMK0CLLGZ38orOTklS6SgIMtz8fomxCl7dIP6pqX1V04mW14wYE+qXskZ8T4L4sF6pZG2fwfLa3H8TBoMVnJ52ntvPPicibiaHUvynmOkkxcd1Uo0JeIDWTmjd1RPAX5KbOanA8hKi8a8ZNNjmyu6u7Gt6eoat4SN6o2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlyNHqu2si6NGi5BE6oEKB8lfCLMuzSu3gK80fFKBMg=;
 b=rlVdjSmL5vDSfGkXzClFdW+tR+De2Q5MiwO5pKx6zCouwGME7K0/lhjcqP2GIz+nUUCPscsBIUkY+8xakf8c4ilxddFrvR/AdfGY5J3/FAgIr0y+MtkO++JUwCRY4ZnbEHA3Huwcm1kL7eJMzXiZHteOdfcG6ScyeTClOU3ZFkbu2vQHJT3cX2sQaFyvLroMjfw21ksfkXY0SAbPvRqMmy9YvfKteTVMhHSP/jHT1Fxe+Su++WN26D7JDp5rWHcuzePJw4NgB1MAjUNlx90QchLldUIj9D7s+X2SlZ8N6wMOVxiO9IBtpVUlxH6noHM5VjNBD8Iksy+uEyZiGkmC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 07:09:29 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 07:09:29 +0000
Date: Mon, 9 Dec 2024 23:09:26 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Olson, Matthew" <matthew.olson@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 3/7] drm/xe/eustall: Implement EU stall sampling APIs
 for Xe_HPC
Message-ID: <Z1fpJnSL-cDY5eLj@intel.com>
References: <cover.1731919693.git.harish.chegondi@intel.com>
 <61d372440de6c620b0033aaea353d363e4218a53.1731919693.git.harish.chegondi@intel.com>
 <Zz9NY-xzdzckG7Uk@bolson-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz9NY-xzdzckG7Uk@bolson-desk>
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA1PR11MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b6bf47-3cc0-4f17-a17f-08dd18e99682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1NzOXZQT1ZIdzlrUFJmRmY3L1pnYlJ1UXdUUC90QS9HR2RTRXRGam95OUQv?=
 =?utf-8?B?dmtURjM1M2ZUcm5Vd0lLVmtIVlJKKzlCdDZNdlkxMEZ0bHRlSTV4S0dLTDJQ?=
 =?utf-8?B?SWVqRlExaVNBL0hGQlRkd3BkOEtYZXFWU1FHRWdxZXcxZ1lBdndUaEVpQkVW?=
 =?utf-8?B?Q2JlQWVlTzc5SlpwM3hFMlZLTDc5bzQ0RFJSRnZzajZ1cWhZZG1TK3pZNytU?=
 =?utf-8?B?b2NLbkNSandKdXZPQ0I1WXJnaDNjWjR2QUhpemFXMSthZmRaMVR1ejRSdmdi?=
 =?utf-8?B?QVBMUlRhVDZsakpkKzUvUzQ2d2xhcFlHd2IyT0s1ejRLZEwvUXdQWUd4WTBL?=
 =?utf-8?B?RzZZeVZKdzAzUGpUZ05DdCt1cC9sNjJUOEdWa3FCaXBtUTBRdVZjOUJBZjdv?=
 =?utf-8?B?N0VOZng0eFpVVHRib1JrK1VwcGtYWFFxengzZFQzVjIxVldpQWMxcHRnNTBi?=
 =?utf-8?B?WTlhQVpTUTZyYjVqdFRwMDF0bkF2eHV0YVk3eVhteHYvZkdxZC9pYU0wb3Jz?=
 =?utf-8?B?b0p6eS9ZVEk3ekI3RW1TZlUrTWJLYzBXaEFreDlXTEZ6ZFFMaHhyQ1lTZGw4?=
 =?utf-8?B?Y0IyUHhIU2FpVlh3ZW5lY1IxdEFuVmxzVW4rZnMvOUpUWUdXdkRuWVJ3QTJX?=
 =?utf-8?B?dGk5SkRLem5QSTROTy9pVTNUYjNFdktRNDU2dC9VYnNNZXZQRDkxVzRYVXZD?=
 =?utf-8?B?MVozRFlFRmtLRU10NUJoUERDRVN1THExNnNZM0V0Y3NZTXdyeitrR3JiZHBm?=
 =?utf-8?B?SEkrcURGVW82YnpTZ1Z3T2FremJ0Ymd1WGxhcTRDa2s3YjVtK01vN3k3cW9Q?=
 =?utf-8?B?bVl6eUcwdlZGRjk5OXA0U29UYUtzL2RaNTlqNGVMNkdGa2VWMTJRU2JaUFUr?=
 =?utf-8?B?K1hjSDFkdmhNWE12Rk5YbDNQN1EvYWUyZWhyV01OaUppWGdrakNzZGs3RVE5?=
 =?utf-8?B?cGZHUVZNc2hnMzdOb1hKaURtYTBiWjh3cmt0R29oQXZMTmFveXE0b2JzdjdK?=
 =?utf-8?B?R2Zram0xTEpQL0MrRzVoZ2V1anpweTliT2VTeTJwUHR0U3hBdklGMlNIb1Bq?=
 =?utf-8?B?a3BrOFJXbEJJR0NyR0NaMlBOeFRTb1FaS2NIdFNCMURyRSszODZtT041TndG?=
 =?utf-8?B?MjhFcThjQ1JOc1BIc09QeEdmQVB6b2NUcjdaL0NkcVFwSlU5RzVhcldIYUdu?=
 =?utf-8?B?Qk5JOW9neGs5dkhmTW5Ud01FVW9XcnZndU40ZE1Ebzh1WDc3UzJPZ29oZTB2?=
 =?utf-8?B?OXJxVGRKL2hXUFdMUStRRzM2TThOQkNyd09ZVnRYRkNob29yZ3pYK1RFMnd4?=
 =?utf-8?B?bXp0Q2xRMHRSYWZUM0pjVWxlVzFqZnpFTnR3bHpROXBINm02a2MxSGxYTDBE?=
 =?utf-8?B?RUI4SjVURGFoODdZQ0tJbXRiUXZxcmhnRTg4M3pCMWpVOXhwMHhoaUVvMzRm?=
 =?utf-8?B?STUvREdIM01oUWZtL1NvNUNOM1dLWWFOS2dQTFVKMk12Smt6WUJrWlhGcjZO?=
 =?utf-8?B?aWdDT3FnN0FGaGpna3JtaEROVEtoaE0wUGFQQUZ2ZFVGWmJramtqV3hZRkgw?=
 =?utf-8?B?V2FtN1FoRjhMSno2bVd6UjBST0tFRW5zS1dzSUZJR2U3dFpnZFhMS0I2eXk0?=
 =?utf-8?B?eWdab3FIVmtjVU1UUUc4Rk9tbjdCL1RTMDVOckwwV3JPcHdrUTZSZnBXY0VD?=
 =?utf-8?B?a1VmZGVlWkZXZERmamdWV1U4QTlLdHRmaXJ1VkRHNDNFa1ptZk9ia1dPMDIw?=
 =?utf-8?B?UC9OR2N3UE1LZm1LeG16ZzZ6aEo2elNqaXV5d1RudjlhZGY0aEhtbnNxZjU0?=
 =?utf-8?B?S2dUbU1nUXFiSU9ZUW9Udz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkRhL0hKaHl6SC9FMmRHaTdLekNPWjNFZU9RWXRodUNOWlQvWU9aamNadUt0?=
 =?utf-8?B?YTE0eGU1OURETTJXZ2ZzaEY0UEVaNGo1d1Y3TyttNW9OU0JLclp2YzNEMkR5?=
 =?utf-8?B?ZjRVWHdjV0U0aU0reU45R20yMUthZFJIQjdEeE5tMzhvM2tkUGtoMTRsT0FD?=
 =?utf-8?B?MmlVNVRENkUzbTRiVnJuSHcwT2Z6QTFKZk1jVXRUbVZSRnB3ZVIzOVZ6WEEy?=
 =?utf-8?B?cUhEZ1N6UEFqOS9rcGtJTVRhakRwampOT1VUZUdPYjFoYW1WSUI4QTQrbnVC?=
 =?utf-8?B?OHppWVNWWkxKcGd6R0FoZDRHbFU1eUhiTDdSb0pvaTRZU1NtWEJBSzY0RmRF?=
 =?utf-8?B?cjZHbmh2NlpqUGdYa2IxYjJSc0J3cHdTVENjWDBZTElIZm9IZ29vc2dBVmpL?=
 =?utf-8?B?Qnc0T2pMMkRmb3ZSSTZOMG04UzFPU1AvTnlHa2JFckQwRFQ0b3hPekUydTNi?=
 =?utf-8?B?WCtoSmFFajA0U1RxK2Z1bCtlMlZUOXIrNUFhNDFkNmZWb2t2MzIvQWdTNll1?=
 =?utf-8?B?WG5UdlNvU216VTAvdGhVUVBSU2syY2hDN0RRZVo3ZTFGT1g5S3dBRk9MMEFo?=
 =?utf-8?B?bi8wZ01tVVA1WUs0YlFESzYxNVZna0xlcEpicjB4YU1RMEV6bUZYUWorVTlQ?=
 =?utf-8?B?M3g3ZHdzL2VkTDhWa1dTcG9ZbTlRc1BwSkwyWUZmWjhiSUZjL2hHY2RRdWF4?=
 =?utf-8?B?YURNUWU2YzNyaTRFNHhqU1FQZHdyQktTL3l5OTB2ODROSlR2TVFWdTFQRGE4?=
 =?utf-8?B?U3M1UytET1puSGdBbVhQMnhUUFR3YUtKcEl6SmRpa0QydDdkVjl0Ukd0Tzk4?=
 =?utf-8?B?V204NVcwOE5pTlZHM3FsTkhTZzUrVkp4NWxheXhTVkJEWkNySGVkUi95V1lv?=
 =?utf-8?B?RTBkSFoySkJvNlZrbXIvS3JxNUlXUkRBUGdsNFFRUlRrK01ZSFJiZ25tRW85?=
 =?utf-8?B?Y0NnakdWaWR0dU5rMU1YR2trSU5vK0psdUxubVQ3V2YraDBFUmxyYm5jVFRP?=
 =?utf-8?B?U3ZQM1hyWTVsUWtwKzVZUSs2YStEbzc2Y1p2b3R0TlpJbVhWbzJvczlBZVAw?=
 =?utf-8?B?RkFUYjRGRmpoYllpa1ZjdHYveGxtR2pVanNwYWJWcE9jQ2FBMXhmem93eHZP?=
 =?utf-8?B?MGplb2FTdUNHSWhCeXVLanQxL1Zqdkp1bEtLSVZyTytEUXVxUm5acGVDL0c5?=
 =?utf-8?B?dGFCUnR4YlZhRmc1MXplZEx0OEgrS1hVZGZnaWtzNStxTWhQSTNwRm81MHlH?=
 =?utf-8?B?SUtPWGIzdFFOOUtrTFNuakpvVUpMV2szUndlbmpUaGl5Yk12bDlVYU54dnh4?=
 =?utf-8?B?UXAyWEJTR2kzV1R1UFhnbjUrUkxIcSs3WjlobHdyYUs5RjhuUjBDQkxmTitL?=
 =?utf-8?B?WmJsY2xWUGk1VzlnemRSOStENzlWb0gvUnY5SFJEY0szSG54cU8rOGtZRXhT?=
 =?utf-8?B?bThjWjNidGozeWFaWUNjQzdVQlBZbjdpSGhTYW1KRG1qczZLaTIzZHA4dHh0?=
 =?utf-8?B?Q0tWMU5vQWNCT2VvSkhrY1pZK2VTYWNuSzBqMVF4Mlp3T1BsUHpaR21rdWZx?=
 =?utf-8?B?MFVJU241cVQ5cnVMbHpsY1N2M3pxTzVycEFzWXpwSzBZNVd2R2srblpLd3Ix?=
 =?utf-8?B?Y0p4a3lhWXlxS0ZJN1NyYmFDZnBaUy9PWkJSYVh5Rit0UGJIOHZGQ1h0UDNN?=
 =?utf-8?B?a2Q3ek04R0NBUDZlYjlFS3g4RDB3Q0lrU3MrTHl5Ri9CTU1RSC9qMXNyUkl3?=
 =?utf-8?B?OXdvREZqQTBmUnY4WE5sSTBUSnpKN2RpeUpYTktYcFBGOG1nenFCOXR4Yit1?=
 =?utf-8?B?ZWxBeHhnMTFsUDZNWVovNXRxcTl6SWdXZkV4TE1vVTVSTUFmUXJ1NGlIU21S?=
 =?utf-8?B?NE5nMmpJLzAwc2NXYjJNbUdxbnFnK0J1L0o3aFhJYk9yR0hpQWZ5RWl2Nmt1?=
 =?utf-8?B?a1JkZ0EwNXNaNkRHMk03NVlqdVpwK0QxWTNWM1RpQnI1U3AxNUdyYnhrVzFo?=
 =?utf-8?B?c1JqSG5kQzNSUU5BUUpndEFCSHZYTEdXNGdJeXpXUzJYYVZ5cUVRaW90REdN?=
 =?utf-8?B?N0trREV2ZTgyOFplc3I1UDNEWlowVHJtR3FNMkYwVmlyMW4rWThRMG85cUtz?=
 =?utf-8?B?SGNEWmYzZTFucElJT3U4TmhEbjJSWVp4RlZyVTQwTU9FM3JVb1lYcDJQeVhD?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b6bf47-3cc0-4f17-a17f-08dd18e99682
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 07:09:29.0133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LYkvB9/Fg0L33cWn+9DK6ZwRhwgYmEFeClDv7GSH0CRTYkTsV5LxnOaFy9vin6FvNou+2kYiqo45TgqoLqrqAmLryb0vkoGfbmw3rF5d3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
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

On Thu, Nov 21, 2024 at 09:10:45AM -0600, Olson, Matthew wrote:
> Small suggestion down below:
> 
> On Mon, Nov 18, 2024 at 01:07:15AM -0800, Harish Chegondi wrote:
> > Implement EU stall sampling APIs introduced in the previous patch for
> > Xe_HPC (PVC). Add register definitions and the code that accesses these
> > registers to the APIs.
> > 
> > Add initialization and clean up functions and their implementations,
> > EU stall enable and disable functions, poll() and read() implementations.
> > 
> > A timer thread periodically polls the EU stall data buffer write pointer
> > registers to look for any new data and caches the write pointer. The read
> > function compares the cached read and write pointers and copies any new
> > data to the user space.
> > 
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |  29 +
> >  drivers/gpu/drm/xe/xe_eu_stall.c           | 748 ++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_eu_stall.h           |  43 ++
> >  drivers/gpu/drm/xe/xe_gt.c                 |   6 +
> >  drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
> >  drivers/gpu/drm/xe/xe_trace.h              |  33 +
> >  6 files changed, 837 insertions(+), 25 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> > new file mode 100644
> > index 000000000000..2b742890b283
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_EU_STALL_REGS_H_
> > +#define _XE_EU_STALL_REGS_H_
> > +
> > +#include "regs/xe_reg_defs.h"
> > +
> > +#define XEHPC_EUSTALL_BASE			XE_REG_MCR(0xe520)
> > +#define   XEHPC_EUSTALL_BASE_BUF_ADDR		REG_GENMASK(31, 6)
> > +#define   XEHPC_EUSTALL_BASE_XECORE_BUF_SZ	REG_GENMASK(5, 3)
> > +#define   XEHPC_EUSTALL_BASE_ENABLE_SAMPLING	REG_BIT(1)
> > +
> > +#define XEHPC_EUSTALL_BASE_UPPER		XE_REG_MCR(0xe524)
> > +
> > +#define XEHPC_EUSTALL_REPORT			XE_REG_MCR(0xe528, XE_REG_OPTION_MASKED)
> > +#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK	REG_GENMASK(15, 2)
> > +#define   XEHPC_EUSTALL_REPORT_OVERFLOW_DROP	REG_BIT(1)
> > +
> > +#define XEHPC_EUSTALL_REPORT1			XE_REG_MCR(0xe52c, XE_REG_OPTION_MASKED)
> > +#define   XEHPC_EUSTALL_REPORT1_READ_PTR_MASK	REG_GENMASK(15, 2)
> > +
> > +#define XEHPC_EUSTALL_CTRL			XE_REG_MCR(0xe53c, XE_REG_OPTION_MASKED)
> > +#define   EUSTALL_MOCS				REG_GENMASK(9, 3)
> > +#define   EUSTALL_SAMPLE_RATE			REG_GENMASK(2, 0)
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index e9209fc0d917..5c69f68acb98 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -8,15 +8,27 @@
> >  #include <linux/poll.h>
> >  #include <linux/fs.h>
> >  
> > +#include <drm/drm_drv.h>
> >  #include <uapi/drm/xe_drm.h>
> >  
> > +#include "xe_bo.h"
> > +#include "xe_pm.h"
> > +#include "xe_trace.h"
> >  #include "xe_macros.h"
> >  #include "xe_device.h"
> > +#include "xe_gt_mcr.h"
> >  #include "xe_eu_stall.h"
> >  #include "xe_gt_printk.h"
> > +#include "xe_force_wake.h"
> >  #include "xe_gt_topology.h"
> >  #include "xe_observation.h"
> >  
> > +#include "regs/xe_gt_regs.h"
> > +#include "regs/xe_eu_stall_regs.h"
> > +
> > +#define POLL_FREQUENCY_HZ 100
> > +#define POLL_PERIOD_NS (NSEC_PER_SEC / POLL_FREQUENCY_HZ)
> > +
> >  /**
> >   * struct eu_stall_open_properties - EU stall sampling properties received
> >   *				     from user space at open.
> > @@ -31,6 +43,48 @@ struct eu_stall_open_properties {
> >  	struct xe_gt *gt;
> >  };
> >  
> > +/**
> > + * struct drm_xe_eu_stall_data_pvc - EU stall data format for PVC
> > + *
> > + * Bits		Field
> > + * 0  to 28	IP (addr)
> > + * 29 to 36	active count
> > + * 37 to 44	other count
> > + * 45 to 52	control count
> > + * 53 to 60	pipestall count
> > + * 61 to 68	send count
> > + * 69 to 76	dist_acc count
> > + * 77 to 84	sbid count
> > + * 85 to 92	sync count
> > + * 93 to 100	inst_fetch count
> > + */
> > +struct drm_xe_eu_stall_data_pvc {
> > +	__u64 ip_addr:29;
> > +	__u64 active_count:8;
> > +	__u64 other_count:8;
> > +	__u64 control_count:8;
> > +	__u64 pipestall_count:8;
> > +	__u64 send_count:8;
> > +	__u64 dist_acc_count:8;
> > +	__u64 sbid_count:8;
> > +	__u64 sync_count:8;
> > +	__u64 inst_fetch_count:8;
> > +	__u64 unused_bits:27;
> > +	__u64 unused[6];
> > +} __packed;
> > +
> > +static unsigned long
> > +xe_eu_stall_data_record_size(struct xe_device *xe)
> > +{
> > +	enum xe_platform platform = xe->info.platform;
> > +	unsigned long record_size = 0;
> > +
> > +	if (platform == XE_PVC)
> > +		record_size = sizeof(struct drm_xe_eu_stall_data_pvc);
> > +
> > +	return record_size;
> > +}
> > +
> >  /**
> >   * num_data_rows - Return the number of EU stall data rows of 64B each
> >   *		   for a given data size.
> > @@ -43,6 +97,36 @@ num_data_rows(u32 data_size)
> >  	return (data_size >> 6);
> >  }
> >  
> > +/**
> > + * xe_eu_stall_init() - Allocate and initialize GT level EU stall data
> > + *			structure xe_eu_stall_gt within struct xe_gt.
> > + *
> > + * @gt: GT being initialized.
> > + *
> > + * Returns: zero on success or a negative error code.
> > + */
> > +int xe_eu_stall_init(struct xe_gt *gt)
> > +{
> > +	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
> > +	if (!gt->eu_stall)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&gt->eu_stall->lock);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_fini() - Clean up the GT level EU stall data
> > + *			structure xe_eu_stall_gt within struct xe_gt.
> > + *
> > + * @gt: GT being cleaned up.
> > + */
> > +void xe_eu_stall_fini(struct xe_gt *gt)
> > +{
> > +	mutex_destroy(&gt->eu_stall->lock);
> > +	kfree(gt->eu_stall);
> > +}
> > +
> >  static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> >  					   struct eu_stall_open_properties *props)
> >  {
> > @@ -143,6 +227,235 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >  	return 0;
> >  }
> >  
> > +/**
> > + * buf_data_size - Calculate the number of bytes in a circular buffer
> > + *		   given the read and write pointers and the size of
> > + *		   the buffer.
> > + *
> > + * @buf_size: Size of the circular buffer
> > + * @read_ptr: Read pointer with an additional overflow bit
> > + * @write_ptr: Write pointer with an additional overflow bit
> > + *
> > + * Since the read and write pointers have an additional overflow bit,
> > + * this function calculates the offsets from the pointers and use the
> > + * offsets to calculate the data size in the buffer.
> > + *
> > + * Returns: number of bytes of data in the buffer
> > + */
> > +static u32
> > +buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> > +{
> > +	u32 read_offset, write_offset, size = 0;
> > +
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	if (write_offset > read_offset)
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> > +
> > +	return size;
> > +}
> > +
> > +/**
> > + * eu_stall_data_buf_check - check for EU stall data in the buffer
> > + *
> > + * @stream: xe EU stall data stream instance
> > + *
> > + * Returns: true if the EU stall buffer contains minimum stall data as
> > + *	    specified by the event report count, else false.
> > + */
> > +static bool
> > +eu_stall_data_buf_check(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> > +	u32 buf_size = stream->per_xecore_buf_size;
> > +	struct xe_gt *gt = stream->gt;
> > +	struct per_xecore_buf *xecore_buf;
> > +	bool min_data_present;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +
> > +	min_data_present = false;
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		xecore_buf = &stream->xecore_buf[xecore];
> > +		mutex_lock(&xecore_buf->lock);
> > +		read_ptr = xecore_buf->read;
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						       group, instance);
> > +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> > +		write_ptr <<= 6;
> > +		write_ptr &= ((buf_size << 1) - 1);
> > +		if (write_ptr != read_ptr && !min_data_present) {
> > +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> > +			/*
> > +			 * Check if there are at least minimum number of stall data
> > +			 * rows for poll() to indicate that the data is present.
> > +			 * Each stall data row is 64B (cacheline size).
> > +			 */
> > +			if (num_data_rows(total_data) >= stream->event_report_count)
> > +				min_data_present = true;
> > +		}
> > +		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> > +			set_bit(xecore, stream->data_drop.mask);
> > +		xecore_buf->write = write_ptr;
> > +		mutex_unlock(&xecore_buf->lock);
> > +	}
> > +	return min_data_present;
> > +}
> > +
> > +static void
> > +clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> > +{
> > +	u32 write_ptr_reg;
> > +
> > +	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
> > +	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > +
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> > +}
> > +
> > +static int
> > +xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
> > +			  char __user *buf, size_t count,
> > +			  size_t *total_size, struct xe_gt *gt,
> > +			  u16 group, u16 instance, unsigned int xecore)
> > +{
> > +	u32 read_ptr_reg, read_ptr, write_ptr;
> > +	u8 *xecore_start_vaddr, *read_vaddr;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct per_xecore_buf *xecore_buf;
> > +	size_t size, copy_size, buf_size;
> > +	u32 read_offset, write_offset;
> > +	unsigned long record_size;
> > +
> > +	/* Hardware increments the read and write pointers such that they can
> > +	 * overflow into one additional bit. For example, a 256KB size buffer
> > +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> > +	 * write pointers. This technique avoids wasting a slot in the buffer.
> > +	 * Read and write offsets are calculated from the pointers in order to
> > +	 * check if the write pointer has wrapped around the array.
> > +	 */
> > +	xecore_buf = &stream->xecore_buf[xecore];
> > +	mutex_lock(&xecore_buf->lock);
> > +	xecore_start_vaddr = xecore_buf->vaddr;
> > +	read_ptr = xecore_buf->read;
> > +	write_ptr = xecore_buf->write;
> > +	buf_size = stream->per_xecore_buf_size;
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	if (write_ptr == read_ptr) {
> > +		mutex_unlock(&xecore_buf->lock);
> > +		return 0;
> > +	}
> > +
> > +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> > +				    read_offset, write_offset, *total_size);
> > +	/* If write pointer offset is less than the read pointer offset,
> > +	 * it means, write pointer has wrapped around the array.
> > +	 */
> > +	if (write_offset > read_offset)
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> > +
> > +	/* Read only the data that the user space buffer can accommodate */
> > +	if ((*total_size + size) > count) {
> > +		record_size = xe_eu_stall_data_record_size(xe);
> > +		size = count - *total_size;
> > +		size = (size / record_size) * record_size;
> > +	}
> > +
> > +	if (size == 0) {
> > +		mutex_unlock(&xecore_buf->lock);
> > +		return 0;
> > +	}
> > +
> > +	read_vaddr = xecore_start_vaddr + read_offset;
> > +
> > +	if (write_offset > read_offset) {
> > +		if (copy_to_user((buf + *total_size), read_vaddr, size)) {
> > +			mutex_unlock(&xecore_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +	} else {
> > +		if (size >= (buf_size - read_offset))
> > +			copy_size = buf_size - read_offset;
> > +		else
> > +			copy_size = size;
> > +		if (copy_to_user((buf + *total_size), read_vaddr, copy_size)) {
> > +			mutex_unlock(&xecore_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +		if (copy_to_user((buf + *total_size), xecore_start_vaddr, size - copy_size)) {
>   
> I think this should be `copy_to_user(buf + *total_size + copy_size, ...)`.
> As it currently stands, this line will overwrite some of the bits written by the first
> call to `copy_to_user`, and will result in userspace reading `size` bytes, but
> this function only having written `copy_size` bytes.
> 
> We noticed in our userspace profiler that many of our stalls weren't related to any 
> particular GPU shader, and so debugged it down to this line; with this change, we no longer
> get 0x0 addresses and random-looking data in the stall buffer.


Thanks for finding this bug. I am incorporating this fix in the next
version of the patch series.

Thank You
Harish.

>   
> > +			mutex_unlock(&xecore_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +	}
> > +
> > +	*total_size += size;
> > +	read_ptr += size;
> > +
> > +	/* Read pointer can overflow into one additional bit */
> > +	read_ptr &= ((buf_size << 1) - 1);
> > +	read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, (read_ptr >> 6));
> > +	read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> > +	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> > +	if (test_bit(xecore, stream->data_drop.mask)) {
> > +		clear_dropped_eviction_line_bit(gt, group, instance);
> > +		clear_bit(xecore, stream->data_drop.mask);
> > +	}
> > +	xecore_buf->read = read_ptr;
> > +	mutex_unlock(&xecore_buf->lock);
> > +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> > +				    read_offset, write_offset, *total_size);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_read_locked - copy EU stall counters data from the
> > + *				    per xecore buffers to the userspace buffer
> > + * @stream: A stream opened for EU stall count metrics
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + * @ppos: (inout) file seek position (unused)
> > + *
> > + * Returns: Number of bytes copied or a negative error code
> > + * If we've successfully copied any data then reporting that takes
> > + * precedence over any internal error status, so the data isn't lost.
> > + */
> > +static ssize_t
> > +xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> > +			       struct file *file, char __user *buf,
> > +			       size_t count, loff_t *ppos)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	size_t total_size = 0;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +	int ret = 0;
> > +
> > +	if (count == 0)
> > +		return -EINVAL;
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> > +						gt, group, instance, xecore);
> > +		if (ret || count == total_size)
> > +			goto exit;
> > +	}
> > +exit:
> > +	if (total_size)
> > +		return total_size;
> > +	else if (ret)
> > +		return ret;
> > +	else
> > +		return -EAGAIN;
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> >   *
> > @@ -159,11 +472,259 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >  				       size_t count, loff_t *ppos)
> >  {
> > -	ssize_t ret = 0;
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	ssize_t ret;
> > +
> > +	if (!stream->enabled) {
> > +		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!(file->f_flags & O_NONBLOCK)) {
> > +		do {
> > +			if (!stream->pollin) {
> > +				ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> > +				if (ret)
> > +					return -EINTR;
> > +			}
> > +
> > +			mutex_lock(&gt->eu_stall->lock);
> > +			ret = xe_eu_stall_stream_read_locked(stream, file, buf, count, ppos);
> > +			mutex_unlock(&gt->eu_stall->lock);
> > +		} while (ret == -EAGAIN);
> > +	} else {
> > +		mutex_lock(&gt->eu_stall->lock);
> > +		ret = xe_eu_stall_stream_read_locked(stream, file, buf, count, ppos);
> > +		mutex_unlock(&gt->eu_stall->lock);
> > +	}
> > +
> > +	stream->pollin = false;
> >  
> >  	return ret;
> >  }
> >  
> > +static void
> > +free_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	if (stream->bo) {
> > +		xe_bo_unpin_map_no_vm(stream->bo);
> > +		stream->bo = NULL;
> > +	}
> > +	destroy_workqueue(stream->buf_check_wq);
> > +}
> > +
> > +static int alloc_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream,
> > +				   u16 num_xecore)
> > +{
> > +	struct xe_tile *tile = stream->gt->tile;
> > +	struct xe_bo *bo;
> > +	u32 size;
> > +
> > +	size = stream->per_xecore_buf_size * num_xecore;
> > +
> > +	bo = xe_bo_create_pin_map(tile->xe, tile, NULL,
> > +				  size, ttm_bo_type_kernel,
> > +				  XE_BO_FLAG_SYSTEM |
> > +				  XE_BO_FLAG_GGTT);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > +
> > +	stream->bo = bo;
> > +
> > +	return 0;
> > +}
> > +
> > +static u32
> > +gen_eustall_base(struct xe_eu_stall_data_stream *stream, bool enable)
> > +{
> > +	u32 val = xe_bo_ggtt_addr(stream->bo);
> > +	u32 sz;
> > +
> > +	XE_WARN_ON(!IS_ALIGNED(val, 64));
> > +
> > +	switch (stream->per_xecore_buf_size) {
> > +	case SZ_128K:
> > +		sz = 0;
> > +		break;
> > +	case SZ_256K:
> > +		sz = 1;
> > +		break;
> > +	case SZ_512K:
> > +		sz = 2;
> > +		break;
> > +	default:
> > +		xe_gt_warn(stream->gt, "Missing case per XeCore buffer size == %lu)\n",
> > +			   (long)(stream->per_xecore_buf_size));
> > +		sz = 2;
> > +	}
> > +
> > +	val |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_XECORE_BUF_SZ, sz);
> > +	if (enable)
> > +		val |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
> > +
> > +	return val;
> > +}
> > +
> > +static void
> > +xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	u32 reg_value;
> > +
> > +	/* Take runtime pm ref and forcewake to disable RC6 */
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER));
> > +
> > +	reg_value = gen_eustall_base(stream, true);
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> > +}
> > +
> > +static void
> > +xe_eu_stall_stream_disable(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +	u32 reg_value;
> > +
> > +	/*
> > +	 * Before disabling EU stall sampling, check if any of the
> > +	 * XEHPC_EUSTALL_REPORT registers have the drop bit set. If set,
> > +	 * clear the bit. If the user space application reads all the
> > +	 * stall data, the drop bit would be cleared during the read.
> > +	 * But if there is any unread data and the drop bit is set for
> > +	 * any subslice, the drop bit would continue to be set even
> > +	 * after disabling EU stall sampling and may cause erroneous
> > +	 * stall data in the subsequent stall data sampling run.
> > +	 */
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		reg_value = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						   group, instance);
> > +		if (reg_value & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> > +			clear_dropped_eviction_line_bit(gt, group, instance);
> > +	}
> > +	reg_value = gen_eustall_base(stream, false);
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> > +
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +}
> > +
> > +static void eu_stall_buf_check_work_fn(struct work_struct *work)
> > +{
> > +	struct xe_eu_stall_data_stream *stream =
> > +		container_of(work, typeof(*stream), buf_check_work);
> > +
> > +	if (eu_stall_data_buf_check(stream)) {
> > +		stream->pollin = true;
> > +		wake_up(&stream->poll_wq);
> > +	}
> > +}
> > +
> > +static enum
> > +hrtimer_restart eu_stall_poll_check_timer_cb(struct hrtimer *hrtimer)
> > +{
> > +	struct xe_eu_stall_data_stream *stream =
> > +		container_of(hrtimer, typeof(*stream), poll_check_timer);
> > +
> > +	queue_work(stream->buf_check_wq, &stream->buf_check_work);
> > +	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period));
> > +
> > +	return HRTIMER_RESTART;
> > +}
> > +
> > +static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > +				   struct eu_stall_open_properties *props)
> > +{
> > +	u32 write_ptr_reg, write_ptr, read_ptr_reg;
> > +	u32 vaddr_offset, base_reg_value;
> > +	struct xe_gt *gt = stream->gt;
> > +	struct per_xecore_buf *xecore_buf;
> > +	u16 group, instance, num_xecore;
> > +	xe_dss_mask_t all_xecore;
> > +	int ret, xecore;
> > +
> > +	init_waitqueue_head(&stream->poll_wq);
> > +	INIT_WORK(&stream->buf_check_work, eu_stall_buf_check_work_fn);
> > +	stream->buf_check_wq = alloc_ordered_workqueue("xe_eustall", 0);
> > +	if (!stream->buf_check_wq)
> > +		return -ENOMEM;
> > +	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> > +	stream->poll_check_timer.function = eu_stall_poll_check_timer_cb;
> > +	stream->event_report_count = props->event_report_count;
> > +	stream->per_xecore_buf_size = SZ_512K;
> > +	stream->poll_period = POLL_PERIOD_NS;
> > +
> > +	bitmap_or(all_xecore, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> > +		  XE_MAX_DSS_FUSE_BITS);
> > +	/*
> > +	 * Enabled subslices can be discontiguous. Find the maximum number of subslices
> > +	 * that are enabled.
> > +	 */
> > +	num_xecore = xe_gt_topology_mask_last_dss(all_xecore) + 1;
> > +
> > +	ret = alloc_eu_stall_data_buf(stream, num_xecore);
> > +	if (ret)
> > +		return ret;
> > +
> > +	stream->xecore_buf = kcalloc(num_xecore, sizeof(*stream->xecore_buf), GFP_KERNEL);
> > +	if (!stream->xecore_buf)
> > +		return -ENOMEM;
> > +
> > +	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> > +
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > +
> > +	base_reg_value = gen_eustall_base(stream, false);
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, base_reg_value);
> > +	/* GGTT addresses can never be > 32 bits */
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE_UPPER, 0);
> > +	base_reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
> > +				       REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
> > +				       REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
> > +						      props->eu_stall_sampling_rate));
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_CTRL, base_reg_value);
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						       group, instance);
> > +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> > +		write_ptr <<= 6;
> > +		write_ptr &= ((stream->per_xecore_buf_size << 1) - 1);
> > +		read_ptr_reg = write_ptr >> 6;
> > +		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
> > +		read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> > +		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> > +		xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1,
> > +					read_ptr_reg, group, instance);
> > +		xecore_buf = &stream->xecore_buf[xecore];
> > +		vaddr_offset = xecore * stream->per_xecore_buf_size;
> > +		xecore_buf->vaddr = stream->bo->vmap.vaddr + vaddr_offset;
> > +		xecore_buf->write = write_ptr;
> > +		xecore_buf->read = write_ptr;
> > +		mutex_init(&xecore_buf->lock);
> > +	}
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +	return 0;
> > +}
> > +
> > +static __poll_t
> > +xe_eu_stall_stream_poll_locked(struct xe_eu_stall_data_stream *stream,
> > +			       struct file *file, poll_table *wait)
> > +{
> > +	__poll_t events = 0;
> > +
> > +	poll_wait(file, &stream->poll_wq, wait);
> > +
> > +	if (stream->pollin)
> > +		events |= EPOLLIN;
> > +
> > +	return events;
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> >   *
> > @@ -175,11 +736,60 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >  static __poll_t
> >  xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> >  {
> > -	__poll_t ret = 0;
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	__poll_t ret;
> > +
> > +	mutex_lock(&gt->eu_stall->lock);
> > +	ret = xe_eu_stall_stream_poll_locked(stream, file, wait);
> > +	mutex_unlock(&gt->eu_stall->lock);
> >  
> >  	return ret;
> >  }
> >  
> > +static void
> > +xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	if (stream->enabled)
> > +		return;
> > +
> > +	stream->enabled = true;
> > +
> > +	xe_eu_stall_stream_enable(stream);
> > +	hrtimer_start(&stream->poll_check_timer,
> > +		      ns_to_ktime(stream->poll_period),
> > +		      HRTIMER_MODE_REL);
> > +}
> > +
> > +static void
> > +xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	if (!stream->enabled)
> > +		return;
> > +
> > +	stream->enabled = false;
> > +
> > +	hrtimer_cancel(&stream->poll_check_timer);
> > +	flush_workqueue(stream->buf_check_wq);
> > +	xe_eu_stall_stream_disable(stream);
> > +}
> > +
> > +static long
> > +xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> > +				unsigned int cmd, unsigned long arg)
> > +{
> > +	switch (cmd) {
> > +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > +		xe_eu_stall_enable_locked(stream);
> > +		return 0;
> > +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > +		xe_eu_stall_disable_locked(stream);
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
> >   *
> > @@ -194,14 +804,22 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
> >  				     unsigned int cmd,
> >  				     unsigned long arg)
> >  {
> > -	switch (cmd) {
> > -	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > -		return 0;
> > -	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > -		return 0;
> > -	}
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	long ret;
> >  
> > -	return -EINVAL;
> > +	mutex_lock(&gt->eu_stall->lock);
> > +	ret = xe_eu_stall_stream_ioctl_locked(stream, cmd, arg);
> > +	mutex_unlock(&gt->eu_stall->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void
> > +xe_eu_stall_stream_close_locked(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	xe_eu_stall_disable_locked(stream);
> > +	free_eu_stall_data_buf(stream);
> >  }
> >  
> >  /**
> > @@ -214,6 +832,19 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
> >   */
> >  static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> >  {
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +
> > +	mutex_lock(&gt->eu_stall->lock);
> > +	xe_eu_stall_stream_close_locked(stream);
> > +	kfree(stream->xecore_buf);
> > +	kfree(stream);
> > +	gt->eu_stall->stream = NULL;
> > +	mutex_unlock(&gt->eu_stall->lock);
> > +
> > +	/* Release the reference the EU stall stream kept on the driver */
> > +	drm_dev_put(&gt->tile->xe->drm);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -229,7 +860,79 @@ static const struct file_operations fops_eu_stall = {
> >  
> >  static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> >  {
> > -	return false;
> > +	return ((xe->info.platform == XE_PVC) ? true : false);
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_open_locked - Open a EU stall data stream FD.
> > + * @dev: drm device instance
> > + * @props: individually validated u64 property value pairs
> > + * @file: drm file
> > + *
> > + * Returns: zero on success or a negative error code.
> > + */
> > +static int
> > +xe_eu_stall_stream_open_locked(struct drm_device *dev,
> > +			       struct eu_stall_open_properties *props,
> > +			       struct drm_file *file)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct xe_eu_stall_data_stream *stream;
> > +	struct xe_gt *gt = props->gt;
> > +	unsigned long f_flags = 0;
> > +	int ret, stream_fd;
> > +
> > +	if (!has_eu_stall_sampling_support(xe)) {
> > +		xe_gt_dbg(gt, "EU stall monitoring is not supported on this platform\n");
> > +		return -EPERM;
> > +	}
> > +
> > +	if (xe_observation_paranoid && !perfmon_capable()) {
> > +		xe_gt_dbg(gt, "Insufficient privileges for EU stall monitoring\n");
> > +		return -EACCES;
> > +	}
> > +
> > +	/* Only one session can be active at any time */
> > +	if (gt->eu_stall->stream) {
> > +		xe_gt_dbg(gt, "EU stall sampling session already active\n");
> > +		return -EBUSY;
> > +	}
> > +
> > +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> > +	if (!stream)
> > +		return -ENOMEM;
> > +
> > +	gt->eu_stall->stream = stream;
> > +	stream->gt = gt;
> > +
> > +	ret = xe_eu_stall_stream_init(stream, props);
> > +	if (ret) {
> > +		xe_gt_dbg(gt, "EU stall stream init failed : %d\n", ret);
> > +		goto err_alloc;
> > +	}
> > +
> > +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> > +				     stream, f_flags);
> > +	if (stream_fd < 0) {
> > +		ret = stream_fd;
> > +		xe_gt_dbg(gt, "EU stall inode get fd failed : %d\n", ret);
> > +		goto err_open;
> > +	}
> > +
> > +	/* Take a reference on the driver that will be kept with stream_fd
> > +	 * until its release.
> > +	 */
> > +	drm_dev_get(&gt->tile->xe->drm);
> > +
> > +	return stream_fd;
> > +
> > +err_open:
> > +	free_eu_stall_data_buf(stream);
> > +err_alloc:
> > +	gt->eu_stall->stream = NULL;
> > +	kfree(stream->xecore_buf);
> > +	kfree(stream);
> > +	return ret;
> >  }
> >  
> >  /**
> > @@ -251,10 +954,15 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> >  	struct eu_stall_open_properties props;
> > -	int ret, stream_fd;
> > +	int ret;
> >  
> >  	memset(&props, 0, sizeof(struct eu_stall_open_properties));
> >  
> > +	/* Set default values */
> > +	props.gt = NULL;
> > +	props.eu_stall_sampling_rate = 4;
> > +	props.event_report_count = 1;
> > +
> >  	ret = xe_eu_stall_user_extensions(xe, data, &props);
> >  	if (ret)
> >  		return ret;
> > @@ -264,19 +972,9 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> >  		return -EINVAL;
> >  	}
> >  
> > -	if (xe_observation_paranoid && !perfmon_capable()) {
> > -		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
> > -		return -EACCES;
> > -	}
> > +	mutex_lock(&props.gt->eu_stall->lock);
> > +	ret = xe_eu_stall_stream_open_locked(dev, &props, file);
> > +	mutex_unlock(&props.gt->eu_stall->lock);
> >  
> > -	if (!has_eu_stall_sampling_support(xe)) {
> > -		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
> > -		return -EPERM;
> > -	}
> > -	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> > -				     NULL, 0);
> > -	if (stream_fd < 0)
> > -		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> > -
> > -	return stream_fd;
> > +	return ret;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > index 70fc89480df2..00896812db41 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > @@ -6,6 +6,49 @@
> >  #ifndef __XE_EU_STALL_H__
> >  #define __XE_EU_STALL_H__
> >  
> > +#include "xe_gt_types.h"
> > +
> > +struct per_xecore_buf {
> > +	u8 *vaddr;
> > +	u32 write;
> > +	u32 read;
> > +	/* lock to protect read and write pointers */
> > +	struct mutex lock;
> > +};
> > +
> > +/**
> > + * struct xe_eu_stall_data_stream - state of EU stall data stream FD
> > + */
> > +struct xe_eu_stall_data_stream {
> > +	bool pollin;
> > +	bool enabled;
> > +	u64 poll_period;
> > +	u32 event_report_count;
> > +	size_t per_xecore_buf_size;
> > +	wait_queue_head_t poll_wq;
> > +
> > +	struct xe_gt *gt;
> > +	struct xe_bo *bo;
> > +	struct per_xecore_buf *xecore_buf;
> > +	struct {
> > +		xe_dss_mask_t mask;
> > +	} data_drop;
> > +	struct hrtimer poll_check_timer;
> > +	struct work_struct buf_check_work;
> > +	struct workqueue_struct *buf_check_wq;
> > +};
> > +
> > +struct xe_eu_stall_gt {
> > +	/* Lock to protect stream */
> > +	struct mutex lock;
> > +
> > +	/* Execution Unit (EU) stall data stream */
> > +	struct xe_eu_stall_data_stream *stream;
> > +};
> > +
> > +int xe_eu_stall_init(struct xe_gt *gt);
> > +void xe_eu_stall_fini(struct xe_gt *gt);
> > +
> >  int xe_eu_stall_stream_open(struct drm_device *dev,
> >  			    u64 data,
> >  			    struct drm_file *file);
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index d6744be01a68..6e9598ddabd7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -59,6 +59,7 @@
> >  #include "xe_vm.h"
> >  #include "xe_wa.h"
> >  #include "xe_wopcm.h"
> > +#include "xe_eu_stall.h"
> >  
> >  static void gt_fini(struct drm_device *drm, void *arg)
> >  {
> > @@ -158,6 +159,7 @@ void xe_gt_remove(struct xe_gt *gt)
> >  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> >  
> >  	xe_gt_disable_host_l2_vram(gt);
> > +	xe_eu_stall_fini(gt);
> >  }
> >  
> >  static void gt_reset_worker(struct work_struct *w);
> > @@ -622,6 +624,10 @@ int xe_gt_init(struct xe_gt *gt)
> >  
> >  	xe_gt_record_user_engines(gt);
> >  
> > +	err = xe_eu_stall_init(gt);
> > +	if (err)
> > +		return err;
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 6e66bf0e8b3f..833a1a67e9ae 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -430,6 +430,9 @@ struct xe_gt {
> >  
> >  	/** @oa: oa observation subsystem per gt info */
> >  	struct xe_oa_gt oa;
> > +
> > +	/** @eu_stall: EU stall counters subsystem per gt info */
> > +	struct xe_eu_stall_gt *eu_stall;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index de682978c4bf..bcc34e47808a 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -424,6 +424,39 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
> >  	     TP_ARGS(xe, caller)
> >  );
> >  
> > +TRACE_EVENT(xe_eu_stall_data_read,
> > +	    TP_PROTO(u8 slice, u8 subslice,
> > +		     u32 read_ptr, u32 write_ptr,
> > +		     u32 read_offset, u32 write_offset,
> > +		     size_t total_size),
> > +	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
> > +		    read_offset, write_offset, total_size),
> > +
> > +	    TP_STRUCT__entry(__field(u8, slice)
> > +			     __field(u8, subslice)
> > +			     __field(u32, read_ptr)
> > +			     __field(u32, write_ptr)
> > +			     __field(u32, read_offset)
> > +			     __field(u32, write_offset)
> > +			     __field(size_t, total_size)
> > +			     ),
> > +
> > +	    TP_fast_assign(__entry->slice = slice;
> > +			   __entry->subslice = subslice;
> > +			   __entry->read_ptr = read_ptr;
> > +			   __entry->write_ptr = write_ptr;
> > +			   __entry->read_offset = read_offset;
> > +			   __entry->write_offset = write_offset;
> > +			   __entry->total_size = total_size;
> > +			   ),
> > +
> > +	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
> > +		      __entry->slice, __entry->subslice,
> > +		      __entry->read_ptr, __entry->write_ptr,
> > +		      __entry->read_offset, __entry->write_offset,
> > +		      __entry->total_size)
> > +);
> > +
> >  #endif
> >  
> >  /* This part must be outside protection */
> > -- 
> > 2.45.1
> > 
