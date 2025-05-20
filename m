Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554B5C3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 10:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE210E555;
	Tue, 20 May 2025 10:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="es7Pv/R/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F8C10E538
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747736111; x=1779272111;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WLYBrTPuhqYZ+ibTuj1E404wrzl+No5NYrYvj3dRWe0=;
 b=es7Pv/R/59vAugZJKu7ejGrxMy4QYQcB+BL5Pfj96DBXHp015/wA5Z24
 uXjRJ0EVNqneEzqokHRUt0KMGVbfhPtvpjZzXElH2qnkLGgXeXX2KRT/Z
 5ViYEh4fPTy0+RuP/Vi7z4ZImKRvgI4Ftuj1oBcV18T5HjSq8ZHXjXSll
 hBPuW2K+qvgCNrAKDepC+1h0jYjOWVZpNHXGLThsC98WenNrsh6iuCE3R
 gHd0B/25PUahh6igXstKOFPftmX+C3zfiJ4sxQ2wxLaRap6cQo5+L8Nu8
 V+EE1AJ8UEKovqwdWeTLjAa6iCxkM7V0G4XyLEHabDL+7yonHTluV/JFD A==;
X-CSE-ConnectionGUID: NuWWiBVvTge0o/k3cRvNFw==
X-CSE-MsgGUID: tqwLkmhjSouNk1ZNweWu9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61055864"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="61055864"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:15:11 -0700
X-CSE-ConnectionGUID: iXOd47RCQWKg+44Ceizo+w==
X-CSE-MsgGUID: C7uRe600SUC5uXxEWmEh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170536405"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:15:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 03:15:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 03:15:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 03:15:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbw5czabsHg8Oko9pfnAuYVpxJ07y5Tls4FQkOKOwE/e73ln2ohbFIB0xI/BRW8qv6a4H7FR2qKPNZMvXF+LDZlUn6kcOtoa4Y6ELNPO/bovJvxqdLYyb9oibXayOoyNY+KRtci36rnkVnnr0YUTxHH8H0herO5oSrINx5d+l7hBecKQxgNdu6eXZTwthF2manjC78SkO95obQGS/w1P8qA7XMv2ncb3MX+TndQHtQa+5Yipv7pARkkYRL9TjZ/TymZo/21yGvtkAuNDSBQTcDOrMR3OJIDQnyS/OJh1XMlam1SGlefV7CjXZlZjEAxYC7vDfDJ0D7j9HisHai84qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PygmxQEGMIXX1CsKCmVBR6YYAXHM/nuTww9KrAXY9f8=;
 b=TWxo1Sul0HtAYIuI8hrXlkqfzVMA7qfYsOHOdD23jj+hygjEw9M4/hnMt0E2A+y8WEUNnrmTU7ghDtwLUg/8jArUK91AYJmMQK1i7XSLJOL+vUF7P3pPrOPGb8BuzaS8bhrxaiOCAvRoc2k3qfwezSZoGWRL0UGuQbgtfDWc04kseqp6vVrTGXHd7PWD7fn7Vopj00XCFU5Hdrhap1mOMGgofY7bz27gGTCetQnwLA7qb5jbdJPb7rbJXMFXdpPdRDrB1fg5+NerrHmNi1HtZntTIA6p1Bf1CFqHpVK+4aMe6teN3SwqlU7SfHJPjA/DS89r6GnZUteIt/U07INK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 10:15:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 10:15:08 +0000
