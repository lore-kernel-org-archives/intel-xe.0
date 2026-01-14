Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C4CD30CF5
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 00:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00E910E392;
	Wed, 14 Jan 2026 00:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+HlZ7Yc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E8610E392
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 00:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768350345; x=1799886345;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GCe5huPMh15pmTBnwFRhv202ObE4i1K9S4zbYZKu7Ts=;
 b=K+HlZ7YcCiwU1Ax+dmvL49w/r/krmu0wpjeqW3ucjbU5pIuMmnoOed/q
 KDlGJ1Au5VHOgESRlDpSVJiYKM7gn3IzyXPMveGJ8vgS+FyMX+bzADIy4
 YcsWDBeYSF1ytJNKxIKKtsUE21JQf3igvb+6AS8WUDe4WMYtYY8h3edM1
 cL+qCJtXjOm56YAmrXaq1e0rTm07RFU67/skFeVO4PZJX2s6+R3h2b8lB
 j5xP5wyBKrexZs3XylIBpiz8igU0WDuUzgUTt2v5w6VofzRLqqDW7BSR7
 IBTTbWm+KJce4R+cbldrO1rbf/Zt7CLvGjHigMouX299b9iTNx7JhSk+3 A==;
X-CSE-ConnectionGUID: r0Ub7H/aSd2hkdvzccv6sw==
X-CSE-MsgGUID: Vqjt741QTdCW5X5dEmc32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69382093"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="69382093"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:25:44 -0800
X-CSE-ConnectionGUID: j6EFC28ZQMq4WrQd2IazzA==
X-CSE-MsgGUID: zOIJub2+SnS3CSO0NRvgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204319912"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:25:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 16:25:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 16:25:43 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 16:25:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDd1X4G1wEgEEDH6W9FUUPRqD9SGiBAlxgNTjgBk2A8BQUTTrOsRsZJBaXTrJCutk723bf/nqEw9nAv1ffd318/GE1Ot6i/apbICL41DL163xxFvywXAZKoQZ01K4hQ4zxdqE99ov1RO85GIK1EFLn3fyfJW9n3FnsCeHlxQwQEXW3gU8u5racp6iQfdaeqZUq6Im7+fYBGyXUokQqDLrF6otUhwj3cd9cPtFj2rBdpYXDFb1+bY6qbP5wWOmMflb87LRdzo0mQZhkVyTFUAHR+JkQ0uJ8NTxb57CxfBdioECkYXRiWLZSa182VO5MqE7k/1OqCBDIxooJtCPz+BhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zs7luQ6cFOfIS3fbyy/pjpZaF4DR1afkH4U6+AOhgbw=;
 b=o/qh6AAD9moiGSyMFrLiUxUlxUGXAks3FQODG9PvMfdDp7mjU//Hr6V0ildV1aprKpcpvGll9ZT0DFlRXSDawpILLbMFEbSh9sKaJa233B0KXuuTG3kUlpMtZt0ev7ebqFeW5cr+NLLs/oHUWVPIZQwnoS9qnqVsnTFmuBffSDMg8Ke/w7/MnpwUYVdPtsd4u2QzTWly6/X3fZS8kFBJoqIcHuqn8AiDTwY5YeCOxjaHYYlGeEkhdtQhCvMZcmZ90m6Cdl2NkWstzii2A+Pm0iu7sG0fr/OG5NTlfN4HQAWkUZRy1QWHUlJpSHtTF1KazbZQoqEeHXcILMWIoA2MCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 00:25:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 00:25:41 +0000
Date: Tue, 13 Jan 2026 16:25:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 11/12] drm/xe: Add context-based invalidation to GuC
 TLB invalidation backend
