Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC6C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 22:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7242B10E258;
	Fri, 14 Mar 2025 22:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6G0Jn1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A041410E258
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741990311; x=1773526311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=iduek9Obh+v64nAHUni8DkeB701vN1JFBQUISNwQoUU=;
 b=h6G0Jn1T7kMbhQQLvSmgKtAI1jpo1oT6qThow1hXv96gHTcAW5Tb1ssK
 CgspKRbsw8YZKbueXlRDITAWGPx8Q2dboXlgvCLB4+KYRFOK3eJ+isw9C
 qOXZ0h1I4NsOzNsV5sQexnNH9HImzbu98ZpSHmEbCLNQZiXuosRzAOIzn
 ARdxZFicTFic4dIGJpy5mYm88+4Fu0NC60UqvHIsqk0KrN/TomLcIgzyk
 HvFBsAKAQd1oBhCjZUiNso4ijBMYURZBrAj1PO8zSqOC9r/vf3kJiAcLl
 xjwC+CTeWXa5aY4y6lAkf+Th127qZcLWTafGn05Zf0CK7//hjhkZJ4gBb g==;
X-CSE-ConnectionGUID: AQAWrs/WQWyk1AaqLCAirA==
X-CSE-MsgGUID: H3d4Qw6qQiWPUYkeheR0Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43194949"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208,217";a="43194949"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:11:50 -0700
X-CSE-ConnectionGUID: KCNprg8kQLyf9+4jtm34iA==
X-CSE-MsgGUID: CtXZ7b1ZSyWUk2+UP3bSVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
 d="scan'208,217";a="126265377"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:11:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 15:11:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 15:11:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 15:11:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f25fv4LfvPDMZD0t5T+j4SSVKBjCNSIGqmlcBtDGsCFg7PDr5Oqt8fvqmlzgrAJPpetk335u6+lMXz+fiqOonTN33eAwwboivYidIba092pbACgIC8Igh/ntjGFLJhZwmCSx69QizLRkEi+vgpYuELsxoA5M54wJMA6AcGyq6ovQ3DY6KhR2LmeCPdxoNL1V3A7ZtLwUBrDQHM3eN6owNlP0RjU5pXnZTkvXzAb4l/ySMTpS1Aq2bNpm+LQV7NtJ1bIjPCeqitFT4J9PIfMxj5mL4Zl65o3yial8JoqTWYUPnpjgrUbN1wvueItHpRuQPgarBJRJdnNpSCjaG3EbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHjnEKFjhw053d4AUhVEXHvW55Hhjs+yBTmlpuiaUyk=;
 b=ZHckW7xqCN/NVwpHOLKYP+jareGBMs2WGV8FMB9AnvbcVrOOK7vuPL/Vej4eDuxWMpE3Yl2SgNoCG+6W6BeoOR2Qic44cj3c41JtI7xMcS87J2SkLAGtZzH/pb6EnPUvmKzsJZfaDyqtqrYG+oD/RV42EgAhW1K0ARn/sKaY2wogDIOM0e/yh4nFF9mNS5PEFO/ECZqo+aIk41hf6CYlXRVY61SUoD0jLAOZ7tHftoiFLQ7oExA8ZKW140WOzHjItiGCUBVTYzmW/FYZ+G4QkIQvIWMun7lrECPnpY5itmxQ8Go9MmCerOwA26TsjAq4coaTfwap44WxLd40WsXgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CYXPR11MB8692.namprd11.prod.outlook.com (2603:10b6:930:e4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 22:11:47 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%3]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 22:11:47 +0000
Content-Type: multipart/alternative;
 boundary="------------f0sv0DyUg5R3ADI1dzZAsKcS"
Message-ID: <d0597e0f-7222-4d4c-8982-380ecfc69451@intel.com>
Date: Fri, 14 Mar 2025 23:11:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
 <20250306222126.3382322-4-tomasz.lis@intel.com>
 <667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com>
