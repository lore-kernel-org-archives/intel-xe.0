Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2A4EF99E9
	for <intel-xe@archiver.kernel.org>; Sat, 14 Feb 2026 00:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A478110E844;
	Sat, 14 Feb 2026 00:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFa87cFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68DF10E844
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Feb 2026 00:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771030490; x=1802566490;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yqXqTbvHWhkYriJdEX0Cx5oLpHRoSwGZl24tRgjkwug=;
 b=SFa87cFJRiBTIWKTbaKpbUiShXryA3MGgdJrFitxZ1U8BSr35qb7qAcm
 QXSJ0jVPgpBjPENovzwT6liHMleJ/OsUkX2aKADL0tOFSiAEKPe5Nl0YK
 91zsvW8ZC7JkTaxCYdF0PWFfPB2/zAGfTkIvKqMqTRswjuGrLBy5hJEh6
 eABkMqUqtFYXS1+DlwTNNmizmMmwq8GAZh8qdO4WAMTOFOe9x9G3GbHoP
 CFvtEYnh6phZhATce4dOH7t/2MO86u1TN/2q9DXnZOcnZJASuB2uyPg81
 B240m4SrzQ56sYoDRxORamT0q9SL7EAIfN+tKaSRCRmgpIn8uknh+j3CJ Q==;
X-CSE-ConnectionGUID: lHKwAU+pQLCpfUTzw/dKIA==
X-CSE-MsgGUID: DiN2PZpNT5GS9gdIFQqMGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71929903"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="71929903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 16:54:49 -0800
X-CSE-ConnectionGUID: ozL7U0dUQ92cojjJX+OkFQ==
X-CSE-MsgGUID: /QyS3rG8ScC8NZ/Kk5zITg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="250733152"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 16:54:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 16:54:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 16:54:49 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 16:54:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlQwVrZlnaHJktQXSlQjsOQjigaur8bTScqBRH7xeM6FDlg+/jN/qbg8BTIVyGrA+H+zuq7W1hfyNuOPMMHTvwW6kjMps7qBcoSulGMGn74tM4SlnlQm/V6RnXGeDEDPXBZwJ/7SSuN9FE8zMufgbaNJDSrwvt6S0VFB6P+CStdOtgSoH22R9mUX07k3eirYcT1/8NpzzbGHeWLLn7GLaOkhE7ZzgmrFUkagPeXU5IalXvfMagewsQt3pwCSLKN0HYckN5vqfBGT9jYSqRLu0bIBhkWQKs6N8NLj3ckx9xJGvDQJ5NYHQ7TnkNNkvkTn3Mu5JJeF0ZoW2Iu1/+Y1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS4IWwySIWveSijCinTNkmW9KqoZLTIi91LRIzbZmJo=;
 b=M/FmGfdLd0PH3Bg2CULPUEP4ZOjgdyIvYd6y9toRr46l1VNzUMLbR/2JyYTP3878DJVwFuQQ8D6D3B/knAmmBCSa9WRtEFshDWa94Q/RiC/aV9EgrrPHrMWntn2s6yVo5L1UaUaM7bEoGQCroVSw4yF1lOcn4wYjjyAaHsKB2wMat34C+OKfEE5SFFIN7w6iYIiybsA2DKPdXqK2KGXximJ/34OkpWv5VaVHQ3Ix2QV8g8Gt+oLe/jkhUO/t20Oca9Hsc9WfVf8EVHL9HhTEMVkK2DsL1d7TDIKS3P470sqrjgE/Abxc7MsDzLXU4geLNTJL25/ilRUFVDWycXOPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 00:54:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 00:54:47 +0000
Date: Fri, 13 Feb 2026 16:54:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Split H2G and G2H into separate buffer
 objects
