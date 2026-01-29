Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A7D73E87
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 22:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8832110E8D9;
	Thu, 29 Jan 2026 22:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXUSgmi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8725410E8D6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769724497; x=1801260497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1cn4QuLzndgbxXl5iEZze5IXAFsuxN15s3ytB4r1DfA=;
 b=dXUSgmi5IPZWxaYHNqegLG9Ti34mqPgBpYxxXfsEmkC1LpGHqaQGdBAm
 QOQ8sefeQbUiQOy703ZOWKvq32z7vs5o52h9cCA+IV6b2uiBPJnmhsJIo
 zYz4m12sBNclwBGcPpCxrVPe7IS7fIAYwPeYrdLRkEgR/6cW/PdT2gpBi
 l/EHloEJNfatVPirlb+K58t/hynn3xPaeKoJ7S285B5r5ufYAzMSdpFxg
 yb7qBLntyk1Z4BDHcfVdGV3UDGyPuOqVpAnj/+sSMpmnbNVrIb8m7c97D
 Uzj3j4G9cKGaOcjP2u+p+llsVrHKWIXTovXTxLyD5H08qrj6fDKx1iAQ9 w==;
X-CSE-ConnectionGUID: SXz24e/lRRmFALcmjLJSJA==
X-CSE-MsgGUID: BJWoycDZToCnr7cxbiHdmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73575538"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="73575538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:08:17 -0800
X-CSE-ConnectionGUID: hjoIpubPR86eK/55+MWJCw==
X-CSE-MsgGUID: vAMTA1aEQPWQCl7BKrGi1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208801454"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:08:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:08:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 14:08:16 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:08:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BR2JHGlBeCp6HMxSN6Txe6InGjtLSeEEqgtJpq7fCzXdww+nZG1KeijfVOQiPmdGaoK3PnBhkcUASKmAWPSDN3zw8ZzUATISLQmJcmRIQkYKdhWbWWQxDH6JZ6NH3gQ7xnNxlrelz7Cu+ds+7feFaJjxp7sjLbZ95Ye7InaqpP5r3hKyO50NImeh1ox6uBjBagvN9pPqgAsmOzffK62OyujzlnU2SQHECP2pPZwUMWLl2y2hU5tAOj4hsSoaa8sNOeR15Yxzea/tBZ8Lxt9ZavXu//DSAxiEK6kEf4cZDLJhiWKz3CUQehzVnAQbamPH5AfelQfmoklqTkqwwkdepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV5bwOmUpFgXy5zt6tx5XGrcBPId7CvYj0txs3M5tro=;
 b=LSfZqTT3CRS1GK+J0m1zz9ChJAuuFh16KDCGHUNj8vuEsIpcFuZZiBslxl3TPZY7h0OebUQeqMke+cYJ7vsRSFYZyEWELaaofXchchJjmaW5pIfay6jChF+Hhp3kVS0dnvTKRkqmEK0GpebcsoB1ArVpfcZwPchpJWInlNG8i+yWriOzBbhVZ7sAOvSNl6Uf1DyOQxrteLaJJB8MSgo4Jil4cFTqH9B5LLdbRlSx4BUxmNi1MJE7NFYoXud+PEknvsDttIdf8TKj5UFKryI9EP2Y6YXJ5+mTJjU2MtJwQCLdSZX0R/+cesz5JOIS+KlkOf2oeF7e34rVQgpHH8bRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 22:08:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 22:08:12 +0000
