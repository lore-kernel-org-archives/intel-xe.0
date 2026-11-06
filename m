Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAFE606D802
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YyFAc4Oj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580E10EAA1;
	Fri,  6 Nov 2026 17:19:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4015310EAA1
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793985593; x=1825521593;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sfygE3qy/xNAkBrKZUHhZQp/ka6avK2BN4CmyLbJDs0=;
 b=YyFAc4OjydmznkB1eKA6hmbT0MLBhh0eQTtMyZtSe/y5uSj7E8mu2lof
 AHh8Pgjg5bn/0TCL/0c7LUc6zRC2YUSug6QHKG+uhjCrvNVsx4JJhgz+R
 zazi1N+T6jl01WNDtTZvx9sgCzPN/0VMDOG5UkJmXgNSijCYMfp7g8i+E
 lP7mBZOsllhf7FM9QlhukHUkXkIkkLZvR+LTTG0GWNVg0Sa8zLDG3hbxB
 QVq9OJHR47/w0A3MNCPEdH4onzwOiXUac2/XTA3wzjnZKiAi19etajaA/
 xuimYHrtJ7xQFGP2Z0W4Kd8gfe2vXQqyTGGqnY70/Mg/0CTN4WKl4v8vK Q==;
X-CSE-ConnectionGUID: K/B5OzsxSUOyvgw5QpKJIQ==
X-CSE-MsgGUID: yXnrsFmpTUal9yhmyraoRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2823495"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2823495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 09:19:53 -0800
X-CSE-ConnectionGUID: hMmu2ZPSS0+InXercPD5LQ==
X-CSE-MsgGUID: 0QjMGjfjSUy44in9C1pFCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7310816"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 09:19:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 09:19:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 09:19:52 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 09:19:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOhBPG7MP/+dL6LcjVd0O9NopjRlKMEnDYXZlk3nutaZKk7/40hhL4qMGuYzT9kfJVVQ2G5xMP9zTwpDbr+Tadb9puELcGR4oqF7W97TM31oe/DaBg1AEyO70LXSJq3bRNpZMwLrQbwBVe30BKIz2GK36FhWgM8Mkaai396l3DLUSY8VFuha5l7foxhq92LB/eAhxjWT8rQN82OJwrNlMZ3B6ul2jXCLFWFxoQXcIsdSOsLozv5XKRf9IZ4AGadvCEQhfOiw3Z2cYXzSsGxK+rOwdmhroA5WI6EwaDiVv0Eodtz1z3V75ycE3bh+bXbVh/U7F4AaR9GuKsdkKb5tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSiCgdc8dARLzkGoofIenhHIgBgRx5+oGwmKtH+QiSQ=;
 b=gqiKf8tYRxOMBE0tN8f0YDRuX+jkt5gZaHkIq3owXWFiLY394hcjrsCpDzo1i16Ib8PZlO677vxdDOll7gT/pLQKFhuRNCK24b1cM0hdph/4sfu9wPQE0l+b2dCHzcZyBPkDbO3Z/UPMngiKPI457nyXKomTV2VBNMG4vmi5uXccKU+uaO0nHc/MRfnRZFBfFQ2w8AfSJMdxE0l7WGf3U8l/zas42WZpJS3hegOsg5Wu8r5Ll8a0NGF7RFZApgcwM8Jl+b3hOLuNmrMZczA7AyX8CpvDOx+V5ZIn7vx7FDJ3FMbGwsZWB1uVEOlsb3FDOSZna7JM/SmvsV2oFvO3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH5PR11MB880693.namprd11.prod.outlook.com (2603:10b6:510:501::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 17:19:50 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 17:19:50 +0000
Date: Fri, 6 Nov 2026 09:19:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/pf: Use multicast writes for
 early-generation LMTT config
Message-ID: <20261106171948.GK6078@mdroper-desk1>
References: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
 <20261106095403.1790515-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106095403.1790515-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH5PR11MB880693:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d1d580-0879-4891-7f8b-08df3c2a2a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|10067099003|4143699003|11063799006|261026121527099003|261102123227099003|261026140227099003|261028144727099003|261022113327099003|261021135927099003|261021123027099003|261021121427099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: 1drh6XhM7xwMdEgtcGqubVlblxU9tViqHGBxRMyKaN+DgIzAfgS+aztzul2afvDZeRl4fF84aPHDMTK+u0F0yDXqChl03pxFz4g+F2ueYIpUK7T3nQ6hJqsRU/iR145DkQs6XHnPhAzMxI/8T3whVBANJOeIC8FAkhvWNo2DU6Xdse+DkWu3fb1VqXrjCT8/iY0tQrwrfFyr4LXCdSo1WzxfheaSHtvv2T7yQTogXgLfm+4dlPO5eancnCj5GFp169qX5Re7+Gk2yFQsLsJdPIAoPvlT2ihN1segbCSNhdJGBAL/sJSPoaYR+oMkCWSR8An0vOdDbddhmUDnnFPhRUJbiZ929+mBVea/6XssAckSuZfrEyc9L02KMASyFKgZ81E1ArYuV50NBLYp/oD07n2MTCBY94vYNcJT/JaGu3FFXbM6puD+6hecowaQT/dew/4UIXQ2O5HW+kw+cOeKBVyNfzJSruvbE8rEnCdWyUSxb5sQbQ0AwQd96QjamGHCBwtKTNu+U0fuvPdoBGMiZ7CoXWvRn/OF4RyDOczXeVcWaeeUR0ZbYkSxaPueHFB2GCFUns2JNXBKPCOW+J8cnPV6AtT25hok2BtXRQEUL3IOhZYrakTAqCDCjMwSltzmncua9+FcVxQjpwGt8ZthCArf5IH3kay42CC0qMMe4vY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(261026121527099003)(261102123227099003)(261026140227099003)(261028144727099003)(261022113327099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktOTXhKOVYyM1Y1ZlBWT0hDUXZaZVJMTzUwT2c5bEJmVmI0dUNtam5jM3Fq?=
 =?utf-8?B?MlJzRzk0MDNuR3dTZkpZc0xVZnZNVmorcThDRVBXMUpucDVTa0d1cVZyUG56?=
 =?utf-8?B?YitsM05QaHdqQktyV2ZERG5rd2I1VkdsWTAwOGdScUg5azkrdmZ2RDVLUk9J?=
 =?utf-8?B?bFRDbExweVlwdDJPbDBwZ3VSVklBbk0rbU10VWNOUEQvOGJpanBEd3c0Q2RD?=
 =?utf-8?B?UFhVN1IvZzBtU0xlQ2YxbHV6WXFzeW9EclM2YytLWGNsbHd0RytPYjlhN0xF?=
 =?utf-8?B?eUNzSFFpUVpKRDNtZ3gvNTlBRkFpeTE1eDlESktaNGpIelkrdC9CVy9DdTlj?=
 =?utf-8?B?M3YxUjF6VmRGQWZUK09FWWRaRDg4dGFxc0pLTFg0WWRGZGVYL25VbXg0ZDJZ?=
 =?utf-8?B?UGUrU1ljWWg3UGxFaDYrZXIzWWxyUXBBd1pGSUtNSnBtbjRQWUEvRW1PZ250?=
 =?utf-8?B?dWNLUUNseGkwNkRaOUl4cHlpdjFZSFZOc1YwS2plZGs4UlM0ei9HQnhjeUtj?=
 =?utf-8?B?MFA3VitCc0s3VWJuK1NHUjFQUkdaMFZpUVR5c09zMWYvQWVoUytlbHVLTmNa?=
 =?utf-8?B?NnVKWnlLZFZ1WTNGblBZS2E5N0NGVVZPcm53RVUyRjM0NkwvOVNMV3RsK1VR?=
 =?utf-8?B?U3FINkhscGJ6SHc1UFU2NXdXSm1odGpzVFZVVUQ0ODZjR3p3WlgrR3dCSHhP?=
 =?utf-8?B?MVMxRW53QWNBRkY0SEZ5VXVXeG1NMDJlN2VsQUlhS2FONEc4Zzk1UTVQVGdI?=
 =?utf-8?B?NWhrbHB4Q2ZkRzZQNXAxZHNWNktJdkRPSVdBMjY3dTNnYVhxQ24yTVJ4MUs1?=
 =?utf-8?B?WDNpU0cwTEU0T0gySFJjdzdDU1BDYjg1ZlJFSkZ4QzlkZFhuN08vSWIyc0Fx?=
 =?utf-8?B?K0pzNG5LcnpxTzNHTE56N0xscGRXR3NJMHhVQ3pGakVwRVRCcXZ2UGtKbGJC?=
 =?utf-8?B?VHpNQ2gvVk1WMU0wTGhSZlZGT2I2SWVGUitFUlhCeDVodjhQYThYbXRTNzB0?=
 =?utf-8?B?dkJKa20zQ09XOHBoWmNMa3p3NU03S0JOYVRQZFJCTkFGVHlUOWdFL1VaQ2ht?=
 =?utf-8?B?Z0JncmFaSWtWMXdSV2pYOG52NnV3ZkNUWHFzWTFLRzJnUVlkSEpTUXpwQXEw?=
 =?utf-8?B?SG01YUlhWDNIWTQwMnpYSmFqbm13RXNkU2NUQnQ1NmJGdmEvZEpyNVlEY1dh?=
 =?utf-8?B?MCtnNjJpTTZISE1COHdDU0EzOU9VVmRQblFHaVNJaWlISWI5YmhVak9WaTlh?=
 =?utf-8?B?Q2FRK3N1cVgvVTZaVWpRZTlxci91cTdMbUJLcXNsbTgvYVh3UnMzMjhqMjZO?=
 =?utf-8?B?b05FWTZNb2txRGg2NXN2VkhQejNEbEZvM2wrSndQTGpwL2krQmdGeHNIdTEr?=
 =?utf-8?B?SkFobWtiQ01nemhXQXpnODVCb3VaL2F2dlFib05DdHhYYU1ER201cHFZdG9a?=
 =?utf-8?B?QzhQbzFTWjlJdFlWdUZsOG5wSlVSUWxteU02dndLa0VWVTlQQjVmYll4YXNs?=
 =?utf-8?B?cDJiMm93WlY2dzFoakl1b1RNWjhwZGl5S2xLOWlMNlV2M2sxMjRuY0w1d0NI?=
 =?utf-8?B?OWRoTEQ0MGpZUE5LM3NFVzNzSWRISm9LSENLT25qUjE5SkNhUGIway9GU2V6?=
 =?utf-8?B?TG94MTBlN3pJbFdtU2VRbDdsREx3N3QzMWRTYThLeDYvMDQyYkRCSTh1c1Vq?=
 =?utf-8?B?L0dQUHlpbWsrUVlUdUd2MTQraU9yTE1sdlhseE1hbUdIQkQyQytTM3N0WlE2?=
 =?utf-8?B?NjEvZGV1MG1ONnpGWGJLSXRtU3QwMzNEZWl2WmE4dlh3MFJIaTdDTUNGR0dD?=
 =?utf-8?B?NzZ1cGJPeG13TUJZa3BweFZNK3JYWm9NMWp5d0RBRWFST0VPK0tqMTVqck1z?=
 =?utf-8?B?dnJrREpUVUk1eWl1M083RThNMnJZdjkrdERtODMrbXZLUDd6UXZRY3VKR01P?=
 =?utf-8?B?dDBIbXdWZUpMd1hrSmVVWVc4Uzg2OHJCZHBSZEJrdjNZSklzSFpMd01LWTlh?=
 =?utf-8?B?UXBoWHhOMkxUeitIWTk0Wmp5dWhhU2NmTk82WXYvRk9GMU96cHR3RGVCNzZh?=
 =?utf-8?B?c0oyajFGUmljdmxNNGxFeENiUmJCOXJtTDVnMHhQanAxaTBHdmFwZUJRSWdT?=
 =?utf-8?B?NmdiNGpGMldpT2JlWXl1TXZlTERtc29IakxvQmdUTlFOeTZDQjNqalhjVUVZ?=
 =?utf-8?B?TGd1QVZPblRFRUNGQ29WZ1U4aVFPMVlxM1VxZ1o4dUhTSS96Nk9JQWFiR0lF?=
 =?utf-8?B?ekFRdW84b2NKSk1takhpVWpmYTBPclhxWW1IZlk2WG5OdUpJY3VzcmtTSDZD?=
 =?utf-8?B?VFRsWk9kemU5aHlZS1hhYnE5Rkh2ZUJYYkFWalliOTFmR1lIdXVSTWdqTHZP?=
 =?utf-8?Q?AIQJycrtSC+VCOPk=3D?=
X-Exchange-RoutingPolicyChecked: hLlAsZq/aSU1wR9eyEKlT67PWnSkYnr/UZY2FcwsF8cj7ulGBKlSr84p0IGLV+YN5abMfxYtNaSDx2EHvqoTuUH23MkZd+L3uDgjqALEZEKiQIbs+9CdHh2snAXiuMY2rROS23p+c7QUdUx15zTgyhLMKuWSMAngnyjGhZqXQM6WiKOI3TgsRjYEiruMFSfKkJ3vyqn9TnbG6pM0QomnzofO7tyKLHZdqrRGoPhagq8Nt4+rkIMdBnE+HIxNuKkAOXjdL68g9Ix9SaY3EVAtOrURy1hInILZmDL0jjAUxfeSvthS59r1T7p/l7K+2iey+qa816F3imlRCDlddIkDJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d1d580-0879-4891-7f8b-08df3c2a2a25
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:19:50.4736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mm/egJYmKON320Wb4lcCjaC3Mo0wpYcDUGsaYdCLI2q2+g+Afvdzwh3P6cgsQZ4Hs/sm91DLyGPALBDV7iALMbDOhpgTXsGAycJNf3vTm78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR11MB880693
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 09:54:04AM +0000, Satyanarayana K V P wrote:
> The LMEM_CFG register on pre-Xe2 platforms is a MCR register. Use a
> multicast write to program the LMTT directory pointer across all
> instances.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> V2 -> V3:
>  - New commit.
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_lmtt.c         | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90319e3d6046..06d45b1f2218 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -526,7 +526,7 @@
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> -#define LMEM_CFG				XE_REG(0xcf58)
> +#define LMEM_CFG_MCR				XE_REG_MCR(0xcf58)
>  #define   LMEM_EN				REG_BIT(31)
>  #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
>  
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 8fba3c01fac2..ea2a3eeefccd 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -220,14 +220,8 @@ static void lmtt_setup_dir_ptr_gt(struct xe_gt *gt, u32 config)
>  	struct xe_reg reg;
>  	u32 val_read;
>  
> -	if (GRAPHICS_VER(xe) < 20) {
> -		reg = LMEM_CFG;
> -		xe_mmio_write32(&gt->mmio, reg, config);
> -		return;
> -	}
> -
>  	if (xe_gt_is_main_type(gt)) {
> -		reg_mcr = XE2_LMEM_CFG_MCR;
> +		reg_mcr = GRAPHICS_VER(xe) < 20 ? LMEM_CFG_MCR : XE2_LMEM_CFG_MCR;
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, config);
>  		val_read = xe_gt_mcr_unicast_read_any(gt, reg_mcr);
>  		xe_gt_assert_msg(gt, val_read == config, "LMEM_CFG_MCR: %#x != %#x\n",
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
