Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B439D6ACFD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 18:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF98810E072;
	Wed, 27 Nov 2024 18:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njD+gmml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62010E072
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732733292; x=1764269292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RVmssAXzfnN5ZZ9ZNilPxyPaPJbXXrnqaqg5WHPRVJ4=;
 b=njD+gmmlwcFzxiYCAAiFBCRZv9uvdJUh3DGKn0cmGeujUNFwyRbRTMp0
 g2wr+CKwNksb8T74ygtyRH5GyyigWG/9nWUC0ajRjcvfk6LOAOccvLDvd
 Tykt71X9rOYpBmD9aA8pY1n8xPRipV+lmAYOvKWkJJoJDEv2jTda/7mjr
 BmFsFJefKVzy2WOqKkkklmRuTkVzG72YjmnJRpdzjLRskXmQmrVVhm0ct
 bEooRqciAkfqXNmdwF0SBY1RdOp+ECnmCl12exy6qr74nQXRWVse5VCx4
 Zn7B8JtgBt2NOa7EiQ6AqHk7G8XAJI8I2OPUkS26DdOqz6a4U0mvU+r3t w==;
X-CSE-ConnectionGUID: VW6PSMbwQkKjQrNTHdnKag==
X-CSE-MsgGUID: Iqy33A3pQoKOTuXnnFAL+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36617716"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="36617716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 10:48:12 -0800
X-CSE-ConnectionGUID: v49pO72VSiehGWw8U+z9NA==
X-CSE-MsgGUID: gv0MdpmMQh2g8pBpmSekDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97087487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 10:48:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 10:48:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 10:48:11 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 10:48:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZePQ3kS+0Kk+04NvS7efud+9OrIAeiQHcJyAzIUpHypOPNYegqltRCpSctjuE4p7fddYnijqadTF3luo9Cz/yDwlJvP3erHsbl8U4bQomddTLGNNUf/T5ov0/NDV5VbMVrw0TsezIvhEMsrKf1djqmGLDe7GDHNnZSFgy3K/KqsWE7hQZI9Q3PYwDxQ+fW3HiAQAHSSg8SZlF10xn1qq8LxoWZKisFN3+JypUSSrxWIePtcVH7062zyAXK7Rr/SDARrnIHjhRxa08zB0BWdmIm2Uu2d1MmXpCzbvOkTVpfo02VMMQIOaEN/vWMsFpSV4ql9sbd9wlSmS6g3qRVtYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPgYs9G7FLNVHL+1bPxJ64qluYLKsyjmsotwvaEGyEI=;
 b=uphEIM5sFau6V7AkjNwIB/Q7kIaNeESxKLjOX6vEWrAne5isJVTQhO8WFaFjXdon7XPQQC3Ab8Xzt/+BiZaz4J+5Aa5bN+o0iuMQlflZArCmGd/7ZirqltLbcwWpEkfKaL4yvmxPIalsalg86E01x050E8cj9ISuLzsDbdemSJUtJHGVWsHAFqsHs2HgznDQUStUcGldCsdUJ6IYdV+ZR1K/MSbaKoJwtXA/II9yH33rKHI9QcDmWRlPg6mU4goKCjwjBb6KmjCICKomGPaw7Fp+ZwxRoflslbTIl6MPCBf/ISgDdw5and+/NOEtm1WGiEwq8mDU8zl6MQ+rEWMxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 18:48:06 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 18:48:06 +0000