Message-ID: <aY/H1RKHSPJBlw/w@lstrano-desk.jf.intel.com>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-2-matthew.brost@intel.com>
 <7da8eddd-9fe9-4e7d-9133-34b7ed9605a5@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7da8eddd-9fe9-4e7d-9133-34b7ed9605a5@intel.com>
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 847cd6ea-61a7-4df6-509c-08de6b63a651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHFsOWZUVFNKc0hNSlJTVnkyRm0zY05zVEZ1VDNsaG1WaEVDTmZrTUdFS2pv?=
 =?utf-8?B?T0JWeUNJaWo5UWFONlU0NytBY0lNMkhyc0hIT1piUEdDTExRSXZOSHZ1Sk9k?=
 =?utf-8?B?TExTVVc3UjN5aFNYdGUyYXRsVnZsbGM2QklBR1RKUUpuSTFtMVQ3Uk9mK2N2?=
 =?utf-8?B?OTEwK0tlWGROdUZTbFUvdmdnSm9JZ3g5UU1GQkUxMUFhUjJrOURuS1FPTkZ3?=
 =?utf-8?B?UWhDZ2RGL0V4dUVJcW1KVDUwYlZmU1NoMnFGYkF3bytEd0JqSm4wampxWWpx?=
 =?utf-8?B?bHVLUTFFK2tDSDVlWmovcnFYMlYrUFNHMDUxdVYvZTVIRVZQOWdlNmpYRERV?=
 =?utf-8?B?VTZEd2V3UmhIOWJ1SlJBVW84S0dscEU1TVllWHFGVjArcnE5L1FTRVdmZldo?=
 =?utf-8?B?cGpxZ0hhUnRCUFRYVUJJaVlzWGJ2WWJ6Q25MVldXdWJXNThlU1puajFVenNU?=
 =?utf-8?B?ajA1UlAyb1NOMnJzc0NDN1h0YldNY0xhU3UrdWY4ZDg3Z1dRbHM2bVBuVzdu?=
 =?utf-8?B?cTVpZU9QOXdzTG1Bbng5aElxcmJMcnJUZks4TENUZTBRTkRzaW4ybGxjeFZa?=
 =?utf-8?B?Y01wby9kUnJCMmcwb1Y1TUxudE12SVltTmo0cjdQRWRRMXNDRWMvSm1HM0ly?=
 =?utf-8?B?VnJlZEF1bUQ4cmtvVXBHYUp6VmVlRGVodnp0NjFvOUVCcW5kWi9XV3l1TjBB?=
 =?utf-8?B?UG9PdjJubndwcU1uajBKOXhYeTQ0RXZXbkI1eCtnTUxDYnZGT1lXZW9jbS9X?=
 =?utf-8?B?bkU4Y0tCQmcwRld3SWdHREttenduZUVKNUxLbWt1VUZnV0JEdXhsbnhETGt5?=
 =?utf-8?B?MGJjMEFlRGlqY29XSDB4dGRLVHFZQnBXUlBVTGtpNlZLRHArQ1JUSXVqekUy?=
 =?utf-8?B?QzBpcllWN25mWjh2OHlaSnF0YlpmV2xGRzhmcDFqZU1NcE5FRE50b29HSmhJ?=
 =?utf-8?B?clB5ZkJNRU5lN0thOGs5ZDlLcEZuRWpHVXBXMWtNWnc4NDY4WWlFaFRUK0lF?=
 =?utf-8?B?ektWUHZndUpwMEoxMCtoM1FDblltdjR4R25RMXRMS2plR2prOHJyRlVQZ21X?=
 =?utf-8?B?Z1FoTGdBaUZhbmw4ZEpNTmplVmxOMGVxZytDd09QOG1qL3hLRzFQcmw0OTNY?=
 =?utf-8?B?NHZKM2o4b2EwQTNqNnRKV1luc3IwVmkvSEVlSk01NHM2VVExb3pNQmpXZHVU?=
 =?utf-8?B?ZTBHa2YxWDg5SFhwQ0ZRWlVJK2dZTUpNMmpUZWxKL1lpT0VpcE9VL0RSdDBT?=
 =?utf-8?B?MktqbzF1TnA3d3EyMmc1VDNUNTIrbzNGd05xWXBJK2xwMWFjVlVnRldwQkJ5?=
 =?utf-8?B?Z25YcjQvRzFDS1RaZmpvV2ppOE9TT3Z3bHhnZ2RBeUo4bCt3Z2ZPTXpHNXM2?=
 =?utf-8?B?cE8yQU4rSXoyOHc1Z3MvUXAxVXFNTEtHczRLTHZ3Ulp4SHVwSXZZVlNSR21N?=
 =?utf-8?B?VmlCcUlkbzU2bEJTSlFFYW5STTRpZ2dSdmZDQ1p3VGJQMGp3OUhwYkpRNW5K?=
 =?utf-8?B?VXRQWEFqUHRwNEl5RDZYR0o3TDRmM3RGY3E0TmtSTEltS0NLNjkyeUEvblNF?=
 =?utf-8?B?RE9GdE9UaWlTQUtPdzZOQmVLOFIrS3AxSTNQSDM1Z0VFTTA3RXR3TzBMVzZ1?=
 =?utf-8?B?SnNIVzZiRDJscUJTYjBnQTNoR1hrZFB6SGJpeXNiWWJWMDQvZ2ZXdjZlTzBQ?=
 =?utf-8?B?RTJreFMwdmFjcm41QUJtSHNNSXZxdW4xSk5wK1h3NTVkQzNtckEzZUwyNjFo?=
 =?utf-8?B?Nk0vMTVSRENjSytMRHRzMXFQaDdHR0hpcnk5ZS80NU5wd0xhYjFZcUNSejdC?=
 =?utf-8?B?amZmUnE2bjVzcFQyMnZBVTExazJDUnVqbU9QWURxUi9peTNhdFhIdEZIN1Bk?=
 =?utf-8?B?WkhIVElKc1ExdnVzalJrYml4TzF3YnhoaTNTcExvK3dxbEVsUFBhb1A4eEZ6?=
 =?utf-8?B?dEdtRVhqeTVsODZWekpzcXYrOWxNQm0vWFVCL2tEVkFRQS9jN21pbkFGTDBZ?=
 =?utf-8?B?RUhKODRna2NVNGYvUWxxSURvRUJHQnFmTDRRU2QwTEpCdVV4djR0OS9Edk1k?=
 =?utf-8?B?UmVBSm9JdUVsbG5RM0VjQVVOa2NPaHFKTHNTdWlwWFdOcmVKWkFJTjlNNWNO?=
 =?utf-8?Q?oew0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVJWaXpnTDJXUGdhYXdSN0dEUFNRRUw3ejBJamZibHhUejNGbVZqZE1uTHQ4?=
 =?utf-8?B?VFpORVpneC9zdmV0SmJiNG5wVHFpY1pMb2hHNE5YSCs0MXVXWmZUL2l6Mjk5?=
 =?utf-8?B?K01GWE5TcWJzcDRKTzFWZWVpT0lmaDNDQm9JZWJTeVlpd0FRNEZxUW43d0c5?=
 =?utf-8?B?b0h3SlJleGtjK0srWk5uT25LdXFSTC9JZ1p3a0wreTlqZ25rd3RPbUtDR3VW?=
 =?utf-8?B?UkRwazJoWDlZK0RCS2JPV2VHaEhCY3k2OCtQa3U4UGVuajQ5OFJSUVpOVG1O?=
 =?utf-8?B?aXdQdTQreW11cnZSUDFyMzJ6Y1lHOTd1ZmR0dkk2K2NOZDY0WE5VRUZzdkYr?=
 =?utf-8?B?M0pkeGp0SVUzRDJ6dkRMZG1yVUR0b2x4R1ZsajFjQ2N4VlZQRWNoZ3NHR3Nr?=
 =?utf-8?B?M25DK0N6c2RTaWFVT1VBUUFxRWNMbGxxWjhJTmxZOGN0elc0anVvRVVtZ3lM?=
 =?utf-8?B?L29HUEZRSUJmQThJWDBQK3FYdmlPNEZKdEoyR1FkSzY1NzMydUtEMTN1VlBZ?=
 =?utf-8?B?UUNNRDdpTjR1SDh5cEZUcDQyczBnUGwrbkk3V1ZCTGd5UlVyb21rSzYwQlAz?=
 =?utf-8?B?Sjg0VnZ3UWI1TnE4cjlmb1pOMnZIUEI3Sm5JelZJKzhNcGk3d2oxN0JJaEVJ?=
 =?utf-8?B?QTFsYW1ZTzc5UFFtSkdha3p5UWx1OExNUUJzQWFKZnp6T3BtcW9DUVlobjE4?=
 =?utf-8?B?Y0dQOVFBMHpmM1B6NFM2NkNtMEp5VnNZMmpVQ1ZuVkVUY2tqZFdpK1JDaU9C?=
 =?utf-8?B?SGtQTjZXNDR5UEpRMjlVR1FjeVUxaS84ci9IZEVXV2xKd1RBZjM0bkJISjhF?=
 =?utf-8?B?cWpkSnZKM0M2S1A0akZBM1pWZGVoTkRtWFp1cjRwVjl2QWgrS0RpcFlydjZ3?=
 =?utf-8?B?ZHdRZytmU2MrYWRwQXY4RDNxNGxwekFIamFWbGxDbEhnZ0NDUkNhSlRZMjIy?=
 =?utf-8?B?ckpNVFcxY24yRlNqQzY2MC9CdnprcWo0QzNTUHhKQ080ZHNicWhMSGQ4cGxY?=
 =?utf-8?B?WGJaVmdvL0Z4YVk1ano3NDhLOVNzZXNBRFlpZW94TkJvcCs3aVlsUEoxejVk?=
 =?utf-8?B?ZGFJQVVHck95UlFHdXFFN2VRWEdhMnB4UVNCeFRPUWF4OXk0b3VWalg0b012?=
 =?utf-8?B?UERHbVdLN2VSVFNOcWJSTlBrd1NHUm1jOHFNUHRTSUw3Y1YvdEl6QmxsVDds?=
 =?utf-8?B?aGhJMVREM25Yendwc3JnN01ZTDFOazBhU1pSTEE0OGdFMGkvanRybEw2bFEx?=
 =?utf-8?B?M0RwdG1OSlVvelpqaVZGcnBFeE5zOXFsOFY4VDVYN0RPT1Bjc29Ra1pXNUxy?=
 =?utf-8?B?R2NkZXVPU1UvRDNTbU51YUlwWWlOdDdjTkdSU3NUc2ltRys3K0t0cWl2eFFF?=
 =?utf-8?B?M25VWWV6RDhMcnl2ZHl1VExuU0I1YVIxcWdnYllrZmZFQVUzVkIvanFMSjJW?=
 =?utf-8?B?eWZtd3IyRGJYMTlZT2lTM1Yyd0FXbit1MEJFWW0zaUpYSlFXbDkyK284WkFi?=
 =?utf-8?B?a3p0SThiblo1RlBvSEx6UlV1ZmYrWkRHTEhtZ01YNW5qd2hoL2lHMWgxTmJi?=
 =?utf-8?B?c0ZHeHR4dnZjczJ5a1JjOG14d29rcTlsTGJyWTNOUVZubGg5bGVXeUViMWxP?=
 =?utf-8?B?dldKbEQxME9oZDhPWU1TaEJlMkN0SHp0WHB2YXE3T2lZdWlHaTVveE1lOHhN?=
 =?utf-8?B?OGI2VXNBTHoyQlFQNWNrRFlmMDM3b0VRTm5JMFJWNFZ6RU1KYWVSUlZPdXMx?=
 =?utf-8?B?R3hsSkdLNmxaTk5ETlNtczlVYkVlSlZxUDRNS0tKb0dnK1FEZEpBNkQ0Wmhp?=
 =?utf-8?B?SVArOUhpOHJtZUhVNmYxWUFFdlF6QktoUWNJWTJNUkNKQlhRc081Q2FRRVZj?=
 =?utf-8?B?Y2p5SG9mTkZJSlFwZkpIR3BVQk1oUEY1NFJjTkFxR3NMbE9wbkQ3SktQTUVN?=
 =?utf-8?B?MGZaOU9mcFY2cmhhMWp2MHArUyttdlRCVEh1bWl4OVhTcyt2c29GQjFucG04?=
 =?utf-8?B?L3R5VEtsc2tENkN3UWZqd253TlR3ak9EQUZLaVpaclJ1M3lWMHRqd3RYNWdT?=
 =?utf-8?B?dHNISDJUSzNJcUppenM5QWtwaUxZN2NqZ09JMGF3TjMyUVdRZmZLTCtWYW4w?=
 =?utf-8?B?QWpESXAxWFdnQm5uRXBhN3ZvWHQzV2hoQ3VYQXliRUhoYXQ4WDZ0Z3JEeGxL?=
 =?utf-8?B?WkxIZjhvUGdZMHpLNjlEVW5LaVRaR1BxZVhjNXV2R1BxMXF3eUhGbUsxY0pu?=
 =?utf-8?B?ait5MjhmUjBJZTZXd2kzSE1DVmFnaWc5OVdlY1RiZm1ybFJzWnlPNnhjYlVR?=
 =?utf-8?B?MnhsUkp3OG1SSEhJRHdaT25Fbmk0RUQwZWVZUW9xTWR2dXRyRXdxdXRtVmN1?=
 =?utf-8?Q?pSlXLZrja2IJgxhE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 847cd6ea-61a7-4df6-509c-08de6b63a651
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 00:54:47.1715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CcJqZmw39u+jfyU7S84R0TV+WfEI9g+//imt8oPjpLFtR+5lm5D1YoDph7ysbuL9I7QGt9ZPc7XcPZLxmY/UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
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

