Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A18CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F82310E4CF;
	Mon, 22 Sep 2025 17:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="El8VTwZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED6210E4CF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758560861; x=1790096861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sThu47I//L8wo7Wya99ajpoeWI+38KdDJdsbAp6UPzA=;
 b=El8VTwZR8vtPCCpcgHgPZgtmgNskEdEXgUhYVHnDiGub0hLgNPwj0Ma7
 Y0f/jO0mPBcJgh7G+9gzHVl9kzYOYW9lIvrEklf9Cb3s8oagSIVlmYWMG
 3tXH8np6How3GlWLex/MzQ4CIYq3Xiqmq8lWiUfHvbStTJHaLsFSvyivw
 BAJk2CnFOZngmgR0vgiTOrP9qC3DN6DJAFtjMMZ969I2f5Y8lKXsSRcPS
 bt0LnvrVxIszqwAA4TLFzruO1D5lOeIjNzY3B2n2bEw150avOE4pzwTmn
 CTA48oZO73npxCBS4wJD5yRqS4MWxE2wLHb3md157YxNg589t7KR528XT A==;
X-CSE-ConnectionGUID: h+uzBnbCTcGizlxNQC1+kQ==
X-CSE-MsgGUID: Xatc5jgSQG+/NDCWBlJcnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60883922"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60883922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:40 -0700
X-CSE-ConnectionGUID: j1eSWbDqRemwevmKv9xGSQ==
X-CSE-MsgGUID: hftSKObCTBi87YwtHX+Tog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="175669896"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:07:39 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdE4Jkox8guOaM36HNbKtR7f1hP7IxH9SaQ8VtGtVg+Dw7Ba2kz7CRXg8cC+VeMafZiT+PgD8SFD5NIHmemVxuKlALc+vK1jYr301EoFlXBRHzyvOJgByWmEOV580B7OYp6oiH8jpeCzEJGzkIdzbWDkmT8QOvvhMFfqeGyw9Sz3KeZ6+A3C33eLs0fk/S0IPnKMfItVqcfr5IiM+5dc+sTC5PyU2bpRyu+XPyikpKYbY9KBF3bvqlFZJRmaCHeaT2s/ZmZkusA2ul5OUwqyM8OiqQ9Qs+WE70zGlpbEUEo5pNO2ZaWn1iptuVZFJnqnstYiSgWCt68E5IyQQPSx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CeOdti9HpKjZPzW46Qd8WIEm5ZXssjSIAaZFPVjMx4=;
 b=VdCLWHXiuXEvwAWRkXgphbWL266UKWMZe0/uELVHzkN619FkTp603mqbQ7ZU3bnACJnwvsJ7e1AcurbQ6tXJydI1p+FyRzygKK+sonN1AMPuDMW7bIPfRDHE5Fs+MpUBSOr2CNOn+GdAy/sF/uGy7OE2U1KJ7oYR+pEyeTR4iFKmXKvmTlALkY5MsMtB4sOrlvPq7RMTBhc6gXO47L2bdAd5AyfJoqxx3ynznajBIolUzKpAsDEd291h1PfYa4mpdeZO6BgRVma6tJg3DwwUbabXeekfLAu58qWZVblZsW/k4aSoITvPvEzHcsueBMwKuRzvETrmKdFiDSiwEsOjpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:07:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:07:37 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v4 2/5] drm/xe: Introduce new BO flag
 XE_BO_FLAG_FORCE_USER_VRAM
