Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC4AC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 19:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290A510E8CD;
	Thu, 25 Jul 2024 19:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMD0M6E+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B258110E8CD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721934006; x=1753470006;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=1ceB5608aiBub/MpS2PWAV8z+1ujk292S7rM6rQ/ua8=;
 b=CMD0M6E+Q9lkTZlrPRoagsuGlS8FFWqJrteHgPg5n0+pICvNq4hGB8AF
 WLjAhAKhdn9l9UIEsjFU9SOtVsupwu9GD837d1HzVLAP4vVKJ3dZNdhk+
 0TkVPIKvrzk0kQTsIMBftKQVQ9ZAg7MvKM6V5Rjv8PgdDjBbxwlJXXN4N
 CW+j0svKF/zho+xhigBmBt6kAoFJ1yN6qHXjQ+edsRYhjQsBbhl/Z5XMD
 CkeCwDgL2GksIn5dAJsjCX2IAotktvdLwVjLzc1UyRNkrkjCLz7hwHjJd
 OY1jcXPuQHa91H/cOTUWlLl5xVpyvMA8AUfvRCHL3g9BjcT0H8jIoDpK+ w==;
X-CSE-ConnectionGUID: vCaO++l9TiW5gfhZirAY+w==
X-CSE-MsgGUID: UnB+ynzhTNWlF6us6fP4nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19837465"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19837465"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 12:00:05 -0700
X-CSE-ConnectionGUID: ejTS1AI7RjieWZcUEFQAMA==
X-CSE-MsgGUID: JhrbX28gQtSClejH1JO2cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="83647597"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 12:00:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 12:00:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 12:00:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 12:00:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 12:00:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5hMZyQesxAGiL07VtwWb9vVJxoEPqKyWxjgsAD0S7ZVLTY1R6peOz2KJaJ62oFlRGwY5Wd+QLeEsAvJ92syJGpJth7CW/JCX88+UykuzCFhfFOGhOBJ3OrkC0ewgC4Dl9t7y0ldyYFUXtB6U16B6VYkTmMiBwVg6JXrbMxL2FYR90I3P+rrpQKZOzSj+QWbcK5Tskav4WCipVe1DL4zhl0FY1g4JdBL3N7nmrLIEqrgTFKT6EnN7VH10oDfRLwj3DxjwoNlHDu7SAL8/qW4OrruIxX+di5V8Tr8K/8COkGy5YcNigcHQ5gTYu9CgPvy2kfUQM2aGm3IW9aG/jmwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x6IOfYkcLUDLtnWa92ThmVx20CByMOq7K+Sj78oGak=;
 b=RvtqvNW4TmccuGgmZqDhUNlyBcxb5jdL/aOWDv7lllcHlGfnl5y1F7yDYuaBsHgfEA8LCAnpmUOtvPBGtAHmyrkwzp1pt6p3oL4qYegPkbH24/naz7DMthLVng175wjIBzJR3gXiTh3TtrwVbK7VJPfn2HnqEQs3Fq325+U0Tp8XHmCXkjhhTEmLX8frUdtH9cgwzP4EKOn0NOqcHnqdV7mfTtfF7h7aLtubyPQe8UAqxn/VKAJk7rgm0Wea45ZwbZqqVWe3dGMC6dtTkWVGHTauadA06I442dHC+8I/SwEIbSFwMW0yn/EGgjZlSWV/4igUgTpE9ZwEXbkXYErN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB7490.namprd11.prod.outlook.com (2603:10b6:806:346::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 25 Jul
 2024 18:59:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Thu, 25 Jul 2024
 18:59:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240724121521.2347524-1-sai.teja.pottumuttu@intel.com>
References: <20240724121521.2347524-1-sai.teja.pottumuttu@intel.com>
Subject: Re: [PATCH] drm/xe/xe2hpg: Introduce performance tuning changes for
 Xe2_HPG
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 25 Jul 2024 15:59:50 -0300
Message-ID: <172193399009.1567.13779997283728313218@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:303:8f::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df4aba4-0dba-4ea5-9b6e-08dcacdbf945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVAwNU1RTnVsdGZQU0NZcEN0aXNvUUJZQ012RWtyV3EyMmVzTDBvZExDbER2?=
 =?utf-8?B?QmJydldOK2U2RSszZE5OeFVhZTRhRDhDU3lBbWVZSUQ4L20xTWovMkp3YjZM?=
 =?utf-8?B?MXJMVDFmWWEwSHlCWTQ3NW51bHgrRWhYWXVMblU5Uk1mNElIS0w3QzJQL3Q2?=
 =?utf-8?B?ckRvYVdrSzI4MmFKWlBJRDlYclpKS2FUTnYrcjJlTlp2YlFwWW02KzVmTnNs?=
 =?utf-8?B?UVJmSlJwMXFyRU5iYjcrcnRMeUxvdW52MkZuTnlWS1JISDJCN29jNmp5QzVC?=
 =?utf-8?B?SGkvZjEzcllYekVzbjRlMjliSEd3N2syZlZjaUlEWnQwUEwxZzlvbzI4MlZE?=
 =?utf-8?B?UGhWNWxNbnFuOWZSWnVlSVlROWt2bU0wUTdSdzBjNGY5cWZ0TWFOODc4MWxV?=
 =?utf-8?B?eE1CS0dRSmlXSHV5ODZqUk9taXIvcTAvcGtQQ1QyRU5idXJNRW5wUENvZ0t3?=
 =?utf-8?B?L1BHY2xwRWZYbFNHK290aEpuOUw1ODVnRU5nSUlnYVYwTW5aUVkyS3A3cng4?=
 =?utf-8?B?NHFmdi9JTStYUGdaUUVDZERJNUJFdUgybkdPbyt3eTlaUTV0cVRKV1dwVDdn?=
 =?utf-8?B?UUtWVWZKN3pWYU9vUzIzQ0ZraitKZmQrVVpUcDFrMEs2TndNazlQNWxqOWll?=
 =?utf-8?B?WXhvNFdJSTZTamllOWsvYjB6ZUtlUDZydXE0Vkl0OTRzakx1MEFkeVRTd3hn?=
 =?utf-8?B?ODRzK0pIUGxWS2hTbmRBUFZ3aGw4VmdTTW5NOTFXb3hKREh1bFNJSUR1SVlk?=
 =?utf-8?B?clBmQWovRng2QmpzMndJN0xyNlNpSkpIeWk1Wm9vNTdlSHFzeG5lWFJ2a2xN?=
 =?utf-8?B?dGlPWFkwcWdYSGF5UXgxalVLZkhmTUN5S1VPY0g5S21pU2hNREswSkxnTlRG?=
 =?utf-8?B?ZXFmeFpuczBKZmprUUVuU3lzbmJFZEMyNWVwcDdoVXduaXpaNEREbmJlYU1y?=
 =?utf-8?B?NjNDbTBSOTIvRlFucTFDMmRjUnJoeFJEQ0tKRFFyd2o4bzJ0bHFlWGl4Q0xE?=
 =?utf-8?B?WC96MzFVMzhMc2NNZ1FMY1g1NkcvWHdWbmhTZkFkUkFWMHA3TzgxdkU1WmhJ?=
 =?utf-8?B?YVVOUUZFaElRaWpib1c3aVpiWU1ZbXVPNWJrNEZNbFp3eWdPdk8rTXFCWFpV?=
 =?utf-8?B?WjJMbEFhbjBtR2h3bXE3dU1xS1g1ZkdXQ0lHUTNIS0RVMDRpYlhpTGE5ajN5?=
 =?utf-8?B?SFMwRjAreVRWeEVGUnlDZnEyb3hHNDFnYTNZUjNveXhiTk1KbjIrOW9kcUlu?=
 =?utf-8?B?ZmU4MnNzUEtiU1hTb2pKQkdzSm5kT2ljMUFoZGlKMXVMd2twWFhBM21GMmRG?=
 =?utf-8?B?Uk96WmNoaVcvbmJSMjkwZFNrbU9MTS9MYTVRdkErU0NOYmVuaHFKUk8zS2N4?=
 =?utf-8?B?SGlYR3dPeThZNVNFWDFTS3Jtb2NKSS9mZjdIWjV1UlFGMHB0d0RvLzgzNFox?=
 =?utf-8?B?STJTQ1hoZFRQUGU0T1VMeDlDSjdVOEtlUUFQRVZqMEpNR3lyWE4rTko1Unpa?=
 =?utf-8?B?aTFEaDBpM0sySlZQSTNPeDhROWxqV2NaRTBKVFJleWdnOXZ0TmUybjgwa0JP?=
 =?utf-8?B?Ty9zZWRuNDYxTHlQQXRvWlJZN2h1WDNBYm5uTStjZjQ4dXNyb3pYN0l0aHdF?=
 =?utf-8?B?UkUvMzBzNkIvUnkxTFJvUDFaZU5xSGdXeVEvMHVIbXM5UmF0eGF6bWU2YVpY?=
 =?utf-8?B?U0VyUERNTE9TMU5BaXdvODhXVDNkZ0p4WFJSK2dvVXJlRTIwVDNodnpYRXlT?=
 =?utf-8?B?QTZ4Mk9GSG9LcWlRanpjUDhMemlWT0d2MCsvSzRpV0Z4R3kzeEVEd0tKVW1N?=
 =?utf-8?B?aVFaWTd2YlVhRStWdlJIQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVhDM2NDeWxpbTNFcTFvR3VVZks5RFhwRS9rNTIyejFRVEFEdy9WRTlURmtk?=
 =?utf-8?B?eS9ZYTRwdTBLMnBWSW54VUpEbE5TR3NtNm5UVVc0cFVGeHNkRVZWbkh3bm8x?=
 =?utf-8?B?Ni9nSitETUxxeDlTbXFZWnU4U2RUOVYvNXdPTm9TZ1EyalY0N20rZmlPRGo4?=
 =?utf-8?B?bnVuN2RmMFhzZVFWdFN2V1pHZS95a3M0dUtxbjVTWjUwbGRGWUE1YVVob3Mv?=
 =?utf-8?B?am9ick9lZmJpS1ZmdVI0TDN5WURDQ1JpRitDVGpvUlJhOEF4UFhNZXUwUFJw?=
 =?utf-8?B?UjlDdzNJeDk4NU0wY0RRalFzQi9EMUFmYlh6dlF5K2V6WFNsbG51ZWVqYXNt?=
 =?utf-8?B?UVhOR3hlQW9zWVRZbytBTS8wSitjMU5GamhCWWpDcTRPNEEzdnNsTUxpN1RZ?=
 =?utf-8?B?RjYyOUN3bVAvNlJkRnNySlQxNUtKVnpVRjRuWVJWRnIyYUc2aWQ3OWw4WXhq?=
 =?utf-8?B?cmhUY0w4WHIwemxaREozcC9OQWtlSmUydEhsZ21qNW9mN1IxdTIwa3NWWitj?=
 =?utf-8?B?Rnd0d0tEazlsVG5VcTN4RFVDZExKVUw3azYzd204OE9jdzVLWFp4RHgrZ0JT?=
 =?utf-8?B?bEJsMnJ3UW1kdDA0WE45RWZ1WEVLbWJ3Y202WXgvKzBkTlR0OXdGTDJtWUJy?=
 =?utf-8?B?UFZyOEZibGYxWFhxZGRmQU9GUzUxelUwa1ZCdnVIZi9hUWhVUkZkR3hpaTk3?=
 =?utf-8?B?a1lYelNhckJ6VDNucWdSY0M0c09FT1k1TUZGeXRmSDFFVExhNlNVbUV3c09q?=
 =?utf-8?B?bytVR0I3dEVCTC83YmRtYnp3SHhOUEs2enQyeGlWN3dpMHY2Q3Fad2tDeEpP?=
 =?utf-8?B?TXo2RytHVVh1MkFuYnlPTUM5ZzcwZlJ0YTBmTlpKUjk3WW5Bc1VqbXNrSW5D?=
 =?utf-8?B?emhkTDNQSld1TmFxdFpNZVF0SlJLRGZ4Q3E4YWVCYlhIa0h4NWNvNm5Tenk4?=
 =?utf-8?B?NWJaU3VJZlgvNmpDbVlLZDd6OEFHMFFLVzRGVnVaZW5EZVhQdlE1YUI0WUFu?=
 =?utf-8?B?UGFqWGIwck50MU1zaUdOQ1NlWENrMmcyUzhsWmVOazV0WGlReEFWUzBkYm9t?=
 =?utf-8?B?YWh6MmdwckQ0S1B5dTNDTklaYytFTHlxTXh4SG1JcVZjUlJLb2J0WktkVlBX?=
 =?utf-8?B?YVdtY3Focit6RkQxeDRERENoT2xqcEt4SzQzQnVtYWF2TWdtd1NTUmVRc3di?=
 =?utf-8?B?d1p4d2FEaStONDFidlF2TGpZaDlRL0hINkFkQXBjSkEzMk4wU0xMRjAxdmtD?=
 =?utf-8?B?a1ZyM2lqOW5yNSt5eDh2MFNjYWV5d3ZGeGZxbkoyN1V6MCt3RWJJVmJnTnNZ?=
 =?utf-8?B?bHpnYjZsYTFERnBUWWFDRUtXeEZJdmZpdDNRNys0Y05FdHJxbUF4NVZrWWdU?=
 =?utf-8?B?MzlNbGVkVm5OYjNvM2p0bHdOUTE0Q24veUpvaUFBVUk2a0Q0bFdjS21ydHM5?=
 =?utf-8?B?U1BqVjc5SkZkVFZIZ0pkSi9mMHprcjdZU1RvanhaOEg1Ymo3bm9wV0RaeGRJ?=
 =?utf-8?B?M1BkTUx2cXVVKzBnNEM1TTBoSStRVGtjU1RxRUVtMmg2c2YzNm4zTHV3djgx?=
 =?utf-8?B?aldCSlFmNGtCVFhTMldCQnF0RUJvL1h5UmxEbllPNFBiK09aclI3UEgvYjNK?=
 =?utf-8?B?Z0hvdVZNSk94WEdJZUxzanhEakE2bFVXaUlhYW9UckNMNm81aHRzbzZBbTdC?=
 =?utf-8?B?bnI4cm44MTF3Y0lTVmowVElud05RY2ZFMGZwalcxT0Z6Y0x3MmM4VGhHRW05?=
 =?utf-8?B?Y2RzZGpDQXlldXVKM3RBaGJnak05cUR6UDYza3Y4OGt2TW1VVnNNYnYyUFB6?=
 =?utf-8?B?U3NxZUYyQkpLbnl1UjhrQjdESm81QzlIUW9ObndCNTRON2FBNWowaUZSTTkv?=
 =?utf-8?B?Tkw3aFNDUVA2VjhXR1lCQTg1YzFDNkMwdGE2S2RrSVkxak1wQkJwOGx2dWpj?=
 =?utf-8?B?MWs0QTlUTENQMzVvbmhhV1FrUDZJOUhpSDQyKzd2MlNFaGRDYjlOWDVEODdx?=
 =?utf-8?B?cTFRWVZUYzZrNWpNZDQ1RDRHdEUwMEY0RGVzeGFhZjl6a1lzdE1MVWprNU4w?=
 =?utf-8?B?Zkt4Z0xSV1hEVU1jalgwMGV3Wmp2Y0pwRTFTUGtjcTluSENaNGx0NjdhMlB2?=
 =?utf-8?B?Qk9GaWRCQlU0azVNaW1zTTVOcWJMTkpac1R5dktsWkIwUklLQnUxRmZVQm9z?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df4aba4-0dba-4ea5-9b6e-08dcacdbf945
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 18:59:56.1615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0FTD/vQbxmNKCC8KLF8PTnpZsHBd4kycswXvENPznU+IZNy/BkkS0oIOfHdsOLTd4X9KuSNvoR3YRmGSicxCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7490
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

Quoting Sai Teja Pottumuttu (2024-07-24 09:15:21-03:00)
>Add performance tuning changes for Xe2_HPG
>
>Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

I would add "Bspec: 72161" just before the s-o-b line.

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
> 2 files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index 8a94a94d2267..3b87f95f9ecf 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -108,6 +108,7 @@
>=20
> #define FF_MODE                                        XE_REG_MCR(0x6210)
> #define   DIS_TE_AUTOSTRIP                        REG_BIT(31)
>+#define   VS_HIT_MAX_VALUE_MASK                        REG_GENMASK(25, 20=
)
> #define   DIS_MESH_PARTIAL_AUTOSTRIP                REG_BIT(16)
> #define   DIS_MESH_AUTOSTRIP                        REG_BIT(15)
>=20
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning=
.c
>index d4e6fa918942..a8e1cfc99ed2 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -93,6 +93,14 @@ static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
>                                    REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_M=
ASK, 0x7f)))
>         },
>=20
>+        /* Xe2_HPG */
>+
>+        { XE_RTP_NAME("Tuning: vs hit max value"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>+          XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
>+                                   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, =
0x3F)))

We are using lowercase for hex values in this file.

The patch looks correct based on the specs. With the nitpicks addressed:

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+        },
>+
>         {}
> };
>=20
>--=20
>2.34.1
>