Message-ID: <2e935f46-a904-43f4-a597-9a503560be58@intel.com>
Date: Tue, 20 May 2025 15:45:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/32] drm/xe: Implement madvise ioctl for xe
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-24-himal.prasad.ghimiray@intel.com>
 <aCUOBPal7m8PF67H@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCUOBPal7m8PF67H@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 03af065c-24eb-432f-a873-08dd978732ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bERweHc5SjluVTkza1oyWFpzV2wxa08waFZ3bmZpZDlMZHErM1d6UGhqdUpp?=
 =?utf-8?B?ZnFlbzZFbEVWeXQ0QmU2bXFjdTg1M1kwOUVnd2ZyN1plZjBVYjVlTkpiWFBi?=
 =?utf-8?B?WFhkMG9pNHhpSG9tUUJmcDdOcjdvMzZFaXZieEcrYzJJLytEUDRTTjd0Skgz?=
 =?utf-8?B?Mm44SWtkdkpsQ3ZjZnJrbXBsQW9XRUdnbk9pTGpqc1dEclZOZXVrYTVIdmNB?=
 =?utf-8?B?SGM0TTd1NGRzQWRacHZxVmNRZm1XTXNhOWZldEE4VXAwY2dlUlY0Y1ZzYllE?=
 =?utf-8?B?YUdoMmFMVVdZL3pFdGxhcmZ4emx5NG5qcGIxOFFNUXdxN2xxOEk2RWMzTWZk?=
 =?utf-8?B?TktwUVYrYnlPSGIzbkNhbWV6dFU3c1VGeERNQWVpaWxRNWZlWHdIZi9Id3Nt?=
 =?utf-8?B?U2RMb2UwSkp0MlRzVXdDK2F1T3dhZis4RFJPVU55djBrL085SGd1VWV2K3lT?=
 =?utf-8?B?K2Y5UEkzd3dMK2FBN3JkdHlJcnVUYnFYY3dZdDJzRGdnZ2lteVNCUHBEb0lB?=
 =?utf-8?B?ZXRZc3BsYU1SVU5ZbTAzUzhoa1BOYk1WdEVWaDE4M1kzNEhpU1l3U1FMT2dn?=
 =?utf-8?B?U3pxc1RWcURFTXM0c3JoM2JNN3h4OU1iRWdyU3NSNDh6eTROTDkwMVUxZjY3?=
 =?utf-8?B?Rk9DR2xZVi9qZ3czcnROV2tROE9oaXo3SWRoUHFzUUQwN01mdEJ3Mi9qZ2ov?=
 =?utf-8?B?Q0VsMm9IWkNmaEwrZTQzZEMrcnJjQ1VvSW5Yc3VmRHRaRWF6cDM5RGRUWjZB?=
 =?utf-8?B?UDk2d3dvS2oxY0N0Ni9TRXNBYUNPcTZXUmp4dldoVWFzQXRubWU3aXZTTVp5?=
 =?utf-8?B?aE1pdVRzMVBYZThMNmFBWmsvOHRNQjRIQ3F6Y1VMUWlQczdCbVhBNi9vdmJh?=
 =?utf-8?B?TWVGdGpQOStCSWZWb0s5NkNBcVdkc2NXVDFMZ0twenlXaGRwbStFWndTZDE1?=
 =?utf-8?B?STVzcitpTTNtRXpYL0hCVUNVNjZxQ3UrNDYzaTQ5K01zNzV4aFllaUx5UWNK?=
 =?utf-8?B?NHRiejE4YzVDZGZFUXRPY1Z1MFVDSGhXMkxqT3UyS0FuQjFlOWpFWi9qNkNy?=
 =?utf-8?B?SnVwM1YxQlh1aUwrUXlFUTlVRTR0RnR4UkFLNTlEN2J5SEtsZVZiazFWc0F3?=
 =?utf-8?B?Q1p5SzdmOE5QTElWQ0dmajhOcm1KS3J3djhRc1lLekZBbWg3Yzl6UFR0WkJC?=
 =?utf-8?B?bGptQklia3hPUnBvZDFvQWcvSi9RN1NZazV4N0F2TFRFVkdtRyt0TWpxY01I?=
 =?utf-8?B?UzhzOCtPSVExN09mam9hb2xXa2l6Q0hOU1U2MmZNSnBRdFVDOFVIekVVSnU5?=
 =?utf-8?B?S09rdU5odmI2UnY1WksrV04wS2t2TEI3em84dWxrdnhPVDdNT0VOUkNyYjlN?=
 =?utf-8?B?Y1hXcnVxQ0llTlZYVU9jT2VKdHNsY2hsOE1vZmlwR0tKV2Fjc0pBUGlVdjI4?=
 =?utf-8?B?cFpoNVU0Q2t3em1XZmZic1RJeEExbHMwcDhSVFR2Szd5bjFMOThJZUhEV1Jw?=
 =?utf-8?B?OEIzcnlxK0thenQ2Y2wvNmordVVERzNuQVlnNFhqa3gwcUFRN0lrR3Y4QTdx?=
 =?utf-8?B?cVJHdjdCY1Z0UG81amhCUlBEbkhwWGVrOHVFZ080a1lDTDhVU1ZyUXViNC83?=
 =?utf-8?B?RmFXWTh2TUJieVBBUERBN0hIbnBhODlQUy8vbnVtQmVYTmJoS3c5Tk4wUUN3?=
 =?utf-8?B?NVIyMk5SblZYanpZKy9XOW11bklVbmtiNXBxK2gwc0tNcTd6ZzRWTkl4WFpl?=
 =?utf-8?B?MlQ3ODZkVlhUaVhkcnU2WnpKMzk0bGhaV2x2RktYSWo2UG1sNW1YOXR2bG1W?=
 =?utf-8?B?aVl4RGlIWVoxdmR3UW9iSkVxQW8rbGdkL21nZ3pKV1NFUGYyMVJRUDQ0SUYv?=
 =?utf-8?B?VEYyOEZJYllKRUFyMitaYTRYbWJ0aWl3YjBtbm1DampPRHU1dEJKVWxmcGdC?=
 =?utf-8?Q?kD0Ug6/gjeE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUl1aC9WOVNvQnNFTVYxR29CMnU5V3pZdEN2cG9pT1IvOEZqNE1qbCt4Nmpw?=
 =?utf-8?B?SVQvTlJ5QVhNTFVJR0g3cXJ6b05BOWdTNitBUDlyanQ3L0pXSXU5VWh3K21R?=
 =?utf-8?B?dnBUZThpMEx3MVc2em1YbjlzTnBxbnpIZEpaejA0dmJwbW1JR01LR29paGRM?=
 =?utf-8?B?MjN0QTJjamY4ZDFINGducXcycFNZZU0vMDB1Snl5UGEwVEE2K1lmVlVYYVBC?=
 =?utf-8?B?cXV1L2pyK0laeFBaNWJaTGxWRTZ0bm83M21KU3lmSlBRbmpkczR5UlJ3dzdC?=
 =?utf-8?B?b0dUb2VVREV5cStBMzhvTmxrRTNXdEVFWHZZZ0ZtUEF6VEZSazN5bDBYc2FO?=
 =?utf-8?B?K21VM1lHVE14YlE3aHNEMDZReWVRdi9EYXlab0hNejZZLytCa1hRMDRjZjB3?=
 =?utf-8?B?K1hYRFVJeDZsSmJuQVU5YmxMTUZMVWJwNExhZW9XTSt1WXkyVDROUUJKcXMy?=
 =?utf-8?B?WUYwUDg1RHhzdlZYRDNTT28wN0FXTmRDRVhxOUV3MXFmczZza0Y3T04vWHc4?=
 =?utf-8?B?bEwwL05ldEJERVJDVUNWYTVONmYyVTd5UFZKRHpDdG0xck5tWW1YTXN1YU5Z?=
 =?utf-8?B?a1NWTDlwV0tJdUFTUmFPVG04Y1duRHZPalU0SnZScS9Lc0FsS250QUNrR3pX?=
 =?utf-8?B?S2x5ZFFEMVhYQTdTRE05SjN1ZDZMZDZlZ0srMjdHZE5ENWVSSEQ2cmdFTjhZ?=
 =?utf-8?B?NEFZT0x1ZjdBY2NLR3BVVTJoQUprQXpybG91QW5NQ2s0SzlNNlN5ZU1kak1Y?=
 =?utf-8?B?U2RaSnEyUzBVK0lsOGQ1NmFsR0RNcitOS2xySnNXVGljNHF3UWxEbWs2dWNv?=
 =?utf-8?B?ZVZTSVBEYUNJTDRnWWtIMytHOG5SY2lrSXlURUxtNCtJdDdTUWxsWFFvUnFv?=
 =?utf-8?B?YUhMY1BLTWpYYUVaTGxwQXFwTkpnNXJuN09hRjBkOFhFRysxem9KWjR0Tzdy?=
 =?utf-8?B?TDF6MlJndHd4UWRLd24veVJzMmh5VFAxa29wUDNjZHREZWt0MFJUdzRvc2tZ?=
 =?utf-8?B?RzhXamZEMEhsai94MUFjNjR1TFByR096NTI4N3E3SkE5UDFUZ09tY2lNMFVN?=
 =?utf-8?B?YllsdDhKTGZKVndoTjEzdkpRTTlsdVg3dmhiQjNSNGN6T3h2ejBGOXJjeEdx?=
 =?utf-8?B?T3hPbEFUaC94UXlwbEpYSUJxVHRsTm82NEpyK05LWWdvdXNWazEzMlhFRytC?=
 =?utf-8?B?QWQ3WDY5Nzg3TElpdndQVDZqNXIweWxReThLNnplSU5mUW1KTTFvRkoyYXow?=
 =?utf-8?B?RzJBeHg0dDBIdWxyKyswVjhEOHNwT1N1N1ZIT0dUU0M0NExwZGp3RVlsMWFq?=
 =?utf-8?B?QWx2b0l1Mk80MWJGbUZjT0Ria0xPcVdESnY3dXNPV1Y1bTEra1A1aXFPZjBR?=
 =?utf-8?B?TlppdGQ0QjQvTUVMdnNoNjFVVDVuQXZkUVViOGNLQWhLY2loQUF5Z1RYejdr?=
 =?utf-8?B?cGVIaUV5TFpIcjZyOTJKWlhIMytNU2MyK0FIb2ovSm5ISHZ2RmlsU09QYmVp?=
 =?utf-8?B?QXgxdmRES0twTjJHNmxJSEJUaDhIUUhrNUtGTTlaMUZPeFpxUytPNzdDWmtX?=
 =?utf-8?B?V1RuZzNKOGFXTTdRaDBzaXlUMEptSXdIVW5sUFhqc3FYQlEweG9HWWxqNGNP?=
 =?utf-8?B?eWd0MnNWbmcxZFN1bHRQK1NQZmVSNExHeHVPMnFGRG1VRkdSc1hpS2lCcHND?=
 =?utf-8?B?UzZKdWZUT0VjU1dzM2dlbnNXRXFwNWtlay9WZktBUW15QTJvYXF3Y1JqMVU1?=
 =?utf-8?B?cEhYK0RKeVVMQ0dwQTMrV05iTFVSSnVRL1ZFY1Zya3M0V1liUU9EdmpPNjhy?=
 =?utf-8?B?eCtuczNET0w1MFJORTZkcXRyZXpMUkhjdkRONDE3cGNwNGxEZEV0UVZtOE1r?=
 =?utf-8?B?ZTRQSDh0UUdMRXVOZlc5SVhLNDgyd1E4UUd4U2wrYmM2NmZVUEJoaHQvbExy?=
 =?utf-8?B?dnpON2NzRklVTkU3OVVFaUVqSlVUbEpMNWM0elFWZHN4Njg0YmFncXgyNW0y?=
 =?utf-8?B?ZTZjSmIraTUxdFlocERXbG9tYXA2SWNvZkVqcnRHZFFFUy9IYVROSEt1ZG5j?=
 =?utf-8?B?TlRVdkZTZng4b1ZScWY3Um02NmMvMGlla1RtQjI5d0hiQlQ1cS9wbUI2dmtZ?=
 =?utf-8?B?WDJuUnZ1N2ZuMHh4cHRZUGNldzFIVFR2Q01oVVpaWDFzdmZlaWJ0eDR1YTdB?=
 =?utf-8?Q?/9r6O2g+0w3Uu0ADCQ6zYMM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03af065c-24eb-432f-a873-08dd978732ad
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 10:15:08.6072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqW4vBCrtXxOIPf1XlGv66qqFCOeN2DVMUc1M8J2Aw9V08HVOpjfq+Lfg/GoDXi9sApL2nvJHh7dXkxkgSoIYjN6MnJxm7GdLuquYheSXAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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



