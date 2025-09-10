Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5C3CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 07:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A1710E87B;
	Wed, 10 Sep 2025 07:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYX0bQU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA9410E87B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757489757; x=1789025757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QzOGyohulRQsCSxoMggIdyKnaVzqeYpS5ImQda3fi0g=;
 b=WYX0bQU0Vbbc2NF+lneUScqyak9Jw67oARyDXHdVgaCQ44csMwHxy2Hm
 MmTLmcO9rurLxGgNrCCTXACMD/DVET5DHFa4e+6B7+onYKvphzUfREqRq
 Y9B1CHaMERWPfEGcRjwi8WehO5URx1ZaR6fNfIwCZR1RI9EBmK8uatHs6
 48T8xKKPvAPFKMgjwOrvGIw4rACBu+3oXsEwjzD31bD6COlUJJfRNx9gl
 pY1byiUYyN1Ry4qQLM9KXn4gbw4u1qayS46VYH6ZpG4XOPhd4vWmJQt4D
 8Ksm9Ktkd1CeH8xO1uFNYCLhZimaaStz0YE8oI1akBknIrgNM15uymoID Q==;
X-CSE-ConnectionGUID: vzb1O3xCRWG6m0h8eKBIVQ==
X-CSE-MsgGUID: yqq+YNRFTCCC+PBF1uX1iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59646036"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59646036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:46 -0700
X-CSE-ConnectionGUID: Kc/uUGZkTnSYpHL4nszDYA==
X-CSE-MsgGUID: JJeKdaTHT0auMMGlsqI1EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="204304741"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 00:35:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.79)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxEW5QIBj7eoNREL0+ymM6HJ7aJbSKEpRdnVlG6wfqalfamAWMqcHDfFwZrv0PThcS19A+2Jy4DdkbaXGpcToLUb10+sk3uUU+s7eJItYZ6NWDxkgXtyqYOyYyMooAfWihg3SZFnlv2f0ug59kMUWmaqs6hcBhzxxIVgL1Sy8SjvjvdlikIXfNZixSkVB6Vu/pKFT3MAU1Ap9wz9u8X/E41UgcnAuqHuo2jFfyRyRMxGzXMpngeYP4cGRbZgAPhwYihmMrrRYjSajjnPaRfJchSZeW7cROZXDCw6rDTI8TBGwyCnlPpLq7j1eRpg1tqYllGiELHzTJDAiQbU+EwigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OP5Q5W9o+hkh/1vm0O7bjNW8Bs8TRAztsL7xgegwSto=;
 b=okgACuMQNtnWonMaVv0HaILdnlLSbJ9ARRLYLnF3NLVnsVpIF6ZrnOJarBikcidKDj3zC/tGVXvr2n2QsZcY/pH14HFuQ9o0oO42UYPQfrenyyINj+eszxe+QdlGaQIJ6gPw/6DIwDyaNnkUPGpqMOiftfYR47rD4395FakeNstjB988/8KOy30S2wuKfVI+QNksliAIbep6ZCw5NpgOp0ZTDZTYY8DUVq88OrTBTM4Z3N8OCvqD9EliomI0vKcANB+11aaSX5tH++x1048flGV7uU6mlTNed3vyykmID/p6Vscbo+pTIOTq3es9ukgmKDEDH1Y6Q81N1LdcpqR8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 07:35:39 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:35:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Force user context allocations in user VRAM
