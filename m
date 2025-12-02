Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE463D116FE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 20:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8610E6B8;
	Tue,  2 Dec 2025 20:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNtkFA2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8876410E6B8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764707712; x=1796243712;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vLg+RYfR8LjZQ2+LF6ev1F3nF/JmT4CeVxK8QAr4Ix0=;
 b=VNtkFA2HWEtn6CpqB6y8+WR6pVQkzIgypq4VUlrTuzWT8RyGe8oonvai
 gwBdU0yaCVHhXKaGSfp1IyPHAiT1IvYXJga3aeevmHYPxHFTAXYn6peaC
 W8uGRVkELyri6q4rgmvR5ZXNBMIAH1Juw5IlRhT4T6uy5wW08OPqj4nKg
 f4CHkWFhIMXa7CiFW0ILSCEsGYwlKFMAtyVc/w5Lm/SzTcmEox9hlhCom
 OI9KDLlG94b6PWNdG/nns2EkSj0oZgEPUoH8BXDYKCeMGM3dB5S0xXNPW
 C/XKsja3mQAlLHlIsv8ErafI7qgRM0xgVFFDfXLI8BISGYL22DXWOXf0u g==;
X-CSE-ConnectionGUID: o+RH32OHTiirvVaBYlHyzA==
X-CSE-MsgGUID: TOM3XBvcTNCob+mIiDMYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66579613"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66579613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:35:12 -0800
X-CSE-ConnectionGUID: xcovRE/bSPaBTnHSA5yTrw==
X-CSE-MsgGUID: m2aoOTddQwW2LpRrFFt2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194359188"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:35:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:35:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 12:35:12 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:35:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ5xbqsF3vw419rfpIFHXDak2jwL+HEauj0U7fMrPJG1uo5jS88UrKD504CvqQQCCaCh0OT6IqjLJ9971nKv3QFqTx0AcQEtrS2DJ7nkSsxbKf8Hpukds9QO8z08lvI4nP9A8LQXBlX+TNspcBKNyXFtpRtO4pWqZ2pFJ8BMMz//ZtGjfeuGxtDOhSNNfPeJ+ciTGr9v9xBWAf+joVhnj70ZtHie1hghERd/Szhx84ig/acniDPQwSekTPjZCMTRHQx2xvmvhBCgEVFodvntAXEice7GPYLrkLqvZGyLcBaUdXEr2Eh5ZWPpl8+YVSyRZHgSjNfRPyFzILZdx1eESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ENPOu30YOL3nTmerhDwe6w0D28YzlgnMKkV9k/3PYU=;
 b=AWUgBikJf0EEd1vMgq6VZhY3/U24FJGgu/Aq9e1xrhhlBp+vJ916pfswWb8p+Yig9Jsw4AWqpENjLukc8LOF++0aNhnUUUj4x8q72Cldy15oy9ZC1nzhLYU5ujPod0lz1c66TjGVcbfAOFmN8B03azFXO7/tEjXuDE/o0McFk5w5vdtkhQja2i9FUyKxgyaqxl/0N5WXCMy5DVF8DAu4pN0j2N7HZ0bkT/dFdRA6hGjY0shnLWtx8DYwskwdgTO8cbzOswcc5/NyEr/3jAjCqbPkDdud3+q+CToWFSZ5lmlmkKCUX4+b8C6mbGqjWSWNUOlNQmk30tNYTwyQec7vEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 20:35:10 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 20:35:10 +0000
Date: Tue, 2 Dec 2025 12:35:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe/soc_remapper: Use SoC remapper herlper
 from VSEC code
Message-ID: <aS9NeKJ6Xqp6scG2@soc-5CG1426VCC.clients.intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
 <20251117205315.1458477-8-umesh.nerlige.ramappa@intel.com>
 <b4ac66ba-850d-4140-bfef-f91399e0540f@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4ac66ba-850d-4140-bfef-f91399e0540f@intel.com>
