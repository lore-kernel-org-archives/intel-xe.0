Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7282FC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 05:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1859A10E1B1;
	Mon,  7 Apr 2025 05:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nb4TIgFa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC61310E1B1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 05:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744003757; x=1775539757;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kgVeya1vWn4QX0CDmrP3kZYzKXk7BcpWMWmvcfxOY+U=;
 b=nb4TIgFaZu2kL8wVIoPDlO6VA9HlyhnVF0vMgwXu+ZGm/5A0iUtsAmTh
 b4Weg0kvp3uAL0OVCPM3ujQgNph6HyPL4RnfVqFc//SV14w4n+FZwVVyP
 pvc8zuzb2S1/P2A7k8Vi7htSyxCpDYXsFkdaPdwBSQj9rhZYtBiGezvkc
 1EbLSRwN0JinXX8moWwFOnFFkLElbLpNX24YAprrJzeVJe5AGY42pEzcv
 S+tqe5BgE0oSwq2486pz7iNK9BSvjAcuQhvYoNqbucjYR5P6nBbQkp86D
 fb9zO0MYzMsT6nA/22RpN4in2GjrgztZX2JnP8+20wlKJAJ6wJB64sup3 Q==;
X-CSE-ConnectionGUID: OeIhz3+ZSXGA8gY3w/8+7w==
X-CSE-MsgGUID: 8o0pdhMUROmjDRkMnUc/6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56733581"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56733581"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:29:17 -0700
X-CSE-ConnectionGUID: Iho5BwjVRwe3SMIV2flqqQ==
X-CSE-MsgGUID: JeOUtnRNQQep8Vd6g3IvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="133061987"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 22:29:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 22:29:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 22:29:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 22:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6W5RHl1vjDhMc2aHDlDnkf+KIKJA3mrMGOx/s/ykySisf4sHi0XYY5HcdUFNrKupAyxMmfVTkUrpuwY38omnFuOTDWyreK/Civxzp2WzrxXPVVB50LxxHfnoZujYTgVYBJdRHS6Zydrn2i0wK5MzLCOsZ5Fql2ScHGSwxlUp3ilAS7Z1BtrQ3iAHfk9HOf6vtUUpLOg1dlaiAraY3J3D4zfXJAVvv7xlfwsKymoElNkT79SyB/HWtOZYio1VXFiHgH4u7haxktnu5QKYbiL2Lz+c+tNNcDCw9LhHLVXeKMuwqh3LFYHrFNzOfhtN1f1RljWFVMl4SG3V7OXZN3Wiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcEtzbGj+kN2NsZly0sOdA6IkIm2SiuJnWCqsg5a75E=;
 b=Or7TzVJH9MG2MM5F7+hJmhRfkJy3GyXG8HlwPQc70MhDhXNrxN3AovH/LY8SE83pFytBCFtllqS4Vbq70K+55NAjnTGYMIX3exyPJ67jRdLx17ozOhp6RFPOP1OQ4bK+PEE2pLdNviUGalUMECLshPdr7ZFXCv5pUj8Opqu2lVAn6pqAgIWyrjqBWIjlqpdOlzx0gbLLi3KGKm3BhwXbEtgDImYiABheB8phSETe0GOgK8f0JU5oN/AUdP9jfIZxhDopUON1uhQEdPl7KhYUKZL+r7Tvo0GscDZLoww9MYJRMdHJxBM4jB1brdFSgT9ZNR/IC825SVLjWhGroHj5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 05:29:14 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 05:29:14 +0000