Message-ID: <aWbigiMoVLMzSBux@lstrano-desk.jf.intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <20260113025232.3504648-12-matthew.brost@intel.com>
 <ba1c6cb4a6f171d4faef8f00baaedd02ae2189b4.camel@intel.com>
 <aWbCcsiYM4hv1W+N@lstrano-desk.jf.intel.com>
 <c020446d914494e6f5d08eaaa055cef5ab0fbc0d.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c020446d914494e6f5d08eaaa055cef5ab0fbc0d.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: dabcd197-2625-4996-1620-08de530372bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGdDS3dFbHFZLzczeFpqSWdWb09YdmZkeFlqT3A1dHNhMjlHMVR1bGpuMTUx?=
 =?utf-8?B?WUptM1ozTHBUR3R2Rk1OMGNBYjhLTmRwTUJFdkhiMk9KclV1ZjAwUUtlemlx?=
 =?utf-8?B?Yzh0V3lJZWVFYUhTNk5VNEI0VlkzRCtqckdQRTNLTFMxTzBPREtyZ05PZFpQ?=
 =?utf-8?B?eWplcGtWQ3hnd1FuZmx2TnVPVUxHZ09seFBwWit1aW51cXU3TjdQVG9xRVBB?=
 =?utf-8?B?VGRxRzRQMEZocURqM3AwVFhjYi9XTVZiTityQ0RZY2YyVDlKRUU0azVTSlI1?=
 =?utf-8?B?SStodWFvYk5xUHpwTGV1dHhlYUc4UGQ4M2EwQ3FkM0dPQXAzc2tzYkFmYjRN?=
 =?utf-8?B?ODFlRE9UMVZKaWhXRk9iQTN2bFgxM2oyU0ZmTWV5bXo2WC9yek5Jd1VQSVBX?=
 =?utf-8?B?a2NBU3V4RTFZbjNKNHh5RmlpcW1GN05nNlM3MjY2dWRFRFpPc2gybG5VS0V2?=
 =?utf-8?B?WjhFVm1PREhTU0gzQ0VwTXBVNTJiMlh6cTFsODhvcEJubFpzRDJjcWZQMXRq?=
 =?utf-8?B?Q0pyWmJBZWpkTTlUUzkyYjE2bEVOSnZ0dlZ2NUNyNzJ5Tm9kdGtrV21WNW44?=
 =?utf-8?B?M0M2ckhPc1BtM0x3K29pb1krMHdNcmFJMnh2aHF4MkdMUXN5NlF5NDJMTzMz?=
 =?utf-8?B?b21rV001TmMrcTdCOWIvOXFXNVRCa1RCSlN4UnFUdkRzYXdyM2ZvTkZ4anZ4?=
 =?utf-8?B?aFQ1ZGR6TXhkcG1zcjNLMUlrM2hEcGo1bDRyNTMxVFdZcWNka3N3cGdOZHpS?=
 =?utf-8?B?NHVNcEpLRjl5UUtHUEgvaGpFV3h4MHdtTmQ1RCt6Zm9UUTkvNDJYZlZPb281?=
 =?utf-8?B?d09Cd0I2Qk1OaVhGU2QvMXdSL2RuclJ1N05STVpFbU5jVHFuU25veUpJblMv?=
 =?utf-8?B?YjZOa0JuU3NCQUJQQmpPRGFuQm4rUjY1RmlPSDZKb1lyeXhackJWa2FYeDBu?=
 =?utf-8?B?TExVTE12UGtvSmx0ZVdaRVk4MVZnM2pnZjc0Mkt0b0E1a1d5STJ2MTU5S3hU?=
 =?utf-8?B?MFRMN0grRVZlWThRVkFxOEkrU0U4SExTd1NKd1prd0p2bW43ZThMVlJvQ3Na?=
 =?utf-8?B?UTIvaUVWMThOb0ZVWHMramZuK0VEMllXOXZ1K1o1OFhzUTl4WTRZN1p5Z3lV?=
 =?utf-8?B?OHJJQm01TjBuZHNSMEw2eFhVTGZGTnBNSkNGZ0FTY0hSZEVEN3RaZStFT0R0?=
 =?utf-8?B?a3hPZkRYM0k1VVRrL3dObUVoYVdjNXhrTkd1U1VtTFgrRWh2eXV2MlhaU0pW?=
 =?utf-8?B?MDRRd3UyeHU1ZzYxdVpEdTBySEs5akxhb08wYnppVml0bTZQTExpTVdhNzZR?=
 =?utf-8?B?d2kwQWxBQW9jdGhmcTl4UWg0dndHSjhYK3oxTENhY3pUOHN0SC92L1dQUldM?=
 =?utf-8?B?UDJaelMrdlpQakM3ZTc3VDNEZmdaWTNWNDF4WExHWFpPZS9tcFVaWWRDYVdH?=
 =?utf-8?B?UTJqUVdKdVNpcFVEcE4rSXN3UTVtZllaOWRqMSswQk9SdGtOT1RQZXYvemdR?=
 =?utf-8?B?TThNSFhpQUFieVZaLzdXMnFFREExejZBUUlaUHpRNHdGZWVmUGJxUDZ5aGpK?=
 =?utf-8?B?OHRPc1EvV3l3MUVlVzk0RmpuQXNpWml0eHJBRUV4ZlVDeUtBRmw1TGxGTlRH?=
 =?utf-8?B?M3ZsNGsxOVdHUVMrMVJNQkUvbFFSdFF2ZnY1MndBbk5DUkFuc05URG91SmlK?=
 =?utf-8?B?V0lhWXA1QTVnRVlMeDUydDRlbHVqRGd6OHN2aUdublNDTktTblREWDhNaXFU?=
 =?utf-8?B?ZzZENys0RXpUNDBjN0pKYmdITWlYakczVWhVUGxPTWdZVkJSV2dJL0tZQ3dm?=
 =?utf-8?B?WGpLaDhmMnNoM2JrdVNJWHN2OGRJUnlhY2N1aWcyWU81RzVjaWpMbFB0Q0Jx?=
 =?utf-8?B?blE0eVRCOXgyZlcrNWZJdW1CdEZ1Ym95SlFLcnZGakpOYXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0djV1JHbXZvVGl1MkdoVDBKQkJVdEJsZGhWVUdUY05yRGNzTnNqaktJaHFN?=
 =?utf-8?B?VFR5eFZDSythYyt4ck9yZjJXUFZ5TzAyWmJ5bndLNXp2K1hibjgxQ1dhZUsv?=
 =?utf-8?B?RFZkcDlWMlFkd1NzbWt4M3hrK21UbGE0QTJORkQ2S0YrWFoyVmhXNFZtcGpk?=
 =?utf-8?B?VkhNNnIvckxDL3hJQlozWXN1NFJpSnBSMnlIMkhBU1E1QUJyajFaMUVmZitU?=
 =?utf-8?B?akhiYlVOYWxtTExFOGs4VXdKQ0ttSDM4OW8xcStrT0tsL0pxWFMyVTZ1QmRT?=
 =?utf-8?B?TmxvRHlrTTl3U0xwREg3VUl1RmYzc2NkaG9QczlYRE1uYzRwdkgyVms2RzFO?=
 =?utf-8?B?NTlMN0t5a1c3cmduVWhoa2VNNjdPRlRRL2YwMThQMTVYY2NpUDkxRnhpdE0v?=
 =?utf-8?B?UXZYWFJLNjdKd01GY0JuOEpFR01zRG5RQ3NQQldtNWYxWkpQRStVNG1WS3U3?=
 =?utf-8?B?U2pYWk1VVGFjbjNSTEduRDJGUnBHZHZRZUhUdHF4MWQrNVZGRW0vb2tKM21z?=
 =?utf-8?B?Ly9oaE55bkwyODErVmdWNDR6QldjeTgyN2E4VE9CeHhvOUhJL3NOOFBTTEdy?=
 =?utf-8?B?QXNTbWpNaUM5RUUxZGp1bWZkeURnUmFrb3pNak1SSGc2V0FkenFCangwb3U1?=
 =?utf-8?B?VkFVaW0zT29TMnQzcmxna0pNMzdSaklHWFhUSzhrYnJ1bm9mZ2E3TjJja3lQ?=
 =?utf-8?B?azdPV0NGUEFkaElGcTVBM2lUbWtWT2JHVzFCbXlHVVI0OW1pWVdNRlNKUWZ3?=
 =?utf-8?B?T3ljUFV1QVYwbFdaN0ljS0UwMXRhTlU4YWU0bmFNOHZVN1dDR1krUVZTMURz?=
 =?utf-8?B?cUVlUk9pM1orV1FQcVdDMWtKLzYwSkQ4c1dtQnFuUmtKNEM2ZUJib3Y4eWh2?=
 =?utf-8?B?MzJaSFZKTThJNm1heVFZQmIyZUJrSXVaTDBCTjdSajltNmpGWnZYOFJLZ2pT?=
 =?utf-8?B?SU1FRGZUZ1dueDBUc3NEVklhMVVuNmRUdDBZMFU5QkNhSjljUEVRVmJnTlg4?=
 =?utf-8?B?NFNDbDRwbForbFMzazhVMWNuOXBiRDdvd25lTkZYNEtmdi9LUUFrMUxEMjR4?=
 =?utf-8?B?TVk2dEZ6YjQxWGF0NWdXZjBZYy83QTNYWW15OHk2ZUNFZXlkK0taYUE2Rlgr?=
 =?utf-8?B?MDhKMHpCRzNjWGY1MTRjTjhjMXFtZjR5aWJwRzU4QlgveXdGZVA5K3hwUlIr?=
 =?utf-8?B?SE9KTWcySG9aZGVtWURvMUdRc0E3Y1ZUWkFpM2JWbG9VRzlHWHd1WHRsMm5o?=
 =?utf-8?B?ZGpoQkxQTC9WZWp3NEhmajdKU3l5N1pmc0RKWUF0MlNLOEUvanZ2OHlCOTVK?=
 =?utf-8?B?SHZibndiaGxCbGh3RU0wNlBQbWw2TXhYR1JpVE01Q0Nla2hGUVNIVEJ6OUNY?=
 =?utf-8?B?NnpYaTNUc01NcTZVa1JVVjI0N0lMRWF6bzlXYlJHem5BckpUV1J2Zkp4Ri9X?=
 =?utf-8?B?V3dxZnJuMUlLNjdSTlovSDk4Mkd6ekZyN1o0dmVsdDAyOUEzMXZ3L0tQNitI?=
 =?utf-8?B?Y1ZZT0xyc0tNRURTU1FTaHVmY1ZuUCtHODlKelJBd05RbkdMR1FteTZhQk4z?=
 =?utf-8?B?VUVWZzVvTDNROWpxN2g2UDlPdXc3eTdsS0N6QWRlLzBUM083N1dUbmthS0ZP?=
 =?utf-8?B?YnozU3p3T0VBOFpkQ0FHa2h0d1RBWnRoQ25uRkQ1RGhMWngzMHRhQndIQzlz?=
 =?utf-8?B?d1E1VzhERytTOG5NSE1pQVdxeXBnekduTGJzcFgvVHB1VUFGdGw1eWtvYmxp?=
 =?utf-8?B?NExNeFhjQmFCUTIwNzZQMEowQzh5VXFnYXZPVTdEcjkxOW1xM1VrWVpjSEgv?=
 =?utf-8?B?dmtSRVl6dWRaSGFNZUU3RWZIZTZ5T2YxTG0zd0d0RTV1UG1aL3g0RmxvaDNR?=
 =?utf-8?B?eWEzeDdUeWRDanpjZTlTcG1KT09ESlh4bWxlZ3FrYUtlWTRCbEdyQmZZZ3J3?=
 =?utf-8?B?bDVacWJEK0VQdE1YcCtYc1FYZW5DaEh5bkE4K29CRDFSUzNjdGlWZTM3NGFn?=
 =?utf-8?B?MGJ5eWRITmE2bVBsa0V0eGtkN04wdWU0RWhVNXkvK0UrRFhHV1dWM3gzTlhz?=
 =?utf-8?B?RlVWMDNrZlhJSTErU2ppZVkwTzJVZXA0NFBQWWh6YXJSQloyZ3VZNXVvVnE4?=
 =?utf-8?B?RmFKdkdpTjZMYnNMTnNtaUM1dEc5WVJQQTY3OHpmOHFmWkpnVFJCMzZtNjY2?=
 =?utf-8?B?QzhxZG9GazVMNmlZRUdxWWQyUXBiSVZCOGVlYWg3Z0JUNkdleTJSU2gzbEl1?=
 =?utf-8?B?clpROVpzZjdjZWJlRXptdW43TURYdXl5T083V1EzNzN4UnlQdUxkeFhZb1NM?=
 =?utf-8?B?NlY2c0JmWjBXOGtKdWRncW5ERkFTMlhBclVoT1d4YXhEQ0lGWmQzM2lqVkhs?=
 =?utf-8?Q?WLrvlBi/6dMvPfuk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dabcd197-2625-4996-1620-08de530372bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 00:25:40.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EhJvzS+VLVX2x7Lw+n//tjpBUDUm8WCjnufVF8k9nfJTp0FTnMHwqw4swcBNoD7qva6Mn8dmhn1ZJYMbVA0sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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

