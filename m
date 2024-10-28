Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D81D5B149
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 20:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2227610E575;
	Mon, 28 Oct 2024 20:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxkSNpot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B3A10E575
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730147595; x=1761683595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NJVcg2Sf88NXWHFa+LKRVKJcN+yRD2FcNGkfWVDtkHo=;
 b=dxkSNpotCHWAJuLIDiDRFFTQJtOLAArxRxufaz+l3Dsjr0BDvJUuQn5E
 CJw1GERC3tFO3rqFczCOCKUfkwG3UGju8X4tjsQPF5RrFwVuEY/LYmwOl
 3NTKTFjxFWyDK5+u3HDda4tE+sZ5JNxhnBDXSwUGU6ilCJ/5likCOrtFU
 dhFNygF7/S8IQXVDbxA3610DIiQjhPMD5MSTV+g9QxHPJqfflL2UXBRiP
 seHzu9T8kjcO+dxvUYxKDl8GU5TWZ4C52vl7DWQNpe6LQ98C0F8a4w5rC
 QxoXmAdn+7kLn1jgAcLP+6z2t8Ty4ypv+F/oxYfHv/HvOfiOJ6xObvNFD Q==;
X-CSE-ConnectionGUID: WthGABSFTleN5hyv8g946g==
X-CSE-MsgGUID: utEsEPmtTSWkP7sZtoVd+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41127045"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="41127045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 13:33:14 -0700
X-CSE-ConnectionGUID: rwt3KVwNQ9udp3EdIDvRcg==
X-CSE-MsgGUID: kX8JQ24QTI6lMEAS6wGgFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="82148401"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 13:33:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 13:33:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 13:33:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 13:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5aUBQomyub2Q3IC7PtjiaxhuYowHVOBsh0zG+aHqB6jsG06n/H8GQgTCc3iQszKpwvAm8OQ13RGeVknCJHQkiMQLT5w59KvBnx6QR8J3SOzL1yni1PSwPX5F+dkFfGTNwingnhrtbIQOpaKdR9hzHRGYzmRpHzKjczRGmYxQzg2kY5dJXAS5pahhBbQYr0+6UdxeoipkpdKp6oHTHwwvpIyXOhDB+fH6dwq5FjczZpfWB9Vp5/UJZdwNHUUG59MxyYdL5YN79NPMuQH16U1ziLylwHYsz+24Xo8r8cTcRRL7AoXes9coYXxx4uHylTQ5tytDrpdV/7MLccwm6OouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yKcTj/YirMptn9urVH8n5X5zT5a5OZYQXfKJvLqgwY=;
 b=SVEkX0ARWKav9m8bxOI7uT4SkcOMbZ5GMUFvK7hHOVcv+WZ+WdAdof5XQ0KS7oHRJYrFRp765bwiP77v6usVqhQrs2htD2X2vxjsaGolf8TqP0D6lU84kZkmf9nAWRUQfGOwsA3Mo0kS9yqkJ4wNp5EfaLV79Dns7eI8i6FRYJR0TFioR8NdiZnYIjdxvR938jl9FfrKmehsW5HspcI+A5BcH8f11bsfT6zcXQqiYE2rgnxBfjMKTOrN82jWRgVuCEnWlLjC6ai83BLIcBOc4xkC4hlrW5tGGSTJDVr7rnDl3qJvPUxt2VbqnIdiVAfP/tA6e3FWw6awoFba/t+XpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 20:33:11 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 20:33:11 +0000