Message-ID: <be02d9ad-7a2a-49ca-9d08-22970761a1bf@intel.com>
Date: Thu, 29 Jan 2026 23:08:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
 <20260129121044.3670780-10-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129121044.3670780-10-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3993c2-6c85-4bc3-e032-08de5f82e47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmlzRGppV1E1Z0pHdE5kWGVvbEtOd0FwSzVoblZ5dTJLaHM3VDBkYlFjK1pW?=
 =?utf-8?B?QjlHTjhvL0xtNGE4Q21kd2lxV3FQOWNjK2hvTWF4enpMbk82OWQ3SEcyZFZt?=
 =?utf-8?B?Q05rdyszUnhXZWtEV1YvWVgvNzhIQmlVU0oyd1BXdFd0bk0vZnRhQWYrVk9Z?=
 =?utf-8?B?K2JYMC9IcUptZmhSY1BKQllEWEI3MmJNeEpjTVdMMmVVcnl3c0JlK2ExVE9u?=
 =?utf-8?B?QmhHejhGa0dOT3c1NWEyRVRMb3lNZkhMWjRhaGVHRUkwUElXU045SkhMSzly?=
 =?utf-8?B?aDAvSmZtSDR5L0R5enZSMHhsT1hyMmRDNWZLV2dsaEdvbU1zdFhoYWtaTVRO?=
 =?utf-8?B?K0lXRlJSQ3NieGQvZnRzTkFEeCsvN0Z6d1hCcndZUlhFWThjZXJpQzlKMjBI?=
 =?utf-8?B?OUxkczE0OTZDdWQ5a3RFdXlmOS9MODlrZk1Temhld3hhL1B4OWZNR3I2ckhV?=
 =?utf-8?B?U2hKNHdWTExXZng0MUtTbmp6bkFSOTR6WCs1cVlCeW5hTDRvYTNodFhWQlNK?=
 =?utf-8?B?QXNiZmNQR3dLN1ozVktIWHRuWi94bW5COTBzNmJQN0RXT0JWdGRjZkYvZTVI?=
 =?utf-8?B?ZlhuRGNNN2lxZ3QxQjlZSzJMQW5HdGhucUVXV2hIUTlnaHdGM0ZHQ2pkSWl3?=
 =?utf-8?B?OVA3bkgyZ2hFRi91VlJvWUVvekVrcWQ1aUpwejllOUFOUFlFLzJVQlU3R3Bt?=
 =?utf-8?B?czBRV3l6blFpZ1VXVTQ4U0gvbzhuNHF1UzJ0MmdNb3VYTTFVazkxOHdOTkxm?=
 =?utf-8?B?QUc3cGw1eG04WVYrdFpHMnlObmpqNXphQmNaWGsreE9oNEJiNGp4WVlJUUUv?=
 =?utf-8?B?TmFMNjNxZmp3Tmg3QXlVYjhIK3ZsS3M5UnJVdHZPL0wxZVVHcmVWMmdyOW9Y?=
 =?utf-8?B?SUZ2UlpRay9JTXRFWG93TWNYMG9VOHRRUVFhMGEyTUtoaE5qSVJHdExRelo5?=
 =?utf-8?B?TEo2WEs2WmVPQktVd2FCQmVQeUQ1Sk9qOWhxR2NyMWlFckI1STBhMU5QZDM2?=
 =?utf-8?B?aVp2aTIwdkJiSTFGOTlNUGV1WFNsVFZqQlFiUFE3U0hHSngvSk44dUR3TVQv?=
 =?utf-8?B?c25kcDI0MUNHWmRFcmdWZGlNbytpWSt6cjBWNDNTb0lmdUxLVjF0bURsZzFG?=
 =?utf-8?B?L3EyWHBiWllVN1o1QXlCQnhHR0hYbXVJMi9USnRRdTBzWGJRRVltc1NSWFRz?=
 =?utf-8?B?RDdlVWxMdU5OSG5uQWNmc1ZCSElDS1Z2bit4dXhUemFDWW13MFRhalR3U3Vw?=
 =?utf-8?B?OGhCRDlLempZdGl6T2JocGZlNmVrdmtmK0l4K3J4NStoQW1OV0xrdEZxcm5x?=
 =?utf-8?B?UHh1TkNoRm42ODUwR292YUhrbm1VNVhRb016dmphUEtFdUJKejZ0dnBmWUNz?=
 =?utf-8?B?MlNrMFBGUFZjRGRicXNWL0wwb1NtUUVhdmlJMGMycXpVSlBaSVNVaS9nckVK?=
 =?utf-8?B?ZWFYcncrZGdiUDF4dHhhS1VBWURRY05QbGxNQ3ZPalUwN0hsVEkwWnpjQStk?=
 =?utf-8?B?eXJ1aDNTVzRZVGpOYVVGcjRPZXdTUWlUa29rNjVQSkZubXVaaHg3WTFMTjg0?=
 =?utf-8?B?L3JnaVpFN1QzYnJ1VWdxL0lBWjBRRGRrcXpnYUdTL3lyTXppS1FLNmFxVXJF?=
 =?utf-8?B?YXhmSGcyenEweHNXYlN1V29HZDB4OEZ0MjQvYTBRNFk0U2ZGM1JvQitMSTNp?=
 =?utf-8?B?YndSVndFYy93VHRsZjlrL0Z1dDFnRHhwUENiMWdDTXRlb3dKbXBWY0g3T1ZY?=
 =?utf-8?B?cnVnY2pkbm5ndUh3LzVlZEdpekcxdlY1R1N2dkF3clNJR1NFUmEvbVhHLy9m?=
 =?utf-8?B?UEc3TnZCSHNzTkNqakxpSGVHRVR4NC91eG1FUmU4SE4yaEJrTjMrNnNZd05k?=
 =?utf-8?B?Z3NpV0dyY3ZjSkVXR1BhdHB6Y0MraDBXZ3dnWmxMQXU2RGk5ZERPREx4dUpr?=
 =?utf-8?B?RUZaNjMwVncxRXRWSlVjd0NYSWVvbkJaMmhZbURDTUg3UlNLZWxmUHdzbTRt?=
 =?utf-8?B?dG43ZmhhVm90Uit3NlIwYXd0T2pjYUxCclUrTUVwaTZUWFFjVUhzekJSVEsr?=
 =?utf-8?B?NjQ1VHZ3RG5jTWJ6eU5wRlI4cHovRlNINWUrZENqUWVqMFM4Wi9rNnA3QkY1?=
 =?utf-8?Q?Cu1c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFlGS0lnMU9Bc0lLVHFuTkdmODNXUmtzZVN4cWh4bGZyN244Qm41NTdzRUVJ?=
 =?utf-8?B?YlkvSFpRT0Q5K1FtYVRhZVFaeVZNQ3l6ZlZmdkJCMUp1YjNUQndzVGI0enF3?=
 =?utf-8?B?amxQRUNBQW04REJ0NTVLSWFyQkRZeFdmL1QxQWIraTEydnhRalZxTWFqbW1K?=
 =?utf-8?B?bUVzbW9leC9yTUEzSVZOUjhoTlc3Ym84UWVackNud0VhT1EzbDFzL1RoNDNH?=
 =?utf-8?B?UERITjVNM3VuZ2ZvY2tIQUpDUXBQT3BKV09Mc21rOVBEMTBrYmdBUFB0RXk5?=
 =?utf-8?B?WmdUeXBtRWx3RXZYN2hiLzNPWXJnSTRHeFFEQVY3MTluUStYdVRTSW8raHpD?=
 =?utf-8?B?MXhLREIybUk1Mm9JSjZkS09oVmV4OHQxTnVTcEtZaHJVdHFlZkNqMFpoRi84?=
 =?utf-8?B?ZUFmU3o2UzM5NlQ3QnZXTTVaMlYyM1FsL0Nid0VjT1kyUWhDQzc0N2lZcEt2?=
 =?utf-8?B?K1VMN2Z2cUJNdXVKN2xTUzl5SVNUWFI3cmlDdDJPNzFhQlZjVEVOR0V1RFlx?=
 =?utf-8?B?T1I1WGErZDg4anArTGRWNjc1bE9jMVlmZWQyOFVvNkhUajFQTEFmUElEMVhr?=
 =?utf-8?B?amI5all4dVNrUmI1R2xucy93ZmFibkNwOEJ3SWVkS2hIQTlmcUswMkR3Wldv?=
 =?utf-8?B?eFBZbDRHTmJUaWtFclE0K3puS1lMMU03b2kxMkRDMWw0TGcyMUlDZ3p1aU1s?=
 =?utf-8?B?OWhxVGloUWU2OC9HQXQ5TDBDMU1nU3lIUFQzTnRnZjdjK2JJZkd5bC9hdk5H?=
 =?utf-8?B?eDh2YXBFc0xwOXBmMTA3bm9uVGFlM1k2ZlVQTzA3YXcrYmFBSkxBSjhlRWNK?=
 =?utf-8?B?ZVhRam9nVTlIalRSdE5CWklPN293bEQySmdYWjBwM09YbFdMQjcrZnJEOGpm?=
 =?utf-8?B?clRoS3pId0E1NTNqWi8zL2xkVGxVN3Z0RDFiTGpEZC96LytBSVhDb0ZUUGtJ?=
 =?utf-8?B?SFVwK1J4SHNKWTlFRVZIQUpLNlZHR3ZGbjhBVHNabHIySnN3YTZlUlN3cUVR?=
 =?utf-8?B?UXJMa1BGREppK21FclZ0QmZyV3dMNlluQ0VzOExIeTVtUFhKczdZR0pZbENa?=
 =?utf-8?B?TE0veFhpRTN6REVDQ3owUS9EcVRPVENzM2REN0RoNyt4dW04U3pxV2R1ZWln?=
 =?utf-8?B?cE5tSTNSQTJOcVBIVnZNMzlQc0tHNmg3WFpheEhibGFROHBWY05zS3NVTFhQ?=
 =?utf-8?B?UUt2R0ZURVMxV1cvTzN4VTQvYUxqR1pobXg3dHZtdmpQa3RBMXVGVThVNXdx?=
 =?utf-8?B?OUVFSFl1K3ZTRUIzSTJWOStzZnhFQUM4akh0bE4yT08rRmM1aUVINCtrRU1E?=
 =?utf-8?B?bkdBSUhkaUQ4YTM5SVlxMGt3RElBRmkzZ0h3MnZmRGhiQ2JtU0orRDVjMFBI?=
 =?utf-8?B?bURFRXd0dk1DSmhuY1p3ZWo4VEJBTmFXTVBWeVNPRStzWlE0NnNkNVBnb0pw?=
 =?utf-8?B?QXZNSXUydDVISkNyV0pubjY0ZmU0K0xoTW9WY1BWWmtSNmUvUmhMZWgyT3RD?=
 =?utf-8?B?a1FnVERySCtSZC84S21NNDZaUDFHeXpaVjNOR2VVN05RcVVOWmN2eTNQRitn?=
 =?utf-8?B?NHpmcE55VzhyTmk0M21jdkovTG1LRXk1QTFldWFkak04RmZHRTB0Zm96ejM1?=
 =?utf-8?B?Rk9HT0Y0U2UwK1pLanRNNlVIb0ZtNnhSazEzM0pSc1dJMisxOFU1UTJuVk1l?=
 =?utf-8?B?MnEwd1UzVHFYM0hncUFzVkNva3Z4eUVPejVmOHppLzUvQy9jcXErOHZuZkZR?=
 =?utf-8?B?a2VSTEhpanZoejFqSnVBbHpLU0RidGFnQ1Bvb2ppTEw4enpCdWRjSDNVOGZB?=
 =?utf-8?B?elphbGdnWEVGVFQyRHlpSUwrc2pxMkUxQTI4WTRRNzZvWjF0UTVUcklPT2VX?=
 =?utf-8?B?ZEhKY3lxUjlaRDA4L3JuYUpDTG00aDBTVkIvOUY0QXVDcWxWWUFVVWNiYlp3?=
 =?utf-8?B?L2FSeHFBTkxOVHdMVFhWSGFuN0FtR0R6Qlh0cTY0QjIvMXRtNGU5TnpGMi82?=
 =?utf-8?B?bHVrNW1tWjFWMWV6NVhUSFU4TWNKSDlVZzBiZitmZzZIREtOTU9KSUdaSG05?=
 =?utf-8?B?T0RwbFIzTTRDaWwvMm5RcmpHSHQvZ2ZkUEdMRjBVbVZMWUMyR0RkRUlLVTVK?=
 =?utf-8?B?LytTdmlubFBzSEd3a2NUVFlYZDRvbDdFVUVNNTNiU2N3aXFCSTN2bitJckd5?=
 =?utf-8?B?VVdPNTFRUWwxcUF3VXJzcml0VnhCbEg0TGtvZGliNkZUUHF5cWROQXlaOWxK?=
 =?utf-8?B?dHE2TVV1UXZlVzl5ZTM2elkrYkRTVlVVdWRQNE5teW5ONGUyem01UTdHWk9o?=
 =?utf-8?B?TWlPb1UvL09lNGRRTzU5WE9UYjdiZUMyKytvb0RPRWhmWlhJS2FiWlVnOFRz?=
 =?utf-8?Q?1lXgq4QakO8xQmYk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3993c2-6c85-4bc3-e032-08de5f82e47d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:08:11.9653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQa/nm6PXK+vsXTOxAzt/ejry1MGWcR2n754LtVJJHwBU/pLOHQSLW7UHtMFExK7DQaW9YINqYeaG4b7VgxofN+SEj9soy9Mh1F4M+5cfc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
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



