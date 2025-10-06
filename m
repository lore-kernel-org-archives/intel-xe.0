Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB9CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 08:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60B710E2FA;
	Mon,  6 Oct 2025 08:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgXtHY0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6EB10E2FA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759739049; x=1791275049;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qlZqxcFUZINSyhHx1Qcm0JjCPP6gWEYpNFoy7OXH428=;
 b=CgXtHY0QppjBhK4a2aWdXIgLK453zhtj7PqUrOqqwY2AYO3ErBdXO0rD
 JSBhwOWkF5kv5vNckYa6YeXEV2B2NKgnqWlKUf5kuTkZ6l0i446miodej
 HWM4J76NIz794erwYc/vDfhSoUvRJxL1Q86H+6zyeI3sr3apYeiTlqU1n
 kRpD0lZiwDp9JeavoWRqdTWJ5O7zLXo5Yetqej+ey9Er0IwBIH/AQ+zM8
 Wh/bkLjPwXVMxmJKqepwQ/rSXx12Sp7QUctpy5lid8B1rlMieqTvo8rBR
 ++UxUioDnjzNrM/UJmOofLu2xh+cA3ZC3UYMjw20PNYQZ3VvIvBn4ScpU g==;
X-CSE-ConnectionGUID: Gdy/eMsiQjSUTfkQlRXKJQ==
X-CSE-MsgGUID: yyhTma3CSqmAlqFu+Cr04A==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="72526956"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="72526956"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 01:24:08 -0700
X-CSE-ConnectionGUID: WvugKMyTSqu3/Ib514kaXw==
X-CSE-MsgGUID: VjeCAZ3MTSqybZ2ZEV5lDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="210790903"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 01:24:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 01:24:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 01:24:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 01:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQISDgWXTAG7m2ukGJUUdQCTFYbo8xwa7ykIA07hJbMVvQ3yl7xDPVQq2Ucd6+ea57qOtDHvhlqIiwR9m5iujRcSIBsC2kdyfdSj5F6uNeqWINaojtqb3fMgLFZIe/eF57xKzRjnoZlJFl+qq34WgPxr0ZkjZ4trjmZDNe6oBhTd4HuNEitKtPoEz0d9n/JEXHxYuML4+MY1XS5ItFLuNdh32Du0TMoG0xxn9QvVD/js8qI7HHJYhYVvHW8BXap64vZaCMfCKwQHrPE4bENXzsVSPRS6NEHNGs8wZtrpfcc09xwhRK8ZacbUFmY62ctT1xyHl8NlZzNB+BRAma4/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQbFOsBRBjpbOOI5L8A8JyYCHjvaYcSVTQ9pgYbb3Ds=;
 b=bJo6zNVmmDS6Kmyj8Ap0btH+VHkGmqIJeeOj244Nkf6bq6wfCqZxz2ErPpZEDbKA/10QZ50UK7WX7tPUp2LsmrGUsGKoEACghCkjG7B2Lrc3N0jeFimTOxTrygw4uZHJaQKVy+5iCngPisNdo2q0jbftTtSN48gcuAzTLqjq7T2Nn91R9atlsG3ZhJR/CDGJuKf6+HYK1j9giZrzatjNyI3k2lU7cCgkM9U/Qw5/1CjxdtanulgU70uHept+wR5ag3rYzCVNAXwqktnuq9ESnZBE0YzAid3WzNPBttXoA8JeS0yHBX5Z1ZwbA5nDdn59YIOflGwHcE9bm65W6OgTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 08:24:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 08:24:00 +0000
