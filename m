Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8ECEA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781D410E452;
	Mon, 23 Feb 2026 14:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3N++Vvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B2410E452
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855698; x=1803391698;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=soha4p9dNT5wj06iBcIuxO+BPwWlxeKII7xW4C8exIs=;
 b=D3N++VvsYSMOspJOJ7WcTGWWQ6VYeiTtLP8Qc2G00aVfDXEVg7rwFEk9
 YZO4CkNcsKQXI8EQ7HG40EOPvH/8IJllAN5kQEU+TJFL0l4/SZ/8nN1VO
 813ohf+oLAeHF4oLIWugKQ5q3LM0R4bI3RIaESSuNiMEdNuT6IBEW49XB
 l9N7/H0wKkBIYF6k+mQB21HxEpGcDyfOPpiq+pb6yEJD71QZSPAqf2fZK
 GAr0+vKOLAJ7CTIqSiYHtCWwcS3MKcPYemz9yquenO5ypWOOR8LD4IOGj
 IJGkOvvC2pehfZefDbLHVE++GZp6hEd+Uw4G0RXsVaQPeIxrESrU+ZZC9 Q==;
X-CSE-ConnectionGUID: /7++QkjSTYKtpRm9k3lUNQ==
X-CSE-MsgGUID: uQrPEvqUS+qVsctXHBvv/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76461712"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76461712"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:08:18 -0800
X-CSE-ConnectionGUID: e2rjqhrXSVKkqnjq7jHaQg==
X-CSE-MsgGUID: u2pO0YjaQDe5Otuahp9baA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214801423"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:08:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:08:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:08:17 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDaxsCz7GkaXQoCSUJFeyQZhHOIsOFO72e5AEpyHZbyPjKAeCtH17qFkleV2oG7CRW2CoCfx+PpJBmN2GhdofKie4Z2dxvjukydlVgdDAV0Kuml3YayHchJdREpRdoZoeB31dftxciuvJkKfCyvq1d3a5GmKlGkBLJHghVcIQRD7Hh/TTs3lSJIfkW/MFtsUGuaYw00lLrXSQsCWwHtLyyD2cxb8daGg+qDAnpMopdZyGfuHJCvNKbDssfBl033ADkhv9UzivSPADMV2smOl9H8IZor0bOIGghRYJ63ni+mog0Fw8AVc2EVG9Qq0oRLlJfjFJ/hE4GEQQgRWiaO7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcfntnnHD8lrS/cAQFrjJJpr6cOSmFLcl07x2aIAzD4=;
 b=ttHsFaEcy2H+Pv9pUoRwGuJEzX7NUlekTZo4tpTaQf9SMv8SNtquOGmxTevI0SJvc7ZnggImPzcnW85LfoeNGRt4PpyHdFr6l3VFjfEhN/3pwK1up0gon0tlifJ1M3M5WfE3S+qC0RkmrfOz7yiOu8H2E8dxrT5/wnsuVUZZC9pYod5LZNfbk325j801KQr+1CIoT+MOnuXhSwD14M+tijPhp2B981sQLbRGX1ki1O1YqvrYWXCukxwoPkyDX8gxSLDZ7dRJDJQnaLS0ZxnXJwc4F6XNRqGFLSQEWtv+X4qIpslxgRf2LyjhS1iPEQvmPy/gP1Jkh92nZ1x73J3p4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 14:08:15 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:08:15 +0000
Date: Mon, 23 Feb 2026 19:38:09 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/23] drm/xe: Consolidate workaround entries for
 Wa_16021865536