X-ClientProxiedBy: MI2P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::19) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CYXPR11MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b605f82-c977-4890-1df1-08dd63453662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzZVZTNUdVIvdHJvSVJkN1dLTGNQUmFnRkFHb0F6RTg5OHBOMzJyN3BLUDd0?=
 =?utf-8?B?VUgvWjh0UnAyckdWVklIdW9BTUZQeXdyY0xQSlVLNGpwTUJFT0l1b3lHMGJa?=
 =?utf-8?B?TmVpczJYQUlqaC9rdm9aYWZvd0JNOE9ySXRjNGFiTW5YemFuQ3dtdnRvVW5a?=
 =?utf-8?B?Y29TUEhhQitaeXk0cGpMRjMybG1QQjJTSk9tL2d2dGhpTmYxN0cyRHVkNXgz?=
 =?utf-8?B?WTNCY3VNeENTYXlKMGFRVVp5V08zRU9uamg3MENkNFo1WVF5bG0yOGlSQXFM?=
 =?utf-8?B?TEFrT0RCY01POHlpd0VUTThjM0c2Tmp4UXVrLzIvSGJjQlRvODNrazZNem11?=
 =?utf-8?B?OVdIU24yQzd6cVVETFdZZ00zLzhMbEw1WWM2eC9MZ3J5V2FZYU9FbGtrSVJh?=
 =?utf-8?B?K0FnZzFqdGtjSGJGY3ltYVVEVDZHeC9meDZFT3d4U25Rcnh4TzM3WUtSbFJB?=
 =?utf-8?B?c2dsSkZBYUFjUzliU0trQXBhek9FeXFtTzRUN01IV094S2Z4akFFaXdrd3hF?=
 =?utf-8?B?RWpsVWFqREVRRERBTWJ5amJjbU5WT1NrMXVkaXo2ZkNFcXU4YTJUejVQRVho?=
 =?utf-8?B?UDRVOVFpN3ptZHd2ZGk0RkFLa0JPTWNFMGFFTTdRSU1FcENpVHllMTNBTDlM?=
 =?utf-8?B?dnNKdHBvR1F6alN4M2hYUjhHdXQwMUJOaE9UdnBucWt1UVlEQmNuRDVNMVRO?=
 =?utf-8?B?WWhraWRmdWFXUHlacHk3VUtzRDEyeDR6bUpLajNrWHdYYWpvTzI5R1lWbG5i?=
 =?utf-8?B?dG9NalEyMjFtRXA3ZEZzWjZwUUhPZEhDRGo3YVdaTTZEMWYzSzM2YTdQUHZG?=
 =?utf-8?B?NzBoYzFmNzRObWJFK0FnempNMnRKNzhZTHRzWVc4d2RhTWlrVkFFQm5VUGFN?=
 =?utf-8?B?TEtPVVdlNFF5Ums0MjU1WkhoK0xwOW5Mbk9HemJGeVBFdXlyZGZYdGJCc21W?=
 =?utf-8?B?OUZOQ3VPOUUxS3YwdzJkbzdnMW55QkxNbUpQaVZXNlU1NHpBNGE2eE9YRzNi?=
 =?utf-8?B?UDBmLzBKYzU3dzlOODRJVzZpL05sVVFNZXQ0MzhiTnk1MjQ4WEhBcC9qaXMy?=
 =?utf-8?B?WEs5QWpEaHRFWENjOHF0UGhVTis0blRMbVB1S3Y2TGFjQXowVExvQjhuOEhC?=
 =?utf-8?B?QkNCeE5JekRDcVJlc2xqelZOUlVFRGlsOURtNlFjUVlMLzFvUGpFRzRleldX?=
 =?utf-8?B?Skk2UWZrN0VPUzlTalFGbkZQMmUrRHhkZmE0VjJYNVVjNitDT01GbzlyeTd0?=
 =?utf-8?B?MHVnMll6dm40cStRR2R3VmgwMWR2YUlmeW9tbWlzaTliRCtmaDNRNksvb2VF?=
 =?utf-8?B?Rmw1aHZjMDltVklGRVlMMjVFaGFJU1EvMU93bk91UjROYm1HZjhVZWlKR1Jo?=
 =?utf-8?B?cmh4ZkpDSHJuL1dEbElvYWxxVDZrQk5abkMzcVV2WjRzalVHNE91OFNtWG1W?=
 =?utf-8?B?Q2piTHNHNmJYZkZOL29wY01sS3hDMFJacldsRlFrc1dTSmxCckxXbFlPdVVY?=
 =?utf-8?B?Q1pCTVFxaTBuNldhSHNEck1GblQ5VUVpSllHVFZhZk1ZQThUSGJYNXZHcy9T?=
 =?utf-8?B?dkJvMEVKbHNQY01hakc0ZUpNcGJOdmdzV3JvNFRJMjBLbEhQVEVlNVlGTDk1?=
 =?utf-8?B?ZldhVDVTZFN1aklBT080d0JSSGIyY1FUb01Ua0xBNWxBcHMxTE9YV25aN2My?=
 =?utf-8?B?NjZZcGR2L0cydXYzTmVYZDhkdWJFNklQcWUyd0ZzdWR0anRnTDgvU1pRK2pI?=
 =?utf-8?B?YXVRa1hMSXRkbDRodjRUTExxUVltNXU1OEdFM09DaFBCQ01tNVpuVFhTeGJl?=
 =?utf-8?B?dkpSTlJMTUlVbXY4MkpkZmJkWlVVT2d6emE1QzlGL2grWlQ1ZFd1bUdkaDY5?=
 =?utf-8?Q?anInMHMxwCXsq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWx5T0FMZkFpV0tnNGFGQVdZMjg0N05wMmt5UDM1YkR2TVphSXZMb2RLdXlz?=
 =?utf-8?B?TGI5VEdBZGRLK2tqTll4NGRtY21ha2ZFZTVmOWtaNlI1aHRZSDlmS3hvazRt?=
 =?utf-8?B?bkhEODgyUGxHeG5SaUlnckJlaFViZ0Fhd1NQYWl4MzBxMEdjQWk5c05FNldm?=
 =?utf-8?B?dnBVeGJTeWpGdWtkMkI1Ti9ndkRNbFE5NnVEVkIwRHFWUWQrWGpVOXdOVGd0?=
 =?utf-8?B?YVMrTlV5UVRYaGdSaVBJdFZYQ2JONDg1UXJodWV6YTljZStFK1dMbW0rZk1o?=
 =?utf-8?B?eXRucUVCaHZZcTliTHlxYWxlZ1YzdkcxSHZHWGR5dzl4NjdrZE9GK3YzcnBa?=
 =?utf-8?B?SzE1T2FVWk92RSt6RGdDM28wZG1IODBSWllUNVJwQ2hvaGRoaFk0OEZhdjV1?=
 =?utf-8?B?QnI4TjdRK085U3l4R0w0dUJrV1dBRnl0dFI4bjNmYi9SY2tkVlFRNVFmZTFP?=
 =?utf-8?B?OTVmZUVoaWlXS2dwbEk1OXlySFA5eU02VTJlQWYzbC9XaUpwWDJISkVWeDRp?=
 =?utf-8?B?cHQvSlhnTXJINEdMcnF0U1BkbndpMFMxQ01STEpkeU5rRVFpcUZHV3p5RUc2?=
 =?utf-8?B?eVUzamQ4T0Q0Y0JRRlVpUUhRbnZPU2ZydDZMZmcvcWhPb3RnYzh3UUJyMGtE?=
 =?utf-8?B?aWo3VWdXV0VNZitoRHV6RGdWSCtac0lZclZEQVUxMFJWZk5jTHVRRkZDT0da?=
 =?utf-8?B?dUJQanYvQjRqK0IrSFdPSDZDalFBazVNN3huWUhlSmc1TWhiQ1dUMmh5bHIw?=
 =?utf-8?B?a2pBQXFvckZyVzV5SzVLclMxYnA0dXNkRXV4TTF4UWUwNW92S1NLMUlLaklj?=
 =?utf-8?B?aWp5RHhHMEp4azJnZnJoc3RwWmZCQUtGZW1zU1FpZU9SVGpIM1pHSU04L2FO?=
 =?utf-8?B?SHpwTTBmQXBEMWEzQU40N3pyM3o2Y2c5T2dHeGNtNFIzWTJzcnJ2M3NhWkdq?=
 =?utf-8?B?Z2NsSzA1a203WjR3RjZPSGQ4S3J2bkFEQks5LytTdThmaUZPQ0Fva25UOTY3?=
 =?utf-8?B?aFYzYWhuK2F4emlKSHZ4WnJRN1BzdVY2SUo1cnpWZFVQNXB1aGFqQ05BR2Jm?=
 =?utf-8?B?bVgzeXFKZ1M1MWhic05XZDNPMCtoOTlNejNQSU9QWDFIZklId05LZXgvTk5S?=
 =?utf-8?B?eFpLUnZGMUhXSDExbktJUDRrRjE3OUgwYURrZGtvUC9ieWRQQWErZFdwSXZM?=
 =?utf-8?B?SDBxK1ZJZWdGZTBqWnowTzJUb2owS3hpTFlleWZvK3RucnNSK0x6MHQrdWxT?=
 =?utf-8?B?S0ZTTHZxWkRxWjZpNVQzSkcwOVB6QW5UVUw5bEcwVll2eC81bktnc1pwb1dv?=
 =?utf-8?B?Zk9qczBucVl0VHByT0VWZ2ZGcWpLcDhKeGxBTWZ5STFBNkUrR3ovVXdwWDF3?=
 =?utf-8?B?YW1mblF5MXNJclBKdWpZc0ZCSWc4MWE4aUk1OUxMQWhEdHNtN2dGdDZrV1My?=
 =?utf-8?B?bTRsYzhRdGZHQ3FIYVRpTDE1TXdvSWlVeGhtVG5USGJHV2hTUlpjQ2NUTjhy?=
 =?utf-8?B?NGdNZG12MTltWTRCYlc2UjFqbnZwWlJkQU5wNjNhOG1mMlh4QmRZRUNaVW1W?=
 =?utf-8?B?WmcvZ1d4bDBDUUlERFBEZEJQSkJxcE91bmhGL3lPc3VUT3FEWTFuS1NDNTBM?=
 =?utf-8?B?UDRnRVY5S3pmS2h3VUVJN0k2MkVKK2lNUkdRa1VlMTZkblNzU0NmVHdWbGw2?=
 =?utf-8?B?dXpzYll4QmxkTmsxNTRRc3Jvek13SWU1MTVkVkUzaWtDeWxselQ0Rk1GY3d2?=
 =?utf-8?B?ZStzWHFXak9JdlpweExIVjFqMkpZSDBCUnRqZjhxSUE0WXVxVlAwbFNBTjU2?=
 =?utf-8?B?b2NIWGQ3N0NFRGhQZC9COXBJajd1SzJJVlpCZDNlaDlxbTJWd0RhQkdScHdB?=
 =?utf-8?B?TTByUzZsc1hEMCtwb29vL2RQQnFPd1hiVUFJSlhSSDNhb0xtcm01RmRvMVN5?=
 =?utf-8?B?M042cXZtb0NBakJKTEZvS3grZ29oNllKUjZaUnlIYVFwQVF6QzhaZ21qaW1S?=
 =?utf-8?B?TjNuSjBXSE1lWkRTdnBwaS9TOHRSRUdkYmRoN1hPWElNbWpTUzFmZCtJMEFP?=
 =?utf-8?B?WGN1bHZhQWZBbFJBbklvRy8ra3ovQ0I0ZjY4WlBFSTBTNzJzN3RnL05vK01C?=
 =?utf-8?Q?wM/yQyCtvzARlYMS3BWGYQAHe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b605f82-c977-4890-1df1-08dd63453662
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 22:11:47.5433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xj5rNrmoKO1jtITLPAbKkWPLWhbZvZXyjsITbUdJUnt9jWQ3e8p/UR7NA/WYBIaiiWhsz52JXKQXl11BOxy4cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8692
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

