Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E607C369A2
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 21:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC1A10E12D;
	Fri, 11 Apr 2025 21:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tql6DsHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D359F10E12D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744408740; x=1775944740;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4Q2l3zo5j2ixdws7MGMe98zGjzbmj6QtGUaI/1x1RL8=;
 b=Tql6DsHG/HiMm9ZfhUQLz8TdyIv7ge+q2ZHiPjxKr1p8yVf/JWmlZWaI
 C2bLvzlGQzoHOZhheDNSi9PZLXCZWNAqeHSQKwEe0+xWIWSRzajpGW5mC
 FHUVVCJIfncAhDq4WNCtJveMKyLzL1Ni+WeVjj0r7AFFxsfmDKHPkMj3m
 hnyBfxRANPzvssL8IWWxz3pZ2mehXdDcqXrjyPstl4Xg/4Sy23GroAIXS
 dqm1+HdARIfTUC5gH4Y7RA0Mj6Dn3o8bBnuwr8ZL3gCWyZ8wOQP/UFnuI
 Qg+ock3Pf8kTtJ2qbGyk3SvJPMSUlGTN8+mkh5yHTIipwqE08gXClsFJ1 A==;
X-CSE-ConnectionGUID: 9hT1XzANT3eL8TtfTUwqPA==
X-CSE-MsgGUID: gb9viGoTQECUPd2rSQBWmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45107992"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="45107992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 14:58:59 -0700
X-CSE-ConnectionGUID: AbZXEWgOSWGz1F3XYp3zBw==
X-CSE-MsgGUID: plqe6qjOQoekoVn4PXP7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="129859852"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 14:58:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:58:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:58:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1H4Veov/JfXqXtodZNRot3WM+yDg/C0oAjErPFr+kAGuCprstM92JVINWqcsbMFUeiibWn34HH3Sq0vwjC3Uxn19DAOe4y4jOYjJcgJ6hfZq07noUIxgTcLvJ/IQ6ShzmUDbLz9dhmV0DmyJhXvtHuKClxmE2gyNE6FiL/O7SQfUExFSYU27Dh0MXXZw16rssXex1UwD01eta8lVVpBnb4qAKWmjb2q7v72KaYcgRCpb9Ee+/P+gcOuqTpfy98S8zYo9BVvzjEMcf6DLjHqzqJ7Ftq0omAvbA1p4ZBdejZ523avA4rkwAoYnk2+UftPTpYrYa9OARI9s9PjfJokQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuUv+cjTS5Ohoi4nexHV8GjCAL4dW0BPC2ajqU01/Qw=;
 b=JBpIGBPgrlWsJRTjBAUZZSeFehoXUfgruqR49kBElvF21CfE08gbJSX++qw5Nd7+6XuVZTSwZ+/ceRlGTvCFYY2WZVtagrOL1AIdpBiEVmkklqT1BGqRwxkTG4FWSbvN53Ma16q3gcgwqgbb9clI5bzON1STMlyLxGSc+S7gfpGIvnRcz/d3Msqt5jNnXqjytXqTSFQi9eiAYTU6Hjldj/xr0lKwJ5N3QBzYdUbTMGj6xP2CB/lKr8eEMi5+DpwbFAbIoKfX+BEnK1TqezUgwkmVprPrNTUuBUDuIponBWzUQiSWC1ajF7px9X2BVJ8Pty5UO/FPQUwSu/seOkBYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 21:58:29 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 21:58:28 +0000
