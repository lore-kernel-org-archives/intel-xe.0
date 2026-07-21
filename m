Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B77C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 05:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DE910E1F7;
	Tue, 21 Jul 2026 05:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvp/CQiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD60A10E1F7;
 Tue, 21 Jul 2026 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784612490; x=1816148490;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WRXZOztNIOq47Ka6t/xKcp06me1LsuKjeTz+nH5qY4U=;
 b=mvp/CQiRb3vqBrbChA93c33cw1fr+08D9T7gKxA6yH7G+w+nGQNsLWqj
 vM54vXhZmyXyol3QhF3AfKPCclAKFjGbhNBfc7De96bTN21aNHJyA3pBd
 YjuOCvBzkZKUF28N5PLjkYxONqJcvCaGTLwY7O6KdOdRUlFIlYFORoF9O
 bDNfU3lZaNNxe7la6BrhVaP0oswUGRXdBOH88/0oGAQqYiC1U+VuYZrh7
 9yWk55iO/9JUpUIxrAs7eRq1tgvUZ0v22CvsW53+xtpGuV1yGI5NcVCGk
 2+FdhfpTGsIrYyV1+pJSclnE/DRIgWqpwNAsO6UgNUaR75JTd2EputP4w Q==;
X-CSE-ConnectionGUID: cLUgVUSWTLO/zvLBbqtfJg==
X-CSE-MsgGUID: b9xXzwJZTxebTXdHMLULWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="87739832"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="87739832"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 22:41:29 -0700
X-CSE-ConnectionGUID: Pny7VzQ6TZCwyrE1oaKA1w==
X-CSE-MsgGUID: NShyG6yuRWedEhK57LES2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="256459992"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 22:41:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 22:41:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 22:41:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 22:41:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwRtwXj2R84DTCELwUqWLwQ0tO49ypg5xs/6+WR5D/l4o7xi8kHJeYezVjKsuMku9+ZrBvhECRt8al/aXtdxgNfrwCc2iOxnInXzKdXnQ0AH3HVVp+vjC5smfIN0aU8PQMXLJfy+G/j6Iy/EpuClJcb3C0bpTGzCYgI78T+GXoseCw4JAiQu3hkdASDCA3D5QfQJv5j6TD7kAQovetabwUFp5DaTE3UIQ19PcpprAHf0M8aztGJVKGrhN1OvnyyOO2tez8xBbsFIcARBUU1Zz7cQmQSJIaDAtO7f6gi+EAHmKiwB23c9sx0UPR7lEuostvSBFvXvkSwWEmScRczz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEZKlqLUcuL7z4zUzUtSMvuiXC7Qdx6zeHr5ksAYv/0=;
 b=iuHRZfCw9BhpiCVa37ir4kTjwFTnEnZyaTiz08YDQbCY842lqjnG+RkGcP0kCUgsS3bZ8lORCAFVOB7b1+e2CVK+TgUdCPjoMVHBrh171sY6LAYA1L3nH9uR5MmyiS2bj32BVvLvHMFTC2w4HHxbQGpCo5QMw9d5Q/VJm+0FfCcDQeps87aTa1Cc9S8OwzQ53x+J6Xrb1q9UvTY9ppCTaGzKlpdzc0GkRCwxBs/sqZ+Qi9e6fi8ErZPi3DPeMbTYc4efZDCh0UXQvKm5Q+/94u1AIbEIa7GyNTXi5ATT7rP+rRAaGjHNtBEbbpDlvxAyYfsEC10xSDsoXUGDC/erIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 05:41:21 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 05:41:21 +0000