X-ClientProxiedBy: MW3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:303:2b::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 243e0f7d-95ca-4251-8ba9-08de31e249d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU9NS1ZSUlNERUNEeUpKQVJhUjlxK1N5M0VoZzNUb0RJL1hDbzd1SjdHTWw5?=
 =?utf-8?B?TVNJb2tiUUN5Y2VSTlNEK01oNFNabkpxNnhxZ0ErL1hWaEZXenRvekQrN3p5?=
 =?utf-8?B?QmpnUlNaM1A2ajVaNEdqY1N0bE1mdFdTTThKelZ5U01nVE90MFVnRERSK1Rq?=
 =?utf-8?B?N21ienorNlg5VUlBOXZTTVhqY2xkVDdKelc2cGhmQkQvN2E2TGlOV1ltTW8z?=
 =?utf-8?B?bUQ3NnNsYTJSRmxNdEk2VnVBMkJBRmJRL1R4SGNheEdielhPYXA5R25sSjMv?=
 =?utf-8?B?b0lONGU0ckExZHVPblZhK2lkd3I5cVpwTDlwdHBzMDZMMHpndnd5N3VURVRR?=
 =?utf-8?B?M2VRYkhFblBpQVo0SHRyanpxYnZUWEVGcHI3d1B0TUFZVmlnMHIvaVJsR0RY?=
 =?utf-8?B?ZFFvT1BNcWhTeU9uZ2FJRytqd3FCVmFYeUZWeWJITStrUWVYanp3WUtTZ2Uy?=
 =?utf-8?B?bDY5dEhTa3BuK0VJZ0UrRWF0S3JkQzVKbW4rc1NjTTBoVHJsd1c1Qm1NT1B2?=
 =?utf-8?B?OFZtZ21IUGZTdkFSZDFlb1BVVTVzdi83OFlwUWtnelJzY2pmM1N6cFVJc2pw?=
 =?utf-8?B?aXkyaXQ1b1kwSHNRNGxseG9yalFFL0pCcldlSENUdEFqS01UVllsV1Z3eUh4?=
 =?utf-8?B?azNOSVVNVGVqNnp4d2J6cTh0dVVUM1ZGVngxeVVPTjJ0YW1NSkY2NFFiWU1C?=
 =?utf-8?B?TE5NNFRSNnJZOUxVbWg5bGpKb1B5NWRqVmR3bHhqRVFodzcvS0t2cE5KZXM0?=
 =?utf-8?B?Z20xWnlqVVU1YTNieXhtVmxmc09NMDBYQWYwN0VhcGcxUTR1enJvQzloRDU0?=
 =?utf-8?B?QlZWMjNTMlFlNFlob1pPSjZkYzN5UTZUVmRhYkROUVNic0FIS2wvMTdXL1NM?=
 =?utf-8?B?T0E3aWlXQU05V2ZKcDFzZCtjckRwL2JSYVhVWEtkQS9ESC9wVzFNeTRieUVj?=
 =?utf-8?B?TUJzajN5R3h1OUdBTXVnbzlNaFVyZFNUbGk4eTFFd2dUR2c0MUkyUC9halcv?=
 =?utf-8?B?WVgvZnd2UjAvQit3eFZLZDdsZ0dtcFliUytGS0FVM3g4M0UyRmNpU2lRZTNF?=
 =?utf-8?B?SWh1blNiVC9sMFlvNzYzVi9xUk9kSVhYVjVZK1dEYVl5aVRKZzdZbnhxamtj?=
 =?utf-8?B?SXd5TmUrRGhHczBFL05XK0NaWFRUKzNvU3dHRzFLdERzYWtpTmswc1BXcWNz?=
 =?utf-8?B?TzdaUjFqcjFwdWJtOENDKzhnMHh5OVhjbzEvU3RsWmNKdHRaL2F1Vmdhb2ZP?=
 =?utf-8?B?aGR0aEJaSTNWN21zUTNWM0s0RjhyWWFTQ25STHNuUWJEVGpvM1k5c28vYkVE?=
 =?utf-8?B?VmgxVkluOFNMMkNZRDRmaThWUE9sZnBKUnR5K0N4ZVdtYVYwdnhwTnROL2dC?=
 =?utf-8?B?TWhTQjIrR0lPYmJaMCtFQnV2MlE5RmR2ZGZKU1QrV3A2VVFQYzhFS1dSblRk?=
 =?utf-8?B?Y1h0WDBTcHhsVU9SK0RrY3dqWUlyV2g5Yk1HTkJVazMxbEFLSVNvMUpKcFFj?=
 =?utf-8?B?eVkwSmdicHZpMDVRUlBNUFp4Y21Vbmo0Tyt6YVJxR0hGZVMxVUZJMFBvSC9O?=
 =?utf-8?B?cUtZTmcrSGJCTUZLWVFkZmN6YjZpSGlHbnQ3YkVacTFzcnNvSFRNRzY5OGJV?=
 =?utf-8?B?RE9CVklaS3h5TWxXZmV4UkFrZjc5UWVOLzZLS254QmNOMTFwTlJ3RUhJSXho?=
 =?utf-8?B?WnpoS2phUHUvenhxS3pEY3BWMjNObm0xcHl4VHlvMFBCTncxeHpMNWdmUnVV?=
 =?utf-8?B?NFg0d1FqTnFaUHFNWTZyM2JkK1lxL1ZsOWsxcmVTaFptNlpHUjFVaEliMlln?=
 =?utf-8?B?aDVFNnVqUDhPdlB1RlFrcUxKYWp0L0NvUnViRXl0Wkg2ZU5BS2hkMGpEVjNl?=
 =?utf-8?B?RFVjbEVpOXAvMzdKUGtSU0NGUFkyNmJxVkw0cTlTZEN4R0RYRWJJNU1YQnp3?=
 =?utf-8?Q?YTFNxg2SuCm1JSUftb7G9btRoTQwQbu1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEMyWkVzbVVtTmtuN1RMMzV2QmpzUVFhNlg0aFRvU3dzTnpxS0JYY25JVEdW?=
 =?utf-8?B?MFNDcE05QTEwNWwxeXFOSVNTL3ExOE5GOXlvem40U0pJMHZiUTJHdVJIZHBB?=
 =?utf-8?B?SlhEN0d6V1dpdVU0bGE5Z2FZOTJFZGltWEk2Q0k5S0Jnb3NmTGVMUEJOZFE5?=
 =?utf-8?B?RUhmUHV0UHhsQUVZajkzczlYWUtvZmw5b044ZGVYSE9lME1scTdGYzRwQ3lD?=
 =?utf-8?B?ajN6UWFaOU5UQThlLzk2VExJK0t4QkpoVjMrVlJFVlhSMzRHYi81alU5dU9R?=
 =?utf-8?B?NTNmbFlpMlJtYXBpYjlRblBVT0FQT0E2ZU5HSk5NaGtZTm80NFJwYlZDR08z?=
 =?utf-8?B?R2djZThubWFWRURweWpIa21iSWl1NGxwZEZhQlM1NVhJQk42VmJvYzQ0WUtv?=
 =?utf-8?B?MGpTWWFjamJjMURZZVMxUHU5YnNoS2kvdG9kdG9LTzZ4VmgyT3Fqc2hKaEFn?=
 =?utf-8?B?TFZTejVxWEgvSkE5UXRnYmdxSExSTjRFdHdxN01VSVE4NWh6NXZEQzZ3Kzdv?=
 =?utf-8?B?SWozaDI2cklZZzFoKzVrQWd2ZjVrcTUwNHdVZmdOMzZKb3NCdVZ6Z1o3RzZE?=
 =?utf-8?B?elRwanVYdFhsQllmY2haZlY3akpwTGsxK2RvVzVGczRLd1cvcW0rNXJEemFT?=
 =?utf-8?B?amU0cEQ0Z1o4LzFrdFU1azY4YjRGSllZdTVhcHdGeWEycTQ5QTJoWWs0MVNF?=
 =?utf-8?B?WHY4NTFMYVNlTnYxZWlVUDl0OGIrQ0g3N0dOOXFIQW1IMzJYdVVXTjEvczBs?=
 =?utf-8?B?V2VVRGh6M2RzeEF0VDY2L3dPbjl4QjgvTDhOM1l6RS9pd3lyNTJpbGxjVVNx?=
 =?utf-8?B?cjlyMmV5cC9Md3VudW1wWnhRR2dMRDlZM08za3ovc0p2eS9iZnZYWEttQ2xl?=
 =?utf-8?B?SzdGY0JISEQ4RkJ4dWhWRWRtdW5wK21lQURxTlZnK25NOVR1Vm8yb3RxeW5u?=
 =?utf-8?B?R3MxMjZobXdCL1pyQytlSWc3bi9EblBrdGN3bkVxcHU5NkQ3MmRqdEZseWJM?=
 =?utf-8?B?Nk11TWpYbjVxOUF6STlETkN2QkQwMkJsNFA5WkVab2kyVjRzM0ZOV3ZWN3FO?=
 =?utf-8?B?b2Nia2pNaEw5UlRUcm50SlUzWkRrM2RqSVQ2NWZWVHNpei9WRkNDWnE2cUJl?=
 =?utf-8?B?WjEyY2xaWllIbUtMOG5jWXZpc2Q0N2daeng5aXJGd3JFb09FSnpDK2UxMERn?=
 =?utf-8?B?OVRXT1JnbENub2ZNNTk3UEhHb0UvVms5NUJRaW9TVUZiQ0lteEE0bEFoMWhv?=
 =?utf-8?B?Qk5BcUcycXcvWHozb3NOVUVjRXdzV0JmWDJJeXhZaksvMmR6Sy9PYWVKM2Rt?=
 =?utf-8?B?YWRvRUQ2OTlLU0tiNVNhUTJDUFRHOEdqT1U4K29ZMTFFekNWM25HNFZXY3h6?=
 =?utf-8?B?MURjT3Y4OWNvbVBrSWRTZGtEREhYK0lYaUdiN0NKTHVEdkJDd1RyM2JPZElw?=
 =?utf-8?B?TGhscXoveUlURXQ4ZmpreGtmdTFwRG8wM1JaUEZSYXJxTk8rU25UQUtiUHdV?=
 =?utf-8?B?bWVIdzYwSGpsQ0c2a2xiRmVQUVhCM2tLMlk2azh4L2U4M1Z2ZGFhMy9vZWo5?=
 =?utf-8?B?ME9rN0s0UTFNZ3ZkdWd3d2dQVk5hTGd1dGdCWVk2VXNLMjFGWVAvSDZrdXVm?=
 =?utf-8?B?eWJoRlFlZ0R5SS9Eek12M2lXWS9nbWtWZXlDeUlyWlFWTWxLMEFRcE1Udi83?=
 =?utf-8?B?TXJhb0JaK0tDaHFERFlqM2xoMFVBR3BYSmVya01TN1gwamNqYTlObkg5VW9V?=
 =?utf-8?B?MmoyQXZ3dysrNm1SRWVRZ2pUM0hiRG8wRVNyakRhRGk5RGZ6R0J2R3VBRHQ5?=
 =?utf-8?B?RGpPTS81UFk4aDJYUDBBUTl0L0RFZVNpQlBxa0NzUTk5bTduWVQwUzBzZXBi?=
 =?utf-8?B?L1p5RXY1QXBITlNod0FYNlZhMnRwWG1IM0JZa1ZVdGNncEFGODRVMjltMGI2?=
 =?utf-8?B?a0J4MEZsb1k4elBqcWtEL3UxYXhHQ1J5NWNkZTJ1Z0lwUFNRSldmcW9OOWtK?=
 =?utf-8?B?OWtCeld1dmg1bVc0S290am54bjVwSmtsekRCaWJQak5oUlp3VVZWRmUvbElW?=
 =?utf-8?B?a1hWVTl5b0lqYzl2RGloengwYXVLUzBsdW1oZU9UMitsTnZSSU5tMFJlZkJk?=
 =?utf-8?B?dUN1RlVnZXRTZnFtdzRyQjkxUjNEa3NnVTBDVGx5M1RaeVord1E1TnI1K2g2?=
 =?utf-8?Q?FS+bv1e3u0BaTrc0z3PkbhI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 243e0f7d-95ca-4251-8ba9-08de31e249d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 20:35:10.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntMfEawXZIUp3UUsQhBY1ByTCNUdtG3+Eu87/QmN9SzRTz66IN97lb5DZ3nYl9AK6XAWkd6nClg3KLJSEq8Mg0iA2ktTRS1pVMf4sj5bg7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
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

