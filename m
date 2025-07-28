Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A4BC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 07:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2E10E0E1;
	Mon, 28 Jul 2025 07:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRoicn+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032310E0E1
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753689121; x=1785225121;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fYQ6pSOGDF54wiCExt5qcoKlJiNmpalytxN2gzR47+Y=;
 b=IRoicn+sLHRHpkI50JJjRppurQAFsPommitEKheljRx1lOZ4tFZOPcF9
 Oi3V+HSQ+zJfpnVmS1pYNGPtDmdtMJ9wmhYPK7GXu/nPYkx5Hwa1KDBx9
 Gq786mqXO47+DOBAYsbybzv+UdX6ODB8YY/khy2/XFtu3ao11cEoWO7kg
 mzoLRcoO9c/Enz+ot0WEQv84dvn/YqyxqIF573PaBT5GCg6p8Ge+2mY1m
 jk7Wnjond8Xro37RZk6H77Xkljo6fD8GzWBX17N+OcAzj18JDJS1vsnyk
 FjQPEEkwJzShigBcTeqOSaIac3JPZ5cq0FEj1uEDZZPSlmmCEcB7hp0Pa Q==;
X-CSE-ConnectionGUID: rzxBpjU1SHmwOW7xA89Gqg==
X-CSE-MsgGUID: o4pIbEu2TxaC7tcwWQPsEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55139809"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55139809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:52:01 -0700
X-CSE-ConnectionGUID: o6CS6puhRIOqipMJDZp4tw==
X-CSE-MsgGUID: ouHPqBAYQ2+l0ZhodFSVuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167762471"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:52:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:52:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 00:52:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:51:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5tWrlE30wwv9SJoJ5uCvfMRUI4XGyNmOExxbCIC23PX+cUvS8ZKdMmvFktPYGHdhOmRaIF0LRffEXFjRi2nCkJbx54a8VpL6IZsScb17qusPymQ07zuhjzKNGPtAgoyUCTZnEhKu5q7VGHYnDeB5Wi0etv0Ta8cZjANRG+K3tibolU6xJOe9DIiraQf2PqhoaZRrBsQwv77U5SnCnk0/vbCS2YBAr9UWu+xdMLhVWo2J0YCd52tfkECw7F8LdiY8Nqwoi3y2WZ6SYIGD/dkVjwuK1UL+9dUREC1YXKmwARaIpk2Br3Xt6tmzQOUe+iuxknH+R3oUTduzfV6p1PsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUAKbv85v8LJwRCvXgetRN5QnDnagfmrc1CPeoUJqbk=;
 b=VqykiZGRiAY4m2d8hX0K+Q6HjplYF4D9mpJ9WfbTHdG2YlEoZ4NXUVqeWNyPCw76yKNJ/Bm9hco3NyPYpbLEt2+mr38s7LhQ+jaQZbdRzEr9zyu+nbN3A5wXp7PdvqeV0IwzsLBmCqR/IXvf4tivcv92m+1ovuwFmWS3gynubT6JSSI+6sGR4iLxaNbh+xLr0XtdLGa4mDyed03a7CZkQnOC2KcMCA5ml7B0u3sPSI8HWwzFtNy0Y9MRZD3/yTBrOkqdO3T812Xp2eVhK8bYRY/kx6nup5jrgNT9kZCJxK4kVciREomSbzS+G9N7pPCHBZuo64TXYSldBRK5kYHBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 28 Jul
 2025 07:51:57 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 07:51:57 +0000
