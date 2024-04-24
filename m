Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AFFC04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8C10F678;
	Wed, 24 Apr 2024 03:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdLr+Lw8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBA210F678
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713929389; x=1745465389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=GS7wSDYzgGbelGQAjGntSEEEEwNqQEY0d+QC+4nXnA0=;
 b=FdLr+Lw8BRLkFdrilXVj8nTTj9eShtBFHwUprzSJKJWlNP63ewYdnP1N
 QDLf+RumJEqT/ypHalygly5i8yJZ5NCeFxk41yhps4zAFIb5PyBtgiLRv
 jPxvWLXZbt8XhIAH178Xu0z+nmF0TtLWvOnegzXQ8gMC4IJSMKEcuA9OO
 v3EPWCEuz0K2rVdbi11+KcR770/hbcgBUljLTR5Q3raiVOcIFL/l6tA+5
 79RttLM8jok4LNlrcnL+l2t4UN+cCFfiq175LrAY8gF2fmbQny4PR84nq
 YUkpi1evMYhvRlDxI2iA0gSeJpURFbl93L7LWwU02ZAE9c//hrWbiLYL4 g==;
X-CSE-ConnectionGUID: MjTwFEWQSw6XvCzowY+ncA==
X-CSE-MsgGUID: sWDHt0GYTXmCEizpgl5VFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9392701"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="9392701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:29:47 -0700
X-CSE-ConnectionGUID: nvo9R0KSQ9+DfG2Cp+E/Dg==
X-CSE-MsgGUID: uUyTVO9oTdKPGPX9053i7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="24458704"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 20:29:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:29:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:29:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 20:29:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 20:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1LPg1SinmD5/tXFo3TC6SA2tMZYJ4tKeIqDQxTydzmfoAeL/SkXkgJUfQLFS14jWd4eL7Z3mP15jGP2ticGwi2Dhz5/BZP1F1EkTxV2fvHZ3jT7fct4g89kToPONh7UEPs5vKYaKKYqXXpqzAgrYjd7YFM9rZwCP/GNoCrnp6zsJmPtZbdG4v5dQUhrm9miMBikqSXyf4HhvRVQabu2VdG6eBTTHYgoqfjdXjEaGNCBu8sWciVF0hzK2uudnp2JIWJQ5YtWsH+YqUd1hoqr/zLhNp+CgKKUnPydECeyd+Ub7FAyBogA7sMjCre65lqKEL+7j6gK1v65Mt+VHlOHsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4+9mAahsTpdt0To6mwm1urJAW/S2yCz53N27Zs8IY8=;
 b=Ih2A9+1W59l8G1U1/xo4lbj1Q2+it5gSk4rBb6NXI7VoetpWiLqyhirlxb1slWPDci9ybnleqNzEtQ8/vEoTMby3UiilUDZpQzXqjC9emaotv002RB5kDlzaTIfK9TD/lbp/hrCzrbZ4RNb4LTb4X/6wsLnwKzE1BBSmRcBZZ1sRf4PowlG6z2smw2T9SQyxlID1n1NMTCPMXHByBHQaVLOBv1bzpQpZJi1ptzkcwcWKD+n3tlcyTMvGpB0bjgjiU+2YJI+mtKyqcmvZ1HWjD0T40+2PutuGvl7vpzB8FCQKB66DJxtk3Mx4T5i4P7F6jyx/JUTMqpkz+FebBUZhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ1PR11MB6082.namprd11.prod.outlook.com (2603:10b6:a03:48b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Wed, 24 Apr
 2024 03:29:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 03:29:32 +0000
Content-Type: multipart/alternative;
 boundary="------------T50v2QQgFQCqm3OcFFTLcna8"
Message-ID: <f952c8b6-cbed-419b-a43a-dffea0a39409@intel.com>
Date: Wed, 24 Apr 2024 08:59:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
 <20240423221817.1285081-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240423221817.1285081-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: PN2PR01CA0210.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ1PR11MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 04fc548e-3015-4326-1c43-08dc640ec187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0xkVzJBVEhBQ2ZyZFVFVTZRazV2QmV2TlVnbnF4N2IrbXhma290eVBmSTlk?=
 =?utf-8?B?OExzVkVZanBnUkpsWERjbkY0TFVYaldvV2JORWcweVlTTmtqeTdIRzVYL2Mr?=
 =?utf-8?B?NmNoM0tEaGxDeDYwaEFTS3BkYklTbmQ4d3ArUG52TlptVWhJaWM4WlpTQmJJ?=
 =?utf-8?B?L1lPMFZyVjBocEhTc0lySjhLb0c5N1dYUjFTMGNuSU5WanpISnZwQzdGelR4?=
 =?utf-8?B?enNEYzB6R2NXUVhoVDZzTE5JYzlUaWFkUXlXQ0lxVUJUTWVuU0R4OTJWL1Vk?=
 =?utf-8?B?eDJZc3hlMnVXZFdjOCtyYXVHd1lRSDJjamJ3M0JiQUpnMHpwQUtJZGRUYnBn?=
 =?utf-8?B?V2pPb0pXN250YzlleFpJcXBLTGxRWTI4NElLeThicXBUZ3JCL2VaakRyYXor?=
 =?utf-8?B?MGlhS1ozMTcrVEt3dzZyalRzeXJ2OEVJWXhOY0owZjlBeFJ6Y1d5a2w5cHBZ?=
 =?utf-8?B?dU0wNEJ2NDFEZXdISTZlS1E1aFZDQWJnNm5Ta2daRHM1YTBHR21JaEIwMXlm?=
 =?utf-8?B?bVB5WkJQNHV1Ym4xaHVjNHF4TUNOYmNoL3JLTmZoYUxXK3NGQkZaczhhVldX?=
 =?utf-8?B?S0l6aWxQeSt0TTNocWwxc3FNRFI5ZGJVNzFxZjN5am9uc3BiNHZuTEZmWmR0?=
 =?utf-8?B?dklnTFdHSkhnVnVIbXdqVEdwbFNSeHJmT0lGYlU1L0tLakMrSFQwMHJ1R04r?=
 =?utf-8?B?Uk9tWFdyZG1TdzBkSUJ0ZmNTMEFJbks0eXJaazdzNkJJYWpiaDhpeHVvak1O?=
 =?utf-8?B?ZHo3dVBiU0tzeERleWltbVdCblhYNVdHRmdlMUp4dUtibmV1VldVN3ZaMTZ2?=
 =?utf-8?B?U3Vidy84TkdNWk10SXgwVEV5a2E4emVwaUpqZDViM2JKVEJjUSs3WW9rNU5O?=
 =?utf-8?B?cmF5TDFlVGwwSmlwUFVTamZxNzQrejJiRk8yMjRrSFpwYjdpZndrMnVaYVg4?=
 =?utf-8?B?VHNzOUFZd2xiNUNpTmZ5dDd6c3Q4YXoyNVBHTm9NQnhKOVcybkxwdTI4elRT?=
 =?utf-8?B?a0hWTkhBSGdIaW16aU9qNGo2dFQxQTBoa1BGWUxRZnlyTmJZU1N5SUEzNFQx?=
 =?utf-8?B?THRmMlVNbXF6N2ZZbDBBVnFjSWtMZ05xU0ZQTWpsT0VER0hLV2NZT2FzOWRP?=
 =?utf-8?B?VUhRYmdpNFF5Q3gzQUkzK1dMSklmUlFEZC9XQU1ibGJ4azgzb1hXNzZyVXhN?=
 =?utf-8?B?OUJiWGRTK0hLWEtYTnU4OU5BbG1TaW9zakhkZGFubUcwSFk3UlRQZTlYeVJl?=
 =?utf-8?B?WTlTUmJRcWUyUER2eVQraUFSV0FzdDNWb3ZEdWd0OCtVbENLYkZ2ZHl4M1Fu?=
 =?utf-8?B?MExQajdkaGt4TlpRR1NCbThzU3BHK2luY2pub05DNklFQUl1TG11L3VJVU9l?=
 =?utf-8?B?ckJhaHFpb3NhYkRSenhZRVZ2Sm4vYy9CdWZIUU5wTldWZnZTN2UzbEl1K1ZJ?=
 =?utf-8?B?K3VIditDb1dOOFl5WnU2MURmN2F1MDFISVRqTi9HcUl0QzA4RzBjakRtZnBp?=
 =?utf-8?B?eHZRemJBZ0k1NDRNbVFHVTFXRmlvWXhYVURuTWlYZ25LWWFRVFE2NTQ1WWRp?=
 =?utf-8?B?cExPVU5TUlJhaE5ZdnYzbVJjOGtDS2ZXWGVpenArTlM1c2tKcUM5UnNwNy9S?=
 =?utf-8?B?VDAyUE9tTVZXbVpJK3lPb1BTeHY3UlB4Y013bVlwd1NRRjB6dkNiTjhFMGEy?=
 =?utf-8?B?UmlUY1hKeE9rRDhOYVlSNVZJdFZMTGxEV1JLOWdLME9scThIQmJ5QzVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUFwSTBtczdyM0t0N2ZoUHJyYXo3TVc5cjJwYUxJb20xSXJ6RXdYWW54WGxp?=
 =?utf-8?B?TVRGQzNqYzNaQmF2Qno1V1JTa2dUZmNUSXcyWWhpdzR3UUxMN3Z1S3dDRnVp?=
 =?utf-8?B?dW4wZG8zaTk0SkVSbFBud3RJZjdnaXkwd3doL1NxZUlmdnRYcGJPRjR5WHUz?=
 =?utf-8?B?RktQSXg4aVIzZzhFNU5nODJzVEczYUJyVGJlVnIzWmh4RzJ6R1lnM2hEZ0hJ?=
 =?utf-8?B?ZUNtMkRENjNCVlM0eWV0NWJsUHhIT1Y3cGRjd3crV0oyM09BUWRCeFlubnFW?=
 =?utf-8?B?NFd0MkFSMzNvdDhTQzNwcmtMNnBLVFd3WlAra1ltUmtueDNjVCtTeGIzc1RK?=
 =?utf-8?B?dWRGVitpYzdHUS9EZXh2M05iSWxPNFA2WmROQkhSSTRYaWlPamsvUDFzUlJQ?=
 =?utf-8?B?dk9Xdmd0bmdvVmNCWW9RUTRTbStIN1FvYWxwMW9SME9DbXFEbWtEVTA3UXpm?=
 =?utf-8?B?NWhUdk1MVjBDa1Zqa1M3S25ycE5hSW1TajNNZTI5VXB0aWIrZW1QUUg1WFY3?=
 =?utf-8?B?d1daM3MxUXd4cnlzaWJOc21TR3VmNXdOSitsSEpNSThJNnh4VTVVMThCN2Jk?=
 =?utf-8?B?UTh2cmoweExTWHRwb2JQWmE1WUd6Ni90ZjY1bEZTOWJ6ZHpvc1E0RTlnVEdQ?=
 =?utf-8?B?YnhyZXpTcksyNEp5SFRKRVFiNTR3TEttK0E5L2FJNFM1RmJCZXg0R2VrejFH?=
 =?utf-8?B?RUV4Z00wYlhnemRIVXM2UEgwV1VzczRXQXoyRG1oS3NTQmk4MDI1UC9FaFhs?=
 =?utf-8?B?ZmJUdlkyZUttbWVNT1FUdjdBYS9pci9nUW8xT1VnZG1Va2pkVkZRV3NWcmY0?=
 =?utf-8?B?cHVmcWU2WGp5WGlBQlNLM1JCN05xUlkrbDJnTjdpNWt1VVNTYjIxN0lXT1pX?=
 =?utf-8?B?MzRrZVRvVlYxVXV3NXViSFpYWlBhcU9YeHJJdWF3RzdHT2lhVjl3QmNlcCtW?=
 =?utf-8?B?Wlc2bjNBVWxhK0F0V3JRRVhqR2Fid0VNSmJzZjdUUENFRURiRUFZcDRybUpL?=
 =?utf-8?B?UGJCcDI1VFlIbzJqQXhPaWhiOStzN0xjN1YxZ3VjR1Izb1RNMWRJNDU5ZjEy?=
 =?utf-8?B?UUtudzdXSUFUVW0xMEVobWdMWlp0ZXI4MmU5MEpHRUFkSFBDSE5IVWtwcXQ2?=
 =?utf-8?B?ZVpFbUFLUzJkSWx1bDhQNCt5bFpRZ3ZsL3BjeGVXTlBTTjVMVmxtZk1HMzlO?=
 =?utf-8?B?MWgvNUo2YTB4aVgrV1NNWGxjWnlRQktwOWtmT0pwd1NkWkVaT0xsa240TVhr?=
 =?utf-8?B?d3B6TXNjcWh1ekc0L2JuQXJWcFVuTkdjdU45Yk9JRkQ4bjJoUnp1Zy9ETGY0?=
 =?utf-8?B?dnhNOGNReU9lWUtVdWticGVRNzhYVVd6ektjN1d6WFhQRDJkSHAzbllzMzVh?=
 =?utf-8?B?clRVZm5MNEYzQ2RzancrTXZ0SHVzdG9JUlg5U2MxdWtFTTd5SFRVRXVCUldw?=
 =?utf-8?B?ZHhQMldzem95ZWExOVhWZzZLcHdsN2RrOU10TitEOE9Wdmg5M3h2TkdYMUtZ?=
 =?utf-8?B?S3J6K2U0YkFvcnliTkU1NGozK0lQQTM5U09aMExIenNtVHlicXZOU3V4Mm1v?=
 =?utf-8?B?YTR5dEFEMmRhUjhUb0taaEdSZ0tKcHhOcU9zdGRGdVFiSFRJaHdUSkI3aU84?=
 =?utf-8?B?YStucnFVaXZ2MS9tNGF1c2p2L0xpeE43Z2JzYTJLRzFYZXZFeXI1MGVndmZy?=
 =?utf-8?B?WXdFMm1tOStNSnRIcHI2cEJMN1Jpd0dib3F4YkY1WnBobkpudXZRanpLKzA0?=
 =?utf-8?B?cnU1TUJhYkV4cUJYcXowSEM1dTJQY0cwTWRXaGg0dm5STjViTkttSERTYUFu?=
 =?utf-8?B?MkFadmVmakpqSncrQ0VwYlpUblJYTFB0cW9IZGdKT0J5SktKczdta05rUkRo?=
 =?utf-8?B?aktwWUZNaGRTcklLNkd1TWtweVMzWXJHbmI3MU1EUVkxQ0QxYXZEYlYyVGNF?=
 =?utf-8?B?UDByd1Y1bHk4Zmp5bkJra1ltWEh6d3FCZTcxUUEyTmpUV3hjaXB3RklVNDEz?=
 =?utf-8?B?RS94a04xUGZBNnMvTU8zV21tWWlDNE9lMlRzSldjTnhaSlBySGt4bWVWSHVB?=
 =?utf-8?B?amNMdWFyemluWjBjdDA3ZXVCcWx5TFZWWVU4KzJQOGIyY3pjeHlGanBhZ2Fw?=
 =?utf-8?B?N3I2WDdHREY4amo0Skh4Y1VPTDZLbXBrOWpLUlRDVkNjSS9OQ0FzYTVQZWVp?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fc548e-3015-4326-1c43-08dc640ec187
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:29:32.1881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UGwqd8rCokzmigVIeTpgpH1QciTY3R+wCfb1UqUOdBLnVKd9Rw+k/Z27aABofUHhcazYaKifKk6se9cuvbfJC+npE05IuwPiUond8gU0eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
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

--------------T50v2QQgFQCqm3OcFFTLcna8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24-04-2024 03:48, Rodrigo Vivi wrote:
> So, the wedged mode can be selected per device at runtime,
> before the tests or before reproducing the issue.
>
> v2: - s/busted/wedged
>      - some locking consistency
>
> v3: - remove mutex
>      - toggle guc reset policy on any mode change
>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 55 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.c       | 10 +++--
>   drivers/gpu/drm/xe/xe_device.h       |  2 +-
>   drivers/gpu/drm/xe/xe_device_types.h |  9 ++++-
>   drivers/gpu/drm/xe/xe_guc_ads.c      | 60 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 35 +++++++++-------
>   7 files changed, 149 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index c9b30dbdc14d..0e61fa462c7b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -12,6 +12,8 @@
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_gt_debugfs.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ads.h"
>   #include "xe_pm.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> @@ -117,6 +119,56 @@ static const struct file_operations forcewake_all_fops = {
>   	.release = forcewake_release,
>   };
>   
> +static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
> +				size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len = 0;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
> +			       size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_gt *gt;
> +	u32 wedged_mode;
> +	ssize_t ret;
> +	u8 id;
> +
> +	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
> +	if (ret)
> +		return ret;
> +
> +	if (wedged_mode > 2)
> +		return -EINVAL;
> +
> +	if (xe->wedged.mode == wedged_mode)
> +		return 0;
> +
> +	xe->wedged.mode = wedged_mode;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> +		if (ret) {
> +			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> +			return -EIO;
> +		}
> +	}
> +
> +	return size;
> +}
> +
> +static const struct file_operations wedged_mode_fops = {
> +	.owner = THIS_MODULE,
> +	.read = wedged_mode_show,
> +	.write = wedged_mode_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -134,6 +186,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   
> +	debugfs_create_file("wedged_mode", 0400, root, xe,
> +			    &wedged_mode_fops);
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d45db6ff1fa3..a5b4a9643a78 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -506,6 +506,8 @@ int xe_device_probe_early(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	xe->wedged.mode = xe_modparam.wedged_mode;
> +
>   	return 0;
>   }
>   
> @@ -769,7 +771,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
>    *
> - * This is a final state that can only be cleared with a module
> + * This is a final state that can only be cleared with a mudule
>    * re-probe (unbind + bind).
>    * In this state every IOCTL will be blocked so the GT cannot be used.
>    * In general it will be called upon any critical error such as gt reset
> @@ -781,10 +783,12 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>    */
>   void xe_device_declare_wedged(struct xe_device *xe)
>   {
> -	if (xe_modparam.wedged_mode == 0)
> +	if (xe->wedged.mode == 0) {
> +		drm_dbg(&xe->drm, "Wedged mode is forcebly disabled\n");
>   		return;
> +	}
>   
> -	if (!atomic_xchg(&xe->wedged, 1)) {
> +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>   		xe->needs_flr_on_fini = true;
>   		drm_err(&xe->drm,
>   			"CRITICAL: Xe has declared device %s as wedged.\n"
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 9ede45fc062a..82317580f4bf 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -169,7 +169,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>   
>   static inline bool xe_device_wedged(struct xe_device *xe)
>   {
> -	return atomic_read(&xe->wedged);
> +	return atomic_read(&xe->wedged.flag);
>   }
>   
>   void xe_device_declare_wedged(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9b0f3ddc6d50..0f68c55ea405 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -459,8 +459,13 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> -	/** @wedged: Xe device faced a critical error and is now blocked. */
> -	atomic_t wedged;
> +	/** @wedged: Struct to control Wedged States and mode */
> +	struct {
> +		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> +		atomic_t flag;
> +		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> +		int mode;
> +	} wedged;
>   
>   	/* private: */
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index db817a46f157..6a5eb21748b1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -9,6 +9,7 @@
>   
>   #include <generated/xe_wa_oob.h>
>   
> +#include "abi/guc_actions_abi.h"
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
> @@ -16,11 +17,11 @@
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
>   #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
> -#include "xe_module.h"
>   #include "xe_platform_types.h"
>   #include "xe_wa.h"
>   
> @@ -441,6 +442,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>   
>   static void guc_policies_init(struct xe_guc_ads *ads)
>   {
> +	struct xe_device *xe = ads_to_xe(ads);
>   	u32 global_flags = 0;
>   
>   	ads_blob_write(ads, policies.dpc_promote_time,
> @@ -448,7 +450,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>   	ads_blob_write(ads, policies.max_num_work_items,
>   		       GLOBAL_POLICY_MAX_NUM_WI);
>   
> -	if (xe_modparam.wedged_mode == 2)
> +	if (xe->wedged.mode == 2)
>   		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>   
>   	ads_blob_write(ads, policies.global_flags, global_flags);
> @@ -806,3 +808,57 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
>   {
>   	guc_populate_golden_lrc(ads);
>   }
> +
> +static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
> +{
> +	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
> +	u32 action[] = {
> +		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
> +		policy_offset
> +	};
> +
> +	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +/**
> + * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
> + * @ads: Additional data structures object
> + *
> + * This function update the GuC's engine reset policy based on wedged.mode.
> + *
> + * Return: 0 on success, and negative error code otherwise.
> + */
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
> +{
> +	struct xe_device *xe = ads_to_xe(ads);
> +	struct xe_gt *gt = ads_to_gt(ads);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct guc_policies *policies;
> +	struct xe_bo *bo;
> +	int ret = 0;
> +
> +	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
> +	if (!policies)
> +		return -ENOMEM;
> +
> +	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
> +	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
> +	policies->is_valid = 1;
> +	if (xe->wedged.mode == 2)
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	else
> +		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +
> +	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
> +					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					    XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo)) {
> +		ret = PTR_ERR(bo);
> +		goto out;
> +	}
> +
> +	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
> +out:
> +	kfree(policies);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 138ef6267671..2e2531779122 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0bea17536659..93e1ee183e4a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -35,7 +35,6 @@
>   #include "xe_macros.h"
>   #include "xe_map.h"
>   #include "xe_mocs.h"
> -#include "xe_module.h"
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_trace.h"
> @@ -868,26 +867,38 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>   		xe_sched_tdr_queue_imm(&q->guc->sched);
>   }
>   
> -static void guc_submit_wedged(struct xe_guc *guc)
> +static bool guc_submit_hint_wedged(struct xe_guc *guc)
>   {
> +	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_exec_queue *q;
>   	unsigned long index;
>   	int err;
>   
> -	xe_device_declare_wedged(guc_to_xe(guc));
> +	if (xe->wedged.mode != 2)
> +		return false;
> +
> +	if (xe_device_wedged(xe))
> +		return true;
> +
> +	xe_device_declare_wedged(xe);
> +
>   	xe_guc_submit_reset_prepare(guc);
>   	xe_guc_ct_stop(&guc->ct);
>   
>   	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
>   				       guc_submit_wedged_fini, guc);
> -	if (err)
> -		return;
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
> +		return true; /* Device is wedged anyway */
> +	}
>   
>   	mutex_lock(&guc->submission_state.lock);
>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>   		if (xe_exec_queue_get_unless_zero(q))
>   			set_exec_queue_wedged(q);
>   	mutex_unlock(&guc->submission_state.lock);
> +
> +	return true;
>   }
>   
>   static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> @@ -898,15 +909,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gpu_scheduler *sched = &ge->sched;
> -	bool wedged = xe_device_wedged(xe);
> +	bool wedged;
>   
>   	xe_assert(xe, xe_exec_queue_is_lr(q));
>   	trace_xe_exec_queue_lr_cleanup(q);
>   
> -	if (!wedged && xe_modparam.wedged_mode == 2) {
> -		guc_submit_wedged(exec_queue_to_guc(q));
> -		wedged = true;
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
>   	/* Kill the run_job / process_msg entry points */
>   	xe_sched_submission_stop(sched);
> @@ -957,7 +965,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>   	int err = -ETIME;
>   	int i = 0;
> -	bool wedged = xe_device_wedged(xe);
> +	bool wedged;
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> @@ -981,10 +989,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_timedout(job);
>   
> -	if (!wedged && xe_modparam.wedged_mode == 2) {
> -		guc_submit_wedged(exec_queue_to_guc(q));
> -		wedged = true;
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));


LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   
>   	/* Kill the run_job entry point */
>   	xe_sched_submission_stop(sched);
--------------T50v2QQgFQCqm3OcFFTLcna8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-04-2024 03:48, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240423221817.1285081-4-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">So, the wedged mode can be selected per device at runtime,
before the tests or before reproducing the issue.

v2: - s/busted/wedged
    - some locking consistency

v3: - remove mutex
    - toggle guc reset policy on any mode change

Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Alan Previn <a class="moz-txt-link-rfc2396E" href="mailto:alan.previn.teres.alexis@intel.com">&lt;alan.previn.teres.alexis@intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 55 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 10 +++--
 drivers/gpu/drm/xe/xe_device.h       |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  9 ++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 60 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   | 35 +++++++++-------
 7 files changed, 149 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index c9b30dbdc14d..0e61fa462c7b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,8 @@
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt_debugfs.h&quot;
+#include &quot;xe_gt_printk.h&quot;
+#include &quot;xe_guc_ads.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_step.h&quot;
@@ -117,6 +119,56 @@ static const struct file_operations forcewake_all_fops = {
 	.release = forcewake_release,
 };
 
+static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)-&gt;i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), &quot;%d\n&quot;, xe-&gt;wedged.mode);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
+			       size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)-&gt;i_private;
+	struct xe_gt *gt;
+	u32 wedged_mode;
+	ssize_t ret;
+	u8 id;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &amp;wedged_mode);
+	if (ret)
+		return ret;
+
+	if (wedged_mode &gt; 2)
+		return -EINVAL;
+
+	if (xe-&gt;wedged.mode == wedged_mode)
+		return 0;
+
+	xe-&gt;wedged.mode = wedged_mode;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_guc_ads_scheduler_policy_toggle_reset(&amp;gt-&gt;uc.guc.ads);
+		if (ret) {
+			xe_gt_err(gt, &quot;Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n&quot;);
+			return -EIO;
+		}
+	}
+
+	return size;
+}
+
+static const struct file_operations wedged_mode_fops = {
+	.owner = THIS_MODULE,
+	.read = wedged_mode_show,
+	.write = wedged_mode_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &amp;xe-&gt;ttm;
@@ -134,6 +186,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file(&quot;forcewake_all&quot;, 0400, root, xe,
 			    &amp;forcewake_all_fops);
 
+	debugfs_create_file(&quot;wedged_mode&quot;, 0400, root, xe,
+			    &amp;wedged_mode_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type &lt;= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d45db6ff1fa3..a5b4a9643a78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -506,6 +506,8 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe-&gt;wedged.mode = xe_modparam.wedged_mode;
+
 	return 0;
 }
 
@@ -769,7 +771,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a module
+ * This is a final state that can only be cleared with a mudule
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
@@ -781,10 +783,12 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  */
 void xe_device_declare_wedged(struct xe_device *xe)
 {
-	if (xe_modparam.wedged_mode == 0)
+	if (xe-&gt;wedged.mode == 0) {
+		drm_dbg(&amp;xe-&gt;drm, &quot;Wedged mode is forcebly disabled\n&quot;);
 		return;
+	}
 
-	if (!atomic_xchg(&amp;xe-&gt;wedged, 1)) {
+	if (!atomic_xchg(&amp;xe-&gt;wedged.flag, 1)) {
 		xe-&gt;needs_flr_on_fini = true;
 		drm_err(&amp;xe-&gt;drm,
 			&quot;CRITICAL: Xe has declared device %s as wedged.\n&quot;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 9ede45fc062a..82317580f4bf 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -169,7 +169,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&amp;xe-&gt;wedged);
+	return atomic_read(&amp;xe-&gt;wedged.flag);
 }
 
 void xe_device_declare_wedged(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9b0f3ddc6d50..0f68c55ea405 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -459,8 +459,13 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
-	/** @wedged: Xe device faced a critical error and is now blocked. */
-	atomic_t wedged;
+	/** @wedged: Struct to control Wedged States and mode */
+	struct {
+		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
+		atomic_t flag;
+		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
+		int mode;
+	} wedged;
 
 	/* private: */
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index db817a46f157..6a5eb21748b1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -9,6 +9,7 @@
 
 #include &lt;generated/xe_wa_oob.h&gt;
 
+#include &quot;abi/guc_actions_abi.h&quot;
 #include &quot;regs/xe_engine_regs.h&quot;
 #include &quot;regs/xe_gt_regs.h&quot;
 #include &quot;regs/xe_guc_regs.h&quot;
@@ -16,11 +17,11 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_ccs_mode.h&quot;
 #include &quot;xe_guc.h&quot;
+#include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_hw_engine.h&quot;
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mmio.h&quot;
-#include &quot;xe_module.h&quot;
 #include &quot;xe_platform_types.h&quot;
 #include &quot;xe_wa.h&quot;
 
@@ -441,6 +442,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	u32 global_flags = 0;
 
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -448,7 +450,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe_modparam.wedged_mode == 2)
+	if (xe-&gt;wedged.mode == 2)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
@@ -806,3 +808,57 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
 {
 	guc_populate_golden_lrc(ads);
 }
+
+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
+{
+	struct  xe_guc_ct *ct = &amp;ads_to_guc(ads)-&gt;ct;
+	u32 action[] = {
+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+/**
+ * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
+ * @ads: Additional data structures object
+ *
+ * This function update the GuC's engine reset policy based on wedged.mode.
+ *
+ * Return: 0 on success, and negative error code otherwise.
+ */
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
+{
+	struct xe_device *xe = ads_to_xe(ads);
+	struct xe_gt *gt = ads_to_gt(ads);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct guc_policies *policies;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
+	if (!policies)
+		return -ENOMEM;
+
+	policies-&gt;dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
+	policies-&gt;max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
+	policies-&gt;is_valid = 1;
+	if (xe-&gt;wedged.mode == 2)
+		policies-&gt;global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	else
+		policies-&gt;global_flags &amp;= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
+					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					    XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto out;
+	}
+
+	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
+out:
+	kfree(policies);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 138ef6267671..2e2531779122 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0bea17536659..93e1ee183e4a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,7 +35,6 @@
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mocs.h&quot;
-#include &quot;xe_module.h&quot;
 #include &quot;xe_ring_ops_types.h&quot;
 #include &quot;xe_sched_job.h&quot;
 #include &quot;xe_trace.h&quot;
@@ -868,26 +867,38 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&amp;q-&gt;guc-&gt;sched);
 }
 
-static void guc_submit_wedged(struct xe_guc *guc)
+static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	unsigned long index;
 	int err;
 
-	xe_device_declare_wedged(guc_to_xe(guc));
+	if (xe-&gt;wedged.mode != 2)
+		return false;
+
+	if (xe_device_wedged(xe))
+		return true;
+
+	xe_device_declare_wedged(xe);
+
 	xe_guc_submit_reset_prepare(guc);
 	xe_guc_ct_stop(&amp;guc-&gt;ct);
 
 	err = drmm_add_action_or_reset(&amp;guc_to_xe(guc)-&gt;drm,
 				       guc_submit_wedged_fini, guc);
-	if (err)
-		return;
+	if (err) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n&quot;);
+		return true; /* Device is wedged anyway */
+	}
 
 	mutex_lock(&amp;guc-&gt;submission_state.lock);
 	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
 		if (xe_exec_queue_get_unless_zero(q))
 			set_exec_queue_wedged(q);
 	mutex_unlock(&amp;guc-&gt;submission_state.lock);
+
+	return true;
 }
 
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -898,15 +909,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &amp;ge-&gt;sched;
-	bool wedged = xe_device_wedged(xe);
+	bool wedged;
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
-	if (!wedged &amp;&amp; xe_modparam.wedged_mode == 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged = true;
-	}
+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
@@ -957,7 +965,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
-	bool wedged = xe_device_wedged(xe);
+	bool wedged;
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -981,10 +989,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!wedged &amp;&amp; xe_modparam.wedged_mode == 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged = true;
-	}
+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));</pre>
    </blockquote>
    <p><br>
    </p>
    <p>LGTM.</p>
    <p><span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by:
        Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a></span></p>
    <p></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240423221817.1285081-4-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
</pre>
    </blockquote>
  </body>
</html>

--------------T50v2QQgFQCqm3OcFFTLcna8--
