Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88938EE6B59
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 20:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3663510E8FE;
	Fri,  6 Feb 2026 20:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9DX+z9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEE710E8FE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770409758; x=1801945758;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gSdkQvZefgcLMcWV9cAReHcQvbkoA3AjFgrTnUPMZd8=;
 b=O9DX+z9f30hwm+gXvRC4qPgzVjk+pthnA0lfIcHCwQ3GkhPRguiSiCcN
 8+XLSex7llI0q+7deTPgg2qAeYbUsJIQ7RIR80T99z4FwnMmLIc7Tcqhm
 lNN1hmEi7gyxMwbafY1jxnntrg9mKerI60ApJC+CS3DuR5qmN0dhBb6Ut
 PQ+SCQQnGWEMGtf7jgRHP9xKQUO/DxW30nkYC9mCn4McjKQzcczeY20Wa
 63p9cx1raXEjJVwmWs+C9+GR1Kwlzp2hU4jVt+s+SlPkFCGN4lmIqpeTy
 /BtmAEfeKgywo6nm09f5YUACVH8tbhfYabIhECEAzt0uKP4m3XVI5fy/t g==;
X-CSE-ConnectionGUID: ZduMrjEMSbG+cqQIL4G9SQ==
X-CSE-MsgGUID: KDnf0j+iTrSBmf+wb1Qtbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="97080748"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="97080748"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 12:29:17 -0800
X-CSE-ConnectionGUID: uZh0cVVqSK+MbJs132VNQQ==
X-CSE-MsgGUID: d7XDg2sNSxiHipUS1uO5wA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 12:29:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 12:29:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 12:29:16 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 12:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx8NhGNJyiApIiusCuB9Gs2WaUB41N6pLfCZ3F9XJzhSC4YfYgANHYsKqTwwwAXbCgLDcXQZdD34UmrzxWVEnEIiKJCYVjGxbzu38ixiaIxfTOjMBs6RKwexFeEkbrKAn4+j8o7J0M/JJqIOKhEIY8+Qvk9s7Cz1eJIttQ/vr9ObZSvcLW1GZeKliRfqM0PJkoEs1h9iIdPjLGaBZtcSAfx3C1i+bbT6dP4AhnF/xOsUU0adH6lrv9GnU25NqBKrve4w8FVkGo6f9lM8c+9nfiXVEvf5Jkir9UUbDnEzO3Nk0v3nNMsWBu09H3EuebeYYltgnD9ciHRxHJ56Soae0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=952hOi9cYwthdpIETnESCQvwNyMOUhZ7HFMJEyqXXFw=;
 b=shkZu2THaKgLXCJQYJlXHhBGEu/fZgXdZKC9UnmywWxpVb/QGydNNXo3+6xe0LvMOLuhlvhkMxp8fNpFGacUcPqLJrXRDDtynVHO6AdSMcmHglIKuesnfm+HxEcSbUmINUbddbELbE/L+Df7yqghiN21YYaUtPtwdpNLoufpvzu4qziYXxw6KV5E+MOZhTtAZu2Fh8amBqgswFBzuAGrXHmGyfow/VeeS7xYOH3wht2gUTA/TwZu9JT5iCb1+pD+4me2TB1SPBIH5xzYxkJhY6hQuJdK+At5Muq0guq0wfUbPWO3XPwQLYI+guiqveVozDjWzgqpqRFqmoP/t7WEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA0PR11MB4688.namprd11.prod.outlook.com (2603:10b6:806:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 20:29:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 20:29:14 +0000
Message-ID: <94bc7f8c-bb28-4f25-929d-a42253c65702@intel.com>
Date: Fri, 6 Feb 2026 15:29:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-3-matthew.brost@intel.com>
 <5a99db81-ebbe-4dfe-a528-1063c4bcf1d1@intel.com>
 <aWAC4EyhqZZT5tbe@lstrano-desk.jf.intel.com>
 <ae2f2a0f-8ecf-406a-816b-5d62f50e1377@intel.com>
 <aYWBQpKv7oLZ60Mi@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aYWBQpKv7oLZ60Mi@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA0PR11MB4688:EE_
X-MS-Office365-Filtering-Correlation-Id: c00fbc04-3aad-4281-aae4-08de65be64bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0JCb1BzVEs2R0MrbHVwSUIrT1p5dG9HbVVOLzZmeU9iN0FxRHVhdjVOY2Fh?=
 =?utf-8?B?ZDRJOVRQZCt0SU80dUpRTG1qd3RKaHpxeDkxSzhIZHA4UFU0QTdDM09keWcr?=
 =?utf-8?B?dGYyRG1CM1dQS3YxbDZ0eCtUZmk5bHE4MXVNUlVTN1hub2Z1Lzl5anVCc3ZN?=
 =?utf-8?B?dHdtaFRqLzYwaUxWOHZRdXR4amY1Q1YyZmNrY1ZJbkhEVXB5SHBxU2t4YVFV?=
 =?utf-8?B?aTdoa0ZqeDRrMU5PbmlPNjkwMWV6U2JvOVpuQm45SVovVEw3Y05wa2N3MWE1?=
 =?utf-8?B?NGpWRVhDQnVLTFFuRjMyK0Nidm96Nm9reGJ2b2pFRy92cEtjd1VEOXg0TUtX?=
 =?utf-8?B?RHJXL25lU0lIQ2Uvb2dLYUVUL1RyamZuRi9uRloyMitOV2FJOXQzRjB2V05Z?=
 =?utf-8?B?TDNPakpDOWNnR1graVF3dkF6KzB2ZC9mcVdYd0puWHJsalBUeXZEeUtPb1NH?=
 =?utf-8?B?b0l3aElITDJXNTJTbldFTWg0a01Zbnlydmh5VnV0V0hBYnUvOTBXbkZ6eDkr?=
 =?utf-8?B?UGo2enVqSU5rTkRFNXBtMWhkSDRSZFJBMUwvVW1hVUxpRUQ0dENUWXBTS29T?=
 =?utf-8?B?bnpyVWJ4TUF5ZHVRSXlRcGMvbFcrR21XZ3RlQjYrSTBuWDlRaVpZT0xxQ0Uv?=
 =?utf-8?B?eXVOSUJhV3g1a2ZNWWRrOTNZZU9Wa3Nrc1cwQXVFbnJqVGRHcCt4NG9tcTh4?=
 =?utf-8?B?YVIzMzJPZmdGZFpEeTF4OTk1LzVvMnZvdFlaZ2l2T0o0OHAwQmtGbW5WRzNn?=
 =?utf-8?B?TmM0aTN2OGk1dVhiUTRJNWRWaEYyZ3hiNVUwSmsvdkFMc21hSitPR1VoZ0tr?=
 =?utf-8?B?YS9PZXBwR1ZSNjhkTWtBRElENFhSZys3UlVBUWRzT2lkbTk4dzFwK2NLVFZ3?=
 =?utf-8?B?NmlGZHBFWUlQYVdMaE4wOFpqdDhCZnlYa3BnZkFxd1FHQTdKUGJRT0d1YVBD?=
 =?utf-8?B?VktoWWhjdlJsWEhRTzl5UFFwMHFiMXcrQmYyTHBHSVB0L0xpRlMrSWNNeVVV?=
 =?utf-8?B?MWZqSmZOY0V5RXZjSmdwcXNMUFRBa3ErNldaWEVWVXpLdVEySzFHSjRUa0lk?=
 =?utf-8?B?ZlM3c3hXUFFXTDdqRTVzeW8rTU9Zd21jTUU2akxtR0tLdFlPV2owZDFyc2Vn?=
 =?utf-8?B?cW1sSFFmemlaVTgvYlMwa2c2aHVJSkdpZEl1WHJ2RmEwVGFEN3ZFYlBTY2s3?=
 =?utf-8?B?bWxEeDhTbTZvZjN1YjVxY2pEWUN0SEFsWVQzTDRqcERJMDBDeWI2V1JKQ2pZ?=
 =?utf-8?B?Tm1wYzRuKzA0Q1hHY0dycmkwdzRXUVlKV3dhTEorVXFFL2txUis2ZGV2TDNw?=
 =?utf-8?B?aWxsQmNhMHlSUDhQK2tpaXl2TGh2RExHNzVjTlBWSTIrUHIwcWM3TXU4bUMv?=
 =?utf-8?B?S2QzUTNHS1VvSnZRbm4ycmZOUFJNOFZ5WGNCQVB5TEd6OVBxckIzOVBLREc1?=
 =?utf-8?B?ZWRSZ0NJaE9mbmpvSVV5eEc2MkYwOUhjd0lLQU5Pa3NZbDN5WWx2bGFQS3pa?=
 =?utf-8?B?a2JDV0QvNnZYWG84b2YzYkFaVHhrVCs4a1haV1c1bkdhVHdQUWtQRlgwclky?=
 =?utf-8?B?MnNSVDhKSnF3ZmxLTkNGbDdnRE9ZM1FYaXlLYWRMWEZqajlOSk5GKzh6WDk4?=
 =?utf-8?B?TEFqcGNCalBUTmxESFd0cGNXakJvMTBXck1TRG9JRmdTdFJMdzlWcmpDU1JI?=
 =?utf-8?B?b0xtMXNoSkpnREJOS0hDK1EweEJkYVVianRDNDRzd0cza1B1Vy9uTWY2Unoy?=
 =?utf-8?B?MGMxd3RWQUhRSHNvSHJOZlcwYkNVTUhHYkE1eHVrY0JoQlBiQnNyNFBVSWhG?=
 =?utf-8?B?ekFicW5rN0ZBZGNpOEQvNkRQWXFuN3dnZ3IxWVUyOGZUZUZhc1BCR2lxSm13?=
 =?utf-8?B?bjR5ODNRQWxCQXRDcjF0dTQ4anZHcDcrQWZaakRVVnNIeG0rdGgvYWxzUDYz?=
 =?utf-8?B?bng4OXQxUEdBTTRaaUE3UTB3cFlNZm43SkVHV1JWTUhyRExGK0h4SDZiTGtB?=
 =?utf-8?B?azBJVDV0RCtLSC9zNmhRZTlRZ21SaGVMQ1lPSVFwbTYrZW94NUh4VlE0ejlF?=
 =?utf-8?B?Nm9HTnRuQnBxV1pyV1pQcjR0ZktsSC9LUmtCMm8wam9BUlVtUWlqSHp4RHB4?=
 =?utf-8?Q?9RVc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWRGZkJISTJlQVJqRFVIN0Z0OVJtNGNJUUNWcUhBVUcvNEw4U0dvS1d0aU44?=
 =?utf-8?B?VzgwTURmY3Vad3IrWlpwZ0JVT2x2cVlsZldpVlRHbmhQYW1oNll6R3hvaTA4?=
 =?utf-8?B?ak84SzArRi9tVnBSQlhsamhVN0pVN3VnSGpRUEw4MWExYWxiUlo5bkFlVVFK?=
 =?utf-8?B?SSt2NkVCZVk0VERqbmtZSmVtaG85SWsyUWh6YURwcW5LRUZMME13cFVvYjJp?=
 =?utf-8?B?aG1YUzBTcHlQdUV2MDVvZWREaDNMOSswc0JjUU5EdTlqVlB3VE13Ym0yWG80?=
 =?utf-8?B?WkwrSzlpUVRYK0JZdWNmMUx1WHNuSHFYOXR4UGZIb1orMzV0d3d4QnM0NC9R?=
 =?utf-8?B?OVl5R1dnc3dVTlk1c0NIN2VsVFVFeXdxVG5YTHJZbEl3bnZBTm4zeTEzc2Ey?=
 =?utf-8?B?NW9XcjZsMU56RDE5Ty9xVCszUHIxbEtid0JIVExkSnNUWi92L2ozVkZuejg1?=
 =?utf-8?B?b25Oa3N5Ym1URE5IVmQ5bFVOLzRGc0RmRnV3VDNZcmxlelczWHZLWnJvWHhi?=
 =?utf-8?B?QW9vS0FWL0tjNVNWamtxSVJzWkVQUjQ4QzQ4eU5XWXRmRTZTWHdDR2VFQkRj?=
 =?utf-8?B?VW1ObmkzNlZjQkMvS2VGTTRibHZDbjBPamRmdm12OHJXdWw1Y2dqcFViYWlr?=
 =?utf-8?B?eVd1Y3NPZG56S1hjcHFhNWxVMHRkenNzbGoxdkU1RDFVQ2JvbVJpcm9GbEYy?=
 =?utf-8?B?cUJ3VlFVNnpHVEgyQVlSc1YyK1EvSHoyNXVhNkJMelZSQlMxM1lvRHF4RCt3?=
 =?utf-8?B?YytxNkFRb1NOcHdpenZSZ3ZNZ1JMYVUxUXd1SXJidlB3YzFUbndkN0VPeW55?=
 =?utf-8?B?a2hoeXJFSEhhSVo2eTNTSnBmYy9DSGtaYUFBaGJZeENJVEl0amhwQ0h4b1d5?=
 =?utf-8?B?TGx4UnRSVVdyQ2JuUG03VHNnc2dXaDkyZUtiMXBZdkd4M2h3MDdXS0pITnd3?=
 =?utf-8?B?bzN0eGxXTCtJMGQxalJQbjE0SmF0VWRYMmhQQlpYQ3RsQWNaaUZRK0ZKdHll?=
 =?utf-8?B?eGM4QXZncWdLTTFmSi9YSFNEUGtJb05RVVNFajdESDdBQnFBbGh4T1dtUkti?=
 =?utf-8?B?NEh1RmVmc2JvZlFpY25pVnNPUzN1WkJwU0dLSWc5K2xNblNxMFdtTzJ1bC9x?=
 =?utf-8?B?M0lrZHNwMi9IWk0rVGJmMlVpcjlGVnRKa0Z6dmd3Z2tJQkNEbDd4YTJFYWJp?=
 =?utf-8?B?cS8xNlhkUDVzNng2QnVLcU9NUW9qQmpuZDJCeVR0ZFBwVDZLZ2VVUzJ2eWRH?=
 =?utf-8?B?bzI4SFBDd3A4ejBPMHF2d1BUTEZkWjROeGlxT25wcXR6aXc1WXl4cGlOYlhR?=
 =?utf-8?B?eS91bFpKZUQ2WHUreW00V0lYSnFaUHUrc0lRd0dlc0F0Smg2dmI4eTdaTlU4?=
 =?utf-8?B?aVZnL0pBL05QUC85cmYvRDhqRjNVQjdtSGwwQW43L3NnTlNjRjFldXh6TTRL?=
 =?utf-8?B?VEQyVmgxbDhucjBrQXFubGliWmRUSlc0UlFGdFJQeXFGYVVuVlNHdmV6NHhN?=
 =?utf-8?B?MUE5clBBeVBodDRnTm96azQvZ2cyejVVUVdWM1YwMHBSM2NEVTNwd1RhWVgy?=
 =?utf-8?B?aG42ZTFURDEzWFJBcERMN3prZ2xsdW5IMWllbW54dVBJbDBSTHYxZUpwVHg3?=
 =?utf-8?B?bmlGRy8xNVVrc2pKam9KSUI1WTVlWTFyNGRSNW4ybmdFc1hoWjZWVytUWlpU?=
 =?utf-8?B?blZKZGV4bGM4UjhFblJ4SlY1bU1XUnR1N1lpR1A2MnJtN0Q3aDMxL2l0Vk40?=
 =?utf-8?B?Z0tZTmxTQVJjMEpSNzRnYW1hQXhFdm1nVEUrekZ5dlVRMTdvUlBDajFQekYx?=
 =?utf-8?B?MnJPZVZBTkZCckk4ZTlmcmNNTlhPeFRYZ0NqaStqM3kwdWhiZzlCdTFGbllW?=
 =?utf-8?B?amdia2JFajMvY0dRdks0ckFuQjFJMGtGN0hvR2MzaXVmWTYzWUJNQ0l0dHdL?=
 =?utf-8?B?c1hVQlpDV09PM1Q2dHFZZnlKaDRST3dJU0pSbWZGNmcrdmp0L3dGek5NZnZn?=
 =?utf-8?B?ZERJbTFtLzZ1bEZaYytTblhianFBQ3FuWHlCaG9ndkhWV1gyb2MwQzZ3VGp5?=
 =?utf-8?B?MG9LQnRhMHFwT1hTSXVZVEY0WTFBaExsUFBja0ozbkdkSHFQV05oeUt5MGE5?=
 =?utf-8?B?ZUQzWktHdFBSN2gyMjNYZ1o3bnMzdlI5by8yQytxREJkS3liZnF1SmdMNEpE?=
 =?utf-8?B?MklwQ0pIbytlMEJWaisvRVJHOElxalhPL21qeGp1STdQMnNuY2pGdEsrcVRO?=
 =?utf-8?B?YjljS2l1c3FkM2piYlgyNnN6WGZoWHprQjg1UnFyTkJnZGRadG1LODE5WlI3?=
 =?utf-8?B?cDhJbjVKOWVnYWVMWVFMeE0reFZPNkJRSzQrcHJaUVM4eHZQTEdDLzUrTHAv?=
 =?utf-8?Q?ERLJMSvuencboqcw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c00fbc04-3aad-4281-aae4-08de65be64bb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:29:14.3942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDiVG4dtKKo/kmsI060qcJu/nSiE3E23OsF/WSkuo904jbQagKZFS9leUU4iHOz7UcofmZ66kjWAGPAtL28Iiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4688
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



On 2026-02-06 12:50 a.m., Matthew Brost wrote:
> On Wed, Jan 14, 2026 at 05:35:38PM -0500, Dong, Zhanjun wrote:
> 
> This is actually larger problem.
> 
>>
>>
>> On 2026-01-08 2:17 p.m., Matthew Brost wrote:
>>> On Thu, Jan 08, 2026 at 02:00:15PM -0500, Dong, Zhanjun wrote:
>>>>
>>>>
>>>> On 2025-12-18 4:44 p.m., Matthew Brost wrote:
>>>>> In GuC submit fini, forcefully tear down any exec queues by disabling
>>>>> CTs, stopping the scheduler (which cleans up lost G2H), killing all
>>>>> remaining queues, and resuming scheduling to allow any remaining cleanup
>>>>> actions to complete and signal any remaining fences.
>>>>>
>>>>> v2:
>>>>>     - Fix VF failure (CI)
>>>>>
>>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>> ---
>>>>>
>>>>> This fix will not apply outright to any stable kernel as it depeneds on
>>>>> functions which have added in the KMD since the original commit. Likely
>>>>> will have to manually send out patches to stable for kernel which we'd
>>>>> like to fix.
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc_submit.c | 27 ++++++++++++++++++++-------
>>>>>     1 file changed, 20 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index 071cbfec2401..58ec94439df1 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -289,6 +289,8 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>>>>     		 EXEC_QUEUE_STATE_BANNED));
>>>>>     }
>>>>> +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
>>>>> +
>>>>>     static void guc_submit_fini(struct drm_device *drm, void *arg)
>>>>>     {
>>>>>     	struct xe_guc *guc = arg;
>>>>> @@ -296,6 +298,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>>>>>     	struct xe_gt *gt = guc_to_gt(guc);
>>>>>     	int ret;
>>>>> +	/* Forcefully kill any remaining exec queues */
>>>>> +	xe_guc_ct_stop(&guc->ct);
>>>>> +	__xe_guc_submit_reset_prepare(guc);
>>>>> +	xe_guc_submit_stop(guc);
>>>>> +	xe_guc_submit_pause_abort(guc);
>>>>> +
>>>>
>>>> Tested this series over
>>>> 265d13795b45 drm-tip: 2026y-01m-06d-08h-06m-43s UTC integration manifest
>>>> ===(CI_DRM_17772) and (xe-4335) with (IGT_8685)===
>>>>
>>>> and run test xe_fault_injection --r probe-fail-guc-xe_guc_mmio_send_recv
>>>> --debug
>>>> got few problems:
>>>> 1. Assertion ct->g2h_outstanding == 0 triggered
>>>> call stack shows:
>>>> [  708.967261]  xe_guc_ct_disable+0x17/0x80 [xe]
>>>> [  709.043382]  xe_guc_sanitize+0x31/0x50 [xe]
>>>> [  709.119557]  xe_uc_load_hw+0x187/0x2a0 [xe]
>>>
>>> Above is a different problem. Just delete xe_guc_sanitize from
>>> xe_uc_load_hw, that call is nonsense left over from the i915 port.
>>>
>>> xe_guc_sanitize / xe_uc_sanitize everywhere probably needs a look if
>>> those calls make any bit of sense.
>> Agree
>>>
>>>>
>>>> 2. Page fault
>>>> [  740.822070] BUG: unable to handle page fault for address:
>>>> ffffc9000c80fc50
>>>> [  740.828896] #PF: supervisor write access in kernel mode
>>>> [  740.834063] #PF: error_code(0x0002) - not-present page
>>>> [  740.839145] PGD 100000067 P4D 100000067 PUD 100ad4067 PMD 0
>>>> [  740.844738] Oops: Oops: 0002 [#2] SMP NOPTI
>>>> [  740.848880] CPU: 2 UID: 0 PID: 169 Comm: kworker/2:2 Tainted: G S M UD W
>>>> 6.19.0-rc4+xu4335+ #3 PREEMPT(voluntary)
>>>> [  740.859964] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, [U]=USER,
>>>> [D]=DIE, [W]=WARN
>>>> [  740.867952] Hardware name: Intel Corporation Meteor Lake Client
>>>> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317
>>>> 08/28/2024
>>>> [  740.881081] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
>>>> [  740.887820] RIP: 0010:xe_ggtt_set_pte+0x53/0x350 [xe]
>>>> [  740.892900] Code: e2 48 89 45 d0 31 c0 f7 c6 ff 0f 00 00 75 56 49 3b 5c
>>>> 24 08 0f 83 a8 01 00 00 49 8b 84 24 b0 00 00 00 48 c1 eb 0c 48 8d 04 d8 <4c>
>>>> 89 38 48 8b 45 d0 65 48 2b 05 e6 41 d1 e2 0f 85 e1 02 00 00 48
>>>> [  740.911428] RSP: 0018:ffffc9000074b9f0 EFLAGS: 00010202
>>>> [  740.916599] RAX: ffffc9000c80fc50 RBX: 0000000000001f8a RCX:
>>>> 0000000000000000
>>>> [  740.923653] RDX: 0000000000000000 RSI: 0000000001f8a000 RDI:
>>>> ffff888132562628
>>>> [  740.930705] RBP: ffffc9000074ba88 R08: 0000000000000000 R09:
>>>> ffff888168188000
>>>> [  740.937758] R10: 0000000000000000 R11: 0000000000000000 R12:
>>>> ffff888132562628
>>>> [  740.944807] R13: 0000000000000000 R14: ffff88816818a768 R15:
>>>> 0000000000000000
>>>> [  740.951861] FS:  0000000000000000(0000) GS:ffff8884ebbe0000(0000)
>>>> knlGS:0000000000000000
>>>> [  740.959850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [  740.965534] CR2: ffffc9000c80fc50 CR3: 0000000132923003 CR4:
>>>> 0000000000f72ef0
>>>> [  740.972585] PKRU: 55555554
>>>> [  740.975268] Call Trace:
>>>> [  740.977694]  <TASK>
>>>> [  740.979778]  ? __mutex_lock+0xae/0x1080
>>>> [  740.983583]  xe_ggtt_clear+0xa1/0x260 [xe]
>>>> [  740.987716]  ? lock_release+0x1df/0x280
>>>> [  740.991519]  ? pm_runtime_get_conditional+0x66/0x150
>>>> [  740.996436]  ggtt_node_remove+0xb2/0x140 [xe]
>>>> [  741.000829]  xe_ggtt_node_remove+0x40/0xa0 [xe]
>>>> [  741.005393]  xe_ggtt_remove_bo+0x87/0x250 [xe]
>>>> [  741.009874]  ? _raw_write_unlock+0x22/0x50
>>>> [  741.013927]  ? drm_vma_offset_remove+0x65/0x80
>>>> [  741.018324]  xe_ttm_bo_destroy+0xd4/0x310 [xe]
>>>> [  741.022800]  ttm_bo_release+0x70/0x330 [ttm]
>>>> [  741.027032]  ? vunmap+0x4a/0x70
>>>> [  741.030147]  ? vunmap+0x4a/0x70
>>>> [  741.033260]  ttm_bo_fini+0x3c/0x70 [ttm]
>>>> [  741.037145]  xe_gem_object_free+0x1a/0x30 [xe]
>>>> [  741.041618]  drm_gem_object_free+0x1d/0x40
>>>> [  741.045671]  xe_bo_put+0x136/0x1c0 [xe]
>>>> [  741.049548]  xe_lrc_destroy+0x47/0x60 [xe]
>>>> [  741.053691]  xe_exec_queue_fini+0x85/0xd0 [xe]
>>>> [  741.058172]  __guc_exec_queue_destroy_async+0x7c/0x190 [xe]
>>>> [  741.063770]  process_one_work+0x22e/0x6b0
>>>> [  741.067741]  worker_thread+0x1a0/0x370
>>>> [  741.071456]  ? __pfx_worker_thread+0x10/0x10
>>>> [  741.075683]  kthread+0x11f/0x250
>>>> [  741.078882]  ? __pfx_kthread+0x10/0x10
>>>> [  741.082594]  ret_from_fork+0x337/0x390
>>>> [  741.086315]  ? __pfx_kthread+0x10/0x10
>>>> [  741.090027]  ret_from_fork_asm+0x1a/0x30
>>>> [  741.093909]  </TASK>
>>>>
>>>> Sounds like call xe_guc_submit_pause_abort here might cause trouble. That's
>>>> why I call it in guc_fini_hw, which make the test passed.
>>>>
>>>
>>> Thanks for the info. guc_fini_hw isn't definitely isn't the right place
>>> though as that is registered before xe_guc_submit_init is called.
>>>
>>> If I'm understanding the trace correctly - guc_submit_fini should be on
>>> the devm exit handler.
>>>
>>> Want to give my two suggestions a try? Also feel free run with these
>>> patch / take over if you bandwidth. It is unlikely I'll have bandwidth
>>> to pick these back up for at least a week or so.
>>
>> With more debug print on begin(^)/end($) of
>> guc_fini_hw/mmio_fini/guc_submit_fini:
>> [  183.000171] ZD guc_fini_hw ^
>> [  183.000187] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT1:
>> GuC CT communication channel disabled
>> [  183.003374] ZD guc_fini_hw $
>> [  183.116889] ZD __xe_exec_queue_fini q:ffff88816a92d000 flag:0
>> lrc.bo:ffff88816baa8800
>> [  183.129725] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT0:
>> GuC CT communication channel stopped
>> [  183.130487] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT0:
>> GuC CT communication channel disabled
>> [  183.131138] ZD guc_fini_hw ^
>> [  183.131146] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT0:
>> GuC CT communication channel disabled
>> [  183.134163] ZD guc_fini_hw $
>> [  183.235099] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [xe]]
>> [ENCODER:505:DDI A/PHY A] PPS 0 turning VDD off
>> [  183.238289] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [xe]]
>> [ENCODER:505:DDI A/PHY A] PPS 0 PP_STATUS: 0x00000000 PP_CONTROL: 0x00000060
>> [  183.238415] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]]
>> disabling AUX_A
>> [  183.238621] xe 0000:00:02.0: [drm:wait_panel_power_cycle [xe]]
>> [ENCODER:505:DDI A/PHY A] PPS 0 wait for panel power cycle (500 ms
>> remaining)
>> [  183.747985] xe 0000:00:02.0: [drm:wait_panel_status [xe]]
>> [ENCODER:505:DDI A/PHY A] PPS 0 mask: 0xb800000f value: 0x00000000
>> PP_STATUS: 0x00000000 PP_CONTROL: 0x00000060
>> [  183.758418] xe 0000:00:02.0: [drm:wait_panel_status [xe]] Wait complete
>> [  183.774541] ZD mmio_fini ^
>> [  183.774551] ZD mmio_fini $
>> [  183.777314] xe 0000:00:02.0: [drm:drm_pagemap_shrinker_fini
>> [drm_gpusvm_helper]] Destroying dpagemap shrinker.
>> [  183.789419] ZD guc_submit_fini ^
>> [  183.792669] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT1:
>> GuC CT communication channel stopped
>> [  183.793409] ZD xe_guc_submit_pause_abort q:ffff88811d5fd000 flag:10
>> [  183.799955] ZD __xe_exec_queue_fini q:ffff88811d5fd600 flag:10
>> lrc.bo:ffff888168fa6800
>> [  183.807866] ZD guc_submit_fini start drain_workqueue
>> [  183.807920] ZD __xe_exec_queue_fini q:ffff88811d5fd000 flag:90
>> lrc.bo:ffff888168fa5000
>> [  183.820685] ZD xe_ggtt_remove_bo bo:ffff888168fa6800
>> ggtt:ffff88812c695628
>> [  183.827536] ZD xe_ggtt_remove_bo bo:ffff888168fa5000
>> ggtt:ffff88812c695628
>> [  183.834390] ZD xe_ggtt_clear ggtt:ffff88812c695628 start:33239040
>> gsm:ffffc9000c800000 gsm.:ffffc9000c80fd98
>> [  183.844343] BUG: unable to handle page fault for address:
>> ffffc9000c80fd98
>> [  183.851153] #PF: supervisor write access in kernel mode
>> [  183.856324] #PF: error_code(0x0002) - not-present page
>> [  183.861406] PGD 100000067 P4D 100000067 PUD 100ac9067 PMD 0
>> [  183.867001] Oops: Oops: 0002 [#1] SMP NOPTI
>> [  183.871143] CPU: 7 UID: 0 PID: 298 Comm: kworker/7:2 Tainted: G S M U  W
>> 6.19.0-rc5+xu4373+ #13 PREEMPT(voluntary)
>> [  183.882305] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, [U]=USER,
>> [W]=WARN
>> [  183.889524] Hardware name: Intel Corporation Meteor Lake Client
>> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317
>> 08/28/2024
>> [  183.902650] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
>> [  183.909399] RIP: 0010:xe_ggtt_set_pte+0x5b/0x360 [xe]
>> [  183.914482] Code: c6 ff 0f 00 00 75 5e 49 8b 44 24 10 49 03 44 24 08 48
>> 39 c3 0f 83 b0 01 00 00 49 8b 84 24 b8 00 00 00 48 c1 eb 0c 48 8d 04 d8 <4c>
>> 89 38 48 8b 45 d0 65 48 2b 05 1e 41 d1 e2 0f 85 e9 02 00 00 48
>> [  183.933007] RSP: 0018:ffffc90001ce79c8 EFLAGS: 00010202
>> [  183.938179] RAX: ffffc9000c80fd98 RBX: 0000000000001fb3 RCX:
>> 0000000000000000
>> [  183.945234] RDX: 0000000000000000 RSI: 0000000001fb3000 RDI:
>> ffff88812c695628
>> [  183.952285] RBP: ffffc90001ce7a60 R08: 0000000000000000 R09:
>> 0000000000000000
>> [  183.959338] R10: 0000000000000000 R11: 0000000000000000 R12:
>> ffff88812c695628
>> [  183.966388] R13: ffff8881329ea768 R14: ffff8881329ea768 R15:
>> 0000000000000000
>> [  183.973438] FS:  0000000000000000(0000) GS:ffff8884ebe60000(0000)
>> knlGS:0000000000000000
>> [  183.981431] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  183.987110] CR2: ffffc9000c80fd98 CR3: 000000010b9c5006 CR4:
>> 0000000000f72ef0
>> [  183.994159] PKRU: 55555554
>> [  183.996847] Call Trace:
>> [  183.999267]  <TASK>
>> [  184.001356]  ? vprintk_default+0x1d/0x30
>> [  184.005244]  ? vprintk+0x18/0x50
>> [  184.008446]  ? _printk+0x57/0x80
>> [  184.011648]  xe_ggtt_clear+0x104/0x2a0 [xe]
>> [  184.015878]  ? mark_held_locks+0x4d/0x90
>> [  184.019767]  ggtt_node_remove+0xb2/0x140 [xe]
> 
> ggtt_node_remove has hotplug protection via drm_dev_enter, but it
> appears that drm_dev_unplug isn't called if the driver load fails, so
> the device still appears to be plugged in. This becomes an issue if, for
> example, MMIO space is unmapped in mmio_fini then sometime later a BO is
> freed with a GGTT mapping.
> 
> I checked all the drm_dev_enter usages believe we are ok aside from GGTT
> case.
Nice to hear that.