--------------f0sv0DyUg5R3ADI1dzZAsKcS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 14.03.2025 21:46, Michal Wajdeczko wrote:
>
> On 06.03.2025 23:21, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it is necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
>>
>> v2: removed storing shift as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>> v3: Removed inline keywords, enums for offsets in CTB messages,
>>   less error messages, if return unused then made functs void (Michal)
>> v4: Update the cached head before starting fixups
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |   7 ++
>>   drivers/gpu/drm/xe/xe_guc_ct.c           | 147 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h           |   2 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c       |   4 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c         |  18 +++
>>   5 files changed, 178 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index ec516e838ee8..dde6cb5a6be9 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -160,6 +160,13 @@ enum xe_guc_preempt_options {
>>   	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>>   };
>>   
>> +enum xe_guc_register_context_multi_lrc_param_offsets {
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
>> +};
>> +
>>   enum xe_guc_report_status {
>>   	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>>   	XE_GUC_REPORT_STATUS_ACKED = 0x1,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 72ad576fc18e..6f19bf9565ba 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
> maybe to make this function more "ctb", pass ctb instead xe?
You mean `struct xe_guc_ct *ct`?

I don't understand, why would we do this? We don't even need `ct` there. 
That would just add another `ct_to_xe(ct)`.

If we're adjusting parameters to what looks nicer rather than what is 
really necessary, then why `xe_map_memcpy_from` accepts `xe` and not a `bo`?

>
>> +			     u32 head, u32 pos)
>> +{
>> +	u32 msg[1];
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>> +			   1 * sizeof(u32));
>> +	return msg[0];
> and looks almost like our deprecated xe_map_read32 ;)
yes, it does look similar. But I assume we don't want to reuse that?
>
>> +}
>> +
>> +static void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
>> +			       u32 head, u32 pos, s64 shift)
>> +{
>> +	u32 msg[2];
>> +	u64 offset;
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>> +			   2 * sizeof(u32));
>> +	offset = make_u64(msg[1], msg[0]);
>> +	offset += shift;
>> +	msg[0] = lower_32_bits(offset);
>> +	msg[1] = upper_32_bits(offset);
>> +	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
>> +}
>> +
>> +/*
>> + * ct_update_addresses_in_message - Shift any GGTT addresses within
> nit: as this is *not* a real kernel-doc, then maybe drop function name
> and keep only description plus params?

will do, even though I don't know why we break the sibling rules which 
could be easily kept.

>
>> + * a single message left within CTB from before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
>> +					   struct iosys_map *cmds, u32 head,
>> +					   u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 action, i, n;
>> +	u32 msg[1];
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
>> +			   1 * sizeof(u32));
> ctb_read32() didn't work here?

It would. For G2H and H2G messages we always use FIELD_GET on an array, 
and field name contains index in that array.

So, I consider this way of writing it more standard within Xe, and 
therefore easier to understand. Though no strong opinion - let me know 
if you want this changed.

>
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		/* field wq_desc */
> as we have enums that describe field offsets, we don't need to add those
> small now redundant comments
will remove.
>
>> +		ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
>> +		/* field wq_base */
>> +		ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
>> +		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
>> +			/* field number_children */
>> +			n = ctb_read32(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>> +			/* field hwlrca and child lrcas */
>> +			for (i = 0; i < n; i++)
>> +				ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA + 2 * i, shift);
> did you run checkpatch.pl ? line is quite long
it does complain. Will fix.
>
>> +		} else {
>> +			/* field hwlrca */
>> +			ctb_fixup64(xe, cmds, head, 10, shift);
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
> nit: no short description here ;)
why would it need one? sub-function (ct_update_addresses_in_message) has 
documentation, caller also has documentation.
>
>> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
>> +					 struct guc_ctb *h2g,
>> +					 s64 shift, u32 *mhead, s32 avail)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 head = *mhead;
>> +	u32 size = h2g->info.size;
>> +	u32 msg[1];
>> +	u32 len;
>> +
>> +	/* Read header */
>> +	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
>> +			   sizeof(u32));
> ctb_read32() didn't work here?
Like before, for consistency. Will change on request.
>
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		struct xe_gt *gt = ct_to_gt(ct);
>> +
>> +		xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
> in caller we do mark ctb as broken, why are we silent here?