Date: Mon, 28 Oct 2024 13:33:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <Zx/1BZ93nLSC1pFs@orsosgc001>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241026170952.94670-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe4e19b-f175-43a3-2ae3-08dcf78fbd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVF1Q21HcXBpUjRmeDh3NUhEUENKTnZSU1NXa1prRTY1NnRPL0JNdGhXNnZj?=
 =?utf-8?B?YXhrNTZJN2EzdzZoa3RnbVRnbitDRGlyZzlBL0R6ZDZUQlNXNGVZME5GQzVz?=
 =?utf-8?B?SjB4RllmR1dvL2ZNdVQvaHoyMWViTDluL2JjNUZDSnN1ekdwbVZHaGE4TjNJ?=
 =?utf-8?B?MWlKTnREL3FIOEpZTkUzbUp2K1ZqNUZXQnRhNkZObXl4d0VPMFk4Z1NNQUNw?=
 =?utf-8?B?VmxXcGNyd3lYSVRLYzBOVjhuRUVDenRZNVFra25Temtmdkw2K21xV0VMNGNh?=
 =?utf-8?B?YmliY2VFRDlvN09aZ2lHemI4dW0wZDN0L3pmRlBzMDRvQmlLcHVocmJvb2g1?=
 =?utf-8?B?UHJoaFNKeVJtUnJxS2sySkJQckpGaFlHczJhUmhNSzU5TnpCbEJ3Wk93Q0RX?=
 =?utf-8?B?bzYwZ1Z1aWluS0NJT2t1bWd1d1RQblkyemJzQXpEQXJCalAzOFJFYWlIUno1?=
 =?utf-8?B?ZkxqU0h3WGlYMWJTREIwUHdPMURqVjd6K3lsbUFxU0NwajMzN3RacVYyMjEr?=
 =?utf-8?B?VHhMcWgwYlZaK1hiZE82TXJYb2tYZ2dKdXpibEExdWpCNmlpWHNtRS8zd21N?=
 =?utf-8?B?ZEJCSEJTUmduRGN6WmVOTkFPWGdRaytmL0x2ZVJOOXJ0ZDlJNUZ5bnJQaTh5?=
 =?utf-8?B?VUFiRWFYd0dGeGRWcFd5NHdqNm5aclZ2aUJYbEp6cC9ucjhraEhDU1NTYlBq?=
 =?utf-8?B?bHc2VXgwZG8yZmFpRnk5VENzWnJzYXNuM1ZKRXlFSFR0YmRCdmZUb2JhN1Vp?=
 =?utf-8?B?L0dWdkgwVzladmhMbDJhM1hHU1Q3eXNERk5oUUVvTDdFdkFpVXNsYStKTGVN?=
 =?utf-8?B?YTlIR09uMTZOTDZMbU5XZHRsNzVST3l6OWFyYllKZ25INkkwaUJmUldLaDBU?=
 =?utf-8?B?SGRqNjEzRXI3Y1BDbkxobjZtNkpUZk1RRUprQ3pDcmQvbHlEanc3clRRYW9o?=
 =?utf-8?B?S01QRFFwZVd0ZDMveWJaOXJhOUttMG1MUFJkYVhWd2pES0pnbC9YaWhCc3dB?=
 =?utf-8?B?ZlZaSkk0Y3NtaEhKTjIrMEFTczJ0eXZLNXRsTnlJOHpBT3VJOU83NEw2Q0tu?=
 =?utf-8?B?UkpTUHBqR2l4dlhOTjRYUlpPOU5wV1VkM3lmRXRKOGVpTWlOOG8yYXR5NWxT?=
 =?utf-8?B?NG1BNDNTUHdwT2dPSmFwTW1jUi9GYjRqUE9QR1NYcXNheHRMMVE1cWR0bk0r?=
 =?utf-8?B?WmQzc0NwV2Z1Mm9GVnMzcEJnYm80Ny9OcUViVGJYVHNpQkZZNEhjOVRlWXZt?=
 =?utf-8?B?VmVHaFBjZGNxS1JDZUhYVzJ3STNsT2VrZ3lkMU5WSTBFMGtmQTBybnhFUzNC?=
 =?utf-8?B?QjR1T3RBbFl3b1Z1dFJvdzRXWFhwbm9pamJqc3VXaTRDdlVlL21zZUZ6ZWVJ?=
 =?utf-8?B?VEo2Tk04Q3huMXlGY0grT3NHd0liZEFHUjl5VlljK25YNWEvVG5qRDNlNVQ0?=
 =?utf-8?B?Zjc1QmJ1L0Nqc2pqNzhSU0hJUGNERGZaTkc3WUhlZmo0MkpZQnMzaDAxUUNo?=
 =?utf-8?B?eGxjTEExRCtKYzkxMTdDN0xqcXY3L0RybUhSVmpPaDU0MUdFd1NiM3AzSlJK?=
 =?utf-8?B?SlBOdjhrTmZQME5ZaW5pQjRoMUw4SmRReXdXR21OdUJxejZOT3Fkc29wRUNt?=
 =?utf-8?B?UWJQYjN1MG1MNmRXbFR3Nmk0M3cvaTRSc29UZURPb3Y2KzlmWTRzS0NDOHdM?=
 =?utf-8?Q?VU+DPd5Hsg9IjlL2aD6b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnMyVDBVTm40bnVBZkxvNnU1TVl0dURpMlU3Rkl1OHRhM2QzTVoxVU5rK1Nk?=
 =?utf-8?B?OW13UHA3NVZzZXpUajUyeEJta3hwdHBpalZlRzdtM2dLMjRnbVl2ZWhWWFpk?=
 =?utf-8?B?V1I4WlJib1R0b1FEYWVmSzd1Q1pZd3R5WkVoK3pRdWVTWk1ueEYrME92cnpL?=
 =?utf-8?B?RVdRVXlDOURsTThxcHR5RVpyckI5U2VUN2F1b0tDWXloV043aVpZeHJBdStV?=
 =?utf-8?B?dlhJeElUWElaV241VWgyV3VsTFl2TFZwOEV6WUdabGFkREhnTHF0VUFBY1Js?=
 =?utf-8?B?OWJ1YW9KQS8wNlZxSlQwKzNrTmc1bG5RcmFwandsQnk4OCtxWHJ0dDBVaTNa?=
 =?utf-8?B?OTNoeEgwdFpLZTVvOGdOWDNSdC9ZRk5Dd20yZEVpYUxtWUpLTGxqZnh2TGsz?=
 =?utf-8?B?NXRkRXhHeElFNkkyMDVJNVc2cXcrRlVKU2NhL3lGZkt6WjRvTy93S3g3RmQr?=
 =?utf-8?B?L2ZKTUxmNFdJRlpVb1JtUWRoM2czR285eTRkR0NFYWVlWGx6RVhkRDRSNkZa?=
 =?utf-8?B?QkZTWnk5TjBSYmovT1g5TlhiV1Z0MGFORmNvWWI3ak1QYU1kSWgwczVhaDNr?=
 =?utf-8?B?TlZLejRDU0R0aFVWY2VjK0VIcXZmQXhBM1hoT2g4MlNFQUxaVkZTb1drTDZB?=
 =?utf-8?B?YkFDaEJCSXovaDlsd3VpSGhWT3lYSk14dHczd0NNbVZnL0ZXV0RTSnRWRnRo?=
 =?utf-8?B?Skx6aTFkSzRjSVJLaHN4ZExyMWlFV29RQ1duNjJRMW1sOFZmSklVSHBxR0Ni?=
 =?utf-8?B?WFFoRk1wZEhlelBscWFIdmdwUmt6VmdJMFU5UnptZ0xkczIxWGQxSm5ZWFp4?=
 =?utf-8?B?MDFqLzFjYmVxN0U2ZnM3L1FsN2Nmd1lnb1dyRnlQSWs3SEpZUEZJMWJlcG8x?=
 =?utf-8?B?N1lKS2FlbFVRSXpmc0grNUM0Z0lvT2VpOVNyZGZQWW13MUJSWitLbzUzV2o5?=
 =?utf-8?B?ZFFveURGS21RYTUzalEyYkMxY2ZoazRVM2pRVTl2MlBwdnk4OGo5YXVnSVhz?=
 =?utf-8?B?MWtnekdkNjJsWnFNZEdNeVp5bEZuQkkzK0pSdjV3OFBtSU1VM3F2Qmd3dll1?=
 =?utf-8?B?Ly8vNU1GbTJTSzg5WWpKWWlJcFZKMHh1dVR5bUh0S1BFZFl6clc5TmI2WmpW?=
 =?utf-8?B?eHlmYnFLY3AzVE9uK2NLeWQyckQ5aVBjYzhPektPS01PSldkTzhGUzBrd1ll?=
 =?utf-8?B?Z0VJMUp6U3ROaW5PY2tHU2hxRlFUeFV4U25BcGl3T0dIaUw3MEJ3VmxoZUds?=
 =?utf-8?B?dnd3QVJsdXVIMTd2LzBJdHJ0c0F3aFlZWit4cXJUQWhUOXR4aWc2T0hFSWRL?=
 =?utf-8?B?SURwV3cxU2p1V2wyYXZ5OFY2bVN4cGEvdEhuTmZnM0ZWbFRoS2FZNDdQMnVF?=
 =?utf-8?B?eUVFcVBaTmRTUm9pcVhJZUgrbkl3M3pIeDUyMFBKekFoekd0MUZ0YXp3Wmor?=
 =?utf-8?B?ZUxQbUZ3YW1OTlBNUUZvK1p2anUyMGxmMG9zbnJpQlJnMzJIRWEybkFxem5K?=
 =?utf-8?B?WEU5cFhyRFVIUUFHeHlDMzRpQVQ5REcyUHRacC9zbFpROThvallNVkVzam9z?=
 =?utf-8?B?aTFHOUhXYXROVWlnbmNhSytLeksydTA4RkJLY0s2UG43NlUySTZhUXZsTFl3?=
 =?utf-8?B?MmtOVytDaWdhdHMvamVnbmZLK09abVRQSlcwc0x4OW1MUVFvaUZJRm9xRWFq?=
 =?utf-8?B?cEo5VGtnS3J2YVZVelE0Q0xkREMyVEo1ZTQ4NVBGSFlSMStOWXRRdFFneE1V?=
 =?utf-8?B?VVVzVHNPZXlxRkdHMlpRcVBGd0Q1S3l6SGlCd3NlUjNKR2FWckFVbDdIcXMr?=
 =?utf-8?B?RVIwcHlyVzNaOUk0dXFxVkdneERSYmREc3piN0F5ZXZFdDgwY2hzYkczTzJm?=
 =?utf-8?B?TjZiNXJBOG53dEc3cFFmR2xwcTBXSWFhdDBYL25Jc1VzMU1kOFRCOUw0aXpn?=
 =?utf-8?B?YXNUZGZZYkNLdWhicElZK3JzSHYvbUQ5ZjV6aDRkWmRQWnRDMXF3Z2R0SXF5?=
 =?utf-8?B?M2pod3N1U2hEMCtZMnNSdHp4M2ZjTVVvZEJMRGNqdUpKcm5FL0FXcjg4NFlX?=
 =?utf-8?B?dkNDSVZrcy95bVY3TjFVVVd3cGJ3VEpBeTlteGxaZG4xeUdhd0l3N1QxbWNL?=
 =?utf-8?B?bWx4VEt1akpEZm5VNUJsVWhhV0VKZnRaVUx0ekZ3SWhxOEg2aldSUDRlWktC?=
 =?utf-8?Q?gKcvwlboukdTgD4RkBDo47Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe4e19b-f175-43a3-2ae3-08dcf78fbd81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 20:33:11.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1hWDE0jN5YKL0/pJxBBJzXVKt8/IV26TjZPsXv7o6v+fxv5fowCq6dZwt5Chx+JEz6H56STlHVHLhuO5YkXv/cDFf27w7bw+YAGEsg9KC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
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