Message-ID: <838b5592-3993-4d6e-8f3a-35a280c291cd@intel.com>
Date: Fri, 11 Apr 2025 17:58:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/guc: Add LFD related abi definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-2-zhanjun.dong@intel.com>
 <67483d2d-147f-4b7c-bad7-521162a69124@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <67483d2d-147f-4b7c-bad7-521162a69124@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:303:b4::10) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 0861ecc4-f21f-4715-ccb0-08dd7943fdef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkdwOFAwQkNmM3p2cGt3MC9JTnJ1Y2xvbkRhd1E2VFUrTUZ0QXFBUmV5TXZB?=
 =?utf-8?B?RkV1RWkrQUR6czdvSjZmMkZ4dTViNzg1MEdvSWRjWmhwY3RDUFdEcWZJYWp6?=
 =?utf-8?B?SXluYjZob0hEV1dHdElBMTJwMk9rbXFYcTdXYnpQYXppNy9wRmxJVVJvUGxm?=
 =?utf-8?B?TnAycnVUMlZrNzUyci9ycllUWU1zUHRXTWEzKzVDdThZbFlOc2tnWnNHMkc4?=
 =?utf-8?B?ODNKUzUyS3Mvb1JZZ202RW9wYUowUVFhdE0vVy91VitVbjdDbjlsay83Ykwr?=
 =?utf-8?B?RXh4d212K25aN3AxTUYyaE42NVllZk95MjlLM3dTMjNvTVk5Um9vQTJYdWcv?=
 =?utf-8?B?cDV3NlZ2cHhpMStDTWhxMmFMTjEreXhPc2U1VFBFYUpsZjk1Uk45MkhiUWxa?=
 =?utf-8?B?ZHVhNkYvWFphNlVvQVRkT2wwVk0wd3FKSzYwNEFON01nYUozWUQ5bFIwZ2F5?=
 =?utf-8?B?RFRjbXk0d3A2Tm9JamlkaWhiUXVoTjdVd0ZrVGF1Skx5ci82NjNLRnlHdG93?=
 =?utf-8?B?RVhwZG5BZko3UWd2dHRJRzN6L2VLVG9Scm9jaHo2djRFNG1HOEhmcGlZcy9y?=
 =?utf-8?B?b2F5T1hFWTdXY0pZb3RQZWFlUy9oN2NqS2JKY2J0SktOaXc4MGN2Qy9LcmlO?=
 =?utf-8?B?RkxjZTV5Q0VqNHZkWGFOYjlVMHFETVkwZkJsODJiMjk1ekpEZytzTU5FNy8v?=
 =?utf-8?B?WEtqSy84a2xBb0tPVTVHdllZY1l1aWx0SXRob0c3d2dZeXY5MWlqSmptdkNl?=
 =?utf-8?B?TFQ1Qng0R3BMTEhFejFuRjN3UTNSN1czOVBVYmJleDd2dUllNkh3QjQ1YUtl?=
 =?utf-8?B?M2QzbkRxVzNDZ3FGckQzUENmUkdzeUhrbHVnTGJid2d1bHVKMG5WSTRvZnlU?=
 =?utf-8?B?T2psb1NQYVpIQzZ0NjFMbkJ6WUo0SUZpR05WTDlReHM5dWIwUXprSmd2TFJT?=
 =?utf-8?B?RXM0YXVYaG1CVGdsOXRqVUFpVGVQdm84TksrRVJ6VXhjNFo1eHl3c0JkQk1X?=
 =?utf-8?B?Y3REaFRCNmJhSG1TdTNhSkpjTHYxdzJFTTNnYzVGSEptYTF6dWFMYUhvckhu?=
 =?utf-8?B?WHRMU3ozc21Mbkd3ZEJhMFhEVVpPUmpnMGZicGdxR29xTHlkWXltZExvb285?=
 =?utf-8?B?QjBNZnhiUjYrWitaeW55aTNBY0FDSVJTamsrd1FqSFd5ZnlheFUyTmtGaFNT?=
 =?utf-8?B?ZHJmOXJ5SEh3eXA3WEhYZWlaMnlFU0twdkxjUVZjZUgyeTUwWkVTNGxCcjYx?=
 =?utf-8?B?TVNIV1BCYm9EMW9EL0toeFBaUGEvM01xbWxNOE1DUWJWRzBYTktVQlRvNzBP?=
 =?utf-8?B?ZDhjNm5WZnhud3hhNW1lR0h1Qkh4K0N0dVdUSTcyRDhwcnY1d3Bua2VraCtL?=
 =?utf-8?B?eDVML3VRU2Q4WDBZai9QeUVOY3ZxMkxiZGEwUW0rRGkvM2VXYUpJQUFNb0pP?=
 =?utf-8?B?UWxGcnNTUm55WVFLTExURkhpN3NRV0xablJ3T3kxUFV5S01rSlBkTmJwbXZ2?=
 =?utf-8?B?ZjdobUd2aGVEUWlsYXZveTlSV3dYbm14MFVPVDN6TjFEd21GN21rYjFLZ2sx?=
 =?utf-8?B?SS9xd3U0bGtDTUtPdlgvZFY5ellhUlJuaU8yY3pabEM4SWJQb2R2bDdVWDh2?=
 =?utf-8?B?cnVaR2hOWVlCN0tGeVhNTW1tWHFnVW9udml3QWtiODd1QlVzNFRxS3JSejBV?=
 =?utf-8?B?QW9LbkZ6SjhYMGppUG9sckpJZnhJYTFpdlVkYkJEMzl4S01KdG42WXJZcmxo?=
 =?utf-8?B?a0JHZ2h4anpscVN5c29ZWGRaVk9KaUcyeVBqR3dqOGlwRnVTMmkzVXlXdUZr?=
 =?utf-8?B?ZXNaWFkxcEJYS2gzNHZTb0dnd2lqS0N0T0VZODVlZXJXY29TSTJ1VksvQmRv?=
 =?utf-8?B?Zms4RDhJU2FzejJhVHkvR2JoRy9HK0FtTHh1ODNaOFMrVXIwTjdsd2FPaWNG?=
 =?utf-8?Q?MbzBvfFao48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWUrU2dzbFVmTy8zZ3I1cDFXMlRJM0RIcVFtL1ZzY0w3V1hzUVdEZTZQZWVh?=
 =?utf-8?B?K2oxNWpDVFB6b0NLRWE1TnpmTiswb1lwbnFmeFRDRWJoMUhlYlMxcityNFY3?=
 =?utf-8?B?R25PTUZWd25tbjVQM3FPaVhLRzdRZGw2bGs4UCttUDYvRmxKelUrbDAwMHQx?=
 =?utf-8?B?djQwQkFaRWY4bEhTdGRzcTdHcHRhaHRmVFlVWEFIemFkdWdQUU9DRlJXeklU?=
 =?utf-8?B?NVlZblhrQnZzSXhxby90eFdaMFVBNG15YjVybzExMFBORkNMYnNYRDhIT1ZK?=
 =?utf-8?B?eno5Z2Fvck03SmVCZXdKcW95dTB5UzF2R2htWXpyV0NRR1JqL3dUOFhMN0hk?=
 =?utf-8?B?ZFAwdWhDS3FMQlJlajErQytjazA2dXVNOW13YWY0azZ1MlZxWTV5Yi91MTZh?=
 =?utf-8?B?K3EwTzdOOWpBcnV4bFJMdDZDRlRSNWQrLzI1TGhhR0I3Rmw1ejBaTVU1dkpN?=
 =?utf-8?B?NzN0WkpPcmdFTjRPUzhuT3IrSDdQYnAwSzJYcDZVck1aTmMzMDQ1Zy9ZTWtu?=
 =?utf-8?B?bjFXNk9FUTBLYVdERnlGeW1HOU8velVJd25UeERoNzhCSW5reG1WQ05JbTBu?=
 =?utf-8?B?NGM3MFNGMERoUDRFUXVvcVVEV2xnaGFGNzBJVHBwbTdQSnBFNUhabEJJU1Bl?=
 =?utf-8?B?QWRoRXA0eHM2bFAxS2loNlRTaWoxL09Yb1VrL3ZrYmc5M2Fia3c4eUtReDhE?=
 =?utf-8?B?OWNPWUZ2eGtwMzNQV3pjVnlWWmdvaitaTFFLTnVvTE9BSVB5dnNGK1hQRDZp?=
 =?utf-8?B?aDdaTmcwYjBGMHZNeFVQUGIwZHIzMlFjQkcxVU9oMUJpdXkySkJBM011MjlH?=
 =?utf-8?B?dUVPb2JzR0hiZE1xTVdMeWoxbkhkMjNHVnM1V2c5YXgrczFaVXRObmVHWmhE?=
 =?utf-8?B?QlUxZTZJSGlLWWUvekE3Z00rb0pSOGtOMkJ4NStnM2tIc1lKZFNEYlJQK0Jq?=
 =?utf-8?B?RkRmWmZhM0wvMXpRcmJ0OXNwTER2YUxTRDJKcEFsSHVGeFRKS0tUSzFMWGtm?=
 =?utf-8?B?NlM5WTZGM0RLcFBkM0ZsWkd2cVVnZWIzdW5wOE9YZVByUDlEUDk5allFTlh0?=
 =?utf-8?B?eWsyT1RBR3Rnd093M2h2Mis5OGV5WUU2dk10bTl5NnBqcTlUYlZzbHJocDdB?=
 =?utf-8?B?dDJTSDVqc1V5emhGb2lYT3F5Z29hV09QczJHaHE2WEUzaHcrY3RaSyt0bXN5?=
 =?utf-8?B?WXFBZVozZUg2K1dQQ1Nuc3oyUTRuTXdPSFRHTHhQZDMrRkJyK2E2SWdHdmJo?=
 =?utf-8?B?bHBzMnhYNEpHc3gzUUFMbVVwNTEzUzcrbkpQcVdMWlp3VzlFNHk5aloxN2Vo?=
 =?utf-8?B?bFlSNzhvN1ExbHFoSVVZeWpoTHQ5Tkt0VmF0VjRGblVma05ZTXZpYmZGK0Vq?=
 =?utf-8?B?NVE0VnAvdGxpRzlhU0diNmZ2R3gydWlTdU5xMEdDaWYzRE52bXA4NHB2SWlO?=
 =?utf-8?B?K3Mrc2hTVGJSTVJEOENQMHdoTGR3RW5kT21YM1pDakJXOUNnMnFCTkxxTmp4?=
 =?utf-8?B?cUFaVlJtalpkc2cvWXhQWmJoL2tpRzh6ZG1RZmVTYXdKK00vUG5QWnQxNTNS?=
 =?utf-8?B?cHhHU2h5VmJkdjNZaEpRbk1wTi9ZQWZZTkdERkx3UUg1UVJ1c1poS3ljS1VI?=
 =?utf-8?B?L3FWVzNiZ0dNY2pNUFlVQUwxUDJZTEExSXhsVjVBeE8vTVg1ck5jU0FQOHR0?=
 =?utf-8?B?c1lEYmNIQVFQWFE1cEw2ckRpYnFEemhnMDhmd3FCSWJ4WFEyM1VUNGV4Ujl2?=
 =?utf-8?B?dUo5aWxlUkorcXQ4R2VFYWlVUFFxRzZ5N3pFdXM5aXBCKzBUQjZrNFJJNVRB?=
 =?utf-8?B?aWJyOWd2elBXZG5XVHR6WkhhRTNBSDAvTUpSUjJaM0FGTUlhWTZjaThoYWFw?=
 =?utf-8?B?M1hsWEVBVjNBWm82aFBhZ3V2L21tVWJjdTExbjZ1NmlYdFFhTjB1cVlRb08x?=
 =?utf-8?B?UzBocnBTYlg0VlFsQXJBSWZ0aVNIbng5Q3JSWnN6anJxempXRkh0TXUxL2lM?=
 =?utf-8?B?aG9TblN3bTY4Mkp2RjFCK2JIWGZKSzdQcmVZaE5ieVlIeENMQUJFUm9iNlhN?=
 =?utf-8?B?TXBKdnQ2TmlqWWlyaXk1Qy9KWUJaT2ErMWdiaGZFblhBNWRla2FCcUJZRFZh?=
 =?utf-8?Q?91J2RH0x1W58XFHpaM4qGc6gd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0861ecc4-f21f-4715-ccb0-08dd7943fdef
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:58:28.8482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkIbsjZgT82gWD3cvD5V0wcA+ukVCf+mJfw0Io6v98cKkC2UZJogTv0SFRT1yihxCgyb5Fy7Rscr27srb7uuCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
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