Date: Wed, 10 Sep 2025 09:35:09 +0200
Message-ID: <20250910073510.732250-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073510.732250-1-piotr.piorkowski@intel.com>
References: <20250910073510.732250-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0019.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: ace216c8-3e17-4a43-cdc6-08ddf03ca3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXZuajJ1eDBzMklXNVFlbTJPek1ZbWttVHd6dHluVVNDRkVOV0dTdEhpSlNP?=
 =?utf-8?B?aVYzcmsxV0htVUVVVTZRLzJIRzQ0UjlsamRKWDB4UldBalJWMnlJbEozbFBj?=
 =?utf-8?B?NVZUQUQ3aUQwTVhQWExsQk1GQ1NUUkRLeFIvc3ZzWTY5dVZid3Z3Mk9FcWEz?=
 =?utf-8?B?c1NhNU0yWkQ1aXRwNzFWTHYvdHNrME56RXA5WWRiNGFnajMwVlhQTUsvWXA5?=
 =?utf-8?B?WWxERVBtNkhMLzE4dnRvL2lBYnFoYkdOM1FRL2p5dUZQaFNlUG1rVUwzU0Qy?=
 =?utf-8?B?VEdObVdjRStkL1NsQ083ZHZ6cDNJYzVRZFdCTWJUdG9ZWjhzT2F0OGtqNU9l?=
 =?utf-8?B?bXVXTGpGdmZrd2dCK0w4RGUvZ0l2TTQ5S1llUU9OZWcvY3FUVjdOTVNXSFcz?=
 =?utf-8?B?Snk5VUZMcEV3OUNZWkZGdGZLRER1QStGcWczRHAyUlBXNnJRRWhqT1ZVR0lP?=
 =?utf-8?B?Y2NOSEQ5WklyTUJKMGtGd09ncktWY1drM1dNaVBzOC90azM4U0tQMzFhL29R?=
 =?utf-8?B?TVFidzBvS2I2UHQ5dFZURHJYRG9FTHIrWFZYMC9zZVhiNUh6ejZlSzZ3ZVZ0?=
 =?utf-8?B?TU1wWDl1Vmt3eVU3anRUUXdTMXFkamJNV2tGWklhNkluZFBmVWpYRlNrVm1h?=
 =?utf-8?B?RlFmZEVpc01QZmNzR21HbzJ1VmF0amxpL2tHY3lFM1dzRDczOFN0ZW9hVjJ3?=
 =?utf-8?B?dngrdFN5bFRFU09aVzlvdU1rZnF3MGhYM1k2Z2s4aTBvR0JDSEprakZGazJp?=
 =?utf-8?B?VEQ1bW5vUlVLK2wwbUNoczlndkcvZUFBdC9lWmlsYjMwVUdPYXFiTGtMSVpD?=
 =?utf-8?B?Z1lrKzZWd0p6RitvbndCNTFyRUlHWm1tKzFpcng5MWxFbkhPQ0ZhZUhNbTJl?=
 =?utf-8?B?eEo1RWd2YXlDeXlRemlRUHY3RjhHamF3TVFlZVgwdWhDYjRKQjJHZUJSOFJT?=
 =?utf-8?B?cnZuT3hQM2p5ckhHVE5SSkpSMGFTSTdHRElQa1VjRFVLaXkxL1hVWTVEQmtL?=
 =?utf-8?B?T3dFWTA2ZVlCT0hvZW9vZGVzVDJmUFp4cmJPRGVxR3lneS9KQjlaWjgrcit2?=
 =?utf-8?B?RjlETXNYWHpuQ0dRR2FNZGV2eE84WitjSkVFa1NNRWV1Q2lvUHJySURiRUVh?=
 =?utf-8?B?V3EvS3dLejI2V2x0MmVKWnc2YVlXRVlheGM5NkJUY3g3YU9TNFVIT0JzQ1NH?=
 =?utf-8?B?WHE2RzVGd3pNR2hRT0FRUHNxZ1d4RUNPK1ZHRGtIMWRIR2VNcENrUUM3cUhU?=
 =?utf-8?B?Nm5EWktvejQvVHBtTklLSlYxQURmOG43QXN1ckFnVE41dHgxM2xYMzF2d25a?=
 =?utf-8?B?TW5qRERaZFAwQ1hqenZvYjQvWldtVE0zblpWSGY2aDlPZ0hYTzRXcm1NSmVp?=
 =?utf-8?B?OURRSUdTdWpZb1M0Sml5Qmk3c25XMTFYUVhGV1l3bVJqWURCMksrYzl2Zmx2?=
 =?utf-8?B?VVFSaEJzT0lPMk1iejhJTjJCUGFmeW5GN1dmVDJJVDA5YjRkeVpPWXFyejBN?=
 =?utf-8?B?RW8yYktGOURLdHdUaVg0T3ZLVkFTczh4STJNVUJaSjErZTFFQ2QyWTV4T1NC?=
 =?utf-8?B?WHYrMGFEMjJ2cDM0N2cvOUxna3J4bjBCOEpDZXVzUjVwN1RuZ2xVdUh2dUxk?=
 =?utf-8?B?bjJ2TkJHbXptLzk3S0NtWmJVZi9HMGU2dFFYMzdSU2djbGthMnpoKzhubDdC?=
 =?utf-8?B?SDh1NzZSZHpzaHY3UDBGWm9HcG1vYURXTmhmNWZLR2h2aWJBSHN6VGh6YjNQ?=
 =?utf-8?B?bGp2MGwwblhzR3JZdmUrbjdJMFcxNXpyUG91eWJZK2FQOEdQNWFYVHkvdi9v?=
 =?utf-8?B?bFEzNU16R09XeWdScnpTd0lSOWxNZW1yY296blQ4eVIzSGZ4Tkg4SnRNQk5W?=
 =?utf-8?B?dEVWMGRYZGgwQlFYSnZhQ1lMWlF3aEpwWkNDc3BKVjlsZi9DZTd3MzJLazF6?=
 =?utf-8?Q?8Sjttit+wbg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9IL1JwSlFkSzZ4TEpqSm1OelRKemVGY0o2RURPbW1jUnNxcjRTcmpKMUVv?=
 =?utf-8?B?MzQxbWtEei8vd25kNFQ3YkNOWGdYLzI2dlJ6dDV4MzNmQ2pDc1RuVHE0dWZF?=
 =?utf-8?B?Y1VGd25rRkZaT2M2NThkbzB4ZkVaY3pYYkRvVzQvcDZ5ay9nTk5wa3lzSHRZ?=
 =?utf-8?B?UFMxKzhsOVhMbUhsNnJmZCt5RC9sMURpMjRnM1pqbjF0dU1oSmtpMUFUUm03?=
 =?utf-8?B?UjdOTE9aWS8raVZKWEdXaWhmdmxCWFlhcVJTYXRyUkN3WElmc1YwYUNtcG5C?=
 =?utf-8?B?azlzMzlsOUZDZTJmUUVVcjJCOThlR1VBNlR1ZitUS1NSY1phVW53L2pITUUy?=
 =?utf-8?B?MWV2VjJnendNNDR4K01jVFdFQ09YYnorSm45N1hYM0I2L3oxZXRCajMwREtD?=
 =?utf-8?B?VXRGeEVta2gweG54L0dHekdWdGRRQW1NK0UvUVhuTXlmbFVUQjkwN1RsMlBI?=
 =?utf-8?B?VS9qaitGZ3pWVzhGUmJlZWRuT0hwRkw4VmVVVWROT2E4WGlXZUdjbDZWV2hS?=
 =?utf-8?B?d0p2Y01tQ2prVnlScUc5UEFUQTRKWVF2Ui9ZaUJMOW9IY29ZNTcvOGZ6aCtR?=
 =?utf-8?B?RE5oNi8zOThORW9qdC9BaWR5b2p1R0M3MVh2eElmSlBGViszcWtNbGo4MEZm?=
 =?utf-8?B?TFM2M2pOV1p4N2V1QVZjOWl4MVJQME54ZC9Wd0UzR0podTVPQzhvUkdGRFhZ?=
 =?utf-8?B?MU5kbldMU2ZsZUFGaGdWUGs1OE1sZXFHTm55b2ZJWGJIRTVrYThRZGtKdHFU?=
 =?utf-8?B?QjVMUDhGSmxtdncvTFpRREdkTDNuWlNVd0gwVFkyVDlCYTNNdDhxYU9vZ3Nl?=
 =?utf-8?B?b2laT0FFcVV6eVU4WHR2T0owQVhJYklyTGNqc0JDTEpwb2FBR1pGZ1FWeCtu?=
 =?utf-8?B?WjdxVitjL0VtQWY3d0NNc2EwczlzQ2dhTHYxRGVvVGI5WUxtbno4VWFsS3h6?=
 =?utf-8?B?NVM5bEFjdUhmVzhoZ3ZDTzh1QlU3eTJLeHhSZXVpTjRjQndPbEdUSFJhMnVL?=
 =?utf-8?B?aVJvRHY5SjcwYjVqdUtqSVVYb1MvNzR3Q3VwdzNJY3phanNwb2xYU0U2R1Ju?=
 =?utf-8?B?UGZ5TVhTYUFyaXNmKzloYnVxUU5nRmFEMW1aTUhOUm1HNStZUnFWQjhJVUVO?=
 =?utf-8?B?Si9vc2xTR2lFWEtITUNrYmpsMStkMjJIZzRqSVNIV1BhL1pxeTB4amtMOTRz?=
 =?utf-8?B?bXFWTVZpemF3VUlQSjIwQzk5bXQzTy84eFg3RVFwRmtjZjVFMFJRMGRwSFVp?=
 =?utf-8?B?YVl2c1VmNEU5V3VxSmc2a0I5MnoreUZxVFlLQ1l6MDFDK2xIRkxqYlR4MjBn?=
 =?utf-8?B?QTFLWjQ1UnVxSnhZZm1TZWZPWlFTTjZ1dVFCNlFoeFJGUk12QXIwMUFzR0Ro?=
 =?utf-8?B?S0hTVWkrUzlIS2xIbmRXS1F6SldINzEzUzBPMFRXYVhsMTNKSGlwaTd2TTg1?=
 =?utf-8?B?Z0FvZzJsTzlPYU8rTHdrdDljMmxwV2JzbEpwNFhxeklNaGdLUW01ZFA0dGJx?=
 =?utf-8?B?a0ZvT0c0WFhyZkY3aSsrNHMvOE9mbGxJZTdKOFM5WUxNNEJyT2F6VnJ5NWZJ?=
 =?utf-8?B?SjhBTVkxVlROVVh0QVlBcHBDUFpLQ2Nld2dzU2djcEJtL2dCVDFhVGtYWm93?=
 =?utf-8?B?TmJxNmNqbExaT3l1cUl4M3hDTFJkeWRBeVVVd3EybkJlNjVBTEVjVFBmY1p4?=
 =?utf-8?B?VlJwMGpHRkhyckFZVzBHQnFGRjBSRTV6Nm5hRGZtb1krUHhQZFlIVXh3S20w?=
 =?utf-8?B?dGErSU1ZTVg4SHVYSmQ3am9IWFgrRzd3TTUxZ0ErVVkxdFNOVVlGbDRCaG8x?=
 =?utf-8?B?bStYZzBwUEltL01FTlpEbDB1cVVaNXdLVTFBUnU1dWxpaVlTOStUd2ZRN3ZO?=
 =?utf-8?B?VFFUdmpMTXlNWFNoSHFCYm10dWlrVjJxQTc4R2U2eXBEelc2TUdEelVGamE2?=
 =?utf-8?B?d2RRZzVjbVdmSVRHVCtwY3prZG9uZlk0RTRjSlA0Z3hrc2VuSFR5T29uaGln?=
 =?utf-8?B?cmY5ZTM5MGhSa3VmK3lJVitqVWtHMElkMjlSUGZvcTltVFBwV2tnYlcrOG1C?=
 =?utf-8?B?ay92YU1Kck56ZjRUNm1jTWtodkhnMGJNZnpmK0hJVEFrWUR1ZksyVEM1cVA1?=
 =?utf-8?B?VzJSQnJtNSs2LzBpZEFudS9yaVJzZ2R4SStkNnJMNys3cUk2ZlErT3dXRGQy?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ace216c8-3e17-4a43-cdc6-08ddf03ca3c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:35:39.5263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M484hfaf/BiYXQsER8HzcDWDxASv7Fp4mF/Rf3fLD+3u9xpDxHR4600LT736ZJExTrpWzB2C1iepLvZ92AarFHKe8jkhOxR0E2wdk1iG7hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

