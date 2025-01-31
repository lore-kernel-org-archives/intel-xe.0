Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F546C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 13:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B05310E064;
	Fri, 31 Jan 2025 13:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcao5Aw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122D110E064
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738331713; x=1769867713;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L8ZUlNhqPI6sMEptz4SGtLo4hSIe8PdaKO7mmg6Xa6A=;
 b=kcao5Aw3XmIqsOwpYqmw7i+jMZ3YHozAcVq/3mWA+zi9lIsQJIcrNUdJ
 x4+97DCzaTPLAxP5vrUsUPYDs0+cIy6W7PEuFgjhSnLLD6EbrfARtS3vc
 sDxZcGxgTsDTHEKm+FR4OgKiB2e/Fao9y2wSY2FGYNgul9dxcqyP7Ts4p
 JJC9fEIRR85y7onSU75TxhltbwOkWDKKEZVh6LS15gM23XSHHxTBqTq6c
 dtSuagyt6fbQelKE+5rCpWRjm5HXPJeUDCbEktVMuiUzbADLm/DKkmqYP
 aL3O2xn1T3Ek7yi/Bryog6f72buTFkJf1DWMSlbyQCIHqrpeE4TBMpg9a Q==;
X-CSE-ConnectionGUID: uqqYRTLhTGCyWMxFbYFJxQ==
X-CSE-MsgGUID: mPp5gZ1HTmyy62tMDXnrbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39038149"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="39038149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:55:13 -0800
X-CSE-ConnectionGUID: SnIOL7GwT4Sx8IkUiyMDGw==
X-CSE-MsgGUID: sFMOSsyeRDqVxrQnO1kxdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140516568"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 05:55:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 05:55:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 05:55:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 05:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eyx/+5wnlkdho0TSdbRqbj239Ytc4OcpRFDheArlttRZAFMk0nNY1OOBDPnnfiqWUXlR3zJUZlJq6ic9hTyrXLGTEUl+yjuEoYiCqUy72/WSD9L021gN3qPV5MhELkCx1ySTmc9WGNvurAJ2HTSsjwSZY5MIwVpvxJI0KyVZVi0RUtcBxIOuGEmG5oK2rUnVxBfkk26EMOD4oTP1F8XidehP1EKzKsN+uKKmOsiauRTcGjjV5h+zX0a4VL0U6NBPIYa+AZNCVqDSwT+lcsfuFlCSd25+idGDqonMoMQsj5WcXGsxXNeIh1400QRqVxJBqePDF0Os6h4ZFoDNLyrJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v7VECXcDKnEWQeZa7E96aL73SVLKEbCjO228Jbw54c=;
 b=RDr2qfvu504Us365oqqphJq02VL8CevvLQySs3TBVgfXiyJBPBaRCFUM4MJ0SduG5o2kBjcz8sTTzfBRb8JOOshGT/Z0elFSLyYVQT2dWNqhyqb2r8g+uykNgjrH4vOxuHoynKsZVB/RbbP37QnfuwOjC/9kaZCEvLRXlH30DOv1FVW4mm+0nwgPYr9bS/MQPcngdmB5siks8ao+5digCzPvd0f5yDGRsTFWWh7MOFz1GbUeLvagSsfNMDYNDHyPJU1hcCZKbBYoIc+iOYpn6jcKSeJFbHVirFQNKKevrmj8WGkJBf+/IrHTV5fvgYktQw6IzrfCE/Ac1qT7qY/A+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Fri, 31 Jan
 2025 13:55:07 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%2]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 13:55:07 +0000