Message-ID: <2ab2088c-4b4b-4b61-8967-c7cbaf275f1a@intel.com>
Date: Mon, 7 Apr 2025 10:59:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250403165328.2438690-1-oak.zeng@intel.com>
 <20250403165328.2438690-2-oak.zeng@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250403165328.2438690-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: dea90645-f5d5-4dd6-e93b-08dd7595223e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFMrZE5WVE5rMEsreStVTC9IUzJNbUZlNEhrUENwMGJLcGorSzh2N3RSQlVR?=
 =?utf-8?B?bFF2RUNMRnBLRXhzSUFkdXZzYTV6K1VzMWRjQXJJbXkzU0Exb1dwZG11ZVdX?=
 =?utf-8?B?c0pnY1VYU05UeVpmMGV4VzdweW4wSkhjbUZMdnJ5S1lVNEpjMGY0TG15NE0z?=
 =?utf-8?B?SUdLbE9HeWlnenlTVWwybDJWRVZpZ0ZpYkZZUXlLWXBJbmVKN0JqU3JXWE5h?=
 =?utf-8?B?SDZvRzZ4aktsWFJCbldXbUFLUDd4MkpVMm14S2ZzeWJXS3dzZEtaMlZWSnk5?=
 =?utf-8?B?WENYZHZyUDV1NlNmQUUzWmlPNytZYXdCcXREWkg5Uzcvbk1hNDNkQzNGakJQ?=
 =?utf-8?B?WW5GSjc1aTdQYWxLUUF1SFdHejB2cFdOb1FPZ1E0ZEMxU213N1hvaG80U3l6?=
 =?utf-8?B?UWszL3o4TnRTdnBTTE9PT0toUENWOTJpMXdpUHNnZkZrSU9WUlFKaC9kMC9G?=
 =?utf-8?B?eDBVQ2VtcFd2dm9jZFhMbUdsM05hOFlLbkJYbFFiRk9RK0tQSHI0UGJWQ29p?=
 =?utf-8?B?TkxIaEJmeHdSZ0NrcjF6cGNyekVNTUsvKy9qQWUyd3RpNGd6Q3BYbXVZQjIw?=
 =?utf-8?B?eDM1dU1qcU0xRWdVcCt2bVRVdHRLVnA1eGZheDVvT3NkMnh6RUpOa3pkRlBJ?=
 =?utf-8?B?T0Y4cUIvLy9yNXhRRUR6cHFQM3h0WVdyRTRBWDVLZTRqbFAwL0JWbUk5KzJQ?=
 =?utf-8?B?aWVPOXV1SnVkWlRoTWoxWkRSV0JMNkRHSlMwL05jakJ2OStzWnR0aE1UNkVM?=
 =?utf-8?B?cVNLbmxXOFBjVndGOWRSVW4rTHd6RFNQQVljQjdVa3YvNDFQL1N3aC9uZnA5?=
 =?utf-8?B?dVBMQmlmZmc3Vk9NaU11RFZFSVJHWHRDQWQwaFJlWmFNZ2h5L1g2bnA2L1pG?=
 =?utf-8?B?L1Z5VXpQT2NsU2FESU1aUnoxak1aSzVBMXIwSEVacGtCbW1RdThWMVcyMDVj?=
 =?utf-8?B?SUlnaU1jSmZiV1dNcExKdVBYOFdGQk4vcS93WmQ1QmRwRjh2Z2tpa1pYajc0?=
 =?utf-8?B?QXZLNmtzc3E3bFB1OGxjalZtbmNtZ3hNczBoc1RiOVExcElTMy90YnR3ZHRw?=
 =?utf-8?B?VWlYTnNLVVlPaHI2cmlSZ2hudjkrWml2WWlDbXpRUDc0cWVhOUNaME9rZGp3?=
 =?utf-8?B?SzAxOUtlUTdQcmZqNTYwMUVLT2k5ZjFKRHRRY0dmVTBCN2RTOEZ5ZlRzcXlo?=
 =?utf-8?B?SGUrTktoZ1M4YjNna2NBOHdlMWkvKzNPZUZKWitVaDZwSXdhekkzZGwwQ2pY?=
 =?utf-8?B?ay81SkZKZUIzcDRrUlVZZ0lZVWVWSlBYRHZmUElpREFrR096d2RDbi84c3di?=
 =?utf-8?B?T1YyWXJxclpJTmdSZWtwUTVmQVZaa1ZSNHVZbUJXQUNFMkExUGkwSVJIZ0Uz?=
 =?utf-8?B?ZG53WVFSUHh6Rk91cjc3S0V5NDZlT3lmdzRtbks2Zys1dzRIcVp3am9VaU9R?=
 =?utf-8?B?VS94d3NmRkJxd1FubUY5eVVoOWphajFXNnVRZnZ2bStBMVV5azB1YU10Nkhh?=
 =?utf-8?B?MWdzVVJRUTErYjZ1L09qb2svOGFBaTVVRXNralM2UkgxaW8zQkZrM1Bzd05O?=
 =?utf-8?B?OC9MUXhiUGpzeWcwL0lqSjV0SGUxOVdoZGEwUC9hcGxteVR1UnNLemtnWmVt?=
 =?utf-8?B?cUNrVEJuVVRsT0xMam5pMS85NDZMMGZ3Z2xET3FCRVl6anV2MXRHR0w3UEx4?=
 =?utf-8?B?VWlmOUtveFhGMzl6M2dwOFRTcDJxWlNXd1ZKdXR1QjQyRFJTd2hqVnBaNEVQ?=
 =?utf-8?B?Mm92Qjk3bnAvR2NPQWo0aTRQYTdlNlVrTkVqaThXbzBBV3M2K3R0MlV0MmtC?=
 =?utf-8?B?Q25YblhtRHkwQWNERmdNRTgyRWUzRjlhdVQ0WDlJb3hyZDB2cHVuNlZCcGhN?=
 =?utf-8?B?dHpsY1YxbHpkNVYrRjdmMHVoVHVqU3FBVzhhZ3ptM3AvUDF0NCtScHJGZkw0?=
 =?utf-8?Q?jnhkT63Lrec=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdDRXdjQXB0UFgxZUYxZU9ZN2V1TTRmY3ArZm1jTGpraUtRSktuRGZHYTBX?=
 =?utf-8?B?ZnZTQzFWcVlianJnYlFjdmlvZ3d6ZHVaczBkbmZzLzZEQ0pHSGJ5dk9MeE9x?=
 =?utf-8?B?Q3VTbENxQmd0aDhLWmhmU1F4WERKNG51SzZCNFNrYm9ObzNiSzdhVW44UElT?=
 =?utf-8?B?SlZkS212R0pXS3V6M3VlNFNkcDNjUDJnS2NIdTRucFZ2b2hHTkFHdURFUHhC?=
 =?utf-8?B?U21yK09RdUQrL1VVcnlRSkswaVo5eEhRQ3JrQ0haM2F4MDdpQ0lWVm1jdUhs?=
 =?utf-8?B?TGQ2Uy9mell6dGRSWUZ1b2MvR0haa0hiblpydU8ycVdFZTJjSzJrY2Y5QVZX?=
 =?utf-8?B?YXRVWGh0Y254TVFjSlE4ckExdmRlZlNIZTM2QTM5VlJVNm8xNzBFc3dHd3dD?=
 =?utf-8?B?M1l3a3pXeE5SNGZCaSswKzN1Z1d0ZnR1TzZNbFA4R1ZFT0JHVGoxUWpnNi9Y?=
 =?utf-8?B?dFNJN2JUQm9sZkhzZzFMM1N4c0dpbDNlL2ErYkZjT1MydHdyUWI4Uzd3MFhm?=
 =?utf-8?B?cjA3RjNCYjZSVnZIckw2SVdRQmNjUlpYdVlnY0UrTHc1TFNXR3l2WDQ2L1dM?=
 =?utf-8?B?STFyYzg1bUN4NUlBV3FFQjU4Y2o0Z0wwdFRzRjZGWkttbDQ2MFUvZG5SaEFX?=
 =?utf-8?B?Tnd5T0c0V1Y3ejYrRm9FdkJyUit3UkZzelkrbzNjMEhmWE5aQWhwcXRxYTQ2?=
 =?utf-8?B?YkwrS2xid3p3RC9XMjhNc2QwbXI1WlFCU1phNndjeUVUeURTQ3EvUHJVZk5B?=
 =?utf-8?B?RjUrNGttRlVBSSthakljQTlrck95bTVHWGJKZDRlM291ajRpM3ozakZReEpp?=
 =?utf-8?B?K2E1V25TeGl3UzZGVWpMM3d4OHdWUWhUM1FCNlE2ZlplUWlPdnp6R01RdlZZ?=
 =?utf-8?B?OWhvRHdlY2JxRFp4eFp6RXFOR29RL3dUOXFOMGdEV3Q2cGh5K1d6RENQN21n?=
 =?utf-8?B?TWFDQlhBcFR2RHBCdWo0WU1ybmJReUxaY05ySlJrVFo4bWVOZTlEMGsrdlF3?=
 =?utf-8?B?aWZpN0hCL3l0Sjhmb3ZmaTI3eHpvWVRSQmp0cVJPYVMvd1JZRDhTNTIwVU1F?=
 =?utf-8?B?ZzBjaVlTekFGcG96OUQ3S29vTzRCL040YnRWUlhNUkJrWFY1dmtsZ3hra1BH?=
 =?utf-8?B?NWtISHV0RGlDZTJpbVJGd01wZFJFbzBUcGorMThIdWJzNHJZY29sRzVVYksw?=
 =?utf-8?B?ZWlpL3QrUlBtSUs2ZEdvS3Z6T2ZLNGlCRlRKRzJkZmpBMm51VWZRZUx4dUZR?=
 =?utf-8?B?OHNnZUVJQ2VwVkl1aUQ3dk4xeTZmTHFBUE1DdWdEeWo3eDZqdTR3SXdwVUVN?=
 =?utf-8?B?cFpPbDNBQWpKOS9BQkZlbnViQjF5ZlZlRll0SnBqRkxNeWM1dkY0bU9wTm5L?=
 =?utf-8?B?cHpLdDBEanVVNjV6YXo5eVg5WEdXVmN3YlJBZWNtNzlQbDNSTkEwK3RyalRt?=
 =?utf-8?B?SnV1bUpXbnNyQW9CRVFRclBBSEtBemV6VU5qNitCUFBPRXNMTDB1TFZqWkZV?=
 =?utf-8?B?WEV0K1F5dTZkVTNNb3dFamFCd0VMci9ldDZIUzdBbFBGU2EyeG5sd0t2TUxC?=
 =?utf-8?B?ZHA0RUN0SFdRNXQ1WkRNbXBuc0psUDJJREpqZHozQTI0OVNTR0J6ZEh3aVFO?=
 =?utf-8?B?WWZaV3laZkxUTWdZQ2FtdWRraUZpTEJqRmdtMHJhWHZNYnUzYUxNbjZWdjBC?=
 =?utf-8?B?NHJDWm5aNnJNclhtNThpM3dYVktGQUZ0RkFtMFNuQ2FLUDIxc0dGVnhSTjhE?=
 =?utf-8?B?ckhWV0NPb3paQ3ZLV2xZcU5ZK1VabzEra0dycXUyM1ZKUXlwek9wNnd2SkFo?=
 =?utf-8?B?ODAveTJmbkJZYUF0Q3ZBNnBtclhhZXNrM04xbytDRkxkRy83ZmlMSnpvY1pT?=
 =?utf-8?B?c0lNUFFJL2ZOWFl2ekZxVEhBZFNYaXFUOHFMVktTblJGWlBCVm13L05BVStz?=
 =?utf-8?B?UG1nOW5pWjhtemNnZDNULzdYQjZ0RU90dWg4ampsbW11WnVoV0JQWkhibExu?=
 =?utf-8?B?RmNreTVvQXdRYWlvNnJIcDFLNjNZN2I0czJuSE1GSFVmZS9XTnlPdjQxWk5N?=
 =?utf-8?B?bHVoUzlhSzA3VTZjQVg4QzJTQ2FFcDJzdkxMNmM1VG5JUDBOUzR5cDlFZ0xC?=
 =?utf-8?B?TWhXVmJ1NDlYcWczN29UaFE0ZmE0T3pQaTh1L3ZmU0k0Nm9pWFdlRUJnUGRE?=
 =?utf-8?Q?ud8spPJJRvViNoYUSStmE/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dea90645-f5d5-4dd6-e93b-08dd7595223e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 05:29:14.4784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IckgaAYbJcq6oRjMTbe0e2XxoeM+kIMkT/10saYvQ1smI3Z0r4bOBvIkbXUOmY3xodlebZWkJ1uw5vlJgLWazfkxNeeBtmD1gqK8l0BzLQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
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