On Fri, Feb 13, 2026 at 11:55:14PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 2/13/2026 10:16 PM, Matthew Brost wrote:
> > H2G and G2H buffers have different access patterns (H2G is CPU-write,
> > GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these patterns
> > benefit from different memory placements: H2G in VRAM and G2H in system
> > memory. Split the CT buffer into two separate buffers—one for H2G and
> > one for G2H—and select the optimal placement for each.
> > 
> > This provides a significant performance improvement on the G2H read
> > path, reducing a single read from ~20 µs to under 1 µs on BMG.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c       | 66 ++++++++++++++++++----------
> >  drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 ++-
> >  2 files changed, 48 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 8a45573f8812..6a96bea40720 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> >  
> >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> >  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > +#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> >  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
> >  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> > @@ -279,10 +280,14 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
> >  	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
> >  }
> >  
> > -static size_t guc_ct_size(void)
> > +static size_t guc_h2g_size(void)
> >  {
> > -	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> > -		CTB_G2H_BUFFER_SIZE;
> > +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> > +}
> > +
> > +static size_t guc_g2h_size(void)
> > +{
> > +	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
> >  }
> >  
> >  static void guc_ct_fini(struct drm_device *drm, void *arg)
> > @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >  	struct xe_gt *gt = ct_to_gt(ct);
> >  	int err;
> >  
> > -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > +	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> > +	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
> 
> nit: maybe it's time to use SZ_4K here instead of PAGE_SIZE?
> 