Date: Mon, 28 Jul 2025 09:51:54 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
Message-ID: <20250728075154.7wbin3ed5gtqctmm@intel.com>
References: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
 <aIcn426bvQsqEUor@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIcn426bvQsqEUor@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: DB6PR0301CA0069.eurprd03.prod.outlook.com
 (2603:10a6:6:30::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc57725-67f5-4083-7fc6-08ddcdaba07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm1nUE1UcEFKY2preFM4SkVjekFiWkp0U3pLOXY2MVJWcXg0NUFtNlV4STFa?=
 =?utf-8?B?YkxHRFV0U2RaS0l0c09KMWZKRitxT0hkRUUraHdvRTQyWjZiT1NuNzFlZENz?=
 =?utf-8?B?RjkwTVpjUFFValNuMW5ZVldWL1BrTHRjZXp6SmJRdmlvRWhMditPRW5ERmRZ?=
 =?utf-8?B?VXVpVWVHNUMwT0xZQmFUMVFGWEtSNEhaTVVFd0xDNjdLVDIzZjJrZ1IwdFRD?=
 =?utf-8?B?SlNyK2Q1MTI1V25xdzBqQXF1c2t6bUJaaHNreEhDTVc5czErak5YVUI5cVAw?=
 =?utf-8?B?SXd1MzQwQTBLRlNvbDNWak9hNmFWYVBSTCtmcEJLMDVJbDF4UkQrck8zcEUy?=
 =?utf-8?B?Y1NhMGdSdmIzNzRnZTNhQjdIWWVMWXRUZENNL0VDSzU3dHVJZXdxMXdvbVZV?=
 =?utf-8?B?WTFITkwyZ0NaQVVSV3JvTFVHOEZOWFNPb0JmanpVZ1hhbGFKK3V1TmlYK2Fj?=
 =?utf-8?B?MFE3cmI2OHJUVHhZd012WmJoWUhlemc1dS9aMnZZZVRvdmJ5UklGMStON1Aw?=
 =?utf-8?B?djQ1Q1dWYjFlRHZJNHd5VTUyY3BIcDlVU3RWUFo0cjlSZzBENWlXdnlMTGFV?=
 =?utf-8?B?S2FtME1IdHJ0U3ZVem9kKzZPY2dWYTY0Kzh3ME1MeGVFU3NpYWdXcmFVQTdN?=
 =?utf-8?B?RGlzanpoaVpMcE1MMlltVW82OG05dEM0d05mUWViQlhuTTNjSXQrcERWNmJS?=
 =?utf-8?B?YllucWtiVndSdWNsU1JFbHNYQmlpeWFJWkZibThhMEJSRkt3MXNsdTZ3RzdG?=
 =?utf-8?B?Nm9EOXU5b3JuQUkwbndsK2RBSHpjNnJncERSYS9Wb21YWFcwT3BFajMrbG02?=
 =?utf-8?B?MUc3c1NnVUFtYVQ0dU5QWWp3UnZXYjhEaUlYV1JjOW1tZDhBTGVRMnNuR2FJ?=
 =?utf-8?B?WDQ0OFNiaG5aZlgreG9veFh1MnA4M3NQdWlZZXEydU9tcGUxdmJjZndFeHB5?=
 =?utf-8?B?SW00V0xVREtpNXQ1b1IxRitxMEJUbVFqUFNpYUZDcmNYbG0rWlR0eDdmckJj?=
 =?utf-8?B?MnhXK1NuOGVlK040VTlXVlZnZVMrSGNBVW5Bb2ptcUZQVTRQeUdzY1JMVThR?=
 =?utf-8?B?U0dRQnJndjRZQlJTN3FpWkd3cDVEcUxuWXAyUGVrZzdQZFo2VVpTUGc1VENF?=
 =?utf-8?B?ZklYd1NPNGRZd09teUlreTNycy90WTNvOUh5b3NnUDlFUVQ4YURnYm9xcWtI?=
 =?utf-8?B?cWExYnJuWE1MaDdHMEdoYVpyVDRlbWRxRkN3NE9RM0U4THFzUGRGbWdiaCty?=
 =?utf-8?B?dzNQRkdkOWcrZGl4V3EwbkxBU2lsQ0RVcXBERzM5T21BZWpvdWpQK0RwQWRF?=
 =?utf-8?B?M3VhQ3Rya3pralc0RWs0dVh4Z0pWYVhzT3U2cTdJU0FEU0RyYkJKVTdXN0Y0?=
 =?utf-8?B?VTJQdmpUNW05cnJzTzNlak52c2tVMGVXM3FKZmNkUUdUUndVUGFNem8wRWU4?=
 =?utf-8?B?YmZ3bWdRelR0V21VNGhNUk5XU21VdU42T0JHa3EwTi9YQ2lYV09idXpIOUZV?=
 =?utf-8?B?S0xheGFMSVRFbThwenl0djZMV0g4NWN1cGZLdUcwbzVWV016MEVrZmttb0Jl?=
 =?utf-8?B?WUVHR1dMRGJCOVd4elhRSDV6MVkwbHhIRjFSYmtwUjdoVWNycXh4bk9pbE95?=
 =?utf-8?B?dEQwRXB4b1lGaW9BQWYzZmJFbklpNEsyekwyS1ZCRWpSZ2lEenJkRDM3TmFt?=
 =?utf-8?B?VHBUa3UwV0N3UHJUcDVDVHdoRzk5WFk3VERKN01OVjFaeURya0dDVmtObU5s?=
 =?utf-8?B?ckt6Q05sdHM0TDlUY20ybmtud2ZsT1dkSTQxVm5KRDJtR01HTzBMVFhvdDBC?=
 =?utf-8?B?bmlRRk9JY2RIRmFqcE0wV0tISGxmb0VGY2VuNE9GdnBwVjIwZHVCYkhrYThI?=
 =?utf-8?B?eGRWOWFyOFBiZllpSUFhbXVMMnZwVEFUU1Z4SDE0MmUrTmhma2luRG5QbjRN?=
 =?utf-8?Q?fCBaaUjA9Lg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWp4VXR5QkdyeDBpNTJQOHBlSTBkNkcwRldBTXg2cWZOT3NnY0RIZU96WWZQ?=
 =?utf-8?B?WnpMV2lxNjcxNmhOakVqdHRDUDRteEJCNHgzelNqTVhQQVhreG54NW56TzJI?=
 =?utf-8?B?TitzbjBYMFNIRmtNMWhNempZRTV1WEsxMnJrN0huNUtmdVRUc04yTHM1cnRJ?=
 =?utf-8?B?L09pbVJyeXhlWllMaDFNU0c1Yy9rbW0raE55SlF1NmFLemlXU3hEaWF6ZzJC?=
 =?utf-8?B?K25UNHVOb0g0RmZhOXZlbitXYlJFeEhoR0pSZUxhc25XSndOUFlrMzFWY3Bv?=
 =?utf-8?B?SlZjT0djMHNLakQ5N1l4K0E3d0ovenZvSVBCUXMvUno1MWUwTWtuNEVlTFYw?=
 =?utf-8?B?Sm9yeXg0dWFtTVBVUUxkSkp3em96UGQ2ZVhxYlRacjhQRm1GOFR1UjkrcVc1?=
 =?utf-8?B?eFV0dUE1bWJqTXlrb3BRTWZZU0g0VCtuMTljTkpBWHJoZmt5WVFXanBGQTdW?=
 =?utf-8?B?TVpvYXF0cFF5b0QzZ0RNbklvZThqb052TGNPQW9JMTNLV1pqRjlGRktrNEhO?=
 =?utf-8?B?QVR5V1crZDBWazByU051YmdOUDMzQXNwY1BzSEkzeUdBVERvRHNkMFcrQ2pY?=
 =?utf-8?B?aFFrV2JoY3JxcEdMY05YUVRqRk50TnNlVnRsRE5Pd1JONUdKbWNWOTc2UjNk?=
 =?utf-8?B?Z0lvNWpHdUl6dThpMWxoQ1hrZzY1YmlWa3Y4YmlTa1NYYWIwb1FvekdYekJx?=
 =?utf-8?B?VlZoUzZOanYrMGN5Z1BzT21Bd2EyTlhVMC9tR2tDdkhqMlVZM3RpbFBlUFMz?=
 =?utf-8?B?dzdWVFdlV09ucG1hbzNONWg4R3hBbW9hTmhFa1FYdTd4aDMwb3ppSWFndFlm?=
 =?utf-8?B?eFVmSEcyUXFxYlhpSDJHQURFN3ZXNWs1a3hlMmZvUGFsa1U4cStnUGJoWk9W?=
 =?utf-8?B?ci9RM0VURXh2RlcvZUFJVEYvTmp4Qkw3ZUtwWmt5cFZ3dnVUTXlhcDRPVDkr?=
 =?utf-8?B?UEdrRUQwZldBZUllMXlFYk5sYWNSV2RscHpzaWk3MWRZdXZjYU0xbWJ6UENH?=
 =?utf-8?B?bU96ZVp6d2UxYnk2OHVQTHJiU2JTaG5WcWxUa1EzQ09BUmNmck91SEFOelZD?=
 =?utf-8?B?SUdQNlB1T3B4eUJ2ak1jTXlzdVdkOEh2VklXL0VLTWxPWjZQZTllVmpkM05G?=
 =?utf-8?B?azhJZVA4V3dST0RCRldDeFA3dHBkeS9HSUlmQTViWGt2ZlViQUM1Y3ZBQ2J1?=
 =?utf-8?B?bzhGM2lpYkkybVU0K21TSnBORmhzSy80QmhwVDMvaWFYWEw0NVRNOUlGdFg4?=
 =?utf-8?B?QmhndnBEVG0xbUFQNWFBSEZLSGg2WTlQNWUwYmFrUk51bmJMdzFVT2JtUVNV?=
 =?utf-8?B?b1U5ODBCSElnNWFPQWZpeTJFcDU0N3pwK2kyNUEwSWhVZG1HVjJxQjVvVHov?=
 =?utf-8?B?ZzVyenlNWFh2QzgxMy92SlZ5VTd2RjJlUTJoM1U5eW1ZNWs1bmVPcjFJSG83?=
 =?utf-8?B?Mm5CdHJ3VGFtMGp4enVsdytXVFpNaFkzdUNCc2hjVWYyNU1HdnpwUDhDcDhi?=
 =?utf-8?B?NzI5N1ZNdUU5cWFyUWIweDZHTnBkYTExclJLLzFpS0lXd3BzcVNWYy81TzhF?=
 =?utf-8?B?cjl1Y2lSVnI1SzNSWCsrWkhpWFdWYllVYnBqMlp3REhpSkhKc2FJVmFJQ0NW?=
 =?utf-8?B?M1VkRkYyK3IxYzkxaXQ1TEZTVkszQVRaajJKb1g2S1duQzduQTU0anR1K3ZH?=
 =?utf-8?B?N09FVFB3am9Dc1AvaTU5NEk0bTNJalhNeGlkOUN6NmM2d0FHM1JTT0ZBZSsv?=
 =?utf-8?B?TVRhVlg4dkJxVU1TNk90WW01WGJNRFBUanFWRDA2MHlpZ2t0aU1KNms0SkFG?=
 =?utf-8?B?S3VuSzZUU1dGcGc5S3ZMSjd1bzdPdHlBbXIwZzUyWDBZc1RiSDVNd2hZQWQ2?=
 =?utf-8?B?elVMeXd4V3hnSDZneTQvSE9JZFlISnJZMGhEaXZ4YTNZNFgwaXBvdERPOWNx?=
 =?utf-8?B?aEs5UWNON1lhSE9WTEVTY3BKMGUxeHBkYzNsUEFQQ1A3eEJnRmVvNzlhVWwy?=
 =?utf-8?B?cEJKSXVEeWp6K1BWN0QzWEowcFhRclVXUnVIVldZVTlTcmtzUzRRaTZwR1Fw?=
 =?utf-8?B?d2NUczJ3RXVzejRUUTdvWEZvVStvNDJSd05SclhocnJOYkl2aDhObEk4VWJH?=
 =?utf-8?B?YUZMeHB3aFFrSzVGa3UwSThiS2dLMzhhbG5NamI0YTlMWEp5NGtBMzdRSk03?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc57725-67f5-4083-7fc6-08ddcdaba07b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:51:57.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xykh5VxixQOpLWQJ6NEZkf3rCnpD8boUatRGf0VrClMK36B3bJ2qFCuch/dw65E7QuHg8zdb7UzLNrVZw94y2PSaZ4BZwhADNrPQylAPMJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
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

Matthew Brost <matthew.brost@intel.com> wrote on pon [2025-lip-28 00:33:55 -0700]:
> On Mon, Jul 28, 2025 at 12:10:02PM +0530, Satyanarayana K V P wrote:
> > The VF CCS save/restore series (patchwork #149108) has a dependency
> > on the migration framework. A recent migration update in commit
> > d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> > caused a VM crash during XE driver release for iGPU devices.
> > 
> 
> My strong view a revert, restructure to use single xe_migrate object
> that initialized on driver load, but provides queues for the VF
> migration needs.
> 
> Matt

In my opinion, the changes suggested in this series for xe_migrate_alloc and xe_migrate_init
are necessary — my recent changes related to separating xe_migrate_alloc left a little mess here.

I think also that Michal rightly pointed out the problem with xe_vm_close_and_put
inside xe_migrate_init.

I think that's missing too for:
	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
	if (err)
		return ERR_PTR(err);


As for using migrate for VF, I have no opinion.

Thanks,
Piotr

> 
> > Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> > xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel enabled
> > CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W           6.16.0-xe+ #4 PREEMPT(voluntary)
> > xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1 negotiated ABI version 1.0
> > Tainted: [U]=USER, [W]=WARN
> > Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
> > RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> > xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF ABI 1.0
> > Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
> > RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
> > RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX: ffff88811a028c40
> > RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
> > RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
> > xe 0000:00:02.1: [drm] GT0: reset done
> > R10: 0000000000000000 R11: 0000000000000000 R12: ffff88811a029c40
> > R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
> > FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00005af31328c000 CR3: 0000000114534004 CR4: 0000000000f72ef0
> > PKRU: 55555554
> > Call Trace:
> >  <TASK>
> >  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
> >  devm_action_release+0x12/0x30
> >  release_nodes+0x3a/0x120
> >  devres_release_all+0x96/0xd0
> >  device_unbind_cleanup+0x12/0x80
> >  device_release_driver_internal+0x23a/0x280
> >  device_release_driver+0x12/0x20
> >  pci_stop_bus_device+0x69/0x90
> >  pci_stop_and_remove_bus_device+0x12/0x30
> >  pci_iov_remove_virtfn+0xbd/0x130
> >  sriov_disable+0x42/0x100
> >  pci_disable_sriov+0x34/0x50
> >  xe_pci_sriov_configure+0xf71/0x1020 [xe]
> >  ? sriov_numvfs_store+0x78/0x160
> >  ? _parse_integer+0xe/0x20
> >  ? _kstrtoull+0x3a/0xa0
> >  sriov_numvfs_store+0x10c/0x160
> >  dev_attr_store+0x14/0x40
> >  sysfs_kf_write+0x4a/0x80
> >  kernfs_fop_write_iter+0x166/0x220
> >  vfs_write+0x284/0x550
> >  ksys_write+0x6f/0xf0
> >  __x64_sys_write+0x19/0x30
> >  x64_sys_call+0x2bf/0x2660
> >  do_syscall_64+0x93/0x1320
> >  ? ksys_dup3+0xba/0x170
> >  ? __x64_sys_dup2+0x2e/0x1f0
> >  ? do_syscall_64+0x1a2/0x1320
> >  ? __rseq_handle_notify_resume+0x447/0x5e0
> >  ? trace_hardirqs_off+0x5a/0xd0
> >  ? irqentry_exit_to_user_mode+0xdf/0x2f0
> >  ? irqentry_exit+0x77/0xb0
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7e030351c574
> > Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> > RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> > RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
> > RDX: 0000000000000002 RSI: 00005af318d7da30 RDI: 0000000000000001
> > RBP: 00007ffd34a107c0 R08: 0000000000000073 R09: 0000000000000000
> > R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
> > R13: 00005af318d7da30 R14: 00007e03036045c0 R15: 00007e0303601ee0
> >  </TASK>
> > 
> > Update the VF CCS migration initialization sequence to align with the new
> > migration framework changes, resolving the release-time crash.
> > 
> > Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > ---
> > V1 -> V2:
> > - Updated xe_migrate_init() input arguments and return type (Michal Wajdeczko)
> > - Fixed review comments.
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c           |  6 ++----
> >  drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++-----------
> >  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++++-
> >  4 files changed, 20 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index c8eda36546d3..5a79c6e3208b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
> >  	if (xe_gt_is_main_type(gt)) {
> >  		struct xe_tile *tile = gt_to_tile(gt);
> >  
> > -		tile->migrate = xe_migrate_init(tile);
> > -		if (IS_ERR(tile->migrate)) {
> > -			err = PTR_ERR(tile->migrate);
> > +		err = xe_migrate_init(tile->migrate);
> > +		if (err)
> >  			goto err_force_wake;
> > -		}
> >  	}
> >  
> >  	err = xe_uc_load_hw(&gt->uc);
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 90065d7d29ff..7e295ca00763 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
> >  
> >  /**
> >   * xe_migrate_init() - Initialize a migrate context
> > - * @tile: Back-pointer to the tile we're initializing for.
> > + * @m: The migration context
> >   *
> > - * Return: Pointer to a migrate context on success. Error pointer on error.
> > + * Return: 0 if successful, negative error code on failure
> >   */
> > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > +int xe_migrate_init(struct xe_migrate *m)
> >  {
> > -	struct xe_device *xe = tile_to_xe(tile);
> > +	struct xe_tile *tile = m->tile;
> >  	struct xe_gt *primary_gt = tile->primary_gt;
> > -	struct xe_migrate *m = tile->migrate;
> > +	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_vm *vm;
> >  	int err;
> >  
> > @@ -412,14 +412,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> >  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
> >  			  XE_VM_FLAG_SET_TILE_ID(tile));
> >  	if (IS_ERR(vm))
> > -		return ERR_CAST(vm);
> > +		return PTR_ERR(vm);
> >  
> >  	xe_vm_lock(vm, false);
> >  	err = xe_migrate_prepare_vm(tile, m, vm);
> >  	xe_vm_unlock(vm);
> >  	if (err) {
> >  		xe_vm_close_and_put(vm);
> > -		return ERR_PTR(err);
> > +		return err;
> >  	}
> >  
> >  	if (xe->info.has_usm) {
> > @@ -430,7 +430,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> >  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
> >  
> >  		if (!hwe || !logical_mask)
> > -			return ERR_PTR(-EINVAL);
> > +			return -EINVAL;
> >  
> >  		/*
> >  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> > @@ -450,7 +450,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> >  	}
> >  	if (IS_ERR(m->q)) {
> >  		xe_vm_close_and_put(vm);
> > -		return ERR_CAST(m->q);
> > +		return PTR_ERR(m->q);
> >  	}
> >  
> >  	mutex_init(&m->job_mutex);
> > @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> >  
> >  	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
> >  	if (err)
> > -		return ERR_PTR(err);
> > +		return err;
> >  
> >  	if (IS_DGFX(xe)) {
> >  		if (xe_migrate_needs_ccs_emit(xe))
> > @@ -475,7 +475,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> >  			(unsigned long long)m->min_chunk_size);
> >  	}
> >  
> > -	return m;
> > +	return err;
> >  }
> >  
> >  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index 3758f9615484..e81ea6b27fb5 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
> >  };
> >  
> >  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> > +int xe_migrate_init(struct xe_migrate *m);
> >  
> >  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> >  				     unsigned long npages,
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > index af43e04179aa..bf9fa1238462 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >  		ctx = &tile->sriov.vf.ccs[ctx_id];
> >  		ctx->ctx_id = ctx_id;
> >  
> > -		migrate = xe_migrate_init(tile);
> > +		migrate = xe_migrate_alloc(tile);
> >  		if (IS_ERR(migrate)) {
> >  			err = PTR_ERR(migrate);
> >  			goto err_ret;
> >  		}
> > +
> > +		err = xe_migrate_init(migrate);
> > +		if (err)
> > +			goto err_ret;
> > +
> >  		ctx->migrate = migrate;
> >  
> >  		err = alloc_bb_pool(tile, ctx);
> > -- 
> > 2.43.0
> > 

-- 