Date: Wed, 27 Nov 2024 10:47:57 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <jose.souza@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <shubham.kumar@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Message-ID: <Z0dpXQ0JXwtRbqO0@intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
 <ZzYj53waEWwK/5za@orsosgc001> <Zz0mUGCKzLXI5Y13@intel.com>
 <851pz5loar.wl-ashutosh.dixit@intel.com>
 <Zz6HV+/Ya1nOReZE@orsosgc001>
 <85zfltjmv3.wl-ashutosh.dixit@intel.com>
 <85r073jfo9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85r073jfo9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c000b24-0ca2-4a7f-36d4-08dd0f140801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlhHRzhrcE00aG8ybWp1MnZsMmVxUUdlcDhqM1pTTC9HZWJvRWovekNVQkpI?=
 =?utf-8?B?WFhvbVZZdjZveW00ZU5YU29tY2pPUWViVTcxd0JJdWJHK1prUjlaRzA3eWx0?=
 =?utf-8?B?SHNBemR5alhFWHhlSHhId09nVGxHOWpEWHE3eCtJYzBHUGZJVytJclkwNFVw?=
 =?utf-8?B?WG95Z0xlcjd0S0VLWDF3ejJGRGRhS0RXNjBEV01jeWtSWFgxdFkrUzYrbTNj?=
 =?utf-8?B?S1J0anhIN0FjRXIyMm1sYW5iRS9xcFJQV0U1L3BMbWMxSnA3UklxbXN1YVBZ?=
 =?utf-8?B?UU0wcnFKTHNabUtLRERBV25IUnFPbVc2ek43eEZGcERSYzZzdEpKRXhEZDBy?=
 =?utf-8?B?Y3VTeE5aZXpzY2dHbGtDWnhab1pYZ3U3UG02WldSaW1USXB5VUpTZTRjZWtC?=
 =?utf-8?B?bHZUWHRXcEtaYmtBUTBHVFJsT0hIQ0NXSDJoNFZnRmxpWkVaZzBrYnVsVHZ2?=
 =?utf-8?B?YmpBVk1BWkRYNGI4UDNURkJqcVpLM05pRlBRQkxIZzlkemMweDQxRGVRcmpz?=
 =?utf-8?B?eFc5M0lIREhRRnQ4VFozdXZkRGp4YzhCYU5SR09DTTBMYm1hTEIzWHY1WG5x?=
 =?utf-8?B?aUFqbHBCeENwRDFDTUQwWVVJNHJraVI1NCt2TUJ4cVF3YlNiS2p6VXBYM3Bp?=
 =?utf-8?B?R244MnRZZG16R1NZb0VIWUJqNzl0SmZDNThXdXZyWmxSZE51alJQdEdhWXdN?=
 =?utf-8?B?NEtISFY5KzBnNDdRWndmN0grRS8vOStGM3ljSjRwMTI0dDkxTmkxSEhMcTIv?=
 =?utf-8?B?Z05ISEFrSnVsbkRHa3lPUHVOMjVUVVhuUElaR3JsTEtUTWs2V29CZ2ZmUXFN?=
 =?utf-8?B?U3JIUnkrYzNBUHMwdVlSK2N2L1RFdjVsNFRyWWpkTHVrUEU3cjk0TW00VVI1?=
 =?utf-8?B?eWhtaFZWb2Y2TzlzK0tmTld0VXFGSS9RQnV6ZVh2bE1BclZWUVh6R1I3NTYv?=
 =?utf-8?B?TWo2OE01WnA5RitDU0JXWGVoTHF4MmUwc2J5bzdtUEhrYkxFOGV4WHR1ZVB4?=
 =?utf-8?B?OWZpSzVRMnMrMGN1UnBNd2ZSMWs4OEhDZ2FGRWZnaEsxbHRkblk4b2ROcDdv?=
 =?utf-8?B?Y1dTS0ZxN1NDRWxFcU50cFVYVVM1dnFDNFJhbWxvNm1pRXlxRkhFRzc0aklV?=
 =?utf-8?B?RXlmd2ZRQmlYNnlVN20yYjBkdnZZYzZxVFhEa2dic2plaGM4a20ydlRNcnBN?=
 =?utf-8?B?THdwNytQWWlZdnJNNDRpYWthK0htcnpCWmEwcEh6Zlo4R05wN3hXSnBId01x?=
 =?utf-8?B?TkRHdURZWGZubFk3L3ppMEY5cjczcTBqMnNZek9iV2RoTi9wcGZRck1hYnNq?=
 =?utf-8?B?WmJ3M3krb1ZnL202NUI4c2tvYWR4Q3RMZFBya2tlK25TMmNNVXpvS0hLOWNI?=
 =?utf-8?B?TlNKNkFuSGxKbjRMVDlvL284d0RNdUhJM2VJWlFsb004K0ZydGRHV2JHYWJv?=
 =?utf-8?B?aFFSbzBVZTArUitRcWN2NlowREVDYURlY0Zoa2tKY2oyOWdzaHhGL3JKYXlF?=
 =?utf-8?B?cC9nbER4aVo1WWNaclYybjBjaEsxeGQza3EvcEw2bkdCbzNWcDZYY1VBbkN2?=
 =?utf-8?B?eU1QdTA1Nm5nNTlReWt2MjF4elVjekwzNjA2aTcxUlQ4Ky9ocGMwb2o4dUpw?=
 =?utf-8?B?Y2QvZXRIZHV2cGZ3S3dBWmgzbjdEbzU1VXRNbWN1QThmOHZ3S0FCS0hyS2F5?=
 =?utf-8?B?K0VCREUvT0tWUm92TGdoV3QwNEdmNkg0c21TZFRhdXZUcUMxamo2eTZHbzFN?=
 =?utf-8?B?QUVtYnFaYWF5TG1MQWZ2RUFqWXo1ckU3Z25STStMWktHMUIwVnRWRVhRRkNR?=
 =?utf-8?B?SDN6QUNVRzEvbFdFZEtrdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZMT0dPbXIvK0g3b0xiZTl6YTB5OXhuNmRGeGljbVF0Um5QUE8zVGtTOUlq?=
 =?utf-8?B?UXM5SUlCalJBS2dEczRwQjhvcFhDWjF1N2xmZmxzajNEOFRtNkpsWHdsdm5X?=
 =?utf-8?B?RmJvbU55dzN6YkE0SlEvNHFvL01TMFhjMUhpRDFMR2puR1FmRDVRTjlKWGUr?=
 =?utf-8?B?UUFETTd6YXFhZlFpSDhZNHAxZy8yNHdwc3d1N3dHcmNXclQxeEZ5ZUZqazVx?=
 =?utf-8?B?QXN2OURhYmx6NXJDVVRWaXZlV3pIVDREVDJDdWFOVjlTcXdSYll0UGhjdkl1?=
 =?utf-8?B?Y1JMUFc4M3VhWTBFcTlzSW85dmU3T2RFSVY4M2s0RUZnLzQrbCtSNE4weUw0?=
 =?utf-8?B?MDE5OGE5c1ZETlNFS2ZMN3RXM050Y0RRRFNXdEk0YkpGSmtxaWpBQ2ptUWRB?=
 =?utf-8?B?RTYwVHBkeHRGQ2VJYTJFMGwyK3BiTDUzRTN4bnd1T3NUSktsN3hlMjI2K3Zl?=
 =?utf-8?B?SS9XTUk4N2dzdU5KZkF3UEJQZW1RY1ZmVGVEeEFwZ2pueEdvQUpmVnRKYUYv?=
 =?utf-8?B?TElBRjNub1Z2TlprZFV6bC9zTGJXdDE3TnJQa08vWUJFUy9VSzdKTHJMRWxr?=
 =?utf-8?B?bEpxRDZXVm9XWk4rd0p0SG4vNytHTjU0MStDWFlCV2V3RXNqVEZnRXhRY0th?=
 =?utf-8?B?WEd6QXBGeGhlL2JqRG51VUdUTDV1QnE3ajh0OS8rOHdteXNkZTcvRlVEc0du?=
 =?utf-8?B?bk80QUVuZFJCMEhKVDhXSDZPUnY2Z0xGYkU3ZksyZDE2OWVzV25GOFZnWEhy?=
 =?utf-8?B?RmVVYi95S3RsMk5qb1hPaWNwenl4ckxPaERmZGwxZzVHTlI2UFFFZSt1Y3hn?=
 =?utf-8?B?ZTlZSWFIeE9VWDRMV08yVHkyVmxIWFBrRFpOakQveTU4ZmdKWUFWVzRaTmx2?=
 =?utf-8?B?UHNRRzJJV2NrSk5VUllsQ09NV2ZkSzJwZWwwYjNGeFhHYzd6QmFBeHRIN2Fw?=
 =?utf-8?B?YkEvK2QwUFUyRlN6UjNJRU55ODZmakRLeThhZDNUUk1lNzRXUjdwMWZPMlgw?=
 =?utf-8?B?aE5VMU94WXdoaktQdUgwQ3ZwZlhpSFZtTUFNd2NhSXpNZTZCcnhIbHhDd25K?=
 =?utf-8?B?bmZSOVluYUZCenlYcWtTdi9HczhMTjBLeW05cGJIU3AyMHJ4NjR1ZjBLbXFa?=
 =?utf-8?B?TkVOZ2U1VUtYOEpNTU5CR2kyUDhZL1VMUTVZSm5qV2NpVUtMMm9yRGRVYk02?=
 =?utf-8?B?dEdUdE1uNzZ6cnlUVEwrWll4R3FSV3V5VTQ1emE0Y2xZZzZjWDNaQWdNRkEz?=
 =?utf-8?B?OXd2QkUzcWVGTjQvbHhmVHpHTmVYQ0pSelA4azBQVTlLdDA5OTBoSDBldG91?=
 =?utf-8?B?cVlGcml0L2ZMeGFkVXhnTHR4eWRuWGJQV1BneGNKeWJwYlV1QkJEMEpkS2lC?=
 =?utf-8?B?SFh4S1NoMkM0bzZSS1k3V1htME1lOHlCT2VHRk1sS1Y2VU9vVzE0NXNGSkRG?=
 =?utf-8?B?T1VZV3dpbmVEckxEVWNnb0VkWjZZT2M0VVZlTU9kUFZOemYrQnBpMGxKa3ht?=
 =?utf-8?B?TGxIOHNHOWhLOWdHV2dPYkJMN0w1cU9CbTFJZnN6RjlJK3BXTUhNczRHWWo5?=
 =?utf-8?B?UkxhZThKZ0xPc2tYVU4vNDA4WWRpa3U0S0h3d0ZPUXN3YlMwbXFDV2ZZZGxJ?=
 =?utf-8?B?YTByc1JGaEltRExTZTNhS0NXM3k2K2U4eFpJM2grc3RUdnJSNmp0RmJwWEdS?=
 =?utf-8?B?RlhMc2NBNFdoTkljd3VGdlFra1JucnZYVWphS2FRM3BRYzZVYmJuK3NESFFu?=
 =?utf-8?B?K2lkRzhsZ0pKQWJESGZJU3hFQzRkakNMTVcrSWpMTnlBS0ZBUjFlaGYyeXdX?=
 =?utf-8?B?WHpsNDFJNkdIcnFRR25iN2oxVmt2VzBnbFRUc0JNUzljNTNGNmtWVkh1a0Ux?=
 =?utf-8?B?RytRZ2ZUdG01MDNRMS91T1YxU0FwQ0FFelRoSFZmWksyRmZZYWo5Z2YzMXAx?=
 =?utf-8?B?MHZZNFRnajNGWllPVjhCUnh4a0c3d2JjTzF3L05YNzRPOU03RUR1QWdsVjVZ?=
 =?utf-8?B?Rk9VUGhOTE9Qem9SYWE4YTJORlpwdG1VQmcreDNMMUZ3NmN4MXdlb0l4Qk52?=
 =?utf-8?B?eFlsRzcxVVl2UzZ5KzlDN05NYzRiSDIzS0R4SGtFY0ovcjJONzFJSTdSTUFh?=
 =?utf-8?B?dVZIVmJGcVN5RVBkMnBUQ3k0YzJWa1gwSzRCNjBVNHV0OSs2cW5FUjlKRnhm?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c000b24-0ca2-4a7f-36d4-08dd0f140801
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 18:48:06.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEIU+c67SGAshuOXOW5rINJOx+TJ/k719pgByAxSkYTWFvS/gC1aqxFrDlPZyyM8HMDS64pS8D9SZWJqxin2WMcZ7CWobqe6yphVoEifW1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On Fri, Nov 22, 2024 at 10:18:14AM -0800, Dixit, Ashutosh wrote:
> On Wed, 20 Nov 2024 19:18:24 -0800, Dixit, Ashutosh wrote:
> >
> > On Wed, 20 Nov 2024 17:05:27 -0800, Umesh Nerlige Ramappa wrote:
> > >
> > > On Wed, Nov 20, 2024 at 11:04:28AM -0800, Dixit, Ashutosh wrote:
> > > > On Tue, 19 Nov 2024 15:59:12 -0800, Harish Chegondi wrote:
> > > >>
> > > >> > > +/**
> > > >> > > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > > >> > > + *
> > > >> > > + * These properties are passed to the driver as a chain of
> > > >> > > + * @drm_xe_ext_set_property structures with @property set to these
> > > >> > > + * properties' enums and @value set to the corresponding values of these
> > > >> > > + * properties. @drm_xe_user_extension base.name should be set to
> > > >> > > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > > >> > > + */
> > > >> > > +enum drm_xe_eu_stall_property_id {
> > > >> > > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > > >> > > +	/**
> > > >> > > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > > >> > > +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> > > >> > > +	 * If the value is 1, sampling interval is 251 cycles.
> > > >> > > +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> > > >> > > +	 */
> > > >> > > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE = 1,
> > > >> >
> > > >> > What is the rate of 251 cycles? If that can be clearly defined, then at
> > > >> > first glance, I would think it's better to define this in terms of
> > > >> > frequency. The implementation can decide how to translate that to HW
> > > >> > configuration.
> > > >> >
> > > >> Since the duration of a cycle depends on the GPU clock, it can very from
> > > >> GPU to GPU. So, if there is any translation in the driver, it will have
> > > >> to be different for each GPU. I think keeping this input as a multiplier
> > > >> of cycles may be more future proof for the uAPI. I am trying to get more
> > > >> information and feedback from the user space regarding your suggestion.
> > > >> If it is feasible, I will implement in v6.
> > > >
> > > > Umesh has a point but I sort of agree with Harish because this value is
> > > > directly fed into a register. But we do need some changes:
> > > >
> > > > 1. This 251 value showing up here doesn't make any sense and needs to go.
> > > > 2. According to Bspec 64036, HW supports "127 * N" sampling rates
> > > >   (in terms of cycles), so we should support those too.
> > > > 3. Even higher sampling rates (say 10x) are being proposed for the
> > > >   future. So these should also be supported.
> > > >
> > > > So my proposal is simple, but let's see if it can be made to work. The uapi
> > > > will directly input the sampling rate in number of cycles (so the value
> > > > coming in is what the GPU freq is divided by). So e.g. if "3 * 251" is
> > > > required "3 * 251" will come in through the uapi. If UMD wants "7 * 127",
> > > > they will send in "7 * 127". The driver will internally map this value into
> > > > the "closest" sampling rate supported by HW.
> > > >
> > > > I am assuming that UMD's already know what sampling rates are supported by
> > > > a particular HW platform so they can send in the exact value they
> > > > need. Otherwise the driver can always map the value sent by userspace. Say
> > > > UMD sends a value 10, this will be mapped into "1 * 127" which is the
> > > > closest sampling rate supported to 10.
> > > >
> > > > So this way all sampling rates can be supported. UMD just says I want a
> > > > sampling rate of "GPU_freq divided by 10" and they automatically get
> > > > whatever is the closest available. They probably do need to have an idea of
> > > > what rates are supported on a particular HW platform, I am assuming they
> > > > have this information from Bspec, so they can send in exact values if they
> > > > know and driver will be able to set the exact value UMD has specified.
> 
> This is an important point here. Can we assume UMD's already know the
> sampling rates available or not? KMD can handle whatever value UMD sends in
> but UMD still has to have an idea of what sampling rates are supported by
> KMD, to be able to set an acceptable sampling rate.
> 
> Otherwise, KMD will need to expose what sampling rates are supported to
> UMD. There seem to be a couple of ways of doing this:
> 
> 1. KMD can expose the available sampling rates in drm_xe_query_eu_stall
> 
> Or,
> 
> 2. The UMD can set their sampling rate and the actual sampling rate set by
>    KMD for that stream can exposed through DRM_XE_OBSERVATION_IOCTL_INFO
>    ioctl. If UMD doesn't like the sampling rate set by KMD they can close
>    the stream and reopen a new stream. Basically they would need to iterate
>    to arrive at an acceptable sampling rate.
> 
> Or,
> 
> 3. KMD does nothing, assumes UMD's know the sampling rate "out of band" via
>    things such as Bspec.
> 
> I'm thinking maybe should expose the min and max sampling rates through 1.
> and UMD's can select something in between and KMD can map that to one of
> the sampling rates available in HW and maybe also expose the final sampling
> rate through 2.
> 
> So e.g. for now min and max exposed would be 1*251 through 7*251 (ignoring
> the 127 stuff for now). Min/max might be more future proof since HW changes
> to a different scheme, rather than have 7 or 14 fixed sampling rates they
> have now.

As of now, the driver sets a medium sampling rate as default if the user
doesn't pass any sampling rate through the properties. In this patch
series, 4 is the default sampling rate which is the mid point between 1,
the fastest sampling rate and 7, the slowest sampling rate. It would be
good to get feedback from the UMDs on which sampling rates are typically
used. As of now, Mesa is setting the sampling rate to the fastest - 1.
If the driver exposes the min and max sampling rates and sets the
mid point as the default sampling rate, the user can override with the
fastest or the slowest sampling rate or any other rate in between.

Thanks
Harish.
> 
> > >
> > > I am okay with whatever makes sense from a UMD perspective and whatever can
> > > be extended easily in future. Just the cycles as you are suggesting should
> > > be good as well.
> >
> > My suggestion is just the inverse of sampling freq, in a sense, i.e.
> >
> >	eu stall sampling freq = gpu freq / N
> >
> > So we get N through the uapi.
> >
> > > Just curious, since the gpu frequency is may vary, any idea how the UMDs
> > > map this data to their timeline?
> >
> > Note that we are dealing with the sampling freq here, the freq at which eu
> > stall data is sampled, say  1 / n * 251 or 1 / n * 127 of gpu freq. But yes
> > sampling freq can vary with gpu freq.
> >
> > But otherwise UMD's don't deal with time very much, only the IP
> > (instruction pointer). So e.g. eu stall data contains: basically IP x was
> > stalled for y cycles in this snapshot/sample. Since IP is unique, it can be
> > mapped to a line of code for an eu kernel e.g.
> >
> > So I guess there is also an approximate notion of time, so when this eu
> > kernel was sampled (or ran) the first time, IP x was stalled for y cycles,
> > when it was sampled the next time, IP w was stalled for z cycles. So you
> > would have a kind of moving window for the stall times for a particular
> > IP. So it's based on IP, rather than time directly.
> >
> > At least that's how I think it works :/