On 15-05-2025 03:11, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:10PM +0530, Himal Prasad Ghimiray wrote:
>> This driver-specific ioctl enables UMDs to control the memory attributes
>> for GPU VMAs within a specified input range. If the start or end
>> addresses fall within an existing VMA, the VMA is split accordingly. The
>> attributes of the VMA are modified as provided by the users. The old
>> mappings of the VMAs are invalidated, and TLB invalidation is performed
>> if necessary.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>   drivers/gpu/drm/xe/xe_device.c     |   2 +
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 309 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>>   4 files changed, 327 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index e4fec90bab55..3e83ae8b9dc1 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>   	xe_uc.o \
>>   	xe_uc_fw.o \
>>   	xe_vm.o \
>> +	xe_vm_madvise.o \
>>   	xe_vram.o \
>>   	xe_vram_freq.o \
>>   	xe_vsec.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index d8e227ddf255..3e57300014bf 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -60,6 +60,7 @@
>>   #include "xe_ttm_stolen_mgr.h"
>>   #include "xe_ttm_sys_mgr.h"
>>   #include "xe_vm.h"
>> +#include "xe_vm_madvise.h"
>>   #include "xe_vram.h"
>>   #include "xe_vsec.h"
>>   #include "xe_wait_user_fence.h"
>> @@ -196,6 +197,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>>   };
>>   
>>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> new file mode 100644
>> index 000000000000..ef50031649e0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -0,0 +1,309 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include "xe_vm_madvise.h"
>> +
>> +#include <linux/nospec.h>
>> +#include <drm/ttm/ttm_tt.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "xe_bo.h"
>> +#include "xe_gt_tlb_invalidation.h"
>> +#include "xe_pt.h"
>> +#include "xe_svm.h"
>> +
>> +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
>> +				u64 addr, u64 range)
>> +{
>> +	struct xe_vma **vmas, **__vmas;
>> +	struct drm_gpuva *gpuva;
>> +	int max_vmas = 8;
>> +
>> +	lockdep_assert_held(&vm->lock);
> 
> lockdep_assert_held_write

ok

> 
>> +
>> +	*num_vmas = 0;
>> +	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
>> +	if (!vmas)
>> +		return NULL;
>> +
>> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
>> +
>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (*num_vmas == max_vmas) {
>> +			max_vmas <<= 1;
>> +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
>> +			if (!__vmas) {
>> +				kfree(vmas);
>> +				return NULL;
>> +			}
>> +			vmas = __vmas;
>> +		}
>> +
>> +		vmas[*num_vmas] = vma;
>> +		(*num_vmas)++;
>> +	}
>> +
>> +	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
>> +
>> +	if (!*num_vmas) {
>> +		kfree(vmas);
>> +		return NULL;
>> +	}
>> +
>> +	return vmas;
>> +}
>> +
>> +static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>> +				     struct xe_vma **vmas, int num_vmas,
>> +				     struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>> +			  struct xe_vma **vmas, int num_vmas,
>> +			  struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>> +			     struct xe_vma **vmas, int num_vmas,
>> +			     struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
>> +				   struct xe_vma **vmas, int num_vmas,
>> +				   struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>> +			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
>> +
>> +static const madvise_func madvise_funcs[] = {
>> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
>> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
>> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
>> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
>> +};
>> +
>> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
>> +{
>> +	struct drm_gpusvm_notifier *notifier;
>> +	struct drm_gpuva *gpuva;
>> +	struct xe_svm_range *range;
>> +	struct xe_tile *tile;
>> +	u64 adj_start, adj_end;
>> +	u8 id;
>> +
>> +	lockdep_assert_held(&vm->lock);
> 
> lockdep_assert_held_write
> 
>> +

ok

> 
> 	/* Waiting on pending binds */
> 
>> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
>> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>> +		XE_WARN_ON(1);
>> +
>> +	down_write(&vm->svm.gpusvm.notifier_lock);
>> +
> 
> xe_svm_notifier_lock

ok

> 
>> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
>> +		struct drm_gpusvm_range *r = NULL;
>> +
>> +		adj_start = max(start, notifier->itree.start);
>> +		adj_end = min(end, notifier->itree.last + 1);
>> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
>> +			range = to_xe_range(r);
>> +			for_each_tile(tile, vm->xe, id) {
>> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
>> +					*tile_mask |= BIT(id);
>> +					range->tile_invalidated |= BIT(id);
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	up_write(&vm->svm.gpusvm.notifier_lock);
>> +
> 
> xe_svm_notifier_unlock
> 

Hmm

>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>> +			continue;
>> +
>> +		if (xe_vma_is_userptr(vma)) {
>> +			WARN_ON_ONCE(!mmu_interval_check_retry
>> +				    (&to_userptr_vma(vma)->userptr.notifier,
>> +				     to_userptr_vma(vma)->userptr.notifier_seq));
>> +
>> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>> +							     DMA_RESV_USAGE_BOOKKEEP));
>> +		}
>> +
>> +		if (xe_vma_bo(vma))
>> +			xe_bo_lock(xe_vma_bo(vma), false);
>> +
> 
> Do you need the BO's dma-resv lock here? I don't think you do. Maybe double
> check with Thomas on this one as I could be forgeting something here.