In general, kernel structures should be allocated in the kernel-dedicated
VRAM region. However, userspace context data - while used by the kernel -
does not need to reside there.
Let's force the allocation of such data in the general-purpose VRAM region
accessible to userspace.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
 drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h        | 6 ++++--
 drivers/gpu/drm/xe/xe_pt.c         | 2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 063c89d981e5..9a8fa3ed5d09 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -160,7 +160,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q)
+static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
 	int i, err;
 	u32 flags = 0;
@@ -179,6 +179,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
+		flags |= XE_LRC_CREATE_USER_CTX;
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -215,7 +218,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
-	err = __xe_exec_queue_init(q);
+	err = __xe_exec_queue_init(q, flags);
 	if (err)
 		goto err_post_alloc;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8f6c3ba47882..e9d9a68d2b01 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1340,6 +1340,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (vm && vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
+	if (init_flags & XE_LRC_CREATE_USER_CTX)
+		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
+
 	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
 				       ttm_bo_type_kernel,
 				       bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..21a3daab0154 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -44,8 +44,10 @@ struct xe_lrc_snapshot {
 
 #define LRC_WA_BB_SIZE SZ_4K
 
-#define XE_LRC_CREATE_RUNALONE 0x1
-#define XE_LRC_CREATE_PXP 0x2
+#define XE_LRC_CREATE_RUNALONE		BIT(0)
+#define XE_LRC_CREATE_PXP		BIT(1)
+#define XE_LRC_CREATE_USER_CTX		BIT(2)
+
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 07ecf4132d41..dfa508f60e65 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -122,7 +122,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 	if (vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
 
 	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
-- 
2.34.1