> 
>> [  184.024164]  xe_ggtt_node_remove+0x40/0xa0 [xe]
>> [  184.028728]  xe_ggtt_remove_bo+0xa4/0x2e0 [xe]
>> [  184.033210]  ? _raw_write_unlock+0x22/0x50
>> [  184.037271]  ? drm_vma_offset_remove+0x65/0x80
>> [  184.041672]  xe_ttm_bo_destroy+0xae/0x2d0 [xe]
>> [  184.046150]  ttm_bo_release+0x70/0x330 [ttm]
>> [  184.050382]  ? vunmap+0x4a/0x70
>> [  184.053494]  ? vunmap+0x4a/0x70
>> [  184.056609]  ttm_bo_fini+0x3c/0x70 [ttm]
>> [  184.060491]  xe_gem_object_free+0x1a/0x30 [xe]
>> [  184.064966]  drm_gem_object_free+0x1d/0x40
>> [  184.069018]  xe_bo_put+0x123/0x180 [xe]
>> [  184.072898]  xe_lrc_destroy+0x47/0x60 [xe]
>> [  184.077041]  __xe_exec_queue_fini+0x93/0xd0 [xe]
>> [  184.081693]  xe_exec_queue_fini+0x2b/0x60 [xe]
>> [  184.086171]  __guc_exec_queue_destroy_async+0x6c/0x170 [xe]
>> [  184.091769]  process_one_work+0x22e/0x6b0
>> [  184.095737]  worker_thread+0x1a0/0x370
>> [  184.099448]  ? __pfx_worker_thread+0x10/0x10
>> [  184.103676]  kthread+0x11f/0x250
>> [  184.106877]  ? __pfx_kthread+0x10/0x10
>> [  184.110586]  ret_from_fork+0x337/0x390
>> [  184.114301]  ? __pfx_kthread+0x10/0x10
>> [  184.118011]  ret_from_fork_asm+0x1a/0x30
>> [  184.121900]  </TASK>
>>
>> So the root cause of the page fault should be:
>> 1.mmio_fini do pci_iounmap
>> 2.writeq in xe_ggtt_set_pte access valiad address (ffffc9000c80fd98)
>> 3.Since already unmapped in step 1, the page fault tiggered.
>>
>> The excution order of fini(s) is:
>> guc_fini_hw (for each guc)
>> mmio_fini
>> guc_submit_fini
>>
>> meanwhile, it is the destroy worker perform the bo release action, that
>> causes problem, the worker out of sync with the managed actions.
>>
> 
> Yes, this is an issue with all versions of this series, even with some
> of the further suggestions I sent over today off-list, if hotplug
> protection doesn’t work in the GGTT code. We might need to open-code the
> protection in the GGTT code rather than relying on hotplug.