Sure

> 
>> +		for_each_tile(tile, vm->xe, id) {
>> +			if (xe_pt_zap_ptes(tile, vma))
>> +				*tile_mask |= BIT(id);
>> +		}
>> +
>> +		if (xe_vma_bo(vma))
>> +			xe_bo_unlock(xe_vma_bo(vma));
>> +	}
>> +}
>> +
>> +static void xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct xe_gt_tlb_invalidation_fence
>> +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>> +	struct xe_tile *tile;
>> +	u32 fence_id = 0;
>> +	u8 tile_mask = 0;
>> +	u8 id;
>> +
>> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
>> +	if (!tile_mask)
>> +		return;
>> +
>> +	xe_device_wmb(vm->xe);
>> +
> 
> We have the below pattern in a few places in the driver. I wonder if it
> time for a helper?

Makes sense

> 
>> +	for_each_tile(tile, vm->xe, id) {
>> +		if (tile_mask & BIT(id)) {
>> +			int err;
>> +
>> +			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
>> +							  &fence[fence_id], true);
>> +
>> +			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
>> +							   &fence[fence_id],
>> +							   start,
>> +							   end,
>> +							   vm->usm.asid);
>> +			if (WARN_ON_ONCE(err < 0))
>> +				goto wait;
>> +			++fence_id;
>> +
>> +			if (!tile->media_gt)
>> +				continue;
>> +
>> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
>> +							  &fence[fence_id], true);
>> +
>> +			err = xe_gt_tlb_invalidation_range(tile->media_gt,
>> +							   &fence[fence_id],
>> +							   start,
>> +							   end,
>> +							   vm->usm.asid);
>> +			if (WARN_ON_ONCE(err < 0))
>> +				goto wait;
>> +			++fence_id;
>> +		}
>> +	}
>> +
>> +wait:
>> +	for (id = 0; id < fence_id; ++id)
>> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>> +}
>> +
>> +static int input_ranges_same(struct drm_xe_madvise_ops *old,
>> +			     struct drm_xe_madvise_ops *new)
>> +{
>> +	return (new->start == old->start && new->range == old->range);
>> +}
>> +
>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 
> Kernel doc.