Incorrect head/tail of a CTB is an issue of completely different caliber 
than a message with invalid length.

The invalid message is actually more likely to be a racing condition 
rather than CTB damage.

>> +	}
>> +
>> +	head = (head + 1) % size;
>> +	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
>> +	*mhead = (head + len - 1) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages by updating
>> + * GGTT offsets in their payloads.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>> + */
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	u32 head, tail, size;
>> +	s32 avail;
>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return;
>> +
>> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +	head = h2g->info.head;
>> +	tail = READ_ONCE(h2g->info.tail);
>> +	size = h2g->info.size;
>> +
>> +	xe_gt_assert(gt, head <= size);
> we shouldn't trust GuC, assert is not enough
> goto corrupted; if this happens
ok.
>
>> +
>> +	if (unlikely(tail >= size))
>> +		goto corrupted;
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	xe_gt_assert(gt, avail >= 0);
>> +
>> +	while (avail > 0)
>> +		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
> maybe pass &avail like you did with head?
do we have a precedence for this approach being preferred?
>
>> +
>> +	return;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u\n",
> shouldn't we mention that "fixups can't be done" ?
Makes sense, the messages will be still received by GuC after all. Will 
change.
>
>> +		 head, tail, size);
>> +	h2g->info.broken = true;
> returning an error code wouldn't really hurt ...