Date: Mon, 6 Oct 2025 10:23:57 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2] drm/xe/pf: Make the late-initialization really late
Message-ID: <20251006082357.prdfcqxdjvgkuxhb@intel.com>
References: <20251004162008.1782-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251004162008.1782-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: LO3P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a27df8-1a3c-4583-50b9-08de04b1b390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3JrSGw0NzRRMmlNb2pSVVBwcEluOFhIck8yZFN5ZXR6YVpLMDJET3o3enlX?=
 =?utf-8?B?bFJ0TVBlVjJRMlEzakpSMjVTSHhXR1hLMG9UM3dWZEFadFBmUG9jellJWk5n?=
 =?utf-8?B?dld3ckF6ZTdOM0lYckxNanIvb1ZHYzUxZzhrUkdTeVlaWUNaY1dJdVBBSTV1?=
 =?utf-8?B?Z3JFYXJoZUpFOTNFblZ5aGc1aWVLNjZCZDBnZTB1RTBUelRGMzBIZStxSmdi?=
 =?utf-8?B?eU02bTdIdm9BMVBCR210NFhxRG1xUFc5bjRLSS8wM3daSVc2Z0lXLy9NYTcr?=
 =?utf-8?B?RE84QVhUZFhpUW1aK3A3ckgwT3U0eHpYb05XM0MwUThMU28xS3dETjBVNGJX?=
 =?utf-8?B?cEdxdjR4SlVTWnppcHpiTFczQUwzZU0wSmRTdXpSUmtBdnRIbVoyd3d2NHRV?=
 =?utf-8?B?L0tsZXJ3dmZBMWJSblhxaE40eXhFL0U3UUtpeTJKT01WZWRSbHhBWUh0Mk9l?=
 =?utf-8?B?c001V3AxSXQ3SjFQWlNpOUtkSXhKdDVxVVZ4Yy96LyttQmVxQzdIZHJxYzQ5?=
 =?utf-8?B?azJRcE1NVjhhZEFhNDZXenArSjNrV3pEMkROTFlwWEhsbDB0a2ViaDVhUnVO?=
 =?utf-8?B?WTNWUUFDaEVGMVF6bnJveWhCT1QrWFRRZmNaR0tITlFhVXhEeHREcVlMK29R?=
 =?utf-8?B?TG0zWWc4S2h1cm1ZK3FURGpBZThkWmVtQUZGTTFIVWQ4cTFxRnB5QVpNelA2?=
 =?utf-8?B?dDREK1hvQlBleGpnSjBLR1c4L1luR1g0L0dpSFJMbWdPSFdOUUxuVHRyRzNz?=
 =?utf-8?B?QUF1enBQRU11MFBFQlZLa2MwZTVLMUZUby9zMFhhVXdWWVN5NCtkTmRXalBU?=
 =?utf-8?B?dG1obmkxV01HOElMUmdOdDlSc3JqNjl3VWRmUVhTNzIreDUxNVRwZG9wSFIw?=
 =?utf-8?B?cm9QQnVsU1U2Mm5jQjVvaUx6MUpqS3ZiVGY1SG9CczlkS1o2Z2NhTFJaVUs2?=
 =?utf-8?B?WDdhK3NCek9UcFdQZFNzcldsdmdndVVmdGdQbm5Ic2trTHJ6U1kvODNaQm5F?=
 =?utf-8?B?RXFvTmRHQnZ4b2Q5T2x4VHJrbktWZDRBbVZJYVlEeGZ4aUxiYWEwZjJlQlUz?=
 =?utf-8?B?MWFSZDd5d3ZaTHE3a2NMRTArTFhBRE1HcXArWFBJbkhMUUFlZmlYKzY4cGRU?=
 =?utf-8?B?VFVseDhqSVRKeDBDOG0rK0NZMDFXRktNVEtCTDBFVzdzc0FGOVl6VS9heW9U?=
 =?utf-8?B?REJQdFRmREhSQ0NmTVUrQTNJbDNpRzEyRGdsbTNXM21nMnhvOUx1YmdmMmtZ?=
 =?utf-8?B?MW1mWmhkR1FtRFVLS3BtSXoxdEQzRUFrOXo1SUdDS2VNOEl1MDNUZnZOdjVP?=
 =?utf-8?B?STE2Ry9FNmlqbE5PeEs5ZDk5YzFKV1o2MkJvb2lwcHVjemtEQ1MxVUUrUzB5?=
 =?utf-8?B?cG1jNmxZVFYrSWh3cGZvZXMyVUxGWTJMdDlVc2pBNFhjR2lZdy9EZHpqeGND?=
 =?utf-8?B?MXNNUkFVcGUxTXRlQVd5cTdWa1pkWG5iZW9Qb0pjYUtNaHdIMHRyTmU0c0ND?=
 =?utf-8?B?OVNjWktoaEhvM0pXeHd2WHhuYk9pVlNjMDJGYVJpVnlnaVlWdmFFTUpmWWhT?=
 =?utf-8?B?eSt4K2FhUjRKRWJua3oxR2swSS80cXNOYm9MbTllaWpoWDZBaFZFWU5vWi9L?=
 =?utf-8?B?QmxUclZPaGdyV0pJTnBrYlBsT1pSV21weUMwbjh4NzZiQWk1K3c2L0ovTHBy?=
 =?utf-8?B?eGtzd0EzWVNiWTNtM1hBcjZpMVNXdWhvR0J4WENNMW5KNzRzb2JrSnpxbFBF?=
 =?utf-8?B?ZkxzVVZBMnNQNVNxNHVVbTM5VjVXUE8ycmRyaXIvbEw2U0FnNVVhSFl1N3hF?=
 =?utf-8?B?NURJZjI5Y2NUOU54VWdMU0RGN3dSUlN0NktEeVpCMXFHL0VQYjJ3RHNBOGZ1?=
 =?utf-8?B?RTluSGoyZG1LMzZTdWJ5OVpQdEt3NEJTZnA1QnZOaEJXa2NPWDdyNmV2Q0FK?=
 =?utf-8?Q?uYKNAis3de7Zli9DSaYnguAN9pe0G/zD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rmp0ZEZmWEtxdFAzUWVWOFBHWkxEdjRjeDZkSHNhSmhMdGdCM1h6NFVsV1E1?=
 =?utf-8?B?SHpwNXVJdzJ3TWJJTWdmWDFwNTFHTitzTTBEVlZLb3dnd0g3VXA3ZWJwSFd2?=
 =?utf-8?B?Q2d2d0k1NmVXa2ZqdXhlR0toVWFlTWxVVlQ5cm1zVGhaNlRlcmRiTU93a3ZL?=
 =?utf-8?B?aFZ4b1VqYUMxM3lLOTlKVDRBSkttZE9aTm1DeDB1Wkw5SjMwNTVhMi9IeTdR?=
 =?utf-8?B?SlZtckFxK3BYeHNPYWxWVGNtL0tWbXl1cGszQi95YWpLUkwxdkRGaHV2K1M2?=
 =?utf-8?B?djZhV2xrdFpwd2g3Q1lTaXdxKzNlQXlCUWlhQXd1VnJQYXhTU0cwT3A4UVpq?=
 =?utf-8?B?SjlvUHk0MkhyUnkzL3hHS2Ixb3JwUUcyUE9QS2RIci9VeVZHelJXTHB2dFFy?=
 =?utf-8?B?RkhOdmtNcXNsM3M0Qmh2aTY3MGtVZ2VmRU8rbXRVemJxQVZtcUNYVk9KV281?=
 =?utf-8?B?c2puZEFGaXU3aGlmby85K0JSQXdXZDhZcFV4NlpLQXpvR01TT2RTSFJ4YWk3?=
 =?utf-8?B?MnM1MWF6MU9OM3dCTkNacXhGb2VhaEg5UEJpU0dLdDJZMEZZTWxUcmZEMGhr?=
 =?utf-8?B?R3pjM2l4U3FWOGVVSVgvZ2dVem9OQldjQ0ZsajZIM1p5YUszaENBWnd0YWdx?=
 =?utf-8?B?emE2NlhZYWFpNTdxRU1tZFVndVVvOS84MS83Zzc0OG5IOHZKK3ZLY05YTU1i?=
 =?utf-8?B?VGtmZlB0Y3ZGd0hzdzZWY2IzZ0tDY0t4TFdTSFJEVzl2bFZiSXg2eXEzdHVX?=
 =?utf-8?B?Z2tBMlhNVFBBcCt4U1dnZm5iZlBHRkR6ZUsxUDRNaE5kbU9uS3o1TlFtbWlX?=
 =?utf-8?B?TWtUS05QbzdUWlVkQVVKb0x0RzgxTDVIQWRuaEM1bWx1MFRYRXNvdnFnMDFS?=
 =?utf-8?B?YkY3QXRsOG9NaFBHcWFudVZ1ZnZiUnhjOWgxNUk4V0dYcDBUa0R4a1dnaHBH?=
 =?utf-8?B?SllpSkEyMUd6aTFZWXpXWXd2WENnNVBtcmlzN2Y1aXM4RlBHd0tmVTBEcW95?=
 =?utf-8?B?VHpMRXEvQ3dHV29QS0ZraDBqU2ZMdk1EL0Y3OE5Hc1JBTDNZcUVaN1FKZ0Vv?=
 =?utf-8?B?YjNmRitJNktsY04wREhxT3lHK3BucWx2MHhmRHBDSDBORFZIV2YvK0hJcWI5?=
 =?utf-8?B?QkwrUVF4aHBNcEZDY05uYWE5cjh5OXlyRlg1WlhmVlJBQ21PTUJFbFQxVGF4?=
 =?utf-8?B?YkVoS29rR0RpVWdJOUtMa1RjaHJYSUJWbEJFakprKzA4b0crSGRKQmhVWVZy?=
 =?utf-8?B?OUtnbVhZbGFrdWYyWlViTENoUG1Tb1YvVVNuZThZMmtGNjRSaTZmcUJHdmlE?=
 =?utf-8?B?alRpcHhFNXJkUkZGS1FZeHlzR08xVnJNLzRleW9aWkxsYVM3QTZ4UldjOFA4?=
 =?utf-8?B?MDVOTWxCZk00RU5NS3NSZVNub2MrSHpUVDJkTyswaFVTVFN2S2FvUU10R3Z5?=
 =?utf-8?B?MkVhVHA2Q0RwRVpPend3YURRbUoycmVZT0RzdGg5bHpTQnI5ZnBhM3dxQnZq?=
 =?utf-8?B?RFNWMnd5bEw5RndKeDhjSzlQZFQraWthRFFiSlN0MzZONWVtZldrTkNRWWZQ?=
 =?utf-8?B?QXRmMXJHUlo2Yno1dEExOXlPQzIyc1U3Z21hSlpHMlIvYURXZE83Z2w5eTVL?=
 =?utf-8?B?YjFUSFZYS1pKdTNOSkpvQnNyQXF2V1pFWVBkRm9EQUV4QWo5MktzOTRtZjlp?=
 =?utf-8?B?YTBtWlc1eUxsRzRGNDB3dnFEVkdabU56TkczU3hpQjJtbWFBbFFkOFM2cXp4?=
 =?utf-8?B?aTdpZkkxWHVjYlZ2SG4vQll5Q0lVUlI3U0xxUTJMaWxaTG9UR1Y4bE14VWRP?=
 =?utf-8?B?cFlHcloxOFgxdkVPQ052UUVMRm94SncvWW9tK1grNFNubXFXa1J6aUs4SEIw?=
 =?utf-8?B?TWljMDJ2a2lSQm1CWkVyMlBYWExsUWJoYmlZaG9mMHV0RUlzT0E0NzBBeVZi?=
 =?utf-8?B?b1Z0UDh2aElFTmlodDYzUEJ0T01CaG9GWVp6ZUt6eGJJQzJGdE5RbWpxaWUz?=
 =?utf-8?B?MklUVzIwOStTcDhtYkVhd1VtOVpGZGFrejBwanFXU1BmVk1oY1c3d2tWVzJP?=
 =?utf-8?B?UXZHdVdRVGhKVzNnYi9FakdJdFROVXhzcHRMMFU3NHY1OTNNejRSSXorQVVx?=
 =?utf-8?B?ak1jMUlPTnYxZjdRaE1nNC93M1U1c3I4dWgrZzRZKzd2cjRhdnV4T2VvT0tn?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a27df8-1a3c-4583-50b9-08de04b1b390
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 08:24:00.2688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y09HAghYsy7m9qkZKzV2YOh/hddgf5ygp+qoTCcxSCaMh4aRHQLG2YufMeYAxn3oJHTnurAv8KTxDvSQxEMUDMVq3cNgvAHaKF8J61wq4GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on sob [2025-paź-04 18:20:08 +0200]:
> While the late PF per-GT initialization is done quite late in the
> single GT initialization flow, in case of multi-GT platforms, it
> may still be done before other GT early initialization. That leads
> to some issues during unwind, when there are cross-GT dependencies,
> like resource cleanup that is shared by both GTs, but the other GT
> may already be sanitized or disabled.
> 
> The following errors could be observed when trying to unload the PF
> driver with some LMEM/VRAM already provisioned for few VFs:
> 
>  [ ] xe 0000:03:00.0: DEVRES REL ffff88814708f240 fini_config (16 bytes)
>  [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=2 index=1 pte=0x0
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=0 addr=53a470000
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=1 addr=53a4b0000
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
>  [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)
>  [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=2 index=2 pte=0x0
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=0 addr=539b70000
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=1 addr=539bf0000
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
>  [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)
> 
> Move all PF per-GT late initialization to the already defined late
> SR-IOV initialization function to allow proper order of the cleanup
> actions.
> 
> While around, format all PF function stubs as one-liners, like many
> other stubs are defined in the Xe driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
> v2: add stub for builds without CONFIG_PCI_IOV (CI)
> ---
>  drivers/gpu/drm/xe/xe_gt.c       |  4 +---
>  drivers/gpu/drm/xe/xe_sriov.c    |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h | 13 ++++---------
>  4 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b77572a19548..8fc3a6929d6c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -573,10 +573,8 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
>  		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> -		xe_gt_sriov_pf_init(gt);
> +	if (IS_SRIOV_PF(gt_to_xe(gt)))
>  		xe_gt_sriov_pf_init_hw(gt);
> -	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 7d2d6de2aabf..ea411944609b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -167,6 +167,8 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>   */
>  int xe_sriov_init_late(struct xe_device *xe)
>  {
> +	if (IS_SRIOV_PF(xe))
> +		return xe_sriov_pf_init_late(xe);
>  	if (IS_SRIOV_VF(xe))
>  		return xe_sriov_vf_init_late(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 4698348c010a..2814f29f1093 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -103,6 +103,31 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_pf_init_late() - Late initialization of the SR-IOV PF.
> + * @xe: the &xe_device to initialize
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_init_late(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_init(gt);

NIT: I wonder if it would be better to be consistent here and change the name
xe_gt_sriov_pf_init to xe_gt_sriov_pf_init_late.
Then pf_init_late would also deserve a name that reflects what this
function actually does.
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
>   * @xe: the &xe_device to test
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> index e6cf930ecde4..cba3fde9581f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -15,18 +15,13 @@ struct xe_device;
>  #ifdef CONFIG_PCI_IOV
>  bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
> +int xe_sriov_pf_init_late(struct xe_device *xe);
>  int xe_sriov_pf_wait_ready(struct xe_device *xe);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>  #else
> -static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
> -{
> -	return false;
> -}
> -
> -static inline int xe_sriov_pf_init_early(struct xe_device *xe)
> -{
> -	return 0;
> -}
> +static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
> +static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
> +static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
>  #endif
>  

But overall, the code looks good:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  #endif



> -- 
> 2.47.1
> 

-- 