Sure

> 
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>> +	struct drm_xe_madvise_ops *advs_ops;
>> +	struct drm_xe_madvise *args = data;
>> +	struct xe_vm *vm;
>> +	struct xe_vma **vmas = NULL;
>> +	int num_vmas, err = 0;
>> +	int i, j, attr_type;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
>> +		return -EINVAL;
>> +
>> +	vm = xe_vm_lookup(xef, args->vm_id);
>> +	if (XE_IOCTL_DBG(xe, !vm))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_vm_in_fault_mode(vm))) {
> 
> Do we want to restrict this fault mode? Maybe check with Mesa if they
> see any use cases.

Ok

> 
>> +		err = -EINVAL;
>> +		goto put_vm;
>> +	}
>> +
>> +	down_write(&vm->lock);
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>> +		err = -ENOENT;
>> +		goto unlock_vm;
>> +	}
>> +
>> +	if (args->num_ops > 1) {
>> +		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
>> +
>> +		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
>> +					  GFP_KERNEL | __GFP_ACCOUNT |
>> +					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>> +		if (!advs_ops)
>> +			return args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
>> +
>> +		err = __copy_from_user(advs_ops, madvise_user,
>> +				       sizeof(struct drm_xe_madvise_ops) *
>> +				       args->num_ops);
>> +		if (XE_IOCTL_DBG(xe, err)) {
>> +			err = -EFAULT;
>> +			goto free_advs_ops;
>> +		}
>> +	} else {
>> +		advs_ops = &args->ops;
>> +	}
>> +
>> +	for (i = 0; i < args->num_ops; i++) {
>> +		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
>> +
>> +		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
>> +		if (!vmas) {
>> +			err = -ENOMEM;
>> +			goto unlock_vm;
>> +		}
>> +
>> +		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
>> +		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
>> +
>> +		kfree(vmas);
>> +		vmas = NULL;
>> +
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	for (i = 0; i < args->num_ops; i++) {
>> +		for (j = i + 1; j < args->num_ops; ++j) {
>> +			if (input_ranges_same(&advs_ops[j], &advs_ops[i]))
>> +				break;
>> +		}
> 
> The above loop doesn't look like it actually does anything.

My bad.

was intending to do

if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
                        needs_invalidation = false;
 >> +				break;
}
              if(needs_invalidation)
                  xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
				       advs_ops[i].start + advs_ops[i].range);
 >> +	}

> 
> Matt
> 
>> +		xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
>> +					       advs_ops[i].start + advs_ops[i].range);
>> +	}
>> +free_advs_ops:
>> +	if (args->num_ops > 1)
>> +		kvfree(advs_ops);
>> +unlock_vm:
>> +	up_write(&vm->lock);
>> +put_vm:
>> +	xe_vm_put(vm);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> new file mode 100644
>> index 000000000000..c5cdd058c322
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_VM_MADVISE_H_
>> +#define _XE_VM_MADVISE_H_
>> +
>> +struct drm_device;
>> +struct drm_file;
>> +
>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>> +			struct drm_file *file);
>> +
>> +#endif
>> -- 
>> 2.34.1
>>