Since when do we return error codes which are not going to be used? 
Didn't you asked for a change to `void` in previous round of the review?

> +	for_each_gt(gt, xe, id) {
> +		struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +
> +		xe_guc_ct_update_addresses(&gt->uc.guc.ct, config->ggtt_shift);

> this function returns int, shouldn't we check for errors?
> if not then maybe make it void

>
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..5649bda82823 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index b95934055f72..4442fb00d0aa 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>>   	action[len++] = info->context_idx;
>>   	action[len++] = info->engine_class;
>>   	action[len++] = info->engine_submit_mask;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
>>   	action[len++] = info->wq_desc_lo;
>>   	action[len++] = info->wq_desc_hi;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
>>   	action[len++] = info->wq_base_lo;
>>   	action[len++] = info->wq_base_hi;
>>   	action[len++] = info->wq_size;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>>   	action[len++] = q->width;
>> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
>>   	action[len++] = info->hwlrca_lo;
>>   	action[len++] = info->hwlrca_hi;
> nit: maybe this chunk, together with introduction of above enums, should
> be a separate patch?
Ok, can do that. It was introduced on your request, after all.
>
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 4ee8fc70a744..cd759579b9b4 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> instead of open coding just add a helper to query the ggtt_shift
>
> 	s64 xe_gt_sriov_vf_ggtt_shift(gt) { }
This is already a small function so I can't say I see the point. But 
sure, can do that.
>
>> +
>> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, config->ggtt_shift);
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	err = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	if (err != ENODATA)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
> do we need to have for_each_gt inside every step?
> maybe the loop should be here?
>
> for_each_tile() {
> 	shift = vf_reset_ggtt_shift(tile->primary_gt)
> 	if (shift) {
> 		vf_fixup_nodes(tile)
> 		vf_fixup_ctb(tile->primary_gt)
> 		if (tile->media_gt)
> 			vf_fixup_ctb(tile->media_gt)
> 	}
> }

