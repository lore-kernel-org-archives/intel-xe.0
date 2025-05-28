Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93C8C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 20:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9C210E6B6;
	Wed, 28 May 2025 20:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkjdmIUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AAB10E6B6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748463389; x=1779999389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G+50qFO+Q66vneHxioV9aQ8xITjBTm17jkmkZj18UJk=;
 b=OkjdmIUbduO74hVJZdoGl7RqI2ZNqLiYTs9bS1ZSa1Z9GGtRHaMzc8q6
 76+Yym04JVLap9nHIWQfprEADJkVkMoU/9tpe+crpmCrr8rNgu4DSzCja
 2b2xiBdqE+v6/aSTplTUfRYWPFo9GHnt3XyuBaXDpcwtWSm3W1AmoGFJW
 kgTJcXAsYIhDn71wPodAOeh2EkA/qG0IjpluQ0T6oO4fxNEisulkfP2Sd
 Wb8Khdfp/8UPQ2vGRS6TGPgmkPSHO8QcsqU9ad9OWerAAuvJ0QFWpN58c
 kx3JoPbNPO7FdyqNIXVHoxZF8Ui9W2ZEbpRMGJmonQYV0StRtWbN8/1vD w==;
X-CSE-ConnectionGUID: eWX70RQLQsau9fMeC1XFKQ==
X-CSE-MsgGUID: coMi4mGAQiSJ0bRSN8qWmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61140358"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61140358"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 13:16:28 -0700
X-CSE-ConnectionGUID: 4wuJN+jeS9mjsVmC+yVtNA==
X-CSE-MsgGUID: ylgdrqpgQqK4T5hWQNA++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="180566247"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 13:16:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 13:16:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 13:16:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 13:16:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOoL7DoR+Gil9/+lgkTLaozDdaiErCy2wGVpYPhCk8w/sEzljv+7kPTavzL+vgpuFizJX6jbn0cHEY4L4C6SNl6dZTZt8LpqJRPvg23sc/hMztk71KpvLBMvefdvtRskgSEYm+343Jt+GLz2SSVo4uY5rto1R7MRdmtUdfIZLuLMt8QmaGOYaO9//PGeIaom/PHgXXw2gNrDJmynDvg491Eesk+CsDQ4eTTlLkVupAphzg5HPjohxKi8eq2DYhP7UiKMaJ4lQQpqmrzNrD58+BmNonbcNi0K3v4D06QZ4q+gPPjnRVE5Be8BUm80KpWEUvoQksPZfw2H8UttfJ6mcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfppzRZAQM74WUud1GgopxBUzroV7lJxchxQc+lfuYI=;
 b=FOmR4uTnFlDhZoQGf3ZmGdHjDHUJygjxXXqg3Y2KTc9j7be7bF5hWRB3IxgRCQI0RCkfGn5Yfb6es8eO6TzlHwAoDWYp4XnQPhgt+QGMzeSvSw38uEiclagMB9HsBAKGKEHqRI0CWl2j49HxeFZMqHvfA0pOS4dtfrUOVnMi7WVaArx2ZY/bGKH9ZMAlqomhsAXxIMo01vuQ9s853xriYPzIFr8FMa42N6iIAPGeGLpysQGuGJxUGKtNzDgbp0agPdrbYsjoSM6h2FAIM6eOxx4B7rd7ayqbMg3lmfLBVKf1PNwhm2aR1U1Vpp0SDF5qQpR25THzbkWE7IIyfobUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7428.namprd11.prod.outlook.com (2603:10b6:a03:4cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Wed, 28 May 2025 20:16:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 20:16:25 +0000
Date: Wed, 28 May 2025 22:16:22 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
Message-ID: <jm5pvghdqzamxob5ar6yplby54sy6k3asm4gwwvqdnqrb4hm42@mpp7omx62q3g>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519231925.3196154-4-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:802:2::35) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 64097ef0-6d45-4a98-7608-08dd9e24856f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REEzakhLVk1SSjVyc1JjOUhlVDFON29Wb1EvNHVkQkxySU0zTnhwdFVnNVF1?=
 =?utf-8?B?N3JRSURvTytGZU01THNSWkZ1YkEzK0pvdjE5b1JnT3JjNmVLV2FaUGIvclEx?=
 =?utf-8?B?emd1UllSU2VtRGFwandJbW1lRmxkUVdremNRMzdoUEdNS1VoWVdqZUVjb2pD?=
 =?utf-8?B?UmFtUmxQK2J6Ulp0UjA2Zzh0MlRwRTVSQXBzdUJYZ1F4WTliaTNRK3NWZkhq?=
 =?utf-8?B?NDlpc2Fjc2tnMTZsTjJRRENJdjk4RXh1ZTRaRkZXanA5WEliQUg2cHF3MExE?=
 =?utf-8?B?TWxmb2hDU2dFZkZtZ2prRTJXR0Znb1pqdjhFWHRxM0o4bVVsN2pyWXJETVRr?=
 =?utf-8?B?U09YVktTUUU1dnUwVEFFMTdteGFMNldSbkJYSUU2VlRja21TL3lnZDRjQ2xJ?=
 =?utf-8?B?aG5IYzRqNUZ5b0RQU3VSckRIYmVGNzRDTUJoY3lQUHVWWTEvaS90NlNJbWhX?=
 =?utf-8?B?ZzdvVUQ3VEU0OFlNWU9RaWlrOHZwdUZ4YWRhSDFsSHpBcFVyQXRyNklrdWZF?=
 =?utf-8?B?L05mQTZZWDBhZkpPY1NkcE5iRjdHc3BQWS9mR1hkekg0eXpuTXRVMFQyL3Bv?=
 =?utf-8?B?Mnl1RzVZOFhFSVlRdUFWdmdFWm5iQlZYY1BpWmtNYURKVkZZUFhCZHU4Mkpp?=
 =?utf-8?B?ZVJPYXVvT1ZscmVmZUE3VllmcjhuQTZKQ1UzNGxjaFBWUTlUZW11VFEyTjR5?=
 =?utf-8?B?cEN2Y0ZnWTFUUTVDWThOaUlwbmpYVCtNTzNTZUtSVW9Gd1kwckMzVUF2UVU2?=
 =?utf-8?B?RWUvUE91ZEZXZC81aFJBVkhoaVJNQ1hUdldsWWFxdVJZN0ZZMFpZU1JtT29r?=
 =?utf-8?B?ckVXWmJQOVE4cFFFN3lMcWlPZ2lOb284bnhlMXp3emZIeFRRQ3E2N1pqd1RE?=
 =?utf-8?B?alE4OWw5Qno3Tm5laytOMU5mMHp3aXNjN3ptYU52WnV6Tk9Td3NrRHJBUVd6?=
 =?utf-8?B?T1ZoRmk1Ukt2U295VTYzbDBTRWdtUTZUQUNMZU16QVZpendRK2Y0MGkzZ0tn?=
 =?utf-8?B?NnlzK29zNTRwZ1krdTV6Y01MaklESkpsZzRoSldKWDk1MGpWLzEwTTU4MldC?=
 =?utf-8?B?S1ZpQXFoYjFnUzhyK1Vic05HT1FWZHRwYTZyUWNHQkd4UTFYQWZFWVkxVlYy?=
 =?utf-8?B?QjlLYnFOR2U3SkFqSjZRN241Y1hkd2dBdmV3bXdVT1k5VHJKb0VPUlF3d0ll?=
 =?utf-8?B?eVd5aWxYZUVMd1Qxa3lsREIvT2E2VVNoMzN2c0oxM1hlVWdxcWZtUjdBMU5l?=
 =?utf-8?B?NzZNOVJ1Q3pNdDRKSS9TM1JKa0tzNFVFZ0phVEZnVUZTajNEdjhSSWFHYitR?=
 =?utf-8?B?M3RXaVFYWHBrcm5weWRtZ05DZ214ZHdGS1UvUG5lVUdwbS9XZyswSk1YNnRq?=
 =?utf-8?B?bnVnVWxZTXIza3BSeEhKK0ZyaFQ4RUd3Tk5xeHdpRDl1S1ByS3NWUnBkNkV1?=
 =?utf-8?B?MGFObW5yMEJ1bHRkUlJ5S0MrOFZSU3BKVFlmSnY5emNobU9PS0N1TTVvRGVK?=
 =?utf-8?B?SXdoMUN2UEFGbGxRaDFyejYyTkRYM0Jnc1htSHl1RVNNQit1b0ZiUk1IYWdz?=
 =?utf-8?B?cGJtZkp6MDgxdFowUzhSUHF3T1ZpOFpyb1RQWGtrRXNucEJSa0NoTk9xT2FW?=
 =?utf-8?B?MjN2dTMrZnEyanAvYjBQb21tbjRaRnhwSEVUZjZHc3U1Uy9BSmI3Zmcycjd3?=
 =?utf-8?B?ZFd1YlhSRlB1aVpOWjNwcUk2WkJpS0NzL1ljbW9oYnI0QXBXcmdqR3hRSzlt?=
 =?utf-8?B?K2xQblEzT2RQWjh0VlovRElrL0dJc0dJd2NyQ1BscHY2Q2F0THBqdmdFdDRp?=
 =?utf-8?B?RWZJejFWTFFjM3ZhTTJtRlp5Q3RTS0M1MVQyR0tQeCt5VW1pVnI5L2FZTHFu?=
 =?utf-8?B?dDRPaEtrdTg3djFndjVEVjdOSk96eER3T3czT2RTT1JWNTF5RnQ3ZHJxMHRt?=
 =?utf-8?Q?ObKhwwkkFAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZJbmZoUnJNcHFpSkJxOExyWXJhcC93ei9vSU9FcnZ5UzZqQjMwMkFrSDVn?=
 =?utf-8?B?SThsaHFtTUgxN1kvR0hwS3pWT1JGMnVQQkptTm1PaFBwbExPSHVLMTB2Q2ZN?=
 =?utf-8?B?c2xZcHRPR3NzQ2pwNzBZMVhIa3FhWTd2bjlBRTcrQ1M0L1k0TE1SSkp0LzZX?=
 =?utf-8?B?QTRxM1d5SnEzaEtQczJGaWhFRCtJcGNQN0xXcGZnM29sSkowRk9Tbm9oOFNQ?=
 =?utf-8?B?Wmx5SW5meWg3c0trY0xGdHpubXlSQzJTTTQrSG82cGJEbUxDbUxrYTZ6WjVv?=
 =?utf-8?B?bndKb0VFQXh0aWJ4akRMdFRMVVZTNVltWFppWWo3cEp1MTl1c0ZjS3VSc2VY?=
 =?utf-8?B?b3FoeFFXZW84Y2lEWlJPa2FKZmFmei9JZ21yYnF0aUhkVnRWTTMrQ2pPRXV3?=
 =?utf-8?B?ZkNySkdmeE9Fam1NWG9PMEhsdERtWTNlK0ZoTzNGV2xNbHBKWUxqK1ZIV2dB?=
 =?utf-8?B?cTM4T3JCaG9aZ3RPSm9jeUM3eStFbkpCMVFkR2tNQm9PVVFNbElaRUdqRkJp?=
 =?utf-8?B?cGVKSFpObXMyKzlDcmlHWWdUb0lBNnpzYkZPcnEvOXprRTQvdE1vQ1VHYU9z?=
 =?utf-8?B?eHAxWlhPU2dkZnRSOFFuWHU0RitPajRQczBnQ2M3M0l3Y3JJY3lPbm94ZGF6?=
 =?utf-8?B?K0VOWEpUY2lVSmNpbU1wM0p2bURjTnRSRjNPNVk0UkV3TE0vVXdiVjVFU21L?=
 =?utf-8?B?MDJuc3hxYlBYOHdiRldiLzV6RTYxcFhyZVJkMndwd1o1T1A2TXJ6MW5wNHdn?=
 =?utf-8?B?STNPQm9hdFJpdVBtSnZxRVo3VXQralBJRGlPcUl0Yy9nd2xFaXIzRzMwL1Vn?=
 =?utf-8?B?Vm9jVWp3eERzcSt0bHBDS3VLdkNUV29GMWhiK0h3d1dVOUF5dG9ObFNJbjdn?=
 =?utf-8?B?bTdUTU5xMWJJRzltaDdjOEltTmZWOGFNQmxXNUVaZ3pRRUxnTlUySEYveFVZ?=
 =?utf-8?B?L1MybTAxVUxkVVRYemNxeStXQzh2dFpDeGdnbDB0UzJJeWt1OWZ4SUZHNnVD?=
 =?utf-8?B?Y3FhLzlqbi9tczNNbEl4VGpNVkQ2blhWU0xaQXZKczJjY3dQanl5SlNUVXBU?=
 =?utf-8?B?L3F3aHl2OEF1Z0cvM1YxYWp2T2JtNlA5Z09hdTByTmhNS3FCS29DOHVjVy9O?=
 =?utf-8?B?MEVSVThMVHh1ZzBGZndEdWMvNHRoVHB1T0hQaVR3cHNqczhVY3hIVFNEVlp4?=
 =?utf-8?B?V2lLQW0zTVBaQlorZUVNNkV1dldrSm8xbklFSWw4dWovWWhtTk1NM1JvckNP?=
 =?utf-8?B?VXlPaHpWRUhoZDdzZnNjemVSTUE4c1N4cC8rY0wzL2Q1QmF0THdLMlN6UGNC?=
 =?utf-8?B?Y0RscHQ4aTJuQW8rSlE4czFmVWpLeVo2SWcveWZUbWxTSkpKQkhYTnBiSUhr?=
 =?utf-8?B?cDZLTHl3ZEdIOGhXRnYrMVF6L3NwVjQ2TkVNOHk4aEpjczloZzRDOStBTG1u?=
 =?utf-8?B?NFlFRk5CcmhYTFlwbkJPL2EyYmZqN0E1TUdPZnJiZEYvbkFXdVZ0TEFxZm93?=
 =?utf-8?B?SmFNYkwrOUFUbSs3OFVIMGFZeDBkRzNRTURHZHlUcE40SnpwU0wxeHRERjdQ?=
 =?utf-8?B?ZzczTnM0aEk0UlA2OVNQS0Z2a1NjNUs4TEVuSmJPc0dKQzdWUUxqQVFUQ05L?=
 =?utf-8?B?WUJ0YjRmMGF5OVp1ZVNMbzNRckFKUU9SdEdrSGNCNlZiTVpvL083WkhMRzNi?=
 =?utf-8?B?SnNIck90MEtlMHhzZFRmWGZLT3l5S01sVTlQc2NxaTlyanQ0ckJxSFJPTXJj?=
 =?utf-8?B?U1JoeTlkQjNBbGlQUGhyUlg2L1lvZ2hzMUxWUFZqUkpib0RxcXNlS00xdk82?=
 =?utf-8?B?cmJJSkkwZkwrSG1hL2d1c3dtb0ZNa1V4S2xlTGZQQjZSRmp1ODlaTFdhcnY5?=
 =?utf-8?B?SGRKMENGWllrdDRwRy9DbWU5M0NsQUgvd05xYi9wTytkR1d6cS8vY1ZPc2Rv?=
 =?utf-8?B?Z0VocjRjTGxNMGNYei8rYSsxS3AvTUZIdVZTWnpkaURHcGNHakY5a1NYbjQ2?=
 =?utf-8?B?Ni9vSU00R3lEN0FndGs2RVllUStadGNsT3JNcVlTN0s5QnlmTlRqOXFKYzM0?=
 =?utf-8?B?MVM1WTJlL29xWnRrUzJvVXBQS0JkR1VDcFBwNjlvUWNHYzZRQ0NuMFRiY2Jh?=
 =?utf-8?B?aExEL0I1VUVLMHJLdDdBTExTd0tEOW5od1FaditINkxPeWdaMzZFUVpqMzNu?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64097ef0-6d45-4a98-7608-08dd9e24856f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 20:16:25.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XNMrlkxURx6MBMc7s+ZJdwJRakrVjgWp1v1SxHkF0D3ZqOY+k4QqK9n8p1pmhJXx2/9HeB4K9uPTTPz8nNAl6D9M0kJgAzRv6CRoT+V300=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7428
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