On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
>When the exec queue is destroyed, there's a race between a query to the
>fdinfo and the exec queue value being updated: after the destroy ioctl,
>if the fdinfo is queried before a call to guc_exec_queue_free_job(),
>the wrong utilization is reported: it's not accumulated on the query
>since the queue was removed from the array, and the value wasn't updated
>yet by the free_job().
>
>Explicitly accumulate the engine utilization so the right value is
>visible after the ioctl return.
>
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index d098d2dd1b2d..b15ca84b2422 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>
> 	xe_exec_queue_kill(q);
>
>+	/*
>+	 * After killing and destroying the exec queue, make sure userspace has
>+	 * an updated view of the run ticks, regardless if this was the last
>+	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
>+	 * query to fdinfo after this returns could not account for this load.
>+	 */
>+	xe_exec_queue_update_run_ticks(q);
>+

At this point we may/may-not have the updated LRC timestamp.

fwiu, xe_exec_queue_kill() is an async call. It will queue a work that 
will disable guc scheduling on the context. Once guc notifies KMD that 
scheduling is disabled on this context, KMD knows for sure that the 
context has switched out and the lrc timestamp is updated for this 
context. It may work well for contexts that switch frequently and may 
not work for contexts that seldom switch or never destroy their exec 
queue.

I still believe calling it from job free is the right thing to do. As 
for the ~120 Hz updates, these are just memory updates, so not sure if 
it's a huge performance impact.

If the ftrace is getting filed up, we could throttle that.

Thanks,
Umesh

> 	trace_xe_exec_queue_close(q);
> 	xe_exec_queue_put(q);
>
>-- 
>2.47.0
>