On 03-04-2025 22:23, Oak Zeng wrote:
> On some platform, scratch page is needed for out of bound prefetch
> to work. Introduce a bit in device descriptor to specify whether
> this device needs scratch page to work.
> 
> v2: introduce a needs_scratch bit in device info (Thomas, Jonathan)
> v3: drop NEEDS_SCRATCH macro (Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>   drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c54adebfe518..e52221389710 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -336,6 +336,8 @@ struct xe_device {
>   		u8 has_usm:1;
>   		/** @info.is_dgfx: is discrete device */
>   		u8 is_dgfx:1;
> +		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> +		u8 needs_scratch:1;
>   		/**
>   		 * @info.probe_display: Probe display hardware.  If set to
>   		 * false, the driver will behave as if there is no display
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 772b6c81672c..ae06c4c13fd7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -68,6 +68,7 @@ struct xe_device_desc {
>   	u8 has_llc:1;
>   	u8 has_pxp:1;
>   	u8 has_sriov:1;
> +	u8 needs_scratch:1;
>   	u8 skip_guc_pc:1;
>   	u8 skip_mtcfg:1;
>   	u8 skip_pcode:1;
> @@ -335,6 +336,7 @@ static const struct xe_device_desc lnl_desc = {
>   	.dma_mask_size = 46,
>   	.has_display = true,
>   	.has_pxp = true,
> +	.needs_scratch = true,
>   };
>   
>   static const struct xe_device_desc bmg_desc = {
> @@ -344,6 +346,7 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_display = true,
>   	.has_fan_control = true,
>   	.has_heci_cscfi = 1,
> +	.needs_scratch = true,
>   };
>   
>   static const struct xe_device_desc ptl_desc = {
> @@ -352,6 +355,7 @@ static const struct xe_device_desc ptl_desc = {
>   	.has_display = true,
>   	.has_sriov = true,
>   	.require_force_probe = true,
> +	.needs_scratch = true,
>   };
>   
>   #undef PLATFORM
> @@ -592,6 +596,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.skip_guc_pc = desc->skip_guc_pc;
>   	xe->info.skip_mtcfg = desc->skip_mtcfg;
>   	xe->info.skip_pcode = desc->skip_pcode;
> +	xe->info.needs_scratch = desc->needs_scratch;

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>   				 xe_modparam.probe_display &&

