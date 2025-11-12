Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C36CCF9E3
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 15:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AEE10E768;
	Wed, 12 Nov 2025 15:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfOzTjwG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CA610E768
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762961783; x=1794497783;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=l34tAraPKiDTuUlvizqZTjAKomSEMqQL1RwqNiQPy/k=;
 b=WfOzTjwGnfiGmFOvbRsO/afEWeuK15B14C4WFvg+NJ6e8mvFOym9odPg
 0wS1/8nTFs3vEn7bp0E4ci0jRYOWR1kOEKbCmW38Uo5FSciWSOD9hgMk5
 mIxzb6P6AaPourGxuAZbJC7PbD1LYDfRtDVQqjiophjUgy6ymaQL01TBX
 KyCnBCQzzBHHoQshYZNzDYU/yWmUxJ0TU7iKOunoWdCmcuTh0/VVhhjyU
 AQ1jO/muoZ+shAQFRwWfb8e1SP46hU7x61WUFR1XqrIc108hAwaoo/YX9
 8L9QDhZMLcM3XAy6HvwjJ0WNMEZC2RbjplzkfLZGoMe1iXpZ8NNmsQwqT A==;
X-CSE-ConnectionGUID: oehxlC6ASRiOmS8q74HSFg==
X-CSE-MsgGUID: kfS3bpGiRWir9zYPi5RRBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="90499385"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="90499385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 07:36:18 -0800
X-CSE-ConnectionGUID: jNxEywqURoOWMO7JRVX3dQ==
X-CSE-MsgGUID: +Ie5/5mWS/Kh8ixURvYWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189091843"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 07:36:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 07:36:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 07:36:14 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 07:36:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raOvP8k7S5TXBb+t0k7QFPhDucyYEOS/2rIhjaPDeU3BQOhxdV+Kn8zUNiNFEPT7ELvXicfI/W50OykCtQwLgHgsw+iypx8FdH3h4hDEi8Tv6BOePMCT5iCviw2w3RuPgwgFtEASO+xr+iE9qg3s1nizASSkDMl4RMbwMi7NeArezXG422kYTlwtTp78uTYIJUHbiuPjjdTSbbhRGZJuVt2OQ8BpppiJK+VNJTzhcqg7XgfEtzWT55tmKm7xNXhjGWOKw18w11bhlory8nGVm7rL2vB/3MBLNIOcCAeaMPMVgpsnRAKg+/ltYX86h4lSY+ZhXDKM6sUr6k/YkuW8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TI0n4kujoDQmxfD9w/ySrboRwThErJDDM6yhvsjzYU=;
 b=R1WLS7XmPLCl5tTYTYIKfhyrwnOk4+D8e8pM9GHfyU4A6eGQVwGFZttdvyawEWLA4LJsqC/v/6g/OD6ORM/2785jIRZ3WsajfnP4wokNbEW3yoBbC1OX+gWV51XqPMeNjInTrnahaqnTkjjtVqvyDnBGTOESnAuHOYWQtMG46tO/aKjk4X2xDEQ+iEtaRwsKLwWuIfx7yfByB6rpPyOVl1VEP4+aFexofoFVmcWLcf4mkHf0qtwBigYLkOnqkh0T7ooN1D+3aWHJNMu6NEteC18DbLSGUPt6HGED8VlPuXBPTxCqCKIzCPk+7X6AjG/sWCRv4PNz5kRqkBz3jEhi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 15:36:12 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:36:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-34-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-34-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 02/30] drm/xe/eustall: Store forcewake reference in
 stream structure
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 12 Nov 2025 12:36:04 -0300
Message-ID: <176296176410.3698.16746641300227836485@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 5469dac1-b47c-48dc-f8f3-08de2201358f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djlKR0F1OW9Ib3dYMUs5dFBCQTI1WWpuNDlrSHgxNjhFSnJsRDNQeGxhY3V3?=
 =?utf-8?B?d1B0ODVSd3dNU3U2d2tZbWRoY2ZNelJ0WEZpcEViYkI2S1dEUmczb1VoVGhL?=
 =?utf-8?B?Q0x6TXFHeVlJTDlsSHpYd2xrZnRncGNMOTJWVGpycWdBMTkyaDJ5dTQ2WGdt?=
 =?utf-8?B?c2h3Y3d4UGkwMlJnQzRoOWFZUjc4MGdkKzUyOWNXVWtteVREbUFLRkozU3BV?=
 =?utf-8?B?TllzQWtzbnFzRWc1cUV3b3p4S2FMMXE3UXlLcGo5UXhFa0lZZktJT2xsRi8w?=
 =?utf-8?B?OWd1OTY2eGpRWG1JS1JNRnJpNG83Ry95VVFWTVNFeExDOEIzVWlOQ1A2dFM1?=
 =?utf-8?B?YXllcWhrMHJ1b3lLSlVXeG4zakVldXowNmR1RzJQY0tTUlgxUmkzL2tLZFJK?=
 =?utf-8?B?TndMWU5xbWlSVXhFaElWQXhxa3VFK2JmWGpmT0xaWWVMMk0xSUc5bXFFbnNQ?=
 =?utf-8?B?UmU1b3NuNzB4K1J5eWpsNkRHN01vRzBFbnd3UjlZYVQvNzNac2JXMHFSYkVi?=
 =?utf-8?B?VU51VStkcjZ5MnRqRU5HNnRkSTJTaHRIQm43YWNvTm5VNVR0QzJYRTRUaklZ?=
 =?utf-8?B?dGlnVTZDZ296enFUdi9XN3NxT1A1eGluUzBKTHRSVkMxbXNiSWZ0ZlZSMzR3?=
 =?utf-8?B?bkkwQVFsM1kyUzE2eGlVZ2hEYnlFSmRHaEU1RzAvVmp4bzdyNDhZaU5EYmUz?=
 =?utf-8?B?K2YrVmZZa2t2cks2b20zRkJiOE5HeEtPWlBuM1kvMkdvK09YWVFTMTVTTDhM?=
 =?utf-8?B?UTZUTGRzd1QwQm9nbWo3Qk1SajlORm5RRFVNdGc3QUc0NkNCTFhRVjNJOU5k?=
 =?utf-8?B?c3JJeWNIclRBQUMrdmszT2hXTXd5N1VkbEowblA2aTVCWmxPSVZYS0JJRWhY?=
 =?utf-8?B?dEdPeHNubS9QR09MODZsSExzYmNwME9OR0tMbWZsa04wUFNieVlRalZDSDRD?=
 =?utf-8?B?RTNkVnE0OG1VT2V2dk1NVE1CM29zRDUzS2tNYzZXbU1BbWRmMFM3OCtxRDRs?=
 =?utf-8?B?Q2UvcHRNQmR3Qm5uRnRUT2ZaR1ZKN1kvUDkxR2tNa1hUemJDUTBJM0dHczF4?=
 =?utf-8?B?VTVUWmdTWkZEQWhybW5oR3V4U3hSQVZzbEtLblF4eXk2SXNIVjRiWU9rZGhN?=
 =?utf-8?B?R3k5SUN5Q3M1cVpFTGJGWlpTZTNUT3BCdXNoZ20vNU1KczFCdHFVZEJMcExq?=
 =?utf-8?B?Mi9YNjhWTE9wKzNlRUM5RFdQRmJXOUZMRU9udXlHaXVCRU82ODNUYU0vd2NW?=
 =?utf-8?B?MVVQMmNjYm14by9MaGFHbkhGbjdMUHJjcjlnVGszd2RvNjNiZHdDR2dpMzZY?=
 =?utf-8?B?OENVK3NPNmkwTmtBVENqcVpFRlVHdUpQMG5JbXV0WU44T25pMC9GbDNkV0lB?=
 =?utf-8?B?OWVQQWdwVmI2ZmgzRVRCN0lEemZnNDZOcFNUSlFkRS9YelRoS1VlL0xPWEVK?=
 =?utf-8?B?WlppQS85aHZtb1ZnVjV0WjhzL0ZDZi9FdHQ4SG1kSjFQUWxtdE41Y0dOQXdU?=
 =?utf-8?B?c2xvWE56V0t6S2RicmVTRGIwOUZGNDhqQ2lDbXVDU3dXUmdIb2kyd3o3eWE0?=
 =?utf-8?B?Mk9EaFFLeXpkdERwV2RSdUZXRHNMdzd4YVhWTGZ6U0FhL3BTZ3M2bzhRZ0ho?=
 =?utf-8?B?U0JNVm9PMVhVbDRRc1VMRzRWNkZSckMySW5CS0hJN2VVY2ZwcUdWbVlXUDVk?=
 =?utf-8?B?SnRxZUFWQTcraVVOYkYrNVRyTk9jNkl1QjFIRlBuYW9zbUxnWU9mVFNha25P?=
 =?utf-8?B?ZG9CSHU2cjRGL1RzblFLSFJwUm55M2dEZ2pKQ3lmK0ppOVJZUWcyU1JndVlt?=
 =?utf-8?B?WExTQkM2VlZtVnpRTm9sTnVHUEFqcFo4QkF4RUVzUTZRVzZSZnR0ZThSMHp4?=
 =?utf-8?B?TDBoNmRKdlNncC9weFBwK21EQ2EybWJzamlpTkI4UFNyQ1FsTHNiOEY3QVE4?=
 =?utf-8?Q?oN9fgbu6diFXtZtV+AGJ1xc36bBWot22?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2h0VFdoL3NLQTNUWTZLOXNPMURHWDA2ek95Y2o2OG9nblZJMjVBRnYremJp?=
 =?utf-8?B?OHF6MGRyczhVTm5ZMTE0cnJQS0xrbzJyS3JmWmRlNW9BMkV4cWhGUVlFWWdQ?=
 =?utf-8?B?bVZzeHVjNlZBTFFFTmZXWGQ4MHUxajJsNDY2TWdITzJuOHh0RHVtc3h2TUlW?=
 =?utf-8?B?ajExU0g3MStMbnJEQ1Vob09ieDkxb0lOSlhxNVh2anZVcjBUWWo4elhxb3JW?=
 =?utf-8?B?U242V1BrcGROK09KTkhIeFY2VUYvQzRINXM4MVBMTkdwT2h2M2hpMTJPUHV5?=
 =?utf-8?B?ZEUyN01naDlBYjg4am11Yi85WGRsQUorWlBlTGU0NSszRVRjV2pmc3RqdDE2?=
 =?utf-8?B?VkFqREZLMFYzeUJEWFlvSmxRV2o4NVl3d2xTNjNoY0VobFl4czRFS1U5dVhK?=
 =?utf-8?B?b1JqMytzaG9Rd3BseUJacS9IZnRBa1VoMk5ZbmQ5eGZWVWFNUEN6Qm9DaGcz?=
 =?utf-8?B?bmxLSHlJQjNSV3NNRFNuVWg3WDlEQlpBckRaZlpiV3UwK2ZHbWtxZHgrbkJs?=
 =?utf-8?B?dFI0Q3NJbmhxcm9LaytFZUhtTUllcU5YYnJoK3Y5TDkyczVGRlYrZ2NZdWYx?=
 =?utf-8?B?U2FwYmpuNE5KY1ZQVjlSejBTTXRqTDBEbkdyOHA1ZVRvQ1ZwdEk0TW1wd0J4?=
 =?utf-8?B?UG9Za0YzQ3RDaUlvS2Y2Y0FIUFVqOEFzbzRBT0tKUlpRY2dSUWtDa1JwaWZp?=
 =?utf-8?B?UkVhZGlzT0hWUVp5c3poRk45Ny9EeW9uSHZSVko1QnNzenkrdFhzNDVZbk0r?=
 =?utf-8?B?bmwwQVpZa0VCNmpzZkZVQ0pCMGZMTFVha3JIUGlsSVRzM0MvSTNTUXhSeDJI?=
 =?utf-8?B?QldQV2lScERPcHRSa3lWU2NCSDF6NDZVUHgwV1hoUlBkL0l2K3NoT01sVm1p?=
 =?utf-8?B?UlUxYzlYRUNGcVJBb0owVVRmQitRcE50MXBsbEFkN3ZvQTlpcHFlNFlSaEJT?=
 =?utf-8?B?LzBhTTZLTWtaWTJST1U0OXJ6MENVQWRsMml0aVlDUEEyN2xZQU9sRm81cXR1?=
 =?utf-8?B?OUlNZ0JZNHcxUzhhRVNiMjR2QjYrWGhqc2JCcEM5UWdveVVxWTMrZk5OdXdV?=
 =?utf-8?B?MURmUjJxdWZtSlgvRXQyZG90MGxSeUtVR1IvcG8yQVJzWFpNQlRRNmU3K21H?=
 =?utf-8?B?RWxBdjRRZVg3eFo0VUZpR3FBRG5helMrTXJlYVZBSE1Nd0c5MElUbkhEZCs1?=
 =?utf-8?B?ekUyd2trWG1tYmVCZlRzSVVHd2Z6YWkzUlFxbGxYNkxJK2ZGWTVhTE40K2F5?=
 =?utf-8?B?bUlOTkkrSDNYWmFxZUJvUkVJVm1yUG1HNm9IR0hCK0RYY2d6T05UZXpUM0xi?=
 =?utf-8?B?cGFJT1ZPaDBiRDlieW9YRDdrYTNJbjlvOWE0S0lGeCtQaHZJVlk0ckhKYWlU?=
 =?utf-8?B?N2xheEk2ZGZRbGo1Z2ttMS9EaFlrcHUvekdocjRGSmM5cW5lWndSTGhYY1Vz?=
 =?utf-8?B?ZGhtY280MUJEd2V6UlVWeUdSRDdmUlh4TGtveXV4a2MyTllTZ3RXeDhuVVVZ?=
 =?utf-8?B?RkduNWF3WlZMaW5uOThqdnU3QnlNRWJlYU9FR1BCSUJpRjJLOVc4aUJUTmwz?=
 =?utf-8?B?ZFhVc0RZKzNTcE1jNXRsN05YNGZwRTJiUm1iQUJIb2VDOUtWRURqOHFmL252?=
 =?utf-8?B?NTlRRXEwcU42NW5SeU1BejA5YVBwOHo2M3JJT3c4RXUzcVJqYzkyWEorbkF4?=
 =?utf-8?B?VU5wK1FWbDM1NTFFamFETEFJcXhOVHBlUFlJQzlRdmxaV2NwY3ZZY1V6akRx?=
 =?utf-8?B?QjRRMXVHRkdyMy9zYWp6OTVndzRLcUdCamtnOFVkVkdVdm1xMDVRSFNicFlJ?=
 =?utf-8?B?T3ZuZmtRaW85eTl4RnA4cDFEYlI5a09MZVc3ZkV5akdaVzlJazY2OTZNbmRq?=
 =?utf-8?B?cnZhdndMNVcrTVhwZVZHMjBZbzBMbGtJUzl2NlNPL1h3MVRlbEFLS2N3cmhC?=
 =?utf-8?B?bGJEN1dVdWhkNzNCOEZZczRGYzFZdnYwSXd6aFpFd3pwMlAyUTZ3cWFnQUtX?=
 =?utf-8?B?UEtkbDhmQ2MzaUNLRGFSTTRSSWphaXNZVmpSMFk3RkYxOG54dlpnWUJlQUY5?=
 =?utf-8?B?TVJYSmJYZjVBNjQrWjJUU3BGNTBkUTU2SlVEd3QyVVg2WlprcmhlYkxiZUd3?=
 =?utf-8?B?Q1VZaGlzRXhWNmlCRGxuNFFMblRrUjVGbUJuYys2bkJJc0VIYlJLeXd1RzIx?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5469dac1-b47c-48dc-f8f3-08de2201358f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:36:12.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vT0fJMmPXydtzOt3fYgDvxYC8o71vXp0OLzzFCwzwJzPCsZNtcmihlSqe5SfAGhdcYdL2cIxkHqrqBxnwwTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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