Message-ID: <aZxfSTEhGZeIsOBH@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-7-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-7-b12005a05af6@intel.com>
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d86c4b-591d-4713-c4ce-08de72e4fc9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3JNL2E1UzFUcTRBZW5VSnFFTlJuaDN1bjJxbWVSTzVDWjdtNjQ1Tk1BOWJL?=
 =?utf-8?B?V0J6dmtxeHA3OWtJQmJCT0pDQThPM2hpREVYZnQ0U1Y1dzE3Tnc5ZlluaW93?=
 =?utf-8?B?VnR1cEtYS3ZNYVBnZjJUanFXT2FWS0NIREZzYzBVaHJweWZQTVJrTDg5OHJD?=
 =?utf-8?B?L0dkL1FjWWNnYkVuRERwdGx4ZVlGMFZCUGJWVDJkR0NkQzRlSkhNWWN4Sk5h?=
 =?utf-8?B?THRYdHhudm5BRkdtbXhmNTdtVHJ2TzNiRDJpM0FyM1lKS3lHSXBwWTJ4Sjlq?=
 =?utf-8?B?NG02dUhDWFBqQXM4U0ZyT2g2dUNtNWZQSXRvL2tQY0dQTTBqdkt3R21QamV2?=
 =?utf-8?B?aWNCbFNzU2txeGl2V1Q4TnB3SW04Mkxud3poaGhKMERTOElDd0o4a3JwR1hj?=
 =?utf-8?B?RVhweGZ0aFZieTVPZzBGR0FXNzV5YlFjNENndjFHZ1JzYnhXTDM1Q0V0Y2wx?=
 =?utf-8?B?QWUwcjl5M1dIeWppUkh2dVIrdW9LVXBoVVhMbjR4dExod1RBK2JTdkV4VEVJ?=
 =?utf-8?B?a1JBU05oVW1NbTJkSXI1VERtOVU2OTl0QXRKUDc0dFprYnduMHRpM0xXeCtY?=
 =?utf-8?B?eUVRMndmNWhVd1poWnFTL1JWVDB5Q2ZRK1dmMmFLTWFZa2hRVjd5NFJOcGht?=
 =?utf-8?B?K0p0UHcweFZSblJBdmJKdUd5Rm42L1RvbTUxSTh4YmFoaHdOWDM5T29MUTdD?=
 =?utf-8?B?b0psS28zRFV2TG5IeXpoWFJsSDFJblB4dkNkcnNQd29pR0R5UXVVcVNZQUxI?=
 =?utf-8?B?NmZua09zYTNIVWduZVpKamVtZmdzRXJJNHQ2UzNXNE15L3psWWFVTmVXRVhK?=
 =?utf-8?B?ZWJ0WFFRUzI3S0pIeGN4ZTVjN056V0JpYkxwS2x3RlcyRUN2VXBKYkdHa3M2?=
 =?utf-8?B?QjBtblI0QzFyLzVEWXhDbmMvM01HYVRzUFlBNlE2U0puMzJGSTlsckVIanlV?=
 =?utf-8?B?eUsvR1VrYjMxdjdKV2sxejR0cDRKaGh0RUlCUXhYN050L3ZrRWlwYnhZemJj?=
 =?utf-8?B?NFNCSnpMQm1CczN5NWJVUGh5cVpWSHpFaU1xVkI4cnBOeGZkTmNWZGZuR1pj?=
 =?utf-8?B?NnFmTEdiRktaanp3WWozQmZWaTdBZjFFWGw5U0F5eWxYMDNMRk1iTExZQmdM?=
 =?utf-8?B?OGIySW9FNnBjSWVlSE1tMlJHM0RUZENZL2dFRmlXRUlhL1dnM0MwRmVLajY0?=
 =?utf-8?B?OEhxdFVWdWpxc3VKQmFWQmRMYXo2S2F2RXpFRjJiaXZYSGg2azZSOC9YRU9t?=
 =?utf-8?B?cEk2RFFoeDFKMUFkeUpNaXJXTWwzODQ0TFkvaXlQMkRIK2lDTUhhRG1xM0Jq?=
 =?utf-8?B?NTk2V0hPaGl1QVlnK2JJNW95THJXS2tPdXJ5SkFGL0V1UUNLU0NhQ2lZZmpo?=
 =?utf-8?B?azMvcmJQQ01YUUNDdE9FaytGRXZrdE1JZlIvSllqR04xMUhwaFJ1Nm1rWG5P?=
 =?utf-8?B?dmtzd2IxdGlaellCVk5abEpPbnhydWxFdGFYbE1ZMStJR1ZNcGF4RGlkU0dY?=
 =?utf-8?B?dHoyU2pWRnZrZytUOGNKN0wwVDcxSHhLZWs1N0NvV0pzVExHVTRhemkvOUdN?=
 =?utf-8?B?b2NhR3RDaDVYMFlaSE9nRHNERGY5MjNSTUx2WThvOHl3VGVzRCtzODZuRGV0?=
 =?utf-8?B?Y0hsTGFtVHNZQnNkMUhpRjVhY2RGdDIyaFBuTUNLY2RrWFQxTlorTWdDclpT?=
 =?utf-8?B?enowWkRBeFk1Q0JqMVJPYXV2ZlpRUWFGcWpXWE94KzVmM0FyREtGd0FBMkFY?=
 =?utf-8?B?UEZpTmlicGQzMjJaVFFqdE9LK3ZMcGJuVnlFQUViTitpSlM4ckE5MnU4QVBB?=
 =?utf-8?B?THJhUFcxMExrNTNlMFV1bk9MNnQyNkluQlNtbktzSFViQXg4NVFxNVg1UlVJ?=
 =?utf-8?B?aGtiVDN4UW9FSVJsTWpPbGFDWDF3eThMZDUzd1MwSkRLenpRVkdDVXZwTnJJ?=
 =?utf-8?B?Rmx4L09OdDNYeVNXVnV0bkYvN3FWeE9LWlA1SHdtUzkzSXZHSGUrK2daVHA2?=
 =?utf-8?B?L0EzTXF3ZjBsS2ZCNUlFUWE2QXVjU3lJMC8wNmo0ZGdpSUVZNzJrSitBcmxO?=
 =?utf-8?B?eGtWS1lvUm9ybkxhMTZoTTUyaXNwa1owSjQra29BWG9ZYVBwZEhLcS9JL0pR?=
 =?utf-8?Q?Dido=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21vUHc3NHpyRTBTNkFwQ0FiL0lhSks0TzBOOEo2eTVLVzJ3VWZjQzl2ZCtX?=
 =?utf-8?B?RU51NFYrTDErUnI4bU1IODVQOTFNRWtNZk5QNWR2NG9JUXBoV3hlL0NIaGpG?=
 =?utf-8?B?VWlsWlM5VEFlVjBEeks0MzFzMy9Eb3dNbG53WnZYdUM5WHJWMXdCSUJGZVRl?=
 =?utf-8?B?SlAxK2VWY1FQemJobldJR3RlMklrYnBpcmd4VVpmUmRaZklvNDBlazBTYmUv?=
 =?utf-8?B?R3AyOFRRUnp0RkMySlNIWDFxaHZrY1ZrR244aGdFMmt5cGxNVVV4YUEwdnV0?=
 =?utf-8?B?U21qWWJZVUJ6Rk5oVnBWOWFiWEpQTWs4akVqQTQrd1IvOEdHcWhJNXZPZGw0?=
 =?utf-8?B?N3hYYnpERVdqeERqclRWOFpGdnhObjlpYlhLcVFNcDFrWXZlOGVCNEx5T2px?=
 =?utf-8?B?MkZ1WVFqYmt1NDNCdmpLeElEdDFUbnpJOFp0N29IRitLaTRXRTdVb2QrT1JT?=
 =?utf-8?B?aEpoUERIa2ZMY3lCN1JaYzUxRXpJSFJRUVRadUNCQzVtZnpZTHJHRzdTdXJM?=
 =?utf-8?B?eWRFVFY3elAyNU9hazNmRUkyV0RNNGdSWVJ2UEVtWjYwRjhvZ3QwTzhJZVNv?=
 =?utf-8?B?bldWQUliMXE2bHVWZ1V1ZXlNQzBLVTFUVERoTU53N0V5MEFYYzdsRDM2Y3VG?=
 =?utf-8?B?RU9JMmFaUHJRV3FjU2M3NXJEQ1cwZHZPVS9oSHJrK2psZ2M4MTdhTHZQYXhv?=
 =?utf-8?B?dFBBWmEyS3JRaUdteUZkK2tJQWN1Z0sxUnhYYmgzd1RnZW5sUWE4b2paL0Fw?=
 =?utf-8?B?WmFnMFJueDFNMVZiUHh6Q2RIbWVnMldNMTZWKzZwZ1IwY3hldkNpQTBxbmlj?=
 =?utf-8?B?RXUydzVtMk1XM2QyS2FpU2E5RGdGeDVZbDdsQVhVRkpldFd3SWo2aHNPV1Vq?=
 =?utf-8?B?SXk1RCtOeng1OHdwUHBKeEVYNFY1ZlZQSXRMS1RZZlE3LzlzUXFtdXdic082?=
 =?utf-8?B?M3JqbDJqaUpRN0hqSnA0MVdwNDM2T2VwdzB2MDBZNUtBdXFGUHRueUFTN0E2?=
 =?utf-8?B?U002d0s5QVI3VDgzVWpsUFlrKzd1ZERzTmhkejBDOVc3cVk4RXV2cXIxVFRs?=
 =?utf-8?B?UytaYm85Ty9uendweTFxaWJBaVdvVjBGTjRxOStRbUlHQ0g0SVR2SzZPd1NY?=
 =?utf-8?B?YmhrWi90LzV1QXJkZC9BQUY4aXpybmFzZ2pLTWx4VmM1UXd1alJEeHJOd2NJ?=
 =?utf-8?B?VlZ2cy81c1ViN2MrNFNaK0hDNUZkQ21raXJyVGdQUWs4ck5UM2U0SzBwTXVN?=
 =?utf-8?B?dTh5RnRCaCtDQURpUnNMNGg3VmNselp1a21rbzVaUXIwb3V3bTlZajYvM21O?=
 =?utf-8?B?a3VJQ0phaEtKRCtXcEROci9FNkFONnBpWkl5N0lWaXRIV3owU2JXVksxWXpD?=
 =?utf-8?B?T05mM01lSjRNTjE3V3FlaVpYKzdreFlVUHFnTUtFMStKb3d1RUlDWVVxeER2?=
 =?utf-8?B?bDBxbmwvK0gvcHBQdzJqZFZud0padnI3OHBzN3hSOTNnV0d4SWxManpyd1dP?=
 =?utf-8?B?cVlSTHdkVG9DOUQ0c2ViRjNNN08wZnJqTTR0a3lhaUJZVjIyeW9DalU2MlZO?=
 =?utf-8?B?eE9ISlB1Wm9ZUkxFQ1gyMG9ic3NPdnJvOW1HcXNqM1hTOVJsTVJZZXpWYjZ2?=
 =?utf-8?B?U0R0N2x1dFczTU1CTXI5cm90Ni9SdTZEVkNyYmF1QkNYU2dZUFdkUnNiNDY0?=
 =?utf-8?B?dnRNN0tza3dlRlZhbktDWURZUjRhUG9YRnhiWlk4aWZGNEhWYW1sK2t3N2xR?=
 =?utf-8?B?TGxMcy9VMnhvNHJKTWlNMmNoK0kxUERXWG9sVktVY3BKTFF0d1NUZnd4a0VB?=
 =?utf-8?B?UTA1bzBVZXFwTHgyckNwazZ6MW9JdGlBamVjRlJ0YU8waE1EYlFBRHducTl5?=
 =?utf-8?B?cDlaZG1TdWtQL01qWE53L0dNNGt4ZG9TQWEzVkJxdGtHdko2dkhDUy9CV0dI?=
 =?utf-8?B?bTJQWUN5RUxDZCtnLyswVGMzdVRhcHNReUJnbzl4TDJsT1hRVXVtYzhOYjdP?=
 =?utf-8?B?dis4UTQySjBBeHdlN1lCQ0dZY3pjOCsza0JBT1J2eW9YWDhFdW5kcUpQWk9R?=
 =?utf-8?B?ZTA5QmxpNmhsNEZmNEoxVkJFUHVSYWZsYndCc0sxa0pKRnczWEZ3QTZaelUv?=
 =?utf-8?B?TFNMRHc5dVg4UmZBeUhPTWU1Nlc1ekYwdEdtYnloOWVYd0NXZDNXc002cGpT?=
 =?utf-8?B?ZFdFejVvSDdXa1RmQnRDSnJ1bjBVUlRBODVjYWFNRFBxSytZeVBJTUs3MmN5?=
 =?utf-8?B?MC9oQ3JFS2ZLaW1yVTZCZTljYzE0TEd1ZWFEdStzdmhxUFA4aGFCNmpvTUZ2?=
 =?utf-8?B?WDhGdEFiSzJzUmFlam1GZGlFMzZYa2l5VVdoTE1Iam1KYWJHVk5YMlFHNFAr?=
 =?utf-8?Q?JIdb1smKyF4S2sFtpkpIZ9ihoNk3Pp870ZCSv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d86c4b-591d-4713-c4ce-08de72e4fc9d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:08:15.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZE4f9fjOkxYRe5Hen6m0rbh1Gfl7THzMSErkLMoZLxdfTycmXfDJB/YwU5150ghvebs0YSAy00SiuUAwX3ln/3k7ePVApnbGIni196b9f9vSdyO68gWKbz2/2RgBGHCT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_16021865536 applies to both media versions 30.00 and 30.02; since
> version 30.01 is currently unused we can consolidate the two RTP entries
> into a single range-based entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> 

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 4009323da8021cf5791a96e119b7b71b64eb4431..092d46f48165d17b0ab4bf2a7e4550b97e137aad 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -267,13 +267,7 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	/* Xe3_LPM */
>  
>  	{ XE_RTP_NAME("16021865536"),
> -	  XE_RTP_RULES(MEDIA_VERSION(3000),
> -		       ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
> -	{ XE_RTP_NAME("16021865536"),
> -	  XE_RTP_RULES(MEDIA_VERSION(3002),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3002),
>  		       ENGINE_CLASS(VIDEO_DECODE)),
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> 
> -- 
> 2.53.0
> 