Date: Mon, 22 Sep 2025 19:07:04 +0200
Message-ID: <20250922170707.1556781-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::36) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2e759c-e11e-4936-cc65-08ddf9fa87cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlNFS3YzWXBaNS9kYWJ4SndnY3J1RkdRZWZWVWlsNzhVa25IK1JWUUI3YUVx?=
 =?utf-8?B?TlZqNmRKQThqRWRTd0ZSNUZIT1Vkb3Z5b0JFWWdKM2VEOU5la0dOR0hrd3U3?=
 =?utf-8?B?MytGN0p1cHBVdUdlOXNUeUZQaUlQUXdtd1cvLzc0MklEYzJVenNTV2xXRmxT?=
 =?utf-8?B?Nm9oa2pPNWRZb0ZjN1JwRjBCSmFHNVY5M3Znd3hDakg0bVorYUs4elBoaisr?=
 =?utf-8?B?YW1vTm5ZV29tSFMzaTd1Q3F0eEdEVnZTOXcvQkR1QlgzclZLK0ZOZEtGd2Za?=
 =?utf-8?B?MEVJRU9MaFNJb2FwYmxRWng2eFoxeFRpV3RobTZCOWJ5a2FBMmhuVGxJVDRW?=
 =?utf-8?B?UGpCSnV0VVYrUDZrbXZaSHBJUWdBc2JHckRhZjRmcHhBeEtjQ3p2eU82UXZj?=
 =?utf-8?B?bFpDTzRPMisxczRHOVUyQ00xM3F6U1pCM3o4V3JnYTlPbWV1bUJtSjYyYmVM?=
 =?utf-8?B?TUh3NStWNTJBYmtRZmpDNHJTWXM3eGFvb2Jqd05kL09MclJieVR5dGFhNVRN?=
 =?utf-8?B?ZnozRlF0eDlOZFVxYXFGb2s1NGozU3FjaitBSm9zMDQ0NG9LSmIwSG0yWlFH?=
 =?utf-8?B?NUYyODlrZlNvQTFwUkFTRS8xRWlidFFHRkNDb3pYUnY1Q1d2ZW9tcStQd2Nj?=
 =?utf-8?B?b0QxL3ZQbDc3NUY0YUR6RWc1cmdtWHBQNUMvc0l5WUc1MHFWN05PWVU2d2du?=
 =?utf-8?B?VHovdmhMRmdqZ3krcUswTHhsNWduUm12WFpmb0JRR2Q3NTdtN0hveUFoMVRk?=
 =?utf-8?B?UWxtTzZnMXZERDdTV0U0ekpvWkNBZHJ1WVZWZERmVkdiQ1kyd0psVFJzcUV1?=
 =?utf-8?B?aVYycUdDeHRxV283Unp4K0p6OGpoUnV1dTY5SXhWTkgzYzk3dVBDcHZGbjBW?=
 =?utf-8?B?VmhkZi9rdm1lR3U2aW1pNkJCRUw5cGViQUtYZ2E2eFZtWndxUXlMRDZPRWh5?=
 =?utf-8?B?dDFXbnM1RHBuZnBCNmMrVk0wNkxkZ1VpTmpZTEVRMUlaRVZJdjhTUGJ3bU9y?=
 =?utf-8?B?cldSZ0QwcEVsWWFQcC9uQTFZV3lldTVUZUJLb0hockRwSDB0VTdld3o5T3l6?=
 =?utf-8?B?VU1wWXYwYkYvbUpkREJxNjljS2prVzlDVEZ0SDUvMGloR0xQa3hpSkZzZm1Z?=
 =?utf-8?B?d3Vma3JkY3YrYWZOb0c4OG8rTXUrdGszejlKZy9IWUt2eFhZQWxNcnlUNUVi?=
 =?utf-8?B?S1hicGlETmFnczlCY3BURlZkQXRaeG82NXViWDlxdENoYnIzQmtWcXlwZWNT?=
 =?utf-8?B?eHFwK1RxTnFYaFlTSWgwR0hNSlpBaUtnU0ZnWUFLS1R0TlJmdllMYkkyOVRW?=
 =?utf-8?B?Q1g0MnVhTFNhR205SG5BSUdMSEhFYkF1V3drWXNXQm5PczZRejJUVXRaZ0N2?=
 =?utf-8?B?VEdGcTJod0dlSVk4TjhuYkwvUmNKVFJXZ1BLVWlpSVFMSTA4eTNHMDRueThY?=
 =?utf-8?B?RVJWc3dKa3N5V2JYY0IrbkV4S0xrSms0c3NaMmVjdko4KzFQVERCRFF6d084?=
 =?utf-8?B?MzluTWZITXFldUN0OGtNQjhSK1ZpTHFtRFYyL09zTFhOREJka2FOVVN2Zk1l?=
 =?utf-8?B?UGRBK1JhNUVWUWhiQTdaZVZmcW95Ui8vZlZ4Qi92MGhDRmJpYURXcHU4WXdL?=
 =?utf-8?B?Ym1vdmdUUEh5b1A2bjl3WHl0bWVvUThxTjNzTW85KzNOWDJ6anFLcjVyOXZ1?=
 =?utf-8?B?UnRWQUVsa3NYMmRaN3BNeHY4TUR0eStTOVhxTDM1MWFmR1JJRnZWdTVjS2gz?=
 =?utf-8?B?Slc0R243c1ExZkZwRmdZYjVuc2pFbW9qZmV0RUk5aVBMYXI5SVZ6cDBVU3g0?=
 =?utf-8?B?YzFZVUJpUGpLb0kxMmhoVm54SlYxVStuWktWbXAzRWtVblEzUGhZdTVzb09m?=
 =?utf-8?B?Zk13b0p5WjBIRnhxSVVsZDVUU2NJdUppQXZvWDA1VXp3dUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTdHbmoyVmxocW5abDM1cm8rNXhSNFdXQmQvQW1OTzQvTlA2WSszYktBcVNU?=
 =?utf-8?B?UG5KQ1JyRnJYSW5yS2pOMFBNR0pVWVBTSVNRSTV6TVp5a0ZOU1lSUjJjWTB2?=
 =?utf-8?B?aEZVaUNjZ0VZZ0pkQS81RUdiU05kc0F4aVBlYXZFL1c0bzNtaHVTcmc5cmlC?=
 =?utf-8?B?YmN3RXBnU290OEZ0c3BYSUZiZ1RhcURJSnB0bUpvdXJTR2NzREVTUXF6Rm14?=
 =?utf-8?B?Z0w0ZStQK2xuOUFwa1E2cEhOZmlraDZFSnhYcTRJN2JldzF1VkFHV2VKbnFk?=
 =?utf-8?B?bm9ISjF3TE1naEUxeXlyZTJMbTF0RU9reGlHcUtlODl1Y2R1RURReHB4R042?=
 =?utf-8?B?eHBSQjUxZEkrNTFuaXFrL0YwdzdmUUh5cnFpVE5uT204U2JNNkZ3dFB1V2JJ?=
 =?utf-8?B?Njdrc3U0bmRhTk5XRWVKSy9tdEhycSs1OXJ2SHF3blZ1Tlc0ZWNFOFl0YWo2?=
 =?utf-8?B?NW4wQzRlNkZJL2U2STc1Qm1LMU1JNE5LRFMwaHowbS9sa3VYclJLeStjOFJK?=
 =?utf-8?B?ZEVmR1ZxdFNWT0RmZlZuemNTSVpLVUhRb0hXSGxKRnk0VW1DZTVkbkR6dnhM?=
 =?utf-8?B?bzhmQlFaN1RDUlhHU1p0Q1ZCN3loTXNTa1pRVnpORnRUN0ZnOXRRUEdjdDFP?=
 =?utf-8?B?RXcyMUZPNEozRG1vMXR1YXh5QUlWRlliQnZNK2pRdkRiNFBsS200MVYzUUFU?=
 =?utf-8?B?VWh0Mkk1VWZVcGxaY0FkMC94ditqc2RiY0V2c0NRT002c1JTVDltb0Y3ODll?=
 =?utf-8?B?czBtcW53YUk5Z2I3MVJ2NStDRXJIemorb2FCT2c4OUlEbmZiOExRREVEZG4z?=
 =?utf-8?B?M01kTVppQmNhNE5OZHR6U3E5dUFRQjRxV3ZkZ2daQzNUaU9uYi8zd0dsd0E2?=
 =?utf-8?B?VjBGVDFTSkt5Zlp2YVN5NnVtYkNFZVNmcnlxcHVOYndVYlRqdzhIZE93dlJF?=
 =?utf-8?B?WlE5MHQ1d2I2WkhxRnpMT1g2NUd3NG1NVUFRLzdwVmVNOFVadnR1QTRvWlh4?=
 =?utf-8?B?YkswajdsZHZENGx3YlUyMDZuR2ZnQVhHK0tteEEyNGZDWWw0ZnJkd3pkR0dQ?=
 =?utf-8?B?Z2FsdFB4MkFPdm9zSHBBdi9TZmlqcm50VHFjMWNlQ0h0Q2hadkVHb2Q1bkJE?=
 =?utf-8?B?OExTYURGNlFEdUEwMHJaQlJHV0s3bWt2OW9GelhETkhPT3l0NXplRGRsUDBs?=
 =?utf-8?B?Z0lYZnZoTjlORFY0bWVCOURBTlRnWG1mRE1oY0VHRlRRM0pNYzNiL25GckdK?=
 =?utf-8?B?Q0N4QjRCbDd4b0l4WUsxWU9MZXk4YlZkY01ORUJqYUdPdnBucXp2RFFhUTVo?=
 =?utf-8?B?MkxJdmdJTndpaGt4UGN2Q1ljYjhBMzc2UHNtQnFvTkxBSVkzV0x2VU9OQ1JN?=
 =?utf-8?B?c3VGd295emNYaGJlMnVVaHRZb281dFBWd05hb1hHemUzbkY3ay9QcmhzcG5s?=
 =?utf-8?B?aGwzeDZYeDgyRjZ3UFZrMDltdGlnY3N5MGlnS3k5Yjd2UFZQMHV2cmlHQ2lw?=
 =?utf-8?B?M1JUcWtpcmVieWsvRWZvaDlrSE9vQUJhYWFaQjBMZ2dlUGxTVExlSUQxSVNQ?=
 =?utf-8?B?RjBic2xlMlJmdzhRSUJJNzJ2ZU5USUdwbTZMbDdiYjBhOVFVZ0pzL1owUklW?=
 =?utf-8?B?WnM1ek0yR2pxeTVoOWozMm9Dd0Z5Sm1LOVAwSHJFOXdldnYxV1EzS2taTGpJ?=
 =?utf-8?B?R3E4OXAycnRGb0F4TmU4YUpiZUpBcWZIbEJEdnFVZG4rRzYyS3ZGajFhVTJB?=
 =?utf-8?B?NFlISjlJZnJtL2F6WXNHZ2lHVEMxd2Y3RThyZlVlT1JqZ24xWHljUG9iSU1S?=
 =?utf-8?B?TTN5VTY3TlgxOFVnL1VpUXpvSlZNSVZWZ1E5dTE4ems4RUtCSHpQMVZoRkM3?=
 =?utf-8?B?QU40ZkhxUUZGNXlJc2JobFlDa2hUUW10bWs3YWFCMlExbnROREJaU3EvYzRN?=
 =?utf-8?B?dmQzdmxFN1lWcFh6bFE3RkN3ZHlRYXM3a0FYTVE4QUpheFRWVVM5Q2JlQVU1?=
 =?utf-8?B?Y2Z4aEhmUlg4RGZJL2kyelZKTW9mSlJLUi8wbDhhTkd1eWNVZHV0NTl2NXFO?=
 =?utf-8?B?QTlXWHhkTUh4cUd1TENkMTNYOEFqSGNaM1NKZktpalZZVjBNcms1dmpuckFW?=
 =?utf-8?B?UHJLVC9RUlpIODkrMzFiWXNhbVhxdWxhYndkdXlaaHhRd1pmdm9McUpvOEEv?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2e759c-e11e-4936-cc65-08ddf9fa87cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:07:37.3593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwg01fjoWYAvQ+M2Y7XcRrPtDP3UUELemHxYMORZzz5LLOGig+9lnbAUvDQP1jrDETm7L67aZp75ZDhIeaVs0AsYis/MoYh0fYNesy1U7aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