Message-ID: <8e525127-f3d9-49ad-b04d-3769dc0a6c5a@intel.com>
Date: Tue, 21 Jul 2026 11:11:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/hdcp: Make hdcp2_encrypted and hdcp_encrypted
 mutually exclusive
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260717034734.477591-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260717034734.477591-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0256.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::14) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: b43a1789-27a0-43f8-6bc0-08dee6eab179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: twUVudjnUVnpfO1SA3XMZ5QzInoXIztpZD1ER1o0HxW/AiLezJRfztJTKw2KsEuxhfixlx21qC6zE99Fy0zlqDa4O49r9pL9AtpSfKKcx2CSXogtIKHOYqxgp3V4Z4tFHu4CB/SnPLWdtxTOcqUdUvf5WoXN55gQO72EmI4z7zneT8JvG40nzrQJKgczzGeAzteeZnwgNZMGue8Q+fYnuLpAA2awynui2yhj0zdszCbibSvkuoyk7KUF609pR3JyLgHcIQwjOXyJouY8KOiwwWKHfGz2Lt2iU+ct8lHCJFMeSasDa4SDN2g0xHByKi63rP/tgIWmzexBXjKtdGqj0suja514kpLwrI7C8eQz6tKGjmhqOrt/Cqo8CEWuM2zjhPso3Yqtc3ZCl7wLWODPMWU4yXA/yAPGZjVSsYCXp4MLfCDypckl6wdKPCCuwv4MOm/KptTFb8Im+ONNPSsAhHE0mbhDG3EqTSppGA2u5zvgaLhr+Oq7oBXCy52yK9ojrBG7Kb4GY5UyhAbg0xTWPnVlYQwvR5xm5qbQICiaxcjoPLEcJGPUAkzGL1VFZMo5rBdlg9i73NcHj38jFKFuVHLQdV1EE+OYjwYAPT8y5S8OqeK2dqVXJbLOeALHkSzbG4zSoPwaX8LxOMNkjJZdrqc2sqbGds6KoV3oFbUDxlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1dnazNjaytoQ002cUsvZ3dpRHNKSnlMTXlJWGFlSGZPMWR6M21URHpqWDVQ?=
 =?utf-8?B?K1c2VllmQW95UHd4Q2g4a2RMS25BM2YwZ2VEVGhSY3FkZjcrNm1xWkpaNnNE?=
 =?utf-8?B?NUFFVmlITUpZS0xkNE5oOWNrdHFEL05QZ2NUUjBnd1Axb3NCcFREaFg2Rjdw?=
 =?utf-8?B?Y0JNSG5wK0RRZk5WVVdUZGdFUmhQa0wzMWhLNHNUeXE2aWxHcmdoeUFOdUto?=
 =?utf-8?B?ZEdUUCtmaXdDaU9RcTk0SkxtSHJwbGJWUGpZNGNCVEZRTDk3M1BONTJ1aUFI?=
 =?utf-8?B?eWRYaXptMHZQVktTKy90TE9icGFKSTRkWTJraE9vbksvalFWUG1odE1tSHNL?=
 =?utf-8?B?OXE5MGM0MStOQXVhOVIrRWMwMjd1cFpBdWYrMVpBcHhXTDN2YVE5dHdpMTd2?=
 =?utf-8?B?cUVjUVdnN3MvcWY1TVdUTjV6cXVscTlBNndxM25BK292dERYN3lRVitjQ3g3?=
 =?utf-8?B?czNBN2FVa0psK3djVXFUMlhUczR0OGdOaWtxalJOQ2dnOExvV2ZZcWN6UU9O?=
 =?utf-8?B?L254bHRDTCtGWWhnd1lSL0Q3S1hZdXo1NmRiaFdTVXVvd3ZNaWJhc3dtUVY1?=
 =?utf-8?B?YWcrd3cweUJoZlhlTC9menR3MVpnMXJBNnVJSFY2TXN6SHRMODRvQTJOSVlR?=
 =?utf-8?B?V3VhQUdMNWFibFZlYXBxdm8vMVdCYmNNbXF5dDd6OUc1ZVlsaDFLZVlzZTNT?=
 =?utf-8?B?VGt1b2pqN2oveUs0SldlWVowS2ZPajNydzdtM0NyN20wVzJoUVVkTXZWOEFO?=
 =?utf-8?B?alRtekV2TFV4czQ4OTJYbkRQOFRBajFGZVJuL2h1OXp1SDFQSytxVU4veVV2?=
 =?utf-8?B?WjlwVy84eis0K2N2KytmTHR2cEFOSVAzc2RqMmZ1ajVCU3FJWXpEVjl1YjNl?=
 =?utf-8?B?SGpnc0VYMEoxNUdnSVlRUjhGcFU2dDlrc3NsQnVXWU43YVEyZXdVL0VSalBD?=
 =?utf-8?B?TGUvYXNrNm1NMExoR2FZYW1kUXd4LzFOT3Vwd3BaV3FIVEtEVUFld3ZiQWE2?=
 =?utf-8?B?OElUeVRlQTQ5YUw5eUk3OTIyWmo4YldrQmVRczBzckZ5SzZIYXJlZytqOHJ6?=
 =?utf-8?B?WFNKbkFFcVpHY1M1M295anFkd2ZDeFVRTlpMcVZIbENqRXlEd3FmdzZqYlB3?=
 =?utf-8?B?ZVRoODNrQk5yMXphRzk1RE1zSDZaZXM5SWZHZk8xRDZXYzloMU1ydkg0UVpv?=
 =?utf-8?B?aFRKemF4S1hEdlk2S0ZzYlkzMGx2Q2NjY09mM1p3bG9IbE42Ti8zbVJYOTJt?=
 =?utf-8?B?OTVNN2ZaSzN5ZkM5SnVobVZUeEFGZlIxbDBqKzhRK1BkdU5tSmhlRW9FT1hL?=
 =?utf-8?B?Q1Z2QzRRUnh6L1MrdjArWU00N21XTHppcllVaE5QQTRHL0Y3RUh6SXFXNFBC?=
 =?utf-8?B?aGQxb2FWZ0dNY05ZU1JybXpmMmJjaXNiNWl1MUtFNEZKSWNTMTdlY0d6VUd5?=
 =?utf-8?B?a0dCaDZpRHZvOVMwMC91a3IzN3BKVzRxMmw4WW5kYVFUY1B6cWJpZHhtQXA2?=
 =?utf-8?B?YmdWNTk4bThsN3hNRlFFaHNpN2p6eWFOY1NyQzRoYVlFaWtEZk5oUjNoclpq?=
 =?utf-8?B?Wk1yT2lPZFlydjM1MEl1UVV4RGM4dDFEQWlVWmFkbThyend3Z0JXby9VTVRv?=
 =?utf-8?B?UDduWmVnQUpWcGZFcllNTytNSXJoaUxmTU9WbDZ0ek9oc2w3Q3ZxWmNBT0Fv?=
 =?utf-8?B?ZUJjanlVaTBjMk1kVDBzUEdiODh0TGRGZ0hzZ21STjliSmtHTW8vbW8zcm9L?=
 =?utf-8?B?UUNYNVYwKzdSVzBYZlNhd2FKcENILzMxZlNCNDdXRmJiUy9VOGVIOVdHZmdV?=
 =?utf-8?B?VDRsN1d4YlZvMCttUFI0ODhnMDRJdnNlTW5lOXc1dGFYY3JTTldDTGNjNzlS?=
 =?utf-8?B?UG5NQWZmWitjZTJ6QTJhMlBCVXIrU2s4cmpybm9QNGpzTC9ncVN6enN3b2Z1?=
 =?utf-8?B?dFUwN1ZzRzh0Yk1kazQwbkhkVk5ZS1Y1NjVzd3pOamFEa1F3YllzNm96ejFq?=
 =?utf-8?B?TU9HcGIrd0NIaGdkbTJvMGNpRFY5YjZ5dmlIU0pmL1F4RHdXNmtrS1E0NmhG?=
 =?utf-8?B?ckNiUHNWZlltU3dEaXJxLzVnSm83Y093NWw4VmtjOUh3ZkI5aTdTTlpCd1Jx?=
 =?utf-8?B?RkREZlZZTTMvTUt2TUdBWGYyUUZxdHJSd2pCM0pWSnN0NS9YUmtWV2EyMDRl?=
 =?utf-8?B?SEx3S3hhWnBWYWtPQ3FuOVhoaENEOHVyTE5Lb1AxT3BOZVBjcVJ5NHpmM0R5?=
 =?utf-8?B?TmV0MFVPNHJNeE5VRHRubHpmYVdDNFhObmZlMjQzNzJFU3VpMExwT3EwVDM0?=
 =?utf-8?B?NUV6Zzk5SUpmVjdwOWozV2RDUTlFejZJTGJlM3hkL1dEeUthazUwNXF0eEQ2?=
 =?utf-8?Q?fhUOIid5sOnaawkvKqTXoXlAfrTKb28Znv9WN?=