On Tue, May 20, 2025 at 01:19:21AM +0200, Tomasz Lis wrote:
> While applying post-migration fixups to VF, GuC will not respond
> to any commands. This means submissions have no way of finishing.
> 
> To avoid acquiring additional resources and then stalling
> on hardware access, pause the submission work. This will
> decrease the chance of depleting resources, and speed up
> the recovery.
> 
> v2: Commented xe_irq_resume() call
> v3: Typo fix
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 +++++++++
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c    | 35 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c      | 42 +++++++++++++++++++++++++++
>  5 files changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 869b43a4151d..455ccaf17314 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -101,6 +101,19 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
>  	cancel_work_sync(&sched->work_process_msg);
>  }
>  
> +/**
> + * xe_sched_submission_stop_async - Stop further runs of submission tasks on a scheduler.
> + * @sched: the &xe_gpu_scheduler struct instance
> + *
> + * This call disables further runs of scheduling work queue. It does not wait
> + * for any in-progress runs to finish, only makes sure no further runs happen
> + * afterwards.
> + */
> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched)
> +{
> +	drm_sched_wqueue_stop(&sched->base);
> +}
> +

Why we can't reuse the regular "stop" function?
In which cases it's going to cause us problems?

The only difference between stop and stop_async is an extra call to
cancel_work_sync(work: &sched->work_process_msg);
and that worker checks sched->base.pause_submit in various places (which
is set in drm_sched_wqueue_stop), and exits early if it finds out that
it's true.
Is this about the case where we're inside ->process_msg()?

