Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71854CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 19:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0647410E23F;
	Thu,  9 Oct 2025 19:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/jDCYgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CE010E23C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760039385; x=1791575385;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W3KKNwIfvE5NqxkCUJRgwjIema/Mg0Yw0uWHf/ghaHc=;
 b=F/jDCYgwIvzpEw4TUpjWPxeruYoxUqnjy51uPuO5jvnl3S98eQxDpVk5
 S6QYB2xwYiRxjrLxwZfwT0Ndtt32omgouq3k6XZX8b6lj7G7kiNyTxwgR
 dRXHIaCZUQb3LyO9rBntsoawwwPS5pw3eY/JWUPsN9S4guRMecHxzFu+4
 hvVDvNgqhL3WYb5fytim6RAzIVGTPw4hAMNy7+QciwKC0tn2iUQWsWAWR
 sF++BdDuxzzxaxXd5JKeDNmH9zP6w2r603LNRBhGER/aiqusZB0kOIxcI
 AH5kwKAb8NnKVEyQHuDUv/hQ+PlWriqb4vgMNeH2xHqjsrUEmGM0L6yx5 Q==;
X-CSE-ConnectionGUID: 7HFJFsc2Sae7rFGSt7weGA==
X-CSE-MsgGUID: cjZROc0JQImPHUqFgmc7JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66115160"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="66115160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:49:44 -0700
X-CSE-ConnectionGUID: y7oo7JI/TjunszYvWSByrA==
X-CSE-MsgGUID: gX0yA0qXRmiv25g/nF7zOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185180518"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:49:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:49:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 12:49:43 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IziD20hpT6D8Z8+UlhRb6uNyDXopHCAPayV84F1kJ4zKVIROucxxjvJE3kShWZsC4VGq/ec1Zbokj3w0wo51dZsEOE0wdqxwc57lBauFzzQxBSzaWHK9YYi/9ASyxZO7tXCKVO4IrCayLjXlUXFwJkoWHqsUlj/Wt9h1qvEkcFlGJIj/MxAPcq7OF1PMr1Eu+SmhrgaQ+mCTmWFCuZZxcSgxc/i9aiUrSI7vNCd5WTENVb2QDP+u7LpHgQ6RoqGqptyRN2L0WTa46TuIWnPldchIOYcUO8OL9A+S/fIyNq4b1/OUpcsmws7tTuIKctfYeCkf5y/LxNeqDvVL7Phs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXx0iRGXqQEusR1qCH8apZKznoIS8AC4yTGfKkMzcVs=;
 b=x4enBOQz2Sc2XSULX3dGgKWCU2OknLVkYAmxa2M2gqPnRYW8ed09xdCmpC6Kj1pMMjSkiNT5wlqhS8zvlvvdBan+s5S1VQ4OVpszBLA7T/OYH4jd4tXFrd3252Ho2tsT3pyvV1MemK8ZQJ8Bypo9U1UEv9ar01evUnrPTIJH/Tia5eLKfv6rlUEwrWbWIlqTRtb/3qIZVVBR52VWYpnr8mcZI2QSuc3VO3XApiA1+e46lEizw5yPwEeRH5bBSabi6PqNcP97rfoBBX2RBq1YMz9Y9yEmJHw/sxtgIPym9N/lZXfDztFGlhMkDA3nKQF/B3L/aTMIGHcJhLhrVrJ82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8590.namprd11.prod.outlook.com (2603:10b6:610:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 19:49:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 19:49:41 +0000
Date: Thu, 9 Oct 2025 15:49:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aOgRzyimIIPmLdW0@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
 <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com>
 <aOgAXul_Az3JLC0V@intel.com>
 <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: d33ee976-725b-44de-bff9-08de076cfc82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXRIMjBQZWozdGRLb0RHRlg1K0N5UmdWbEx3WWYwNm5SRUsvQnFnZU41N2ph?=
 =?utf-8?B?SkREV1RpNnN1L2RqUUlVaC9TU3N2QXpmdnJNRnB3ckgxd2lqaDBpNGlxd2ht?=
 =?utf-8?B?SDYrYWJhQWNNNUJ4Zk5sRVlwdmpWL012Ti9KVVphaDBnMWE1QkxkTnN4dnpQ?=
 =?utf-8?B?VFZwRkNMRWJwWVBES2Z4K29QeWhZaFhEc0RUT1pzSnQ3ajVYYUZaTVc2bnZj?=
 =?utf-8?B?amVldzlFZzk2SHppeWJDazNkbDQ5cU9QdmxvKzZLdU9uRXUzVFJuLzNIbHE2?=
 =?utf-8?B?NS95ZVJaYzhHY0Z5T0tiWWxoU0lGQnlKaDIyZ0pDOXRxMzd6NG9qcmc0am1M?=
 =?utf-8?B?RExHOGU3Q1d3Y0RBRzh6TkxIdGpjbnBCaFRrMDVzUWNXenRFZ05NM0l0ZVdq?=
 =?utf-8?B?L0NWd0xjbEZtVEw2NFd5eGpWY05uOThTNy9RcW9NNjB6VmluM3E3ZTVVSWJF?=
 =?utf-8?B?TWZpMHlnc2I5OGEyckh2ejZpWWVndzU1dHlIZ3ZPNlR1SWtqTFNNSW83d2R2?=
 =?utf-8?B?OXFqSENycFJTd2dxekF6bEZubWdSZmpoUFRIdlFEL3M4dzZXUWZaTjhUWDZQ?=
 =?utf-8?B?QnpZOWcxTXlqNFdCQUV0MDRtYStwVklkQThodWRJb1plMCtPd3Jta1hmVStT?=
 =?utf-8?B?dzZrY0RhSWVwM0pvVE9xV1lKUWlhWnl6d0tCTEZ5SWlGakJ2TjBlL1Z3WUd2?=
 =?utf-8?B?WVh3eENGNnk2OXZicVFyZlR6ck5sYUUwQTV2US9GUzU1NVluN0ZBV2k2TkRV?=
 =?utf-8?B?MlBrTXZ0MDk2ajNsdzZ0Q1RDU0RMU2RjVFExVzk5ZnZaUVU3QS94bGU4ZVox?=
 =?utf-8?B?RUI4Sm1BY2N4Z21DRVB0RVBpNEZBV3hUVS9wTzRBTnNOMk5tVERsaklpaDJZ?=
 =?utf-8?B?Z2xIU0RvalJpSG1wNzJ2N0g4UzlMMGI5VWdHWEZRMWlhZktJVFlRN0NsZC9h?=
 =?utf-8?B?cjZVZUNWVVZ6dU9FWm9maGhVOHdvQWxyMWVXZXlZendia1QrV3phUHkrcU55?=
 =?utf-8?B?czhVdUFWbzRJemdzZ1FjbGZtSTBCSkM3Y2hkVW9hZnNUdzBZclA2UjJhYTdF?=
 =?utf-8?B?aytJcmYreDM4eGY0R2V1SEIyRnJ6Z3ZPaXZhbHljZThpUGRHblBuRFJuUkpJ?=
 =?utf-8?B?aFEzWGZTTVRMN1QrcHRCUHBieDQySWZrZktFbmJjbDJXRmpKdGp0eWJaOE5p?=
 =?utf-8?B?bDlTSEJlYzZVTGM1YXFQaGFsZ0dyR2FhMXp4TmRFa3BrNEVrOUorcDZhNlB0?=
 =?utf-8?B?eGVoRWtpdlR6Z0FkdHFBbS9zM0U3MWV6N1JmSXY2amlpdHo3ZDNycjE0ZHJz?=
 =?utf-8?B?VllOS1NGR3hWV3lvcHZQOWVZTVNYM1VkemtNOWlpK3kwRUpKQlBiYjRPVmJt?=
 =?utf-8?B?L0FMSTl2UjNVV0FObUxWb3Q0OTdoTXNTMnp4ZUF4UFlvUDNIb05zdTMzRGlI?=
 =?utf-8?B?Tkw1bDUrMUJneVg2ZUhCemR6YWFSOHFTMTN1VXRNSm1vT2hEZ3p4TnIvOVdV?=
 =?utf-8?B?N3Z0dlIrQ1FBZU5IZWNxbnJnbU5kSytnTE5TSkVQNzdkU2hLRzRBcXNvV3A1?=
 =?utf-8?B?SXc3TXJzNkJhdk9aUkdmaWllWUkzWHJaQyt5U1ZDbnd0cDhmNGY4WlpZakIx?=
 =?utf-8?B?Q25scjk5QVNadVFRVnNUTFl5clhUTmRQMnhwMk9EZEltQkJKWVFWa1JPWDR6?=
 =?utf-8?B?Z0hQQXR4dDFtVzY5b2dhTEwzYXh5dmFEVHMrMjlpWWt1TFFtUWNVM1J2ZlFH?=
 =?utf-8?B?c1k5eGdZL3E3cDZEdWUySXMrTnFGV3pzcWRMUXpCMzJyZDVjaGYzZkhlSXJt?=
 =?utf-8?B?czdRdjg5QmtDMlJyLytXVGYyQkczTVZWMm0xV3VSRjkySCtiQ1o3aW5uU0tV?=
 =?utf-8?B?Y1F6aWRSWUZ4WXd0aTBIdzVBZk45Vllpc201RUVRcEE2dnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVubHBlWjNYeEszaWJCeVhvVHlHSTcwTmFOa2ZmSndOWVhLSlBOOVBMTVVX?=
 =?utf-8?B?dnBRcXlBODhJaDYyV012SmVja3V5dzRTTEZEU3dyTis0MHlpcktiY0NGWGFz?=
 =?utf-8?B?cHgraGFKbWZCSDVLZG0xUmlTWmdWdjFoNEFYWFFWcnBkYUFzUGZ4QnB1dGpU?=
 =?utf-8?B?WG1meVRWMjY0SC91cndnV3VTQ0lpK1RUSzNiVTlmc0pmZUM2a1d4U1lreDFV?=
 =?utf-8?B?UWVOR0ZlSXlPdWF4TWV2Vzd4ZVBkQU5Ua1RQTTNlSWZodkQ3TWFCcUJDRTV2?=
 =?utf-8?B?U2FjTWJMb21KVy9KVnJFd0Z6eVFsUm9LM290SnpQdlo1Uk4zRnRpN1pNRUNV?=
 =?utf-8?B?bWwyUUt4ZUZWdjNpaHZHK0FJbmZyOHZTU0Rva3RoM0g4cDNkK1lidVNBczln?=
 =?utf-8?B?bS9yWWZxcWVDaCtSa0Y5L2dlbGV1OHZqdEdRNFZGWGNJRVBCQUZWOEtmZWVz?=
 =?utf-8?B?NE0rdldtWWtJVlp6VDFuT2xsV2lwMXBNaThyNEJmaSszNWdLU3NRUmdPVGZp?=
 =?utf-8?B?eU5aQWY4Yy9ZVEEyQXJTQXdFZ3dCN0xkeURYb2ZybXNuUmlBdzZyblBLaTM3?=
 =?utf-8?B?azNpMXdKVW5nRS9nU0VVSXFDN2hyYWNTdmt6RkErTWdHejl0WUtTRmJNWFNi?=
 =?utf-8?B?K0trQ2xVUW1kODlxQWhpQnpvaWMxRHowZDN2NlIyRU8rMTMwVlI4S0R2YW9u?=
 =?utf-8?B?RVpWYVU3ei9BU3NhQ2gySVY4YUhkcjB5bHc0bDdXbEs0WDUzZkhvOHU3c0FB?=
 =?utf-8?B?RkgxdTRib05xVzRkVDd6U3FnWUM2MmRpVXZ6eENrcmZEQmFZOERMeWpOZWdY?=
 =?utf-8?B?SEs5eVovSGZUSXdlRDBqZ05oV0hQby9kY3V3RWdxcjZ2WDZIL1NsL00rMVox?=
 =?utf-8?B?bGRzVGxpNjhnV1I5NGtJSDBwWE45U2NYUjc5bVdTcTM2UnkxaG5qMDNvU2Mr?=
 =?utf-8?B?UDhRdmVIUDZ4WTFSMmJLdzhkdi9uT0s2dnIyTU00Nm51c3ZzZ01qV0w5RTB6?=
 =?utf-8?B?dXNvb2RFV0p5K1BuNC9LbFZPWFR2bmV2dUhTWWJ0TG9TRzdlVTJHNFo4ZG15?=
 =?utf-8?B?aVhHS0ZWdzVwdVVGOVYvNDdUS0hwT3J1R2R4bmw3dkRHaGo1UXVBRWg0SlY5?=
 =?utf-8?B?eDVzZHlBYTA0SUwvU25EZEdLdTJOZXZGYnRZL0xOMU4vcTJyL3dscHZyMDdJ?=
 =?utf-8?B?ZHU4UjBSYlJVMjVKS2t5S2NVaXpMVndFaVladjNmalcvMkNhWnYyS1h3R2Vq?=
 =?utf-8?B?akUzRndxeWduckVnYVhxSktIRGVUemtSbGtsUlZFMVdBbUNzUGZqVDJBdjFw?=
 =?utf-8?B?WkhlYXZNbXFRTGl3b0d1WUtoYUliTGZpN2FBS2g2UzZqR1RUb1hXRXNCNkJn?=
 =?utf-8?B?SzB3QlhYcGhRRk10M1FsWFdjazJ5RkNXWUdTWnJJS0JvSTRJKzJDUTluMEwy?=
 =?utf-8?B?Y1A4dmw1RXpxV3FjUXhyanZVOUUvSUh4ZENNNjlwNTlWSWJMWG0rUVNBWDUw?=
 =?utf-8?B?NHVtOXZWVVY2bndLMDcrUVRyWnJVejJsNTE1TzB0cHNYUTdEaUlCMDBuNGho?=
 =?utf-8?B?ZVAwb0hWMnZtZlAvcHdHVStUZUkwNEc3aVkrTWpJMm1XR0lrTUxWVTNOUzRR?=
 =?utf-8?B?M2V1MUNRQzRpalExZS9HNXBocU1JT3BWMXFlaEpDQ3BVZDAzakNrZU5XNm5V?=
 =?utf-8?B?dzVCMDFnZHZqWFEwRmtVUEttd0xEMkxFREpwcDZUZjVWcGhHSHVFV1RYbjB1?=
 =?utf-8?B?SVN2Um1nVkE3RXFZZWNUQzFSbzFFVHIrbEFEUUlsV0Z4SEJCZUxDbVRxUmtB?=
 =?utf-8?B?eGdkZzl5dU5lN2V2WVhDcDNvWnhYZ3hzWVBraVpwOFJXWU1nYkxTZmNDbURF?=
 =?utf-8?B?SWlFSDM2VTFOcmZ1K04vd0xNdFFDcHl6N3FvMFB4UGNoR3NtNHdZUW1kcm9w?=
 =?utf-8?B?QWFKRVJvUkROSXNwWHZld3BKcjdmK0VMY0ZJdDlDdDV5NEpZYnF1dDByODh6?=
 =?utf-8?B?VDVubDlkU1U4eTlhZVpRak14MlJwRTdJRXpLb3RCb3ZJR0NUMW5ZREwzU0R0?=
 =?utf-8?B?dFdNUnRXYytBc2xaZXNxVU43UHhmNWdVb1VkQzZ2M25pYXgzYlZDbk9FeHJ5?=
 =?utf-8?B?eVBKUkNENDVKTTVTYjRHN2tkVDg2MzhrRlBKcGdLb0pHRDU2SGpjczN5QURX?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d33ee976-725b-44de-bff9-08de076cfc82
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 19:49:40.9587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsWBitFCPgOmUILbpQEF9P5F/HOtTJbhHDgA2v7zEcXz1zzCKSg/dqlh/T4uViOinslkmrui+HvwoYyk4eLDrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8590
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

On Thu, Oct 09, 2025 at 11:49:16AM -0700, Matthew Brost wrote:
> On Thu, Oct 09, 2025 at 02:35:10PM -0400, Rodrigo Vivi wrote:
> > On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
> > > On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
> > > > On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
> > > > > On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> > > > > > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > > save/restore while this sequence is being programmed, partial writes may
> > > > > > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > > > instruction to write the sequence atomically.
> > > > > > 
> > > > > > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > > > 8 dwords instead of 5 dwords.
> > > > > > 
> > > > > > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > > > chunks.
> > > > > > 
> > > > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > 
> > > > > > ---
> > > > > > V4 -> V5:
> > > > > > - Fixed review comments. (Matt B)
> > > > > > 
> > > > > > V3 -> V4:
> > > > > > - Fixed review comments. (Wajdeczko)
> > > > > > - Fix issues reported by patchworks.
> > > > > > 
> > > > > > V2 -> V3:
> > > > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > > > 
> > > > > > V1 -> V2:
> > > > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > > >   (Auld, Matthew)
> > > > > > - Fix issues reported by patchworks.
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
> > > > > >  1 file changed, 72 insertions(+), 21 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > index c39c3b423d05..b629072956ee 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > @@ -5,7 +5,9 @@
> > > > > >  
> > > > > >  #include "xe_migrate.h"
> > > > > >  
> > > > > > +#include <asm/fpu/api.h>
> > > > > >  #include <linux/bitfield.h>
> > > > > > +#include <linux/cpufeature.h>
> > > > > >  #include <linux/sizes.h>
> > > > > >  
> > > > > >  #include <drm/drm_managed.h>
> > > > > > @@ -33,6 +35,7 @@
> > > > > >  #include "xe_res_cursor.h"
> > > > > >  #include "xe_sa.h"
> > > > > >  #include "xe_sched_job.h"
> > > > > > +#include "xe_sriov_vf_ccs.h"
> > > > > >  #include "xe_sync.h"
> > > > > >  #include "xe_trace_bo.h"
> > > > > >  #include "xe_validation.h"
> > > > > > @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
> > > > > >  	}
> > > > > >  }
> > > > > >  
> > > > > > -#define EMIT_COPY_CCS_DW 5
> > > > > > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > > > > > +{
> > > > > > +#ifdef CONFIG_X86
> > > > > > +	kernel_fpu_begin();
> > > > > > +	if (size == SZ_128) {
> > > > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > > +	} else if (size == SZ_256) {
> > > > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > > +	}
> > > > > > +	kernel_fpu_end();
> > > > > > +#endif
> > > > > 
> > > > > Everything in this patch LGTM but I think we maintainer input to ensure
> > > > > we are breaking some rules about inlined asm code in a driver (no idea
> > > > > if this exists) or if a better place would be somewhere common. Can you
> > > > > ping Lucas, Thomas, or Rodrigo and ask them about this?
> > > > 
> > > > Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
> > > > 
> > > > But the rule does exist:
> > > > https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
> > > > 
> > > > "don’t use inline assembly gratuitously when C can do the job. You can and should
> > > > poke hardware from C when possible"
> > > > 
> > > > In this case here, please explain why exactly memcpy with smp_wmb barriers and
> > > > or WRITE_ONCE code combined couldn't solve it.
> > > > 
> > > > Also, please explain how exactly vmovdqu guarantees the atomicity promised by
> > > > the commit message. On a quick search here my take is that for this 128 or 256
> > > > bits, atomicity is not guaranteed.
> > > 
> > > I don't think cache atomicity is what we're after here—rather, it's vCPU
> > > halting atomicity.
> > > 
> > > Consider the following case:
> > > b++ = XY_CTRL_SURF_COPY_BLT;
> > > b++ = addr;
> > > 
> > > If the vCPU is halted during the instruction that stores
> > > XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
> > > batch buffer (BB) that is being programmed as part of the VF save. This
> > > will clearly cause the BB to hang due to a page fault on the copy
> > > command.
> > 
> > okay, perhaps this is what is getting me confused most
> > what I don't understand in the flow is: why GuC is already
> > executing it or going to execute it while you are going to a halt when
> > writing the command to the buffer?  and not writing to the buffer first
> > and then sending it to the exec queue?
> > 
> 
> It how this feature was architected, will send over SaS link of the list.

It probably deserves some comments around the code on how that works and
why we are doing that.

> 
> > > 
> > > If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
> > > then either the GPU entire instruction is written or none of it is. I
> > > believe vCPU halting guarantees that a CPU instruction is either fully
> > > executed or not at all—regardless of how many micro-operations (uOPs) it
> > > decodes into. If this guarantee does not hold, then the entire
> > > architecture of CCS save/restore on PTL is fundamentally broken which is
> > > always possible.
> > 
> > Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
> > of the vmovdqu nor vmovups. only before, between, or after them.
> > 
> > But is this uncached and/or coherent? isn't there really any possibility that
> > the command finished, but GuC mid-flight executing things aren't still
> > seeing different cachelines?
> > 
> 
> The GuC won't start executing until vCPU unpause on the save flow.
> Restore flow is bit more tricky as vCPU are live when this happens but
> we can W/A that race in software I think. That part is not in this
> series.
> 
> > > 
> > > > 
> > > > So, imho this patch is introducing a unmaintainable, complex, and fragile code
> > > > that is not even doing what it is claiming to do. But I will be glad if someone
> > > > can challenge this and prove me wrong.
> > > > 
> > > 
> > > Let me know if the above makes any sense.
> > 
> > Okay. But how to handle cases where AVX might not be available? really not needed?
> > 
> 
> This iGPU feature for PTL so shouldn't be an issue as PTL has AVX
> instructions.

Some comments around the code about that to be clear that we don't try to
reuse this later in any discrete.
and perhaps an assert ! dgfx?!

> 
> Matt
> 
> > > 
> > > Matt
> > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > > 
> > > > > Matt 
> > > > > 
> > > > > > +}
> > > > > > +
> > > > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > > > +{
> > > > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > > > +
> > > > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > > > +
> > > > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> > > > > > +		memcpy_vmovdqu(dst, src, instr_size);
> > > > > > +	else
> > > > > > +		memcpy(dst, src, size);
> > > > > > +}
> > > > > > +
> > > > > > +#define EMIT_COPY_CCS_DW 8
> > > > > >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > > >  			  u64 dst_ofs, bool dst_is_indirect,
> > > > > >  			  u64 src_ofs, bool src_is_indirect,
> > > > > >  			  u32 size)
> > > > > >  {
> > > > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > > >  	u32 *cs = bb->cs + bb->len;
> > > > > >  	u32 num_ccs_blks;
> > > > > >  	u32 num_pages;
> > > > > >  	u32 ccs_copy_size;
> > > > > >  	u32 mocs;
> > > > > > +	u32 i = 0;
> > > > > >  
> > > > > >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > > >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > > > @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > > >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > > >  	}
> > > > > >  
> > > > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > > -		ccs_copy_size;
> > > > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > > +		  ccs_copy_size;
> > > > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > > >  
> > > > > > +	/*
> > > > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > > > +	 * write the sequence atomically.
> > > > > > +	 */
> > > > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > > > +	cs += EMIT_COPY_CCS_DW;
> > > > > >  	bb->len = cs - bb->cs;
> > > > > >  }
> > > > > >  
> > > > > > @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > > >  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > > >  }
> > > > > >  
> > > > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > > > +/*
> > > > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > > > + * save/restore while this sequence is being issued, partial writes may
> > > > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > > > + * emit_atomic() to write the sequence atomically.
> > > > > > + */
> > > > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > > >  {
> > > > > >  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > > > +
> > > > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > > > +	dw[j++] = lower_32_bits(addr);
> > > > > > +	dw[j++] = upper_32_bits(addr);
> > > > > > +	dw[j++] = MI_NOOP;
> > > > > >  
> > > > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > > > -	dw[i++] = lower_32_bits(addr);
> > > > > > -	dw[i++] = upper_32_bits(addr);
> > > > > > -	dw[i++] = MI_NOOP;
> > > > > > -	dw[i++] = MI_NOOP;
> > > > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > > >  
> > > > > > -	return i;
> > > > > > +	return i + j;
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > >  	/* Calculate Batch buffer size */
> > > > > >  	batch_size = 0;
> > > > > >  	while (size) {
> > > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > > >  		u64 ccs_ofs, ccs_size;
> > > > > >  		u32 ccs_pt;
> > > > > >  
> > > > > > @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > >  	 * sizes here again before copy command is emitted.
> > > > > >  	 */
> > > > > >  	while (size) {
> > > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > > >  		u32 flush_flags = 0;
> > > > > >  		u64 ccs_ofs, ccs_size;
> > > > > >  		u32 ccs_pt;
> > > > > > @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > >  
> > > > > >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > > >  
> > > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > > >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > > >  						  src_L0_ofs, dst_is_pltt,
> > > > > >  						  src_L0, ccs_ofs, true);
> > > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > > >  
> > > > > >  		size -= src_L0;
> > > > > >  	}
> > > > > > -- 
> > > > > > 2.51.0
> > > > > > 