X-Exchange-RoutingPolicyChecked: CkT7drhtJwqTtg736LkAxcrP+inrBT7SKEy/GGl05t4jpmX8jCyf4Y0w6vkFx0UetkgWLaCBM8mgxyZCAo4anlAwBBY+4h7Knn4yGFbsx1tXWKa271VHFfS8f1aaj5IPXSrHtkd1uiIKSbzQHpwWp9XH5QELYuQONPZPa6fWs3t0ZQjpZYkuLXYDVCw2ecoW/pjJpVL94uAa2hwH3s6TCSjDbZl7F0Q1V8c9oz89aTxYrta6fvbj6qwASkP9beIMZY6uddhJ829rwJZvxxH/16M5L/w58zKtOsbbDzD9vJPczcbwQ8HCnuptZkmF6QBDFXYPbeNsp+nUE3uJQwqEtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b43a1789-27a0-43f8-6bc0-08dee6eab179
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:41:21.1273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYEfX56i71Kf8OO2LbmGbHA+ApGRsCU10QWm2cBkaha86bGDsl72QnI1ocPLYr0E3aA1nTQcEliyJ9U6Yl1DTcJVPeDGC+784EmtYZwC5M+w/QY9DH55BfztKxlo9N4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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



On 17-07-2026 09:17, Suraj Kandpal wrote:
> With introduction of force_hdcp14 we can now for HDCP 1.4 by passing
> HDCP 2.2 authentication but In MST, _intel_hdcp_disable() and
> _intel_hdcp2_disable() can return early
> when there are still other streams active on the port (num_streams > 0),
> leaving the per-connector hdcp_encrypted / hdcp2_encrypted flag stale.
> If the same connector is later re-enabled with the other HDCP version
> (e.g. HDCP 1.4 via force_hdcp14 after a prior HDCP 2.2 session on that
> connector) the stale flag from the previous protocol survives.
> intel_hdcp_disable() then picks the wrong branch on the next disable
> causing the following splat.
> 
> xe 0000:00:02.0: [drm]
> drm_WARN_ON(!(intel_de_read(display,
> ((((&(display)->info.__runtime_info)->ip.ver) >= 12) ? ((const
> i915_reg_t){ .reg = (((0x664B4) + (cpu_transcoder) * ((0x665B4) -
> (0x664B4)))) }) : ((const i915_reg_t){ .reg = ((((const u32 []){
> 0x66800, 0x66500, 0x66600, 0x66700, 0x66A00, 0x66900 })[(port)]) +
> (0xB4)) }))) & ((u32)(((int)sizeof(struct
> {_Static_assert(!(__builtin_choose_expr((sizeof(int) == sizeof(*(8 ?
> ((void *)((long)((20) >= (sizeof(u32) * 8)) * 0l)) : (int *)8))), (20)
>> = (sizeof(u32) * 8), false)), "const_true((20) >= BITS_PER_TYPE(u32))"
> " is true");})) + ((((1ULL))) << (20))))))
> WARNING:
> drivers/gpu/drm/i915/display/intel_hdcp.c:1969 at
> _intel_hdcp2_disable+0x4bf/0x520 [xe], CPU#2: kms_content_pro/101318
> Modules linked in: xe vfio_pci_core vfio_iommu_type1
> vfio iommufd xt_multiport snd_hda_codec_intelhdmi snd_hda_codec_hdmi
> drm_gpuvm drm_gpusvm_helper drm_buddy gpu_sched drm_ttm_helper ttm
> drm_suballoc_helper drm_exec drm_display_helper cec rc_core
> drm_kunit_helpers kunit i2c_algo_bit xt_conntrack xt_MASQUERADE bridge
> stp llc nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> xt_addrtype nft_compat x_tables nf_tables xfrm_user xfrm_algo overlay
> cpuid cmdlinepart spi_nor mei_gsc_proxy mtd intel_rapl_msr wmi_bmof
> intel_uncore_frequency intel_uncore_frequency_common
> x86_pkg_temp_thermal intel_powerclamp coretemp snd_intel_dspcfg
> aesni_intel snd_hda_codec gf128mul snd_hda_core snd_hwdep r8169 snd_pcm
> intel_cstate snd_timer i2c_i801 i2c_mux snd spi_intel_pci
> processor_thermal_device_pci realtek video e1000e spi_intel i2c_smbus
> soundcore phy_package processor_thermal_device processor_thermal_wt_hint
> mei_me platform_temperature_control processor_thermal_soc_slider idma64
> mei processor_thermal_rfim
> processor_thermal_rapl intel_ish_ipc
> intel_rapl_common intel_ishtp thunderbolt processor_thermal_wt_req
> processor_thermal_power_floor intel_vpu processor_thermal_mbox
> igen6_edac wmi sunrpc kvm_intel binfmt_misc kvm irqbypass
> int3403_thermal int340x_thermal_zone intel_skl_int3472_tps68470
> tps68470_regulator intel_pmc_core clk_tps68470 acpi_tad int3400_thermal
> intel_hid pmt_telemetry acpi_thermal_rel sparse_keymap pmt_discovery
> pinctrl_intel_platform pmt_class intel_pmc_ssram_telemetry
> intel_pmc_pwrm_telemetry intel_skl_int3472_discrete
> intel_skl_int3472_common acpi_pad intel_vsec nls_iso8859_1 dm_multipath
> msr fuse efi_pstore autofs4 [last unloaded: xe_live_test]
> CPU: 2 UID: 0 PID: 101318 Comm: kms_content_pro Kdump:
> loaded Tainted: G     U       L   N
> 7.2.0-rc2-lgci-xe-xe-5389-67aa8ad5c4c59cd1a-debug+ #1 PREEMPT(lazy)
> Tainted: [U]=USER, [L]=SOFTLOCKUP, [N]=TEST
> Hardware name: Intel Corporation Panther Lake Client
> Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3514.D01.2512291130
> 12/29/2025
> RIP: 0010:_intel_hdcp2_disable+0x4c9/0x520 [xe]
> Code: 85 ff 74 04 48 8b 7f 08 4c 8b 7f 50 4d 85 ff 74
> 23 e8 5b 80 df e0 48 89 c6 48 8d 3d b1 f7 ba ff 48 c7 c1 a0 27 6a a1 4c
>     89 fa <67> 48 0f b9 3a e9 c9 fc ff ff 4c 8b 3f eb d8 e8 33 45 4e e1
>        4c 89
> RSP: 0018:ffffc900027bf738 EFLAGS: 00010246
> RAX: ffffffffa16bd4f1 RBX: ffff8881a1e69000 RCX:
> ffffffffa16a27a0
> RDX: ffff8881c7b1b190 RSI: ffffffffa16bd4f1 RDI:
> ffffffffa100de30
> RBP: ffffc900027bf7b0 R08: 0000000000000000 R09:
> 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12:
> ffff88844397a000
> R13: ffff88844397a000 R14: ffff88817f7d2000 R15:
> ffff8881c7b1b190
> FS:  0000774e9299dbc0(0000) GS:ffff8884eb36c000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000774e94bc7220 CR3: 00000002166c1002 CR4:
> 0000000108f72ef0
> PKRU: 55555554
> Call Trace:
>   <TASK>
>   ? intel_hdcp_update_value+0x7d/0x260 [xe]
>   intel_hdcp_disable+0x118/0x130 [xe]
>   intel_hdcp_update_pipe+0x175/0x1b0 [xe]
>   ? intel_initial_watermarks+0x20/0x60 [xe]
>   intel_ddi_update_pipe+0x44/0xb0 [xe]
>   intel_pre_update_crtc+0x3bc/0x410 [xe]
>   skl_commit_modeset_enables+0x1a7/0x890 [xe]
>   ? icl_sagv_pre_plane_update+0x6c/0xf0 [xe]
>   intel_atomic_commit_tail+0x114b/0x20a0 [xe]
>   ? lock_release+0xd0/0x2a0
>   intel_atomic_commit+0x2ff/0x350 [xe]
>   ? intel_atomic_commit+0x2ff/0x350 [xe]
>   drm_atomic_commit+0xaf/0xf0
>   ? __pfx___drm_printfn_info+0x10/0x10
>   drm_mode_atomic_ioctl+0xcb5/0xf60
>   ? drm_mode_atomic_ioctl+0x8a8/0xf60
>   ? drm_mode_atomic_ioctl+0x604/0xf60
>   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>   drm_ioctl_kernel+0xb3/0x120
>   drm_ioctl+0x2db/0x5a0
>   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>   ? _raw_spin_unlock_irqrestore+0x51/0x80
>   ? __pm_runtime_resume+0x5b/0x90
>   ? xe_pm_runtime_get_ioctl+0x61/0x150 [xe]
>   xe_drm_ioctl+0x64/0xb0 [xe]
>   __x64_sys_ioctl+0xa5/0x100
>   x64_sys_call+0x1250/0x26e0
>   do_syscall_64+0x103/0x6d0
>   ? __task_pid_nr_ns+0xc0/0x290
>   ? trace_hardirqs_on_prepare+0xcb/0xf0
>   ? do_syscall_64+0x34/0x6d0
>   ? fred_entry_from_user+0x92/0x140
>   ? trace_hardirqs_on+0x22/0xe0
>   ? do_syscall_64+0xb8/0x6d0
>   fred_entry_from_user+0x92/0x140
>   asm_fred_entrypoint_user+0x41/
> 
> Ensure the two flags are mutually exclusive at every successful enable:
> after intel_hdcp_auth() succeeds.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_hdcp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 0a076d2ed70a..e56df337dc6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1075,6 +1075,7 @@ static int intel_hdcp1_enable(struct intel_connector *connector)
>   		ret = intel_hdcp_auth(connector);
>   		if (!ret) {
>   			hdcp->hdcp_encrypted = true;
> +			hdcp->hdcp2_encrypted = false;
>   			return 0;
>   		}
>   
> @@ -2109,6 +2110,7 @@ static int _intel_hdcp2_enable(struct intel_atomic_state *state,
>   		    hdcp->content_type);
>   
>   	hdcp->hdcp2_encrypted = true;
> +	hdcp->hdcp_encrypted = false;
>   	return 0;
>   }
>   