Thanks,
-Michał

>  void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
>  {
>  	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index c250ea773491..d78b4e8203f9 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
>  
>  void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>  void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
>  
>  void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80f748baad3f..6f280333de13 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1811,6 +1811,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>  
>  }
>  
> +/**
> + * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> + */
> +void xe_guc_submit_pause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_sched_submission_stop_async(&q->guc->sched);
> +}
> +
>  static void guc_exec_queue_start(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> @@ -1851,6 +1864,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +static void guc_exec_queue_unpause(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +
> +	xe_sched_submission_start(sched);
> +}
> +
> +/**
> + * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
> + */
> +void xe_guc_submit_unpause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		guc_exec_queue_unpause(q);
> +
> +	wake_up_all(&guc->ct.wq);
> +}
> +
>  static struct xe_exec_queue *
>  g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 9b71a986c6ca..f1cf271492ae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -18,6 +18,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
> +void xe_guc_submit_pause(struct xe_guc *guc);
> +void xe_guc_submit_unpause(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
>  
>  int xe_guc_read_stopped(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 099a395fbf59..fcd82a0fda48 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -11,6 +11,8 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_submit.h"
> +#include "xe_irq.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -134,6 +136,44 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>  }
>  
> +/**
> + * vf_post_migration_shutdown - Stop the driver activities after VF migration.
> + * @xe: the &xe_device struct instance
> + *
> + * After this VM is migrated and assigned to a new VF, it is running on a new
> + * hardware, and therefore many hardware-dependent states and related structures
> + * require fixups. Without fixups, the hardware cannot do any work, and therefore
> + * all GPU pipelines are stalled.
> + * Stop some of kernel activities to make the fixup process faster.
> + */
> +static void vf_post_migration_shutdown(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_submit_pause(&gt->uc.guc);
> +}
> +
> +/**
> + * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
> + * @xe: the &xe_device struct instance
> + *
> + * After we have finished with all post-migration fixups, restart the driver
> + * activities to continue feeding the GPU with workloads.
> + */
> +static void vf_post_migration_kickstart(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	/* make sure interrupts on the new HW are properly set */
> +	xe_irq_resume(xe);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_submit_unpause(&gt->uc.guc);
> +}
> +
>  /**
>   * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>   * @xe: the &xe_device struct instance
> @@ -247,6 +287,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
>  	xe_pm_runtime_get(xe);
> +	vf_post_migration_shutdown(xe);
>  	err = vf_post_migration_requery_guc(xe);
>  	if (vf_post_migration_imminent(xe))
>  		goto defer;
> @@ -258,6 +299,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	if (need_fixups)
>  		vf_post_migration_fixup_ctb(xe);
>  
> +	vf_post_migration_kickstart(xe);
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");
> -- 
> 2.25.1
> 