What is the benefit? Doesn't the current code look cleaner?

Isn't it better when all drm_mm nodes are fixed at the point we start 
applying fixups to other places?

I don't think it's a good idea.

-Tomasz

>
>
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
--------------f0sv0DyUg5R3ADI1dzZAsKcS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14.03.2025 21:46, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 06.03.2025 23:21, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">During post-migration recovery of a VF, it is necessary to update
GGTT references included in messages which are going to be sent
to GuC. GuC will start consuming messages after VF KMD will inform
it about fixups being done; before that, the VF KMD is expected
to update any H2G messages which are already in send buffer but
were not consumed by GuC.

Only a small subset of messages allowed for VFs have GGTT references
in them. This patch adds the functionality to parse the CTB send
ring buffer and shift addresses contained within.

While fixing the CTB content, ct-&gt;lock is not taken. This means
the only barrier taken remains GGTT address lock - which is ok,
because only requests with GGTT addresses matter, but it also means
tail changes can happen during the CTB fixups execution (which may
be ignored as any new messages will not have anything to fix).

The GGTT address locking will be introduced in a future series.

v2: removed storing shift as that's now done in VMA nodes patch;
  macros to inlines; warns to asserts; log messages fixes (Michal)
v3: Removed inline keywords, enums for offsets in CTB messages,
 less error messages, if return unused then made functs void (Michal)
v4: Update the cached head before starting fixups

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   7 ++
 drivers/gpu/drm/xe/xe_guc_ct.c           | 147 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h           |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   4 +
 drivers/gpu/drm/xe/xe_sriov_vf.c         |  18 +++
 5 files changed, 178 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index ec516e838ee8..dde6cb5a6be9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -160,6 +160,13 @@ enum xe_guc_preempt_options {
 	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
 };
 
+enum xe_guc_register_context_multi_lrc_param_offsets {
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
+};
+
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..6f19bf9565ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -84,6 +84,8 @@ struct g2h_fence {
 	bool done;
 };
 
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))
+
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	g2h_fence-&gt;response_buffer = response_buffer;
@@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe to make this function more &quot;ctb&quot;, pass ctb instead xe?</pre>
    </blockquote>
    You mean `struct xe_guc_ct *ct`?<br>
    <p>I don't understand, why would we do this? We don't even need `ct`
      there. That would just add another `ct_to_xe(ct)`.<br>
    </p>
    <p>If we're adjusting parameters to what looks nicer rather than
      what is really necessary, then why `<span style="white-space: pre-wrap">xe_map_memcpy_from` accepts `xe` and not a `bo`?</span></p>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			     u32 head, u32 pos)