Not a nit actually, this is a correctness thing and SZ_4K is correct or
XE_PAGE_SIZE. 

> >  
> >  	err = drmm_mutex_init(&xe->drm, &ct->lock);
> >  	if (err)
> > @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_bo *bo;
> 
> nit: can we drop this local var and assign bo to ct struct members directly ?
> 

Yes.

> >  
> > -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_h2g_size(),
> > +					  XE_BO_FLAG_SYSTEM |
> > +					  XE_BO_FLAG_GGTT |
> > +					  XE_BO_FLAG_GGTT_INVALIDATE |
> > +					  XE_BO_FLAG_PINNED_NORESTORE);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > +
> > +	ct->bo_h2g = bo;
> > +
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_g2h_size(),
> >  					  XE_BO_FLAG_SYSTEM |
> >  					  XE_BO_FLAG_GGTT |
> >  					  XE_BO_FLAG_GGTT_INVALIDATE |
> > @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > -	ct->bo = bo;
> > +	ct->bo_g2h = bo;
> >  
> >  	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> >  }
> > @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
> >  	xe_assert(xe, !xe_guc_ct_enabled(ct));
> >  
> >  	if (IS_DGFX(xe)) {
> > -		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> > +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo_h2g);
> >  		if (ret)
> >  			return ret;
> >  	}
> > @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> >  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
> >  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
> >  
> > -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
> > -					    CTB_H2G_BUFFER_SIZE);
> > +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_G2H_BUFFER_OFFSET);
> >  }
> >  
> >  static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> > @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> >  	u32 desc_addr, ctb_addr, size;
> >  	int err;
> >  
> > -	desc_addr = xe_bo_ggtt_addr(ct->bo);
> > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
> > +	desc_addr = xe_bo_ggtt_addr(ct->bo_h2g);
> > +	ctb_addr = xe_bo_ggtt_addr(ct->bo_h2g) + CTB_H2G_BUFFER_OFFSET;
> >  	size = ct->ctbs.h2g.info.size * sizeof(u32);
> >  
> >  	err = xe_guc_self_cfg64(guc,
> > @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
> >  	u32 desc_addr, ctb_addr, size;
> >  	int err;
> >  
> > -	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
> > -		CTB_H2G_BUFFER_SIZE;
> > +	desc_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_DESC_SIZE;
> > +	ctb_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_G2H_BUFFER_OFFSET;
> >  	size = ct->ctbs.g2h.info.size * sizeof(u32);
> >  
> >  	err = xe_guc_self_cfg64(guc,
> > @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
> >  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> >  
> >  	if (needs_register) {
> > -		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> > -		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > -		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > +		xe_map_memset(xe, &ct->bo_h2g->vmap, 0, 0,
> > +			      xe_bo_size(ct->bo_h2g));
> > +		xe_map_memset(xe, &ct->bo_g2h->vmap, 0, 0,
> > +			      xe_bo_size(ct->bo_g2h));
> > +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo_h2g->vmap);
> > +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo_g2h->vmap);
> >  
> >  		err = guc_ct_ctb_h2g_register(ct);
> >  		if (err)
> > @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
> >  		ct->ctbs.h2g.info.broken = false;
> >  		ct->ctbs.g2h.info.broken = false;
> >  		/* Skip everything in H2G buffer */
> > -		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> > +		xe_map_memset(xe, &ct->bo_h2g->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> >  			      CTB_H2G_BUFFER_SIZE);
> >  	}
> >  
> > @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
> >  	if (!snapshot)
> >  		return NULL;
> >  
> > -	if (ct->bo && want_ctb) {
> > -		snapshot->ctb_size = xe_bo_size(ct->bo);
> > +	if (ct->bo_h2g && ct->bo_g2h && want_ctb) {
> > +		snapshot->ctb_size = xe_bo_size(ct->bo_h2g) +
> > +			xe_bo_size(ct->bo_g2h);
> >  		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
> >  	}
> >  
> > @@ -2012,8 +2030,12 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> >  		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h, &snapshot->g2h);
> >  	}
> >  
> > -	if (ct->bo && snapshot->ctb)
> > -		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap, 0, snapshot->ctb_size);
> > +	if (ct->bo_h2g && ct->bo_g2h && snapshot->ctb) {
> > +		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo_h2g->vmap, 0,
> > +				   xe_bo_size(ct->bo_h2g));
> > +		xe_map_memcpy_from(xe, snapshot->ctb + xe_bo_size(ct->bo_h2g),
> > +				   &ct->bo_g2h->vmap, 0, xe_bo_size(ct->bo_g2h));
> > +	}
> >  
> >  	return snapshot;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index 09d7ff1ef42a..385a607e4777 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -126,8 +126,10 @@ struct xe_fast_req_fence {
> >   * for the H2G and G2H requests sent and received through the buffers.
> >   */
> >  struct xe_guc_ct {
> > -	/** @bo: Xe BO for CT */
> > -	struct xe_bo *bo;
> > +	/** @bo_h2g: Xe BO for H2G */
> > +	struct xe_bo *bo_h2g;
> > +	/** @bo_g2h: Xe BO for G2H */
> > +	struct xe_bo *bo_g2h;
> 
> since we already have h2g and g2h:
> 
> 	struct {
> 		/** @ctbs.send: Host to GuC (H2G, send) channel */
> 		struct guc_ctb h2g;
> 		/** @ctbs.recv: GuC to Host (G2H, receive) channel */
> 		struct guc_ctb g2h;
> 	} ctbs;
> 
> maybe just add .bo member to struct guc_ctb?
> 

I thought about this, was trying to keep the diff to minimum for fixes
but moving it there is likely fine.

Matt

> 
> >  	/** @lock: protects everything in CT layer */
> >  	struct mutex lock;
> >  	/** @fast_lock: protects G2H channel and credits */
> 