On 1/29/2026 1:10 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add type definitions and header declarations for System
> Controller mailbox communication protocol.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v4: (Matt, Mike)
> - Add domain-specific MMIO accessor
> - Change phase_bit type from u32 to bool
> 
> v6: (Matt)
> - Add mailbox protocol constants
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 35 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 42 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         | 33 +++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> new file mode 100644
> index 000000000000..2b64165c8e76
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __XE_SYSCTRL_MAILBOX_H__
> +#define __XE_SYSCTRL_MAILBOX_H__

nit: in Xe we mostly use single underscore in guard names

> +
> +#include <linux/bitfield.h>
> +#include <linux/types.h>
> +
> +struct xe_sysctrl;
> +struct xe_device;
> +struct xe_sysctrl_mailbox_command;

please keep forward decls in order

> +
> +#define APP_HDR_GROUP_ID_MASK			GENMASK(7, 0)
> +#define APP_HDR_COMMAND_MASK			GENMASK(15, 8)
> +#define APP_HDR_VERSION_MASK			GENMASK(23, 16)
> +#define APP_HDR_RESERVED_MASK			GENMASK(31, 24)

those definitions belong to ABI, no? see below

> +
> +#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> +	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> +	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
> +
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> +int xe_sysctrl_send_command(struct xe_device *xe,

why xe? this function should take sc

> +			    struct xe_sysctrl_mailbox_command *cmd,
> +			    size_t *rdata_len);