When using a separate VRAM region for kernel allocations,
some kernel structures, such as context userspace data,
should not reside in the VRAM region dedicated to the kernel.
The VRAM kernel region is intended only for allocations necessary
for driver operation. Allocations created via ioctl are long-lived
and not easily evictable. If this region runs out of space,
there may not be a fallback, which could cause failures.
To prevent this, add a new BO flag that explicitly forces the BO to be
allocated in the general-purpose VRAM region accessible to userspace,
avoiding the kernel-only VRAM region.

v2:
 - update commit message (Matthew)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0fe7ce1f15f3..bcc66b474636 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -226,14 +226,14 @@ static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
 	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
 }
 
-static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
 					   enum ttm_bo_type type)
 {
 	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
 
 	xe_assert(xe, tile_id < xe->info.tile_count);
 
-	if (type == ttm_bo_type_kernel)
+	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
 		return xe->tiles[tile_id].mem.kernel_vram->placement;
 	else
 		return xe->tiles[tile_id].mem.vram->placement;
@@ -276,7 +276,7 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 	u32 vram_flag;
 
 	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
-		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
 
 		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
 	}
@@ -2263,7 +2263,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
 	else if (vram_flag)
-		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
 	else
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9a8401300b15..353d607d301d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -49,6 +49,7 @@
 #define XE_BO_FLAG_GGTT2		BIT(22)
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
+#define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