On Tue, Jan 13, 2026 at 04:25:57PM -0700, Summers, Stuart wrote:
> On Tue, 2026-01-13 at 14:08 -0800, Matthew Brost wrote:
> > On Tue, Jan 13, 2026 at 02:23:57PM -0700, Summers, Stuart wrote:
> > > On Mon, 2026-01-12 at 18:52 -0800, Matthew Brost wrote:
> > > > Introduce context-based invalidation support to the GuC TLB
> > > > invalidation
> > > > backend. This is implemented by iterating over each exec queue
> > > > per GT
> > > > within a VM, skipping inactive queues, and issuing a context-
> > > > based
> > > > (GuC
> > > > ID) H2G TLB invalidation. All H2G messages, except the final one,
> > > > are
> > > > sent with an invalid seqno, which the G2H handler drops to ensure
> > > > the
> > > > TLB invalidation fence is only signaled once all H2G messages are
> > > > completed.
> > > > 
> > > > A watermark mechanism is also added to switch between context-
> > > > based
> > > > TLB
> > > > invalidations and full device-wide invalidations, as the return
> > > > on
> > > > investment for context-based invalidation diminishes when many
> > > > exec
> > > > queues are mapped.
> > > > 
> > > > v2:
> > > >  - Fix checkpatch warnings
> > > > v3:
> > > >  - Rebase on PRL
> > > >  - Use ref counting to avoid racing with deregisters
> > > > v4:
> > > >  - Extra braces (Stuart)
> > > >  - Use per GT list (CI)
> > > >  - Reorder put
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 145
> > > > +++++++++++++++++++++++++-
> > > >  1 file changed, 141 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > index 070d2e2cb7c9..ced58f46f846 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > @@ -6,15 +6,19 @@
> > > >  #include "abi/guc_actions_abi.h"
> > > >  
> > > >  #include "xe_device.h"
> > > > +#include "xe_exec_queue.h"
> > > > +#include "xe_exec_queue_types.h"
> > > >  #include "xe_gt_stats.h"
> > > >  #include "xe_gt_types.h"
> > > >  #include "xe_guc.h"
> > > >  #include "xe_guc_ct.h"
> > > > +#include "xe_guc_exec_queue_types.h"
> > > >  #include "xe_guc_tlb_inval.h"
> > > >  #include "xe_force_wake.h"
> > > >  #include "xe_mmio.h"
> > > >  #include "xe_sa.h"
> > > >  #include "xe_tlb_inval.h"
> > > > +#include "xe_vm.h"
> > > >  
> > > >  #include "regs/xe_guc_regs.h"
> > > >  
> > > > @@ -156,10 +160,16 @@ static int send_tlb_inval_ppgtt(struct
> > > > xe_guc
> > > > *guc, u32 seqno, u64 start,
> > > >  {
> > > >  #define MAX_TLB_INVALIDATION_LEN       7
> > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > >         u32 action[MAX_TLB_INVALIDATION_LEN];
> > > >         u64 length = end - start;
> > > >         int len = 0, err;
> > > >  
> > > > +       xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE
> > > > &&
> > > > +                         !xe->info.has_ctx_tlb_inval) ||
> > > > +                    (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX
> > > > &&
> > > > +                     xe->info.has_ctx_tlb_inval));
> > > > +
> > > >         action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > > >         action[len++] = !prl_sa ? seqno :
> > > > TLB_INVALIDATION_SEQNO_INVALID;
> > > >         if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > > > @@ -168,9 +178,11 @@ static int send_tlb_inval_ppgtt(struct
> > > > xe_guc
> > > > *guc, u32 seqno, u64 start,
> > > >         } else {
> > > >                 u64 normalize_len =
> > > > normalize_invalidation_range(gt,
> > > > &start,
> > > >                                                                 
> > > > &end);
> > > > +               bool need_flush = !prl_sa &&
> > > > +                       seqno != TLB_INVALIDATION_SEQNO_INVALID;
> > > >  
> > > >                 /* Flush on NULL case, Media is not required to
> > > > modify flush due to no PPC so NOP */
> > > > -               action[len++] = MAKE_INVAL_OP_FLUSH(type,
> > > > !prl_sa);
> > > > +               action[len++] = MAKE_INVAL_OP_FLUSH(type,
> > > > need_flush);
> > > >                 action[len++] = id;
> > > >                 action[len++] = lower_32_bits(start);
> > > >                 action[len++] = upper_32_bits(start);
> > > > @@ -181,8 +193,10 @@ static int send_tlb_inval_ppgtt(struct
> > > > xe_guc
> > > > *guc, u32 seqno, u64 start,
> > > >  #undef MAX_TLB_INVALIDATION_LEN
> > > >  
> > > >         err = send_tlb_inval(guc, action, len);
> > > > -       if (!err && prl_sa)
> > > > +       if (!err && prl_sa) {
> > > > +               xe_gt_assert(gt, seqno !=
> > > > TLB_INVALIDATION_SEQNO_INVALID);
> > > >                 err = send_page_reclaim(guc, seqno,
> > > > xe_sa_bo_gpu_addr(prl_sa));
> > > > +       }
> > > >         return err;
> > > >  }
> > > >  
> > > > @@ -201,6 +215,114 @@ static int send_tlb_inval_asid_ppgtt(struct
> > > > xe_tlb_inval *tlb_inval, u32 seqno,
> > > >                                    
> > > > XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > > > prl_sa);
> > > >  }
> > > >  
> > > > +static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval
> > > > *tlb_inval,
> > > > u32 seqno,
> > > > +                                   u64 start, u64 end, u32 asid,
> > > > +                                   struct drm_suballoc *prl_sa)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +       struct xe_exec_queue *q, *next, *last_q = NULL;
> > > > +       struct xe_vm *vm;
> > > > +       LIST_HEAD(tlb_inval_list);
> > > > +       int err = 0, id = guc_to_gt(guc)->info.id;
> > > > +
> > > > +       lockdep_assert_held(&tlb_inval->seqno_lock);
> > > > +
> > > > +       if (xe->info.force_execlist)
> > > > +               return -ECANCELED;
> > > > +
> > > > +       vm = xe_device_asid_to_vm(xe, asid);
> > > > +       if (IS_ERR(vm))
> > > > +               return PTR_ERR(vm);
> > > > +
> > > > +       down_read(&vm->exec_queues.lock);
> > > > +
> > > > +       /*
> > > > +        * XXX: Randomly picking a threshold for now. This will
> > > > need
> > > > to be
> > > > +        * tuned based on expected UMD queue counts and
> > > > performance
> > > > profiling.
> > > > +        */
> > > > +#define EXEC_QUEUE_COUNT_FULL_THRESHOLD        8
> > > > +       if (vm->exec_queues.count[id] >=
> > > > EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
> > > > +               u32 action[] = {
> > > > +                       XE_GUC_ACTION_TLB_INVALIDATION,
> > > > +                       seqno,
> > > > +                       MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > +               };
> > > > +
> > > > +               err = send_tlb_inval(guc, action,
> > > > ARRAY_SIZE(action));
> > > > +               goto err_unlock;
> > > > +       }
> > > > +#undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
> > > > +
> > > > +       /*
> > > > +        * Move exec queues to a temporary list to issue
> > > > invalidations. The exec
> > > > +        * queue must active and a reference must be taken to
> > > > prevent
> > > > concurrent
> > > > +        * deregistrations.
> > > > +        *
> > > > +        * List modification is safe because we hold 'vm-
> > > > > exec_queues.lock' for
> > > > +        * reading, which prevents external modifications. Using
> > > > a
> > > > per-GT list
> > > > +        * is also safe since 'tlb_inval->seqno_lock' ensures no
> > > > other GT users
> > > > +        * can enter this code path.
> > > > +        */
> > > > +       list_for_each_entry_safe(q, next, &vm-
> > > > >exec_queues.list[id],
> > > > +                                vm_exec_queue_link) {
> > > > +               if (q->ops->active(q) &&
> > > > xe_exec_queue_get_unless_zero(q)) {
> > > > +                       last_q = q;
> > > > +                       list_move_tail(&q->vm_exec_queue_link,
> > > > &tlb_inval_list);
> > > 
> > > It would be nice if we could consolidate this into a single list
> > > instead of moving things around like this, but I realize this makes
> > > it
> > > easier to track the last active queue so no issue...
> > > 
> > 
> > Yes, the active check is stable exactly once, which would make it
> > impossible to find last_q if we do two passes.
> > 
> > 
> > > I don't see anything blocking us from deregistering a queue though
> > > after it has been moved to the tlb_inval_list here. Should we add
> > > that
> > 
> > The xe_exec_queue_get_unless_zero is what makes this safe.
> > Deregistrations are now completely tied to the reference count, which
> > changed here [1]. A reference count of zero means all jobs have
> > signaled
> > on the queue, so there’s no need to issue an invalidation.
> 
> Oh I hadn't seen this patch yet, thanks for the link!
> 
> So basically before we were doing this extra reference which meant a
> get/put here would not trigger anything until the deregistration
> happened later as part of that schedule disable (assuming it didn't
> time out or something). By dropping that extra ref, the expectation is
> if scheduling ends after we check active here, i.e. someone does an
> exec_queue_put(), as soon as we do the put in this new routine, it will
> trigger exec_queue_destroy() which sets that pending disable. Is that
> right?
> 

Schedule disable is a bit different. It can happen for several
reasons—the TDR kicks something off the hardware, a preempt fence
triggers, or we switch from page fault mode to DMA fence mode. It’s safe
if any of these race; ->active() just opportunistically checks if a
queue is disabled and skips the invalidation. It’s harmless if a disable
races because the queue is still registered, so the TLB invalidation
will still work.

Yes, the refcount protects against guc_exec_queue_destroy being entered.
We also issue a schedule disable here (or more precisely, the message
scheduler work item does this), and when that returns, we issue a
deregistration—the latter is what we care about and want to avoid. It’s
possible that the TLB invalidation code triggers guc_exec_queue_destroy
upon put, but that’s fine.

> And I guess since we're doing the get_unless_zero here, we're also
> protected in the situation where a schedule disable is in progress but
> we haven't yet hit that pending disable?
> 

The refcount protects against queue cleanup from starting. If refcount
== 0, the cleanup process has already started, so there’s no need for an
invalidation. Again since queue cleanup is the only place that issue
deregistration, this is all safe.

The vm->exec_queues.lock also protects against any queue memory
disappearing in the TLB invalidation code.

Matt

> Still need to get some more testing in here to prove all of that, but I
> agree it makes sense.
> 
> > 
> > [1]
> > https://patchwork.freedesktop.org/patch/697820/?series=155314&rev=10
> > 
> > > seqno_lock in the register/deregister routines to be safe? Or maybe
> > > block until tlb_inval_list is empty? Or if I'm missing it
> > > otherwise,
> > > how are you preventing the deregistration after this is on the
> > > list?
> > > 
> > 
> > See above—I’m pretty sure this is safe. Refcounting tricks wouldn’t
> > be
> > my first choice, but a cross-component lock would be considerably
> > worse.
> 
> Agreed.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> >  
> > > Thanks,
> > > Stuart
> > > 
> > > > +               }
> > > > +       }
> > > > +
> > > > +       if (!last_q) {
> > > > +               /*
> > > > +                * We can't break fence ordering for TLB
> > > > invalidation
> > > > jobs, if
> > > > +                * TLB invalidations are inflight issue a dummy
> > > > invalidation to
> > > > +                * maintain ordering. Nor can we move safely the
> > > > seqno_recv when
> > > > +                * returning -ECANCELED if TLB invalidations are
> > > > in
> > > > flight. Use
> > > > +                * GGTT invalidation as dummy invalidation given
> > > > ASID
> > > > +                * invalidations are unsupported here.
> > > > +                */
> > > > +               if (xe_tlb_inval_idle(tlb_inval))
> > > > +                       err = -ECANCELED;
> > > > +               else
> > > > +                       err = send_tlb_inval_ggtt(tlb_inval,
> > > > seqno);
> > > > +               goto err_unlock;
> > > > +       }
> > > > +
> > > > +       list_for_each_entry_safe(q, next, &tlb_inval_list,
> > > > vm_exec_queue_link) {
> > > > +               struct drm_suballoc *__prl_sa = NULL;
> > > > +               int __seqno = TLB_INVALIDATION_SEQNO_INVALID;
> > > > +               u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
> > > > +
> > > > +               xe_assert(xe, q->vm == vm);
> > > > +
> > > > +               if (err)
> > > > +                       goto unref;
> > > > +
> > > > +               if (last_q == q) {
> > > > +                       __prl_sa = prl_sa;
> > > > +                       __seqno = seqno;
> > > > +               }
> > > > +
> > > > +               err = send_tlb_inval_ppgtt(guc, __seqno, start,
> > > > end,
> > > > +                                          q->guc->id, type,
> > > > __prl_sa);
> > > > +
> > > > +unref:
> > > > +               /*
> > > > +                * Must always return exec queue to original list
> > > > /
> > > > drop
> > > > +                * reference
> > > > +                */
> > > > +               list_move_tail(&q->vm_exec_queue_link,
> > > > +                              &vm->exec_queues.list[id]);
> > > > +               xe_exec_queue_put(q);
> > > > +       }
> > > > +
> > > > +err_unlock:
> > > > +       up_read(&vm->exec_queues.lock);
> > > > +       xe_vm_put(vm);
> > > > +
> > > > +       return err;
> > > > +}
> > > > +
> > > >  static bool tlb_inval_initialized(struct xe_tlb_inval
> > > > *tlb_inval)
> > > >  {
> > > >         struct xe_guc *guc = tlb_inval->private;
> > > > @@ -228,7 +350,7 @@ static long tlb_inval_timeout_delay(struct
> > > > xe_tlb_inval *tlb_inval)
> > > >         return hw_tlb_timeout + 2 * delay;
> > > >  }
> > > >  
> > > > -static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
> > > > +static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > > >         .all = send_tlb_inval_all,
> > > >         .ggtt = send_tlb_inval_ggtt,
> > > >         .ppgtt = send_tlb_inval_asid_ppgtt,
> > > > @@ -237,6 +359,15 @@ static const struct xe_tlb_inval_ops
> > > > guc_tlb_inval_ops = {
> > > >         .timeout_delay = tlb_inval_timeout_delay,
> > > >  };
> > > >  
> > > > +static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > > > +       .ggtt = send_tlb_inval_ggtt,
> > > > +       .all = send_tlb_inval_all,
> > > > +       .ppgtt = send_tlb_inval_ctx_ppgtt,
> > > > +       .initialized = tlb_inval_initialized,
> > > > +       .flush = tlb_inval_flush,
> > > > +       .timeout_delay = tlb_inval_timeout_delay,
> > > > +};
> > > > +
> > > >  /**
> > > >   * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation
> > > > early
> > > >   * @guc: GuC object
> > > > @@ -248,8 +379,14 @@ static const struct xe_tlb_inval_ops
> > > > guc_tlb_inval_ops = {
> > > >  void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> > > >                                  struct xe_tlb_inval *tlb_inval)
> > > >  {
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +
> > > >         tlb_inval->private = guc;
> > > > -       tlb_inval->ops = &guc_tlb_inval_ops;
> > > > +
> > > > +       if (xe->info.has_ctx_tlb_inval)
> > > > +               tlb_inval->ops = &guc_tlb_inval_ctx_ops;
> > > > +       else
> > > > +               tlb_inval->ops = &guc_tlb_inval_asid_ops;
> > > >  }
> > > >  
> > > >  /**
> > > 
> 