On Tue, Dec 02, 2025 at 10:33:28AM +0530, Nilawar, Badal wrote:
>
>On 18-11-2025 02:23, Umesh Nerlige Ramappa wrote:
>>Since different drivers can use SoC remapper, modify VSEC code to
>>access SoC remapper via a helper that would synchronize such accesses.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v2: (Lucas)
>>- retain comment
>>- s/BITS/MASK/
>>---
>>  drivers/gpu/drm/xe/regs/xe_pmt.h               |  3 ---
>>  drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h | 13 +++++++++++++
>>  drivers/gpu/drm/xe/xe_soc_remapper.c           | 18 ++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_soc_remapper.h           |  1 +
>>  drivers/gpu/drm/xe/xe_vsec.c                   |  4 ++--
>>  5 files changed, 34 insertions(+), 5 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>index 0f79c0714454..240d57993ea6 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>@@ -18,9 +18,6 @@
>>  #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>>  #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>>-#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>>-#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>>-
>>  #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>>  #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>>  #define BMG_G6_RESIDENCY_OFFSET		(0x538)
>>diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
>>new file mode 100644
>>index 000000000000..9edf234227a9
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
>>@@ -0,0 +1,13 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2025 Intel Corporation
>>+ */
>>+#ifndef _XE_SOC_REMAPPER_REGS_H_
>>+#define _XE_SOC_REMAPPER_REGS_H_
>>+
>>+#include "xe_regs.h"
>>+
>>+#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>>+#define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
>>+
>>+#endif
>>diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
>>index f5a02abd6ab1..85d37a86117a 100644
>>--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
>>+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
>>@@ -5,8 +5,26 @@
>>  #include <linux/spinlock.h>
>>+#include "regs/xe_soc_remapper_regs.h"
>>+#include "xe_mmio.h"
>>  #include "xe_soc_remapper.h"
>>+static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
>>+				       u32 mask, u32 val)
>>+{
>>+	unsigned long flags;
>>+
>>+	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
>>+	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
>>+	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
>>+}
>>+
>>+void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
>>+{
>>+	
>I think need to check index is valid or not.

Checking valid index at this level in the call chain would be 
inefficient. Note that we would need to add code to check valid indices 
for each IP. If a new platform has other IPs added, then the checks will 
increase. Also, other IPs may use a different INDEX register for config, 
so that would increase the function footprint for all callers.

I think it's best left to the IP-specific caller to do the checks for 
valid indices for that IP. If the usage of this code grows, we can 
consider refactoring in future.

>>xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_MASK,
>>+				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
>>+}