+{
+	u32 msg[1];
+
+	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+			   1 * sizeof(u32));
+	return msg[0];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
and looks almost like our deprecated xe_map_read32 ;)</pre>
    </blockquote>
    yes, it does look similar. But I assume we don't want to reuse that?<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+static void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
+			       u32 head, u32 pos, s64 shift)
+{
+	u32 msg[2];
+	u64 offset;
+
+	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+			   2 * sizeof(u32));
+	offset = make_u64(msg[1], msg[0]);
+	offset += shift;
+	msg[0] = lower_32_bits(offset);
+	msg[1] = upper_32_bits(offset);
+	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
+}
+
+/*
+ * ct_update_addresses_in_message - Shift any GGTT addresses within
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
nit: as this is *not* a real kernel-doc, then maybe drop function name
and keep only description plus params?</pre>
    </blockquote>
    <p>will do, even though I don't know why we break the sibling rules
      which could be easily kept.<br>
    </p>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * a single message left within CTB from before post-migration recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,
+					   u32 len, u32 size, s64 shift)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 action, i, n;
+	u32 msg[1];
+
+	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
+			   1 * sizeof(u32));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
ctb_read32() didn't work here?</pre>
    </blockquote>
    <p>It would. For G2H and H2G messages we always use FIELD_GET on an
      array, and field name contains index in that array.</p>
    <p>So, I consider this way of writing it more standard within Xe,
      and therefore easier to understand. Though no strong opinion - let
      me know if you want this changed.<br>
    </p>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+	switch (action) {
+	case XE_GUC_ACTION_REGISTER_CONTEXT:
+	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+		/* field wq_desc */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
as we have enums that describe field offsets, we don't need to add those
small now redundant comments</pre>
    </blockquote>
    will remove.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
+		/* field wq_base */
+		ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
+		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
+			/* field number_children */
+			n = ctb_read32(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
+			/* field hwlrca and child lrcas */
+			for (i = 0; i &lt; n; i++)
+				ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA + 2 * i, shift);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
did you run checkpatch.pl ? line is quite long</pre>
    </blockquote>
    it does complain. Will fix.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		} else {
+			/* field hwlrca */
+			ctb_fixup64(xe, cmds, head, 10, shift);
+		}
+		break;
+	default:
+		break;
+	}
+}
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
nit: no short description here ;)</pre>
    </blockquote>
    why would it need one? sub-function (<span style="white-space: pre-wrap">ct_update_addresses_in_message)</span>
    has documentation, caller also has documentation.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
+					 struct guc_ctb *h2g,
+					 s64 shift, u32 *mhead, s32 avail)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 head = *mhead;
+	u32 size = h2g-&gt;info.size;
+	u32 msg[1];
+	u32 len;
+
+	/* Read header */
+	xe_map_memcpy_from(xe, msg, &amp;h2g-&gt;cmds, sizeof(u32) * head,
+			   sizeof(u32));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
ctb_read32() didn't work here?</pre>
    </blockquote>
    Like before, for consistency. Will change on request.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
+
+	if (unlikely(len &gt; (u32)avail)) {
+		struct xe_gt *gt = ct_to_gt(ct);
+
+		xe_gt_err(gt, &quot;H2G channel broken on read, avail=%d, len=%d, fixups skipped\n&quot;,
+			  avail, len);
+		return 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
in caller we do mark ctb as broken, why are we silent here?</pre>
    </blockquote>
    <p>Incorrect head/tail of a CTB is an issue of completely different
      caliber than a message with invalid length.</p>
    <p>The invalid message is actually more likely to be a racing
      condition rather than CTB damage.<br>
    </p>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	}
+
+	head = (head + 1) % size;
+	ct_update_addresses_in_message(ct, &amp;h2g-&gt;cmds, head, len - 1, size, shift);
+	*mhead = (head + len - 1) % size;
+
+	return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages by updating
+ * GGTT offsets in their payloads.
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ */
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_ctb *h2g = &amp;ct-&gt;ctbs.h2g;
+	u32 head, tail, size;
+	s32 avail;
+
+	if (unlikely(h2g-&gt;info.broken))
+		return;
+
+	h2g-&gt;info.head = desc_read(ct_to_xe(ct), h2g, head);
+	head = h2g-&gt;info.head;
+	tail = READ_ONCE(h2g-&gt;info.tail);
+	size = h2g-&gt;info.size;
+
+	xe_gt_assert(gt, head &lt;= size);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
we shouldn't trust GuC, assert is not enough
goto corrupted; if this happens</pre>
    </blockquote>
    ok.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	if (unlikely(tail &gt;= size))