Thanks for take time to review.
Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-04-11 11:28 a.m., Michal Wajdeczko wrote:
> 
> 
> On 10.04.2025 17:58, Zhanjun Dong wrote:
>> Add GuC LFD(Log Format Descriptors) related ABI definition.
> 
> Add GuC LFD (Log Format Descriptors) related ABI definitions.
> 
> and IMO due to a size this deserves a separate patch.
Sure, will do>
>> Add GuC log init config(LIC) ABI definition.
> 
> Add GuC Log Init Config (LIC) ABI definitions.
> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h     | 116 ++++++++++
>>   drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 265 +++++++++++++++++++++++
>>   2 files changed, 381 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..0b0c5631da93 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -17,6 +17,122 @@ enum guc_log_buffer_type {
>>   
>>   #define GUC_LOG_BUFFER_TYPE_MAX		3
>>   
>> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
> 
> what's the relation of above #defs to enum guc_log_buffer_type, that
> seems to be have similar enumerators
They are 2 different types:
log buffer types, which has 3 sub type:
GUC_LOG_BUFFER_CRASH_DUMP,	// 0
GUC_LOG_BUFFER_DEBUG,		// 1
GUC_LOG_BUFFER_CAPTURE,		// 2
vs
LIC header entry types, which has more sub type:
#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3

For example, the crash related defines:
GUC_LOG_BUFFER_CRASH_DUMP,	// 0
vs
GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		// 1
Make them quiet different.

> 
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
>> +
> 
> all below definitions seems to be about LIC and since LIC concept seems
> to be less connected with the legacy struct guc_log_buffer_state then
> maybe create separate guc_log_lic_abi.h file?
Sounds reasonable to be a separated abi file>
>> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
>> +
>> +/** Log Init Config KLV IDs. */
> 
> this is not proper kernel-doc format
> 
>> +enum guc_log_lic_type_t {
> 
> please drop "_t" suffix
> 
>> +	/**
>> +	 * GuC firmware version. Value is a 32 bit number represented by
>> +	 * guc_sw_version_t.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
>> +	/**
>> +	 * GuC device id. Value is a 32 bit. Refer BSpec symbol
>> +	 * GUC_DEVICEID
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
>> +	/**
>> +	 * GuC timestamp counter frequency. Value is a 32 bit number
>> +	 * representing frequency in kilohertz. This timestamp is utilized
>> +	 * in log entries, timer and for engine utilization tracking.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
>> +	/**
>> +	 * HW GMD ID. Value is a 32 bit number representing graphics,
>> +	 * media and display HW architecture IDs.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
>> +	/** GuC build platform ID. Value is 32 bits. */
>> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
> 
> well, none of above comments are proper kernel-doc, please fix
Will fix it>
>> +};
>> +
>> +#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
>> +#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID + 1)
>> +
>> +/** struct guc_klv_generic_t - KLV with multiple DWs in an array */
>> +struct guc_klv_generic_t {
>> +	/** @length: Length in Dwords of data. */
>> +	u16		length;
>> +	/** @key: Key value */
>> +	u16		key;
> 
> previously there were comments that due to different endianess we
> shouldn't define struct in this way, what has changed?
> 
>> +	/** @value: Value for this key */
>> +	u32		value[] __counted_by(length);
>> +} __packed;
> 
> this looks like existing `GuC KLV`_ definition
> shouldn't be moved there (if it's the same and really needed)
Good point, we already has guc_klvs_abi.h, this struct definition will 
be removed.