Message-ID: <575dd9ae-7a6a-4880-8da5-ebd815db0d03@intel.com>
Date: Fri, 31 Jan 2025 19:24:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250131054502.1528555-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CYXPR11MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 886e8469-e279-46cf-4e16-08dd41fede79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEdVa1lxa2xvMG85Zm5nZFppU3NUb2xqYzY0S3hTaTFoQ1pOVE5adW9KV1R6?=
 =?utf-8?B?MERXT0FGd1FOYWpKMmJYd1NlaFY5ZmRFVGpMeUZwTnJRY2FINzJOWTZMU2pM?=
 =?utf-8?B?SHV5QzRmQ2xZbi93ZXlnd2M3NUJ5d1h5T2piQzYyMDl0YmdFeDJ4K0xZbTcv?=
 =?utf-8?B?eHp1bDdWbm1tN0RDUGFoOXo3ZTVkTzh6M1VENEg5Um9abnkvT1JSTERaMysz?=
 =?utf-8?B?S05RU3BucFpQZnBmZWFLMGNNSEs0V282VUM2VXplRXljMFZuTFRIWHREUnVF?=
 =?utf-8?B?Ni9NK3JaZk5XTkRRVWNKclUyWjJwVHNmVW9RYlI4ODJQZXBYRE5PMmd0eVJ3?=
 =?utf-8?B?N1h0a0l3RVlZZmhPRC93UlhVU2tpZTFFSHJkNmZlUDRqalJlaUgrTDUyZTNN?=
 =?utf-8?B?dTlLeHBrSlUwRlJLZHJFeFUxS0pDZFhhU2ltdzV0eVpRZ1FNYTFXcDNNMGo1?=
 =?utf-8?B?dEZFNytwaXowaEFaMzFRbEl1NFdIbmo2UjQ3WHJ3TXU2OVVqRk1BTTF0ejRz?=
 =?utf-8?B?WGxxY0pDMENFMUcyQ0VwR3lNTUlQQWMxV1RrMjNBVm5ZeDQ1MGZkMEFSRXF2?=
 =?utf-8?B?LzBGRGFDcWtJQTZOaFZOTlZTQ2xITFgwbzBWTVNLcExQU3Azdi9kb0FIQ3Nm?=
 =?utf-8?B?ZmF5bTJFVzlyVm00WlpYdXduOEdtTmNuS2xuaUlZeXNEczhlaUwvcnBQUHBq?=
 =?utf-8?B?amdFbzVSTlB0ZVQ5Nk9QSit3SnhUUkN3MXZGTlUybWx3TW5qV3Z3SEVnTWN5?=
 =?utf-8?B?K2htckpBSklTa25KMldWTXNlNTFYQ0IzUVlGbDV3cmhkWTQ0U3lpRkY1aGdF?=
 =?utf-8?B?cDVORlRpNW0xV1Z4Q2o2TG9nb1JlRVVtYnBPdGYvMjhOTjdjUkorTC9YMUQv?=
 =?utf-8?B?MHhHelpkNUJ1MU1RZEVZeGp6TGpyZlZBUE53LzJsbmUzSHM1ZTBOczd1Y2cv?=
 =?utf-8?B?R3lQczBtMUpzMk1BdjZSUjdlWGhHNTBtVVJaWVo4d09DSWg4anZVb1FSM0pR?=
 =?utf-8?B?eDNjajZ4TGFuQU5MTHlLL0tiQnNQazJFK25uMkVBZFNQY2d3RExYbTdScUhl?=
 =?utf-8?B?ZVFlRExDRksvU0pKK1NWTVBiSG9MNlVTV2lwK0J3S1lCRWRXMkJaZ3B5dGlI?=
 =?utf-8?B?M29zcUNjRFRjSHlZMGdSOWQrMzZpRlJGVWUwS0tDR1EyWGJOQVUxajJDK0dj?=
 =?utf-8?B?a0pUeER6ZG5vUFdSQUZKMUZIaFBKS0VIYkU4UlljNVJ5VWwvRVN3OTdtUVFM?=
 =?utf-8?B?Ulk3YW9iRVpCTS9TR0ZHcWdSam55b1pFd3EyeXd2b1F4VnUxQU1qcG53WFpY?=
 =?utf-8?B?aVRUY1B3cnFkQzYrMEJFa0U0M21JWjFxVFovRlpISWlLOGJHWEgvUmE0cFNG?=
 =?utf-8?B?blQrdCtSV1FwVTFMb3BDck5zUTcrZ3NkM0NpVm9sTEpUZW93YWxLVGhhMys5?=
 =?utf-8?B?UWV4R04wVU1MbkJncXFRRS9OZ3o4MThaa1J3dSt6YnEramVyQXE0ZWU1NE4v?=
 =?utf-8?B?WWoxUTlsMVZ4blpWaEtOVktoUGJBQ3l4M3l5RERFV0NNRjVqU1p5SWczaGlP?=
 =?utf-8?B?Q0F1Uks5b2ZoZ2ZoemZYcGd4WFE2MDVjQzBEcUpUa3J4OGsxQTZVcGI1NENB?=
 =?utf-8?B?dVk2TzB0RFJxZ1hiUHRIODlrbFdaYStTU0dIblhCRWFMZmFpVEJFVUh0Z0Qx?=
 =?utf-8?B?TjNqcHI2bmpkNUZrZDErTThNT2xIN1p6ZlZkY2xpWCtDait4UGRaU2c2YUZ5?=
 =?utf-8?B?R251MGxIZGprWUhvQ1FuVG1Ub0RNMCt5enEyTU5nMXY1ck5Zdmp5dFlVUkRm?=
 =?utf-8?B?WWt2VGFTTEZnZlRXelI3cnY4bFBJY2ZLc2ZtUm9IQ2JMbjhVVkYvUi9lZ09V?=
 =?utf-8?Q?xxJUlA+W6cCKc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW5Rb3N2TGk1YnB6Slc0cllHVVFmOS84VTVVNVFBS2dyaW5kNk1IRmtCdWNw?=
 =?utf-8?B?T04xaUZhY2s3ZGNRZ3F5SGlYWXA2Y3pNQ2R5b0ZXK1NLeUhmL2RsKzhjUXN3?=
 =?utf-8?B?cWlrNG5zU2o2Qm1Yd3dQdG1sTmh1OHRGU2dQd2ZYUFFHR1dpaXNvRXp4elNt?=
 =?utf-8?B?NSs3SkJCanNZSDd6VjRoZmNDaUVUN2Rlc2dRSnBjOUFPVnNHSTZzMXJPdElZ?=
 =?utf-8?B?Kzh4L2JqbHVuL2ZBV0JoNG01Mkt0SnE0bHVwZ0k2R3pxOHFhQjhMUFNoa0x2?=
 =?utf-8?B?ZFhRVmdQbnhWeWpiUkxHZGV3c0h4amZOeGp1QW1PNWRadTJRT29RT2Z5U0xr?=
 =?utf-8?B?RWhuQ0NEUkg3cDJMK1BuSSt4RThSWjlMMUpwbTdweEQ0Nko0OXprQXJleUF5?=
 =?utf-8?B?MEJMT0VEa29SNnBTcGNzUHJZSmNwTUpRVVlKUGxmcnRobk5qMkswQjdqZjBo?=
 =?utf-8?B?SEZOTFluWUVHT2kyMEkyMUVpQTRiQ0ZLYmdqYnhsYnM1NDJYRk5uSmZ3UVF6?=
 =?utf-8?B?dEhsNWFDeXNEOGFJQ1VoUnhBam9hK1JITWhzaHhYREprY040UDNDWXBvLzJn?=
 =?utf-8?B?bDQzc3pmMmVPWDlPQW1nV3V2SkJOOFBpc0NiQnU4U1BGb0pPemtsYW9GWXZ0?=
 =?utf-8?B?WWFFTEZId3R3ZDFKQXQxcWFpMG9LU1RaK2pQTkI2LzRjay9YNTN6YW51MW0y?=
 =?utf-8?B?azhNckMvSUhlMUl0aW0vQ0h4MEZ5MEl2c0hFc1RrZmFqMlRjbVE3a0hkRlN5?=
 =?utf-8?B?RmFtbGlSZmJkZElNeVNrR09IQzBHMVB6OHQyM2J3c0k1amwwSzB5dnQ2bU9i?=
 =?utf-8?B?WHBKU3JXVU1DNGZ6M014MDNDdDcwSkVrdzkyZ0g4U2lLbUw1ZktPaGhQTzN2?=
 =?utf-8?B?M2hoZVVHMnc1NG56V1dQcTd1aDd1b0VBWkpDSGd2YWRYVkN6cnhTZFZCRk1V?=
 =?utf-8?B?aUVRT25vOU5jcVNwRENZS1B4YmJ6M3hWeFpicEhZRzFQSnJHeUxIU3dQZWJT?=
 =?utf-8?B?QnlXMnU0ejJZQVc5L3VVNWpUUEV0cHhnb3RQazllMXpCQ0VvYlFXQzdSMDJX?=
 =?utf-8?B?aUxTNHhtMUFMT0tkRzRoNFFMekRTY3FadnBISGJ2eng0TGo1NkljLzFkTXpn?=
 =?utf-8?B?UnN5S0NLbEhHRU9pblMxT21DM0VkQ1RhOXEvZ3V4bkYxcVR5WGJkd2NLRzhR?=
 =?utf-8?B?Rm13YXRLT0x0NElPTjl0M3Z1akFsa3BwQU5JVUZyaEpEdVRVUjgyL0NaUlhp?=
 =?utf-8?B?VWwvT1BkQmtRcExpM1MrL01iU2RwRHdmOFU2YnB4bmxiRWtBaGZ3V1pNd0Zy?=
 =?utf-8?B?SFU2ck9vZStkR29TSUFzaUY3bVVib1prcThSTFZrT2gveHpYMmtta003emdN?=
 =?utf-8?B?NHNETEhjamhLaS95T2ptTnlhNzJXTUpaNGlEWERmY1lpVms1Yy9BUXFnS2xo?=
 =?utf-8?B?bmhLWmVzbWIvUSs2MTZubUF4MkFvSGtMeHFRZjJveGwrNVIyRjJZZG9JSFM3?=
 =?utf-8?B?MFhWV2lRK0xsTmJlN0x3dktidEVNZy95SVgwdklVOUhXa3BQekRzSGtLL085?=
 =?utf-8?B?ZmM3NG9RR3c5Y3d3eHZ1TElaUTFnU2I4bXVyWFN6dFYxWVBIUnNuZXY4N1lZ?=
 =?utf-8?B?RGNDUEJ1NXRGNzh1eFp3MjVHOW1TazNMNlhmTnJYcmZyaDN4YXBYbURnMUN3?=
 =?utf-8?B?M1I5VTBhN0RoaitlRWxkN1ZPeGNldmx4NkVtTS9melhWNGZWY1FMS1p0NUwy?=
 =?utf-8?B?emlHNFpTOWVHS0JZT2VQanlJbFVRRVFIelkvY0lvOEp4MS9CeG44ZnFmYnFK?=
 =?utf-8?B?TE9Ic2lBZ21rRFhrL3Bud1lrY3ZNby9IeElxN2lWcktXWWp6M0c3UU1yYkZw?=
 =?utf-8?B?QkorcHJkbmpWb1JnTko1NWoycDdUM0JOTldaYXpLUnBvNnRuMGhhM25FNjZT?=
 =?utf-8?B?eURkMjVkMlh6a2FGWXFXSVM5eFhrZmdiVU15TE1xcU53dC9qUHJxUkJYbkFI?=
 =?utf-8?B?STArWGd3T05BQVRKbkpVNENnTnJrVzlQYUMzK3lZRnduUzRtbm42bE5RTlJQ?=
 =?utf-8?B?RzdFS2VvSHdyODk3M0lHQkZwTFIzWnBXeHpNdkE5YzZYcXdITVJLK3ZQU0Qv?=
 =?utf-8?Q?JSpJ+GfMC7U4WOaQYT3+etExH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886e8469-e279-46cf-4e16-08dd41fede79
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 13:55:07.0013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJAU0KpCR81kgW0oTOBtefcdtDCLd/HTleXAUfyn7OP/tJbcEJBgcLXxO6x+WorKIoFj08yGfpERrbCvGg1Hug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
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