+		goto corrupted;
+
+	avail = tail - head;
+
+	/* beware of buffer wrap case */
+	if (unlikely(avail &lt; 0))
+		avail += size;
+	xe_gt_dbg(gt, &quot;available %d (%u:%u:%u)\n&quot;, avail, head, tail, size);
+	xe_gt_assert(gt, avail &gt;= 0);
+
+	while (avail &gt; 0)
+		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &amp;head, avail);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe pass &amp;avail like you did with head?</pre>
    </blockquote>
    do we have a precedence for this approach being preferred?<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	return;
+
+corrupted:
+	xe_gt_err(gt, &quot;Corrupted H2G descriptor head=%u tail=%u size=%u\n&quot;,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
shouldn't we mention that &quot;fixups can't be done&quot; ?</pre>
    </blockquote>
    Makes sense, the messages will be still received by GuC after all.
    Will change.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		 head, tail, size);
+	h2g-&gt;info.broken = true;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
returning an error code wouldn't really hurt ...</pre>
    </blockquote>
    <p>Since when do we return error codes which are not going to be
      used? Didn't you asked for a change to `void` in previous round of
      the review?</p>
    <pre wrap="" class="moz-quote-pre">&gt; +	for_each_gt(gt, xe, id) {
&gt; +		struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
&gt; +
&gt; +		xe_guc_ct_update_addresses(&amp;gt-&gt;uc.guc.ct, config-&gt;ggtt_shift);
</pre>
    <pre wrap="" class="moz-quote-pre">&gt; this function returns int, shouldn't we check for errors?
&gt; if not then maybe make it void

</pre>
    <p></p>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 82c4ae458dda..5649bda82823 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct-&gt;state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b95934055f72..4442fb00d0aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 	action[len++] = info-&gt;context_idx;
 	action[len++] = info-&gt;engine_class;
 	action[len++] = info-&gt;engine_submit_mask;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
 	action[len++] = info-&gt;wq_desc_lo;
 	action[len++] = info-&gt;wq_desc_hi;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
 	action[len++] = info-&gt;wq_base_lo;
 	action[len++] = info-&gt;wq_base_hi;
 	action[len++] = info-&gt;wq_size;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
 	action[len++] = q-&gt;width;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
 	action[len++] = info-&gt;hwlrca_lo;
 	action[len++] = info-&gt;hwlrca_hi;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
nit: maybe this chunk, together with introduction of above enums, should
be a separate patch?</pre>
    </blockquote>
    Ok, can do that. It was introduced on your request, after all.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 4ee8fc70a744..cd759579b9b4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
+#include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_sriov_printk.h&quot;
@@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	for_each_gt(gt, xe, id) {
+		struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
instead of open coding just add a helper to query the ggtt_shift

	s64 xe_gt_sriov_vf_ggtt_shift(gt) { }</pre>
    </blockquote>
    This is already a small function so I can't say I see the point. But
    sure, can do that.<br>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+		xe_guc_ct_fixup_messages_with_ggtt(&amp;gt-&gt;uc.guc.ct, config-&gt;ggtt_shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &amp;xe_device struct instance
@@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	err = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
+	if (err != ENODATA)
+		vf_post_migration_fixup_ctb(xe);
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
do we need to have for_each_gt inside every step?
maybe the loop should be here?

for_each_tile() {
	shift = vf_reset_ggtt_shift(tile-&gt;primary_gt)
	if (shift) {
		vf_fixup_nodes(tile)
		vf_fixup_ctb(tile-&gt;primary_gt)
		if (tile-&gt;media_gt)
			vf_fixup_ctb(tile-&gt;media_gt)
	}
}</pre>
    </blockquote>
    <p>What is the benefit? Doesn't the current code look cleaner?</p>
    <p>Isn't it better when all drm_mm nodes are fixed at the point we
      start applying fixups to other places?</p>
    <p>I don't think it's a good idea.</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&amp;xe-&gt;drm, &quot;migration recovery ended\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------f0sv0DyUg5R3ADI1dzZAsKcS--