Quoting Matt Roper (2025-11-10 20:20:20-03:00)
>Calls to xe_force_wake_put() should generally pass the exact reference
>returned by xe_force_wake_get().  Since EU stall grabs and releases
>forcewake in different functions, xe_eu_stall_disable_locked() is
>currently calling put with a hardcoded RENDER domain.  Although this
>works for now, it's somewhat fragile in case the power domain(s)
>required by stall sampling change in the future, or if workarounds show
>up that require us to obtain additional domains.
>
>Stash the original reference obtained during stream enable inside the
>stream structure so that we can use it directly when the stream is
>disabled.
>
>Cc: Harish Chegondi <harish.chegondi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_eu_stall.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_s=
tall.c
>index 650e45f6a7c7..97dfb7945b7a 100644
>--- a/drivers/gpu/drm/xe/xe_eu_stall.c
>+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
>@@ -49,6 +49,7 @@ struct xe_eu_stall_data_stream {
>         wait_queue_head_t poll_wq;
>         size_t data_record_size;
>         size_t per_xecore_buf_size;
>+        unsigned int fw_ref;
>=20
>         struct xe_gt *gt;
>         struct xe_bo *bo;
>@@ -660,13 +661,12 @@ static int xe_eu_stall_stream_enable(struct xe_eu_st=
all_data_stream *stream)
>         struct per_xecore_buf *xecore_buf;
>         struct xe_gt *gt =3D stream->gt;
>         u16 group, instance;
>-        unsigned int fw_ref;
>         int xecore;
>=20
>         /* Take runtime pm ref and forcewake to disable RC6 */
>         xe_pm_runtime_get(gt_to_xe(gt));
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_RENDER)) {
>+        stream->fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
>+        if (!xe_force_wake_ref_has_domain(stream->fw_ref, XE_FW_RENDER)) =
{
>                 xe_gt_err(gt, "Failed to get RENDER forcewake\n");
>                 xe_pm_runtime_put(gt_to_xe(gt));
>                 return -ETIMEDOUT;
>@@ -832,7 +832,7 @@ static int xe_eu_stall_disable_locked(struct xe_eu_sta=
ll_data_stream *stream)
>                 xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>                                           _MASKED_BIT_DISABLE(DISABLE_DOP=
_GATING));
>=20
>-        xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
>+        xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);

I did a quick look and I would even say that this is also good to avoid
decrementing the refcount if the corresponding get failed and we somehow
ended up making this put call.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>         xe_pm_runtime_put(gt_to_xe(gt));
>=20
>         return 0;
>--=20
>2.51.1
>