On 31-01-2025 11:15, Raag Jadav wrote:
> Add hwmon support for temp2_input and temp3_input attributes, which will
> expose package and vram temperature in millidegree Celsius. With this in
> place we can monitor temperature using lm-sensors tool.
>
> v2: Reuse existing channels (Badal, Karthik)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
>   4 files changed, 81 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index d792a56f59ac..9bce281314df 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. Package current voltage in millivolt.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 519dd1067a19..f5e5234857c1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -34,6 +34,9 @@
>   
>   #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
> +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> +#define   TEMP_MASK				REG_GENMASK(7, 0)
> +
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>   #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 0b0b49d850ae..8846eb9ce2a4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -21,6 +21,8 @@
>   #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>   #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>   #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index fde56dad3ab7..7f327e334212 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -6,6 +6,7 @@
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
>   #include <linux/types.h>
> +#include <linux/units.h>
>   
>   #include <drm/drm_managed.h>
>   #include "regs/xe_gt_regs.h"
> @@ -20,6 +21,7 @@
>   #include "xe_pm.h"
>   
>   enum xe_hwmon_reg {
> +	REG_TEMP,
>   	REG_PKG_RAPL_LIMIT,
>   	REG_PKG_POWER_SKU,
>   	REG_PKG_POWER_SKU_UNIT,
> @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
>   enum xe_hwmon_channel {
>   	CHANNEL_CARD,
>   	CHANNEL_PKG,
> +	CHANNEL_VRAM,
>   	CHANNEL_MAX,
>   };
>   
> @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   	struct xe_device *xe = hwmon->xe;
>   
>   	switch (hwmon_reg) {
> +	case REG_TEMP:
> +		if (xe->info.platform == XE_BATTLEMAGE) {
> +			if (channel == CHANNEL_PKG)
> +				return BMG_PACKAGE_TEMPERATURE;
> +			else if (channel == CHANNEL_VRAM)
> +				return BMG_VRAM_TEMPERATURE;
> +		} else if (xe->info.platform == XE_DG2) {
> +			if (channel == CHANNEL_PKG)
> +				return PCU_CR_PACKAGE_TEMPERATURE;
> +			else if (channel == CHANNEL_VRAM)
> +				return BMG_VRAM_TEMPERATURE;
> +		}
> +		break;
>   	case REG_PKG_RAPL_LIMIT:
>   		if (xe->info.platform == XE_BATTLEMAGE) {
>   			if (channel == CHANNEL_PKG)
> @@ -431,6 +447,8 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   static const struct hwmon_channel_info * const hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
>   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> @@ -506,6 +524,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>   }
>   
> +static umode_t
> +xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_label:
> +		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +	u64 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> +
> +		/* HW register value is in degrees Celsius, convert to millidegrees. */
> +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> @@ -667,6 +715,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	switch (type) {
> +	case hwmon_temp:
> +		ret = xe_hwmon_temp_is_visible(hwmon, attr, channel);
> +		break;
>   	case hwmon_power:
>   		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>   		break;
> @@ -699,6 +750,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	switch (type) {
> +	case hwmon_temp:
> +		ret = xe_hwmon_temp_read(hwmon, attr, channel, val);
> +		break;
>   	case hwmon_power:
>   		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>   		break;
> @@ -752,6 +806,12 @@ static int xe_hwmon_read_label(struct device *dev,
>   			       u32 attr, int channel, const char **str)
>   {
>   	switch (type) {
> +	case hwmon_temp:
> +		if (channel == CHANNEL_PKG)
> +			*str = "pkg";
> +		else if (channel == CHANNEL_VRAM)
> +			*str = "vram";
> +		return 0;
>   	case hwmon_power:
>   	case hwmon_energy:
>   	case hwmon_curr:

LGTM.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

