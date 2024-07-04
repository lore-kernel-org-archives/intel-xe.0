Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7193FC2BD09
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 03:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E35110E8C8;
	Thu,  4 Jul 2024 03:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDyOuld6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ED710E8C8
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 03:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720063079; x=1751599079;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ypG4b4KhJxWUE2b3EVEuviq/w/zayFedwOkJO9MmQjU=;
 b=HDyOuld6Hko3MePKrYzTYiHlol8/uMkNRunpBK0B4ohV8DemTU0mU5XZ
 mx/QEU2fZwO6cNKbHUBPlOla+QVpLDNC3tmie1eqAN7F3kdA+hozL+ser
 DRaMeaHJFc2zY9oUN9vGJm6Yw1r9jtL6g0lQgSOafFbFUJ2IR2KvGv5iy
 EaH1+tefBNXcwB0WwRXlXVPI7h20KGhM/SIn75omxzt3XhP/gHLFyTL/h
 bm9Ck6znrD3/5g5TwVTZCZtbkVWagkTxTUwQKvereg2Gd/8pdHp0pJFER
 Q7wlO11Mu0XNopyxXWFZ0MFO7JXd/LaPR1oaOiu8IJIvCVmls15nWNtZH g==;
X-CSE-ConnectionGUID: 07NAaerOTKO6SiB50l5znw==
X-CSE-MsgGUID: u+GM/1gFR8ukmXcu5OiKRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17458314"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17458314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 20:17:59 -0700
X-CSE-ConnectionGUID: i6Pp6SZyQ32W9f7loZ4QWA==
X-CSE-MsgGUID: DnGAkzPpTZydgcq1mGrMDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46391997"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 20:17:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 20:17:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 20:17:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 20:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QniLkKGlL+8CBdXUnbK4GDj7scZ3PDC4RuIr0xkShyYAr07f0BG1bDGKmes1E9ifYysMrtxdodpRyiXW1zK2w8Z3a2x1f2/Ma4AYvebVUE65Q6C0bgbKXIKmyGC7RpC2PrTK/Tetu/buXqNgId69wjKzVJfp8HGjlg3nEgKa3dagUNfd18xvSc3wcNdVBiLK08xjNyTtfy0o90RNBTjJUOYv381yRfB3jfch0WrY+inYW6l6g5Qo+8A5UAUVfvVe0lRhPdhdoEK8+nMvBsZOzyAsGacdfTGKiRXNOxdh0iNpHPwaFWJ/5gdBR9SadBsBCTtqvyqu5RjQaCkbocVLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud5fn5k4yJR05rbsJEook7kOOkgWhzsdjO5wEuAWYYo=;
 b=lJCqBz7RMXRO+TuAqyKd1d4/279bL7fhNcFsYwSL/k8FknuJMLJKUlqnrLiGIqbztK3xE/fI/o2MeaEOyE8B3Er8/VaF5QaFVuIA5eIKl4LpsNREAzVtIFFKSCtf4+Y2Vf2KnuW+Fj8NJpFSmlkx+ZeOYhMMiFxlg94B6eOFeoO6qe4wVpWehwI3ZE66C3VgHR37aYMnMrreHwrKWMWvwjpXeMILeZrN3w4VrCQtwOWZJok4D5eDw5Yb6vnDGGXZUu6sC1rk3+mxQTjoP1co8iyxqHgZQKPHNj3RpZ4kIKNGJlMUio1bn/As+FzbWbcVY64sbEekIyZu25acnevejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Thu, 4 Jul
 2024 03:17:57 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7719.028; Thu, 4 Jul 2024
 03:17:56 +0000