> 
>> +
>> +/**
>> + * struct guc_sw_version_t - This structure describes the full version of
>> + * a software component.
>> + */
>> +struct guc_sw_version_t {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
>> +	/* BR[7:0]  Patch version */
>> +	#define GUC_SW_VERSION_T_PATCH_VERSION		GENMASK(7, 0)
>> +	/* BR[15:8]  Minor version */
>> +	#define GUC_SW_VERSION_T_MINOR_VERSION		GENMASK(15, 8)
>> +	/* BR[23:16]  Major version */
>> +	#define GUC_SW_VERSION_T_MAJOR_VERSION		GENMASK(23, 16)
>> +	/* BR[31:24]  Branch ID */
>> +	#define GUC_SW_VERSION_T_BRANCH_ID		GENMASK(31, 24)
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lic_format_version_t - Log Init Config Structure Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_lic_format_version_t {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
>> +	/*
>> +	 * BR[15:0]  Log-Init-Config structure minor version. Must be
>> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
>> +	 */
>> +	#define GUC_LIC_FORMAT_VERSION_T_MINOR_VERSION		GENMASK(15, 0)
>> +	/*
>> +	 * BR[31:16]  Log-Init-Config structure major version. Must be
>> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
>> +	 */
>> +	#define GUC_LIC_FORMAT_VERSION_T_MAJOR_VERSION		GENMASK(31, 16)
>> +} __packed;
>> +
>> +/**
>> + * struct guc_log_init_config_t - GuC Log-Init-Config structure.
>> + * This is populated by the GUC at log init time and is located in the log
>> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
>> + * buffer states plus this structure must not exceed 4KB
>> + */
>> +struct guc_log_init_config_t {
>> +	/**
>> +	 * @lic_magic: A magic number set by GuC to identify that this
>> +	 * structure contains valid information: lic_magic = 0x8086900D.
>> +	 * Used to verify the information in this structure is valid.
>> +	 */
>> +	u32		lic_magic;
> 
> why do we have "lic_" prefix everywhere here?
> this *is* a LIC struct, no point to repeat that
Sure, will remove it.>
>> +	/**
>> +	 * @lic_ver: The version of the this structure. Detail description
>> +	 * is guc_lic_format_version_t
>> +	 */
>> +	struct guc_lic_format_version_t	lic_ver;
>> +	/** @lic_dw_size: Number of Dws the `lic_data` array contains. */
>> +	u32		lic_dw_size;
>> +	/**
>> +	 * @lic_data: Array of dwords representing a list of LIC KLVs of
>> +	 * type guc_klv_generic_t with keys represented by
>> +	 * guc_log_lic_type_t
>> +	 */
>> +	u32		lic_data[] __counted_by(desc_dw_size);
>> +} __packed;
>> +
>>   /**
>>    * struct guc_log_buffer_state - GuC log buffer state
>>    *
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> new file mode 100644
>> index 000000000000..b4002f099fd5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> @@ -0,0 +1,265 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LOG_LFD_ABI_H_
>> +#define _ABI_GUC_LOG_LFD_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "abi/guc_log_abi.h"
>> +
>> +/* Magic keys define */
>> +#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
>> +#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
>> +#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
>> +#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
>> +
>> +#define GUC_LOGFILE_LFD_MAGIC	upper_16_bits(LFD_CRASH_DUMP_BUFFER_MARKER_2)
> 
> upper_16_bits() requires #include <linux/wordpart.h>
> but maybe we can avoid that by doing:
> 
> #define GUC_LOGFILE_LFD_MAGIC	0x8086
Sure, we always want to reduce header file dependency. Will do this way>
>> +
>> +/** The current major version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
>> +/** The current minor version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
>> +
> 
> almost all kernel-doc (above/below) seem to be broken
All above are constant macro defines, not Object-like macro or 
function-like macro.
 From 
https://docs.kernel.org/doc-guide/kernel-doc.html#including-kernel-doc-comments
I didn't find any special descriptions for constant macro, if you think 
the above brokes, could you share me with an URL for the style 
description or examples in any existing source code?

> 
>> +/** Log format descriptor type */
>> +enum guc_lfd_type_t {
>> +	/** Start of range for required LFDs from GuC */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
>> +	/**
>> +	 * GuC Firmware Version structure. LFDs payload is
>> +	 * guc_lfd_data_fw_version_t
>> +	 */
>> +	GUC_LFD_TYPE_FW_VERSION = 0x1,
>> +	/**
>> +	 * GuC microcontroller device ID. LFDs payload is
>> +	 * guc_lfd_data_guc_devid_t
>> +	 */
>> +	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
>> +	/**
>> +	 * Frequency of GuC timestamps. LFDs payload is
>> +	 * guc_lfd_data_tsc_freq_t
>> +	 */
>> +	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
>> +	/** HW GMD ID. LFDs payload is guc_lfd_data_gmdid_t */
>> +	GUC_LFD_TYPE_GMD_ID = 0x4,
>> +	/**
>> +	 * GuC build platform ID. LFDs payload is
>> +	 * guc_lfd_data_build_platformid_t
>> +	 */
>> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = 0x5,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
>> +	/** Start of range for required LFDs from GuC */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
>> +	/**
>> +	 * Log-event-entries buffer. LFDs payload is
>> +	 * guc_lfd_data_log_events_buf_t
>> +	 */
>> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
>> +	/**
>> +	 * GuC generated crash-dump blob. LFDs payload is
>> +	 * guc_lfd_data_fw_crashdump_t
>> +	 */
>> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
>> +	/** Start of range for required KMD LFDs */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
>> +	/**
>> +	 * An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t
>> +	 */
>> +	GUC_LFD_TYPE_OS_ID = 0x4000,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
>> +	/** Start of range for optional KMD LFDs */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
>> +	/**
>> +	 * Binary representation of GuC log-events schema. LFDs TLV
>> +	 * payload is guc_lfd_data_binary_schema_t
>> +	 */
>> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
>> +	/**
>> +	 * ASCII string containing comments from the host/KMD. LFDs TLV
>> +	 * payload is guc_lfd_data_host_comment_t
>> +	 */
>> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
>> +	/** Start of reserved range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
>> +};
>> +
>> +/** OS Type LFD-ID */
>> +enum guc_lfd_os_type_t {
>> +	/** Windows OS */
>> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
>> +	/** Linux OS */
>> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
>> +	/** VMWare OS */
>> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
>> +	/** Other */
>> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
>> +};
>> +
>> +/**
>> + * struct guc_logfile_lfd_t - Log format descriptor (LFD).
>> + * A type of KLV with custom field-sizes + magic numbers.
>> + */
>> +struct guc_logfile_lfd_t {
> 
> better name for this would be
> 
> 	struct guc_lfd_header
> 
> as later we have specific:
> 
> 	struct guc_lfd_data_xxx
> 
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
> 
> usually we *do not* align member names with tabs
Sure, will remove tabs>
>> +	/*
>> +	 * BR[15:0]  Expected value: 0x8086. Helpful in detecting file
>> +	 * errors.
>> +	 */
>> +	#define GUC_LOGFILE_LFD_T_MAGIC		GENMASK(15, 0)
>> +	/*
>> +	 * BR[31:16]  File descriptor type (the 'T' in TLV) is used to
>> +	 * identify how to interpret `data` below. For the range of types,
>> +	 * see guc_lfd_type_t
>> +	 */
>> +	#define GUC_LOGFILE_LFD_T_DESC_TYPE		GENMASK(31, 16)
>> +	/** @desc_dw_size: Number of dwords the `data` field contains. */
>> +	u32		desc_dw_size;
>> +	/** @data: Data defined by File descriptor type. */
>> +	u32		data[] __counted_by(desc_dw_size);
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_fmt_ver_t - GuC Log File Format Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_logfile_fmt_ver_t {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
>> +	/*
>> +	 * BR[15:0]  Guc-Log-File Format minor version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
>> +	 */
>> +	#define GUC_LOGFILE_FMT_VER_T_MINOR_VERSION		GENMASK(15, 0)
>> +	/*
>> +	 * BR[31:16]  Guc-Log-File Format major version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
>> +	 */
>> +	#define GUC_LOGFILE_FMT_VER_T_MAJOR_VERSION		GENMASK(31, 16)
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_guc_devid_t - GuC Device ID.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_guc_devid_t {
>> +	/**
>> +	 * @guc_devid: GuC microcontroller device ID defined as described
>> +	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
>> +	 */
>> +	u32		guc_devid;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_tsc_freq_t - GuC TSC Fequency.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_tsc_freq_t {
>> +	/**
>> +	 * @tsc_freq: GuC timestamp counter frequency as described in
>> +	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
>> +	 */
>> +	u32		tsc_freq;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_gmdid_t - GMD ID. */
>> +struct guc_lfd_data_gmdid_t {
>> +	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
>> +	u32		gmd_id;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_build_platformid_t - GuC build platform ID. */
>> +struct guc_lfd_data_build_platformid_t {
>> +	/**
>> +	 * @platform_build_id: GuC build platform ID as described in
>> +	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
>> +	 */
>> +	u32		platform_build_id;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_log_events_buf_t - GuC Log Events Buffer.
>> + * This is optional fw LFD data
>> + */
>> +struct guc_lfd_data_log_events_buf_t {
>> +	/**
>> +	 * @log_events_format_version: version of GuC log format of buffer
>> +	 */
>> +	u32		log_events_format_version;
>> +	/**
>> +	 * @log_format_buf: If `log_format_version` == 1, array of
>> +	 * guc_log_format_version_1_t. If `log_format_version` == 2, array
>> +	 * of guc_log_format_version_2_t. Dword size determined by
>> +	 * guc_logfile_lfd_t.`desc_dw_size` - 1
>> +	 */
>> +	u32		log_format_buf[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_os_id_t - OS Version Information.
>> + * This is mandatory host LFD data
>> + */
>> +struct guc_lfd_data_os_id_t {
>> +	/**
>> +	 * @os_id: enum values to identify the OS brand (1=Windows,
>> +	 * 2=Linux, etc..). See guc_lfd_os_type_t for the range of types
>> +	 */
>> +	u32		os_id;
>> +	/**
>> +	 * @build_version: ASCII string containing OS build version
>> +	 * information based on os_id. String is padded with null
>> +	 * characters to ensure its DWORD aligned. Dword size determined
>> +	 * by guc_logfile_lfd_t.`desc_dw_size` - 1
>> +	 */
>> +	char		build_version[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_t - GuC Log Streaming-LFD-File Format.
>> + * This structure encapsulates the layout of the guc-log-file format
>> + */
>> +struct guc_logfile_t {
> 
> this should be the last definition, see below
> 
> and why its name does not have "LFD" tag?
My understand is this is the log structure, inside, it has LFD stream.
So we can expand it in future with more content types.>
>> +	/**
>> +	 * @magic: A magic number set by producer of a GuC log file to
>> +	 * identify that file is a valid guc-log-file containing a stream
>> +	 * of LFDs: Expected value: 0x8086AAAA474C5346.
>> +	 */
>> +	u64		magic;
>> +	/**
>> +	 * @version: Version of this file format layout as per
>> +	 * guc_logfile_fmt_ver_t
>> +	 */
>> +	struct guc_logfile_fmt_ver_t	version;
>> +	/**
>> +	 * @lfd_stream: A stream of one or more guc_logfile_lfd_t LFD data
>> +	 */
>> +	struct guc_logfile_lfd_t	lfd_stream;
> 
> maybe this should be just
> 
> 	u32 stream[];
> 
If LFD stream is considered one kind of supported stream in whole log, 
then keep the lfd_stream name make sense.

>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_fw_version_t - GuC FW Version.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_fw_version_t {
> 
> shouldn't this struct be defined _before_ the guc_logfile_t ?
> 
Sure, will do>> +	/**
>> +	 * @guc_sw_version: The full version of the GuC microkernel that
>> +	 * generated the logs as described in
>> +	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
>> +	 */
>> +	struct guc_sw_version_t	guc_sw_version;
>> +} __packed;
>> +
>> +#endif
> 