>
>In next patch  we have created wrapper for SC.  Instead of introducing 
>separate wrappers for each SoC remapper, could we maintain a single 
>function, such as:
>
>int xe_soc_remapper_set_region(struct xe_device *xe, enum 
>soc_remapper_id id, u32 index)
>{
>    switch (id) {
>        case TELEM:
>                 if (xe->info.has_soc_remapper_telem)
>                        return -ENOTSUPP;
>            // Validate index
>            reg = SG_REMAP_INDEX1;
>            // Calculate mask, val
>            break;
>
>        case SC:
>             if (xe->info.has_soc_remapper_sc)
>                return -ENOTSUPP;
>            // Validate index
>            reg = SG_REMAP_INDEX1;
>            // Calculate mask, val
>            break;
>
>        default:
>            return -EINVAL;
>    }
>
>    spin_lock_irqsave(&xe->soc_remapper.lock, flags);
>    xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
>    spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
>    return 0;
>}

Same logic as above. We should avoid conditional checks at the lowest 
layers and rather have those checks at the topmost layers of callers.

Thanks,
Umesh

>
>Thanks,
>Badal
>
>>+
>>  int xe_soc_remapper_init(struct xe_device *xe)
>>  {
>>  	spin_lock_init(&xe->soc_remapper.lock);
>>diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
>>index 3cfd44f1fd74..75431b94e66a 100644
>>--- a/drivers/gpu/drm/xe/xe_soc_remapper.h
>>+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
>>@@ -11,5 +11,6 @@
>>  #include "xe_device_types.h"
>>  int xe_soc_remapper_init(struct xe_device *xe);
>>+void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
>>  #endif
>>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>>index 8f23a27871b6..3e217fb75394 100644
>>--- a/drivers/gpu/drm/xe/xe_vsec.c
>>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>>@@ -16,6 +16,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_pm.h"
>>+#include "xe_soc_remapper.h"
>>  #include "xe_vsec.h"
>>  #include "regs/xe_pmt.h"
>>@@ -163,8 +164,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>>  		return -ENODATA;
>>  	/* set SoC re-mapper index register based on GUID memory region */
>>-	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
>>-		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
>>+	xe_soc_remapper_set_telem_region(xe, mem_region);
>>  	memcpy_fromio(data, telem_addr, count);
>>  	xe_pm_runtime_put(xe);