Message-ID: <dfee68a0-6b22-4de4-a5ba-bed987350a79@intel.com>
Date: Thu, 4 Jul 2024 08:47:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Kill regs/xe_sriov_regs.h
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
 <20240702183704.1022-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240702183704.1022-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dafaab5-acc7-4b40-08c5-08dc9bd7e668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXc3Z3F6ekRqb2hJV2RhazFJR1J1U09NbEwwYzVFUmk3ZGtYNUhTM2htTHBv?=
 =?utf-8?B?S1VjTmVIc2thalppYWptTVBWcFRZSmdtNU51OG4wZ1Q2SGhKYktqT0NLZmRy?=
 =?utf-8?B?dDN1NVkwL3JCaGg2ZEV1VU4xNllra1V5U3FianByQmFSUUZQc0xUeU5RZFVE?=
 =?utf-8?B?MXQwSEJNVE9vd0JRbFN0MENpV2pXUkp5TlVEMWtBcnFSK2RkTy9BN1VVUW1D?=
 =?utf-8?B?T3dKclBSL2w2MWVsNHpXWjlURUdaWkRvcFU5VmVRU3FkUEpVZDlFR05pa1NS?=
 =?utf-8?B?NVFsODMvQThIVjlBdmNYRXBYT0NOUzZ5UW5sSjU4MllyRkNlOExPR1QxKzNU?=
 =?utf-8?B?RmV1ZUg3N0RudTZTMFcxSjBQYzl4aUJQQXYrdUZCYmMvMG42NW5kalFrelJi?=
 =?utf-8?B?WkhBSVA5cGRXazlQNlJpRUt3d0RCMTMyVnZpTWZrbW5mczhyN0FiaDNxUGNM?=
 =?utf-8?B?U1hIbDNXMjRnYmhBUkVJNmtiVnRZalJHWHBHMGN0ZmhVNXdHT2RoZWRka3l6?=
 =?utf-8?B?MWxMUmxTRnNVWm51ODloQ1FURGx4NFNaY3BPMmJwcUhxeXl4V1RjaUI3OCtM?=
 =?utf-8?B?YktQbk1JTm84RlVXc1E0TFZjL2lhNWVMK3VWbHFjMnVzWEUvdS9uMUpBbU0x?=
 =?utf-8?B?amhOZy83WHZYUmRXOUpqN3gzT2lxQm1Gc0lTZXhPbFU1bUNrcFl1UEptTlFL?=
 =?utf-8?B?cjdiRmpEL0lHZDF1VFBvQU1qK1E5WTYzRWZtWVZGcmE2Nm1uOEluTUdsRWN1?=
 =?utf-8?B?QXY4V0s1dTZMZHdIYVZMakQ5WXRPNzJ3a0NoZEo3Zyt0TitqZXUrN3NqYUtQ?=
 =?utf-8?B?eTlDaFdrQ2VxbU9mQ1pjS2RmM1Jyc3pXcEVtcGdqTVRsZVRSRGsrV1pGbWpy?=
 =?utf-8?B?bEpBZWFoZXYrQnlSWC9JbG90N2xLNENrVEw3Q3h5cC9LUHdEUlYyaHVtSFM3?=
 =?utf-8?B?VnY2Z1pMcGJnZUJKU0R3VmhzaFVZMEc5cGtya2puNlk3QTY4aTROcmtlZGZq?=
 =?utf-8?B?SXZ3dmM5RTdwRGlqTTZrTWx1T1lYcEFmQlI3Q1RHRG82d0tDUHQ2WHJBVjhr?=
 =?utf-8?B?S0MxVC90ZUtHSXVLUDZ3TmdMVnFHSS9rUnRmVmp4UEZXeXJZQUVWYUNCUTFE?=
 =?utf-8?B?SUwxaklZMUVpOEJVWnI1Y3dmNzhBbXJFak1ISWV6UGhPQ1ZBcm0yS1UyWFdO?=
 =?utf-8?B?M2ZYZ3hpMi9YQzR2VTZud2Z3NWlsTnRDZ3lPWktTMnZaYXQzbnVXRWFuTUoz?=
 =?utf-8?B?K2Y5NlExSGNndTFxUGwveU5VbXRzcUtXbEg2TVlmNEFJNGl3eElnVTA0V1I5?=
 =?utf-8?B?NEZjZnFiZmxjQ0JUcjJxZzZkQVl1YnF2UkJzTE8vNXYvMlNtNUN3U1piTkRZ?=
 =?utf-8?B?dXZCM2ZZdUhIcGZWVGxVNklpcHhDcFFIWW1jSnEwWGFrRzF1WkpFOFhmdEYv?=
 =?utf-8?B?R2h1RzBzVXpkbFNFQ1g5eWhxTW11Tk9LTXpoNFJwWllvb3ZqRVE5NkNMUmNV?=
 =?utf-8?B?Ky9aRVVaQU9tbGdObGZZQ0Q3Lzgwam1uMEU3Z2RyTmttR0NSVFpPUS9KKzVD?=
 =?utf-8?B?WW1IdCtkYmhpWXZZYXdHRDZZcWZyUzlVNFVBcm52YngzSFliZFVlcWJnamVm?=
 =?utf-8?B?RHY3VWRSLzVpdFo1RVRzYjBCWkxGc0NFNnRQRW5JaHRkamlqSzNtWFNkSG9Q?=
 =?utf-8?B?Y0FjNXIxalBUK2VZQ1gxWjZxZkhIcUoxeVBNN24wMTZjeVVwend2dE40S3pw?=
 =?utf-8?B?QXVmWFNHM1d1Rm9TdUJCeExsZE1PS0N2MGpiSlkzNkRsR09RUDgrSjVqZ2lE?=
 =?utf-8?B?UFlKSUlOQ0k1d3Q2R2MvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME4zNlNoUUJYTmpiMk5sbUlscWprbGkyM1FxMUtjVll6dG1sVmVSdWtkY08y?=
 =?utf-8?B?OGNqMWt0Y3U4MHVJRWFyN0h1aUpsYWNDWno0cU1jazkxNldhWnpmTVZGa0wx?=
 =?utf-8?B?SGdrbDZtaUkyaHo4RFdWVkdRUFlyeit5RGdnZ2VMajFIY3VjYzNiSFR2THVY?=
 =?utf-8?B?U1VQdXphSGZqWDA5dDYwYU5RYVNUVG9yWFVRUjdvazE4SS9rN0FwL0pqUjIw?=
 =?utf-8?B?WnRiZHZnM1JEelVDd3ByT0dUbkc2L2lhQ3NZOTliUVlSU1hjNEdIdDY0SDNj?=
 =?utf-8?B?c3NJWm5XNnFhazk0Z1ZyM0R6Y04rU01kbnNNRVNxZkRsZ2xjZDJrQnR5cjRx?=
 =?utf-8?B?RnMrQjNHb2ltYTNnZUE2bEJRc1pja21PZGsxK0loRkdiaXo5WnBSTjlZWTdq?=
 =?utf-8?B?VE9hNThpK2M2YnI5ZVRWTUpYS3JaVGZnNTJ6ZitWYVBOS2JOays4dWtRWU93?=
 =?utf-8?B?UmFMa0locjRlek5iUThwa2RadlRqODhFY0JGZCtOV2dxUXNKRnpWbTd2by9r?=
 =?utf-8?B?Q0ZkYTk5ZDh3RjVNbHFMd0Z4MEF4VnJpaFBCN1RzcEZuS1MxQlNFcnA4Q2oz?=
 =?utf-8?B?ZGxhZjJVZFVMMXN2b2o1S3hkK08vYldVcW4rQWlXaTU5WFdzb3EvR25KSStO?=
 =?utf-8?B?SFU1ZmNaRjNwMW1lejRIaUlqb0s1Ym5DdW5VRUVFQ3FMVVM2MWZyLzNvVDlm?=
 =?utf-8?B?YlVhOVU4c2g5S01HcXZ1OHhHbGYzWGMrYm4zaVdlbVEwYlJva2lQUkVKTUhy?=
 =?utf-8?B?anpUSjd2elUzVXo1d2kwWDZQdit0dDVHTW43ZEg4THo3UXVnRkw5azJXNHFG?=
 =?utf-8?B?ZndTNWl3RERGTTdPd0tJbFBvYWIyQlZ0RnNsVU1qRnVjTllpMHNBV1Q1WFMz?=
 =?utf-8?B?ZmhUT0FhT2IvRUJRWFJDV0lSVENzVVZ2VXgwcS9wWnN0cnhkaW5kT2lTZnBW?=
 =?utf-8?B?N09GeTZpbXJ1T3c3a3czclIwU0lqYjhYc1hkS1hJdnJaak5JRFlTeGo0enp3?=
 =?utf-8?B?SjNPN05TMEZ1Ky9xR0RzNnpFZ1VkYWJWUDJVTmIrRUR6aU01RHVxL0NZRlI2?=
 =?utf-8?B?Q0Y1QVMxam5IdmpYc2Zwc2tTdGlQQXJZRXZuNlZKMEdUWWthT3V5ZnBaemFv?=
 =?utf-8?B?RTRFRVlKS2E3cWNHUHd2aExkcTM0aFVkUG1JemJTeDQxZ0JOVEIzUzV5eVps?=
 =?utf-8?B?L3ZPZmcyU1ZzRkhFVDZsYkI0dE5sSmIrWDBoQnVzcUNYbW81YXZhMFdYSVQ2?=
 =?utf-8?B?NG5vK2hsazRUS2p4YWpidlVrc09GY0pJVi9YL2c0Y3M5NGorSWo3VFp5bmJO?=
 =?utf-8?B?K0NuZXhKOStOakZRTDhOYkxSOVRYSFlMVWRWcVNFRkFwaDZMYkg4VlY2M2Jj?=
 =?utf-8?B?bExvc2dCQkdBNWtaOUlob21TbmQzVkZUaFIxa2tlZm9aZ3FkNktlUG5UUTZU?=
 =?utf-8?B?emxOTDRWWE5mOW1OTEdGd1RxSG5KLzl3RDNZMmFtbkIrSlNtYjdFTDhWTlZY?=
 =?utf-8?B?T2p4YjdMMzhQb1l0QmhoSktqV21CWDFWbEFvdjREb1MwNEpXRThuS1ZsbGp4?=
 =?utf-8?B?UW1HbU03TlViNGIrQXJYcW1xakk0SERlQTFxLzMrM1FCUjNhUHRWNFVEOXJk?=
 =?utf-8?B?V2NlYm16TWEvWUI1SGNJUG91RGZGSHVzcEdjeFpMK0xFTTZiaDgyVEhyUnRv?=
 =?utf-8?B?T0VNUGIwK0dlMS8yemZVNkI1VWk5MHVWSDUrUU9RVUNSbHdZOE12bm1jL2ZP?=
 =?utf-8?B?SlRSdjFUTmtpVExyNldNckRwN3BxTC9yN1FXN0NBcWJLemIvQnVUUkJjQng0?=
 =?utf-8?B?cjdvcGcvakM0YWZmNVo4YjRIaHlKM1B0T05YQmU4a3U2UmxUanJsN0dhSG1s?=
 =?utf-8?B?QmRHd1pySldMNWJjMGRVOGhLY003c0Yrc015eWlXaWNJN2EwL2Z1TTVudmY2?=
 =?utf-8?B?UEhDSVQzMWNDZlpDbGJKRVRvOWlZOWdBZ2k1VGttbmlxTW53RzRqZGlKWWZ6?=
 =?utf-8?B?WERld0ZwS3diZUZBeFp4K3A0ZDhuc2RoaGRIUlNGM0EraXBPVjk5aHFtSkRI?=
 =?utf-8?B?K2lYcmVRYTIrUTRNRzFxY1dKcU1CZThianI0RkVkMVpOWTF4UVcvdmkwaTk3?=
 =?utf-8?B?SEZkUXNQeGthSkNkR28zSVBES0pYR2kyTzgvbUVFME1ab003eExhRVFHeXlY?=
 =?utf-8?Q?fS7ZiKft54ZQeqo7HKH0kZo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dafaab5-acc7-4b40-08c5-08dc9bd7e668
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 03:17:56.7920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cD3XvNGpPY2m3GzWjjzksTfQwEsi0biM6mqkadB3HuEVHXv+86h/jW6C4tpoUvT/35iC7BNcYZUr5tWbpLhOpiK9cYzKVmQrtKOL+ML3qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
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