Right, that's why I move the guc_submit_fini to devm since v3, test 
shows this prevent the page fault happens. And ofcourse, better to have 
open-code protection, I will try it later.

Regards,
Zhanjun Dong

> 
> Matt
> 
>> Regards,
>> Zhanjun Dong
>>
>>
>>>
>>> Matt
>>>
>>>> Regards,
>>>> Zhanjun Dong
>>>>
>>>>>     	ret = wait_event_timeout(guc->submission_state.fini_wq,
>>>>>     				 xa_empty(&guc->submission_state.exec_queue_lookup),
>>>>>     				 HZ * 5);
>>>>> @@ -2459,16 +2467,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>>>>>     	}
>>>>>     }
>>>>> -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>>>> +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>>>>     {
>>>>>     	int ret;
>>>>> -	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
>>>>> -		return 0;
>>>>> -
>>>>> -	if (!guc->submission_state.initialized)
>>>>> -		return 0;
>>>>> -
>>>>>     	/*
>>>>>     	 * Using an atomic here rather than submission_state.lock as this
>>>>>     	 * function can be called while holding the CT lock (engine reset
>>>>> @@ -2483,6 +2485,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>>>>     	return ret;
>>>>>     }
>>>>> +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>>>> +{
>>>>> +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
>>>>> +		return 0;
>>>>> +
>>>>> +	if (!guc->submission_state.initialized)
>>>>> +		return 0;
>>>>> +
>>>>> +	return __xe_guc_submit_reset_prepare(guc);
>>>>> +}
>>>>> +
>>>>>     void xe_guc_submit_reset_wait(struct xe_guc *guc)
>>>>>     {
>>>>>     	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
>>>>
>>