what's the point in adding function declarations if there no functions in this patch?

> +
> +#endif /* __XE_SYSCTRL_MAILBOX_H__ */

nit: we usually don't comment final endif

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> new file mode 100644
> index 000000000000..ce10924c5881
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __XE_SYSCTRL_MAILBOX_TYPES_H__
> +#define __XE_SYSCTRL_MAILBOX_TYPES_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_sysctrl_mailbox_mkhi_msg_hdr {
> +	__le32 data;
> +} __packed;
> +
> +struct xe_sysctrl_mailbox_app_msg_hdr {
> +	__le32 data;
> +} __packed;

as above definitions looks like HW/FW ABI, maybe we should put them into dedicated header in abi/ folder ?

> +

add proper kernel-doc comment for the struct itself
otherwise, members kernel-docs will not be recognized by the tool

> +struct xe_sysctrl_mailbox_command {
> +	/** @header: Application message header containing command information */
> +	struct xe_sysctrl_mailbox_app_msg_hdr header;
> +
> +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> +	void *data_in;
> +
> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> +	size_t data_in_len;
> +
> +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> +	void *data_out;
> +
> +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> +	size_t data_out_len;
> +};
> +
> +#define SYSCTRL_MB_FRAME_SIZE			16
> +#define SYSCTRL_MB_MAX_FRAMES			64
> +#define SYSCTRL_MB_MAX_MESSAGE_SIZE		(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)
> +
> +#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS		500

add XE_ prefix for above defs

> +
> +#endif /* __XE_SYSCTRL_MAILBOX_TYPES_H__ */

ditto

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> new file mode 100644
> index 000000000000..d4a362564925
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_TYPES_H_
> +#define _XE_SYSCTRL_TYPES_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +struct xe_mmio;
> +
> +/**
> + * struct xe_sysctrl - System Controller driver context
> + */
> +struct xe_sysctrl {
> +	/** @mmio: MMIO region for system control registers */
> +	struct xe_mmio *mmio;
> +
> +	/** @cmd_lock: Mutex protecting mailbox command operations */
> +	struct mutex cmd_lock;
> +
> +	/**
> +	 * @phase_bit: MKHI message boundary phase toggle bit
> +	 *
> +	 * Phase bit alternates between 0 and 1 for consecutive
> +	 * messages to help distinguish message boundaries.
> +	 */
> +	bool phase_bit;
> +};
> +
> +#endif /* _XE_SYSCTRL_TYPES_H_ */

ditto