On 03-07-2024 00:07, Michal Wajdeczko wrote:
> There is no real benefit to maintain a separate file. The register
> definitions related to SR-IOV can be placed in existing headers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  6 ++++++
>   drivers/gpu/drm/xe/regs/xe_regs.h       |  6 ++++++
>   drivers/gpu/drm/xe/regs/xe_sriov_regs.h | 23 -----------------------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c     |  2 +-
>   drivers/gpu/drm/xe/xe_lmtt.c            |  2 +-
>   drivers/gpu/drm/xe/xe_sriov.c           |  2 +-
>   6 files changed, 15 insertions(+), 26 deletions(-)
>   delete mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d44564bad009..141d0e0faa21 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -88,6 +88,8 @@
>   #define VE1_AUX_INV				XE_REG(0x42b8)
>   #define   AUX_INV				REG_BIT(0)
>   
> +#define XE2_LMEM_CFG				XE_REG(0x48b0)
> +
>   #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>   #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>   #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
> @@ -395,6 +397,10 @@
>   #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>   #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>   
> +#define LMEM_CFG				XE_REG(0xcf58)
> +#define   LMEM_EN				REG_BIT(31)
> +#define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
> +
>   #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>   #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>   
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 23ecba38ed41..55bf47c99016 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -30,6 +30,9 @@
>   #define GU_DEBUG				XE_REG(0x101018)
>   #define   DRIVERFLR_STATUS			REG_BIT(31)
>   
> +#define VIRTUAL_CTRL_REG			XE_REG(0x10108c)
> +#define   GUEST_GTT_UPDATE_EN			REG_BIT(8)
> +
>   #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>   #define   TILE_COUNT				REG_GENMASK(15, 8)
>   
> @@ -66,6 +69,9 @@
>   #define   DISPLAY_IRQ				REG_BIT(16)
>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>   
> +#define VF_CAP_REG				XE_REG(0x1901f8, XE_REG_OPTION_VF)
> +#define   VF_CAP				REG_BIT(0)
> +
>   #define PVC_RP_STATE_CAP			XE_REG(0x281014)
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> deleted file mode 100644
> index 017b4ddd1ecf..000000000000
> --- a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -#ifndef _REGS_XE_SRIOV_REGS_H_
> -#define _REGS_XE_SRIOV_REGS_H_
> -
> -#include "regs/xe_reg_defs.h"
> -
> -#define XE2_LMEM_CFG			XE_REG(0x48b0)
> -
> -#define LMEM_CFG			XE_REG(0xcf58)
> -#define   LMEM_EN			REG_BIT(31)
> -#define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
> -
> -#define VIRTUAL_CTRL_REG		XE_REG(0x10108c)
> -#define   GUEST_GTT_UPDATE_EN		REG_BIT(8)
> -
> -#define VF_CAP_REG			XE_REG(0x1901f8, XE_REG_OPTION_VF)
> -#define   VF_CAP			REG_BIT(0)
> -
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 9dbba9ab7a9a..ef239440963c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -5,7 +5,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> -#include "regs/xe_sriov_regs.h"
> +#include "regs/xe_regs.h"
>   
>   #include "xe_gt_sriov_pf.h"
>   #include "xe_gt_sriov_pf_config.h"
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 418661a88918..c5fdb36b6d33 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -7,7 +7,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> -#include "regs/xe_sriov_regs.h"
> +#include "regs/xe_gt_regs.h"
>   
>   #include "xe_assert.h"
>   #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a274a5fb1401..5a1d65e4f19f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -5,7 +5,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> -#include "regs/xe_sriov_regs.h"
> +#include "regs/xe_regs.h"

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   #include "xe_assert.h"
>   #include "xe_device.h"
