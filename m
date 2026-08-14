Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D26C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A88C10E551;
	Fri, 14 Aug 2026 13:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dyEAo4FJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D5410E551
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786713429; x=1818249429;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=njU48g/mgH3WsKvSzcLgl/woieS6+xEumjKLGtPGZsw=;
 b=dyEAo4FJPk6sAzGZRvpztWzSwzq/kw/dDgXcFJllmPZ3/y93CkeOQcbu
 Ywv1cgy2OX1dP6juUMte3xLFfPdoD8Ukw+M2Vaf/MIrD30GLDlV/ND3v2
 WNKWwt4Gf4jbK78oDDBYREuVfOaB84uebgpQBo4IMyV/oYj10yMe1mjwJ
 4AIreP2DePX/P9WEVlCQeEPo91e+ylCQ5TbUtn/qJ/eSaJjjDPToRDae3
 GynSFVH2WAZV3c+8OYDXjs2DStVXZJuXf84lrWaMHBo+0nzZvfXLoR7Af
 n0/EGslGN4gCUXgL17KYZI7slTMfVtcQh9zS0uSGhxdT9WA30nYrdMdGg g==;
X-CSE-ConnectionGUID: djvJ6yVzR4+vKFslzyf/eg==
X-CSE-MsgGUID: lUKPbnfdTMe4zvgnpyd1gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98648866"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98648866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:17:08 -0700
X-CSE-ConnectionGUID: DkYnVQXFSYaXSYnapBGwsw==
X-CSE-MsgGUID: 652qGIPBSPKAS7XF10yq1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="264835154"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:17:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:17:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:17:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOThf22v9PVLb2kIdZ64cuJLKBKHlJyoKmKgrN5IhwYtjbGTO7e8OrUnQROpUZNJ4xcW91apm1oFAZ9CZMKY93hxw5igccXYUKJ+yXGlBxLAJKT2Uuf6IDA8R6KVFIEGIFYgVDnmmr4we4SSjsSN32gBPrQw2wQ5UyUw1fYPzLNv7ht49waL499dB4eZcB7E37xrkUIjykiTjCAz00eFjQbLpHEQXxgfonYq5ZIHq2sRb6r3Uli9mKj3DUg/4gpGAXS2E2H11Fd7jGiLGjErlUCjQw+xib/FsMBHJqlFcbkaybfDWO8sOUMH+o5TCikI+lbPrO/rxbfM6g5cKAjpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HrS0eVF8TMN0LbETBwn+bliT/s9JoMS1kEi0QvbJeg=;
 b=uoVGk8vlMQqkJlEb9NqUB0qRPso0zys0XUzR55xbdq+okzYJfNSMrEYIp3qf6ckTVivZxcxhS8PJKUvO9CQbpvC7FNxyYpHYLYE9t0bAjN/SQeJVOfD6TaKGdsKxz2yFWw827rdEawUSZr5llpTM0JSEivusWVLtWok2eE9k6SmRUO9m+Rgfwy+534hrh5zlJHJSyTxUvpqRG2R4qzvq/DAkcs9/staVfHTqH47tbbT/eEg3q1xEt156PV3nl91WjnWYTwFWieh99c0n0EaWp+Ff6NnJW6YC2quDlxvdLztFheF/nxoqB96A4t+P6tHf63uYIaxgoWvwdkBMqyR5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CHAPR11MB9629.namprd11.prod.outlook.com (2603:10b6:610:301::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 13:17:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 13:17:06 +0000
Message-ID: <924199e5-e37d-4ea7-a6c2-eeb9878ed5e3@intel.com>
Date: Fri, 14 Aug 2026 15:17:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
 <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
 <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
 <a0fe9b9e-95bd-438a-b96f-e9ad1005a8f4@intel.com>
 <fa82aca7-1cc8-460e-b7b0-3d11c1729f7d@intel.com>
 <9b18aaad-9844-4e54-804e-b8fe20c8eb43@intel.com>
 <5a05f13f-f3df-4391-8303-6b4d07fb2c8a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <5a05f13f-f3df-4391-8303-6b4d07fb2c8a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0040.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CHAPR11MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac2c53c-2c50-474a-19b9-08defa06564f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pQFnR/JdgFUNwacu/wpHH/dK0RlAuMZrsB4bwJ1TI9N59/UM86wAhAjMRnB0wA/Zxa7n2BukHjaJJwX3gA9RmJyXdrBWqjWh3um5wsLoHIyrP/KOMx8Qu0l94NQv68hmaXRelJ6174mKdojk+qDsABrJeMLXFOcZdXHSt3RCux6LonBYrrkvK3w0+ZougFfzepK2rhAilyIPttx6N11bSk1rEQ2oGrzQPPPNnnlMsYohumWdZlMjjSelj0mFcdQsrew+3LeEOeyRrHQUgRKNmUMuiDTK6nu3ETsgN18OzuvIOYJTQZRCgrN/KApb/uEXDozCbvX/oYDy93LXTLEy2mdWGZUW/63EQOSlhTjFEQ10WtGx/pqg43Ezj2D+SCniQjr+v4GsWYpRqvqJWcKBhSrGGy+H/Fg6Kib/4ez7KrWmPIx1APxsFPAxpKJqIkBf0uWNd+hwj/3l13koOwyPKn0BKRSduhnl29MBYqRRyoiyJf8w1tsJoZqZzOzykLznVijSMLuqVakPYTK8RfP0tqwGi3caqXE4XesQKaadfZUosJYDXX2Lx4LGUXLpaE2vj+EIuPOZW7WkvPzOP+SDgeg41J0iho9TZ3FZeDIVCObxZ+Ot3JTvt8MbCM8OGWtZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFl6MXFqMG1raTZFeHdMZzl4NW84YVhpbFVUNnk3NnRLNFUrTG1jMmJ4T05Q?=
 =?utf-8?B?MlVsd0F1QzlpRWpqUVhVTFdpUDZhTTIyQ044VXhJdVQyZ2Z1ZERncTNPRVBT?=
 =?utf-8?B?OHpEcCtPS0VWUDRkR1BPM3dXM3dDZnozT25XNG1SVVRJUlN3T2t3enJ0UE9p?=
 =?utf-8?B?SmpLY1B6Wk5yTUhaWFpkOVdQekZKQXNxL25JWFRjRDB0cDdYWEFZSkpKdEhS?=
 =?utf-8?B?VkVlbWNkRUZ6WC9KRnlCMGI5L09LM3NjZkl3c2tqMXNyRlM2L0wyUTlWWWc1?=
 =?utf-8?B?V0g0RkVTcHB3YkZ5LzF1RVplamJEV2puYStUamRGQ0NJa0tYOWtZK0ZYZEky?=
 =?utf-8?B?THZMeUcxRWlTYlFFSWxmeTlYQngwY0hLRTljL1BtYi83QkcxNDdGK0lKaHEw?=
 =?utf-8?B?VVI4eFZYN1JNeUVQMEJOSi81QkZjamlCVFpOMk5ydXNwS0FTdGp4L1gvNkNt?=
 =?utf-8?B?aGVLMk1qc3FJTStINkxVOVZza1VRdUdycitzb2VwNmRoQ0VKN1I5M3VNc1FD?=
 =?utf-8?B?bmVrb1dTWmg2c3R2aXF6OEZoeXg0WWs4WGNlOHJYcE5sd2ZmR2JXUzU5YmFh?=
 =?utf-8?B?ZTU0VldTcWt6RWdRTFpLc1g2dHdWN0lGY05EdGpFVS93dDBsTmhFajhLamlO?=
 =?utf-8?B?TndZV3QxZ3pXK2FidzMrMmtXWnB2cEVkZWdNdWI4bElyVndRLzcrSE5WcUpz?=
 =?utf-8?B?WkhlQXN0WVpyeUNwVVBxRkR4d29UN01ZSlVBZEVmV2UwTEMwVEhXblZqKzVV?=
 =?utf-8?B?MWhkWVBxQ2x2dVFGZHVUUTNjVjk5N2cyUjFEMVQzdW85cGxvZ09QaFZ1UzNx?=
 =?utf-8?B?VWlBWVFWYnpZL3FubHNCRk5FSUFBYWJpREsvZytKVHQ4UTdNTEtzdk1FdFpw?=
 =?utf-8?B?bXhZVS9kZXBlSWFRdHF6SUVDbVJPU2JOSXEza090N0cwZTdZNUlhemxBRDBr?=
 =?utf-8?B?di9VZDF2bEJwdE1PMjc2bEIxNHZSN2JOK1d0Y2JYWTJnTHYraFd5QlpleG5v?=
 =?utf-8?B?SG5IVnZxUVlzeXhsa2dhQmc0ODhOQnY5T2ZhQnJ4eXBlbHI2ODh4S21BUTA0?=
 =?utf-8?B?WlQzWkk0V2R5dUNXUXRNOVQ1NlQ0a0oxcGx5NXRoMHZtdFpCckdlT09ta1lt?=
 =?utf-8?B?cGxZZHVPaUxFd2JUWHRJUTVFMGNrTVc1Z1lVNnM0bW0zdDFVc2hNWExXNHpW?=
 =?utf-8?B?emp6ak5FSHNrSUpCbUpHekpiek9sQ0dPRW9pY2ZxL3phWWdNMzN4eXgxZjNC?=
 =?utf-8?B?SXA0dzIvR1pxSGFHbjlFK3J2cWdwbDdvTm0vY3U3c1oyQVBlcEF4cWVDWm5K?=
 =?utf-8?B?RHNZOGg5b1RWQ25idmdzSDBjTndpR2M1SEpHa0hnV2tRYVdMNFc4U0Rxd2Z6?=
 =?utf-8?B?WUNkdFpOazRMVS9nS3d1WlVVbytrV0VWb0ptR1FuV1k1TllWQkZWN2F0Q2xG?=
 =?utf-8?B?MDBOZGVrSnY0M3VUaXNlWWVnN1IwbVVQenNGWE0zNjJWWS9Sc2VSKzNqNUk2?=
 =?utf-8?B?bUtsNDhsaWxuQUhZaTZRbzZrWHpUMmJSWWVqM0lqQVg0L1pLUENubGZrbUll?=
 =?utf-8?B?MGVLeXlYOTNudzlNSTBYc0pHQjVuWW42YlEzRGdLVzhaRStPTGNPU1NyN0Jt?=
 =?utf-8?B?WThFSU8vNzNsdEcyeGx0aGp2cFdtTUxmN3I2VFM1YlJlM0xqRFRjejFDRnNG?=
 =?utf-8?B?WVNURzU5eDRWSHNobHRNZFo4YkQ0YWZwUzIzT2xmV2hvTW5HdXdKdFNsZkZW?=
 =?utf-8?B?YXkwQVQrTzg1cDVydnhqQnZ2Nnhib1k0YUtxVjVhQXdQNnhibllBVnFpZjFN?=
 =?utf-8?B?UVczdnlsbmEwQUFnQU1wdDlhY2JCeW5yT0NnU0dTSXpNNXlUMWh3bndIaVpp?=
 =?utf-8?B?TXcxbVhvZlNPQUZsZkpVcWxEejZiZUtwanF1cHU5eEJCSXlnaUFsS1RoTklh?=
 =?utf-8?B?UjJsQ3dHVktEcXV1NlRkRUp1aDRPMFVCV2hGb0o4UXdteDBGQ09LR1FER0pQ?=
 =?utf-8?B?WVRoUmorcmJNMVd0dHo2b3FTcis3VFNIa2h0RkN2U1lhZzFLMlpXdUpWZWlW?=
 =?utf-8?B?WnU0RUJyQlJHNURLUWtmNEYxTkxGeUVqQStSNjYzRU55aVJ1a3A2T1hGRXlr?=
 =?utf-8?B?djl0MWlxMXY1ZDdzM0VtYU5xMkw0dUNmS1RjRlNTQ29IYWk5ZjQwb3hyVTZq?=
 =?utf-8?B?YjIzdEJEL3FmVmdxc01Ib0NHSWU3c2lpVjFIUWpiMjdWWStZaCthVlIvTmE0?=
 =?utf-8?B?OEMyTDhDNmQreXB0dm1BcmdKQWlPaGtrbmtKVU1mS0Q2L0lSeHgzbWNQY3RU?=
 =?utf-8?B?bkdRM0tnVkd2QUlsc1ZmUUJXbWwrRVYwWjZYTm0ra1V4SGwvMTkvV2ZwZHlS?=
 =?utf-8?Q?dMXWHYzQHndLb0BE=3D?=
X-Exchange-RoutingPolicyChecked: XvZf1JVk9YuNtLQHbAggN5ZcqJBUfdPmr046WRYVASlhYFRzw7H+OmFcCvDa9gSmR1o2WdnjbvR/rrbZmriwHLeph0jfc6yRZi1UbxxKK/E29XrBau1WjoIsPJV+Zl6AM/2e90wvJHXQ/L9zQ/nUlHVIqmOpB+iir+lu6d0c/ZOlHMcq3ufH9G4cW0D1Uzb0UHOjz2NUg1XNMH5UayDbTFZyMidcwIpfaD8Y3XVUfR5BSHrNhnb7dQh/WMjY+PxM5mhUKHSEGCSs0ysw0nJPDH2ibxN+FqvL7Y4L9utq6qC+dcR89OzoEuYzt83uO8USrpRe1ZwTRqdhVZmcHCVQIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac2c53c-2c50-474a-19b9-08defa06564f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:17:05.9454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GJEyZs2U8zg5GE9uH7WM4LMhAa3HhBEdnpSBMkZbsliwbyPRBkAMIkRbyJja3XjjLdvMiqIgBBkyrOvKVhXnf6cFebpq35Uuro07LsrB1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9629
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



On 8/14/2026 12:51 PM, Tauro, Riana wrote:
> 
> On 14-08-2026 16:10, Michal Wajdeczko wrote:
>>
>> On 8/14/2026 12:20 PM, Tauro, Riana wrote:
>>> On 14-08-2026 15:36, Michal Wajdeczko wrote:
>>>> On 8/14/2026 8:31 AM, Tauro, Riana wrote:
>>>>> On 13-08-2026 16:31, Michal Wajdeczko wrote:
>>>>>> On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
>>>>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>>>>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>>>>>>>
>>>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>>>>>>>>      1 file changed, 13 insertions(+), 8 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>>>> index 2d8c532157fd..ebd288986c11 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>>>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>>>>>>>        static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>>>>      {
>>>>>>>> -    struct device *dev = &pdev->dev;
>>>>>>>>          struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>>>>          struct xe_survivability *survivability = &xe->survivability;
>>>>>>>> -    int ret = 0;
>>>>>>>> +    int ret;
>>>>>>>>            ret = create_survivability_sysfs(pdev);
>>>>>>>>          if (ret)
>>>>>>>> -        return ret;
>>>>>>>> +        goto failed;
>>>>>>>>            /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>>>>>>>          survivability->mode = true;
>>>>>>>> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>>>>          if (survivability->fdo_mode) {
>>>>>>>>              ret = xe_nvm_init(xe);
>>>>>>>>              if (ret)
>>>>>>>> -            goto err;
>>>>>>>> +            goto failed;
>>>>>>>>          }
>>>>>>>>            ret = xe_i2c_probe(xe);
>>>>>>>>          if (ret)
>>>>>>>> -        goto err;
>>>>>>>> +        goto failed;
>>>>>>>>      -    dev_err(dev, "In Survivability Mode\n");
>>>>>>>> +    if (check_boot_failure(xe))
>>>>>>>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>>>>>>>> +                  &survivability->boot_status,
>>>>>>>> +                  sizeof(survivability->boot_status),
>>>>>>>> +                  "Boot Mode enabled!\n");
>>>>> Do we need this check? This function is only called if it is a boot failure.
>>>> are you sure?
>>>>
>>>> in xe_device_probe_early() there is:
>>>>
>>>>      err = xe_pcode_probe_early(xe);
>>>>      if (err || xe_survivability_mode_is_requested(xe)) {
>>>>          err = xe_survivability_mode_boot_enable(xe);
>>>>
>>>> and xe_survivability_mode_is_requested() may return true based
>>>> on the xe_configfs_get_survivability_mode() settings
>>>
>>> Configfs also is provided for users to enable boot survivability mode.
>>> So one log should be sufficient.
>> there will be still one log entry but it will be with different
>> severity based on the configfs vs bootstatus origin
> 
> configfs should also result in fatal because it also enters survivability mode and it was user's decision.

then I guess we should be more consistent in reporting user
initiated actions, as in case of blocked PROBE (with modparam)
we are now using info [1] as requested by Aravind in [2] as it
was also an user initiated action

[1] https://patchwork.freedesktop.org/patch/746003/?series=171022&rev=4
[2] https://patchwork.freedesktop.org/patch/742259/?series=171022&rev=1#comment_1367587

> 
>>
>>> If we do need to add a blob instead of error no we should go ahead with all
>>> the scratch registers as they contain the error details instead of just boot status.
>>> Can't we just add 0 for now and come up with something that we can decode in future.?
>> including boot_status value here was requested by Mallesh in [1]
> 
> Don't agree with [1].
> 
> [2] prints only for critical errors. As responded on that patch, it was a intentional change
> based on review feedback.
> 
> No error no should be good here or a hardware error (-EIO). Lets not use boot status
> 
> Thanks
> Riana
> 
>>
>> and logging all boot status registers is already done in [2] but
>> only if boot mode was not triggered by configfs
>>
>> [1] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1372191
>> [2] https://patchwork.freedesktop.org/patch/746002/?series=171022&rev=4
>>
>>
>>>
>>>>> We can have a error log with the type here. We don't need if else.
>>>> based on [1] all survivability mode SIGID are FATAL
>>>> and based on 21] it was an arch choice to go with info level for all
>>>>
>>>> but IMO if the boot mode was selected via configfs it doesn't
>>>> make sense to call it FATAL, but if there was real problem detected
>>>> we should make it FATAL (like we do with failed PROBE)
>>>>
>>>> [1] https://patchwork.freedesktop.org/patch/732271/?series=168333&rev=1
>>>> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>>>
>>>>> How about something like this? and remove else
>>>>>
>>>>>
>>>>> <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=<N> FATAL (01000000) SURVIVABILITY: mode=Boot
>>> I am still trying to understand this series. Apologies if it is wrong, i tried to generate log using AI.
>>>
>>>>                                                         ^^^^^^^^
>>>> boot_status is u8 so it will be at most (01)
>>>>
>>>> and I don't think we should be so cryptic in the user facing error messages
>>>>
>>>>>>> In case of fatal, will make sense to return "0" OR we can add return as -ENXIO right? any thoughts?
>>>>> Mallesh, you cannot change return codes here. This defeats the purpose of survivability mode
>>>>>
>>>>>> you're a reviewer here ;)
>>>>>>
>>>>>> but seriously, enable_boot_survivability_mode() is called from
>>>>>> xe_survivability_mode_boot_enable() which says:
>>>>>>
>>>>>>     * Return: 0 if boot survivability mode is enabled or not requested, negative error
>>>>>>     * code otherwise.
>>>>>>
>>>>>> so returning 0 as success code in enabling boot mode is the correct one
>>>>>> returning -ENXIO will be no different than failing to enter boot mode
>>>>>>
>>>>>> @Riana, this is your code, can you please confirm that
>>>>>>
>>>>>>> After handling fatal case
>>>>>>>
>>>>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>>
>>>>>>>> +    else
>>>>>>>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>>>>>>>            return 0;
>>>>>>>>      -err:
>>>>>>>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>>>>>>>> +failed:
>>>>>>>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
>>>>> Can we retain the previous dmesg?
>>>> there will be already "SURVIVABILITY: " prefix included,
>>>> so IMO instead of generic:
>>>>
>>>>     [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Survivability Mode
>>>>
>>>> it's better to have more clearer message:
>>>>
>>>>     [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Boot Mode!
>>> Boot Mode and Runtime mode doesn't sound right.
>> both "Boot Mode" and "Runtime mode" were existing names in the code ;)
>>
>>> But i don't have any better suggestions here due
>>> to repetition.Since its message and can be changed . Will replace it if i can come up with something better in
>>> the future.
>> I take it as an ack-by then
>>
>>> Thanks
>>> Riana
>>>
>>>
>>>>> Thanks
>>>>> Riana
>>>>>
>>>>>>>>          survivability->mode = false;
>>>>>>>>          return ret;
>>>>>>>>      }

