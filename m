Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E535C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 20:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9A10E637;
	Mon, 22 Apr 2024 20:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVPSTYQc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EB410E637
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 20:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713817970; x=1745353970;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LhOLiyGI1EKtO+R7DKfOi7N2hIpNCQSoVpMr8aGsIoI=;
 b=eVPSTYQc38mE3BWMFzWwbmaus8L+M83ZwA/dOYUZomuRtg/h2VHMZg6S
 U2R+tZPboAWOkwSMF7cAUTj4i/CXXR5iBnXV3UaC1X5wBf6rqHuCFvTHJ
 hMIeAq3VQui5QFWlYBq1otgpnVXZ0DDiHYKlejaVFdFip2Y6bEROur32Z
 33HKrB48kv6B+FNpf+tN0UwJOKIcA0IfwRr2rchzwkt5aGFgiIMMigtod
 orIA4t313Xq8HnAm4QxNTwb8S/OnyAW6XRtqYgYRKo8Y+2Mk9kQ7BM3PX
 Z4tY2WJlOlEiQMp2yO8aeKWShe3UdgoPJfbEcmrtpEWYc9GH9CBwT8I1j g==;
X-CSE-ConnectionGUID: Y4c0QpuCRI+Fthoah53Y+w==
X-CSE-MsgGUID: vA6gqOjFQRyp03viquYaag==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34776618"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="34776618"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:32:50 -0700
X-CSE-ConnectionGUID: N3JgteBUQXKPxuZ7rnm8QQ==
X-CSE-MsgGUID: DiXTfrwzQD+oP5VGmNS3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24573008"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 13:32:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 13:32:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 13:32:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 13:32:48 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 13:32:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcSnUUQhpN+K9LO+FKiv6Ju6EGMSL0adPvkMWHwVbYbGfpiUrjxHkL4k8TZe1eKgcvUA0pLn3plEPA1I+PFRZQfDkx+JJNACnS94omyiup3lw20vbz6RbCCFTBVsQujEBOz3de+Ct1yX/LPL3EpSLBuOHAVxPrWJB3/ZJxJ8XLSLyuSiXqz5eR9HoMTBgCYnpMMiew6Rk1+bLd7MTmj/GnOUdwgZDbKSaiCBnBtjdfXtaccjQQP2AeYVoNUU/nqO2ECePT6pNWirSxmyrAmmriRXEYg/Q0b9Zpj9iPd3E0NjrDx8I2gznkotDbh7smEbLuTzPUv7YSXmQPo3QgB+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WL7JcfTh90JxJRBU5CtzgPRQn1hlpx4XUaKmKv3aW0=;
 b=gW+c5BX+axfnmC0mWf4YUNIr2wDn8iZAibCifXmuWa/9AxA1EFaxpGQyXjTrZ+Taq0tkmcQHDEhZft1zqUZ5fsLVaJvnAa9T/E4HKrxYQoAmlk41QHmMze4A6rLSWniM3h0vbbbT5+UbMHTsLifwTxiv/jVXaWwqQULjpBtpVupIAjJ4fRRAnvihEq20nCA1GxHrMk3PAGFpIWCQ4gk3hV7GYohfoWA+5eVXJCsp1ed2dMDT3KPndWf14rG/LmTGtqzQ9tXvWZukT2z241tqMKhr3XxIAxudEmBqslD2xm56IfEAlYw7o6mcD4JEbVEZsuBaRZPEvU8ZkATMrGxcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 20:32:45 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7519.020; Mon, 22 Apr 2024
 20:32:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240422201454.699089-1-rodrigo.vivi@intel.com>
References: <20240422201454.699089-1-rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: make xe_pm_runtime_lockdep_map a static struct
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 22 Apr 2024 17:32:39 -0300
Message-ID: <171381795961.135083.10917276477490842697@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 5762d215-08d8-4e5a-b35b-08dc630b5dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0U0aVM2NTFWUFVZY0hhcXJGY2hFcmtML0JZV1NJc3V3dXJiTDFUWE0rN0tW?=
 =?utf-8?B?NjZaU2xGUVBDbGhyY3RKQ2JzRXpEZXBFNVk3cFc2eDdqNGVHa1J4dmljY3o0?=
 =?utf-8?B?MFhsUUVvOGt1VmttejZHUEdPK2VrOS82Yi9ac3lBTkV0N2czanRZZllsNUF3?=
 =?utf-8?B?NXFlSjd4d3V2VEVZV1k4dzdvdGRRTTBLVXRJV0xTR1V0QU84bHcxNmlldlRU?=
 =?utf-8?B?Y1BWSE1uYkk5bDlIK2JUYmtOblBWLzkxSjV5R0l6RjB4TGF3YmZ3eUVmcEp3?=
 =?utf-8?B?OFhqTjJHVUtBZ1RIQjQzVW1qeWlYWG1Zc0pncHY2eit0dWZ6V1ZPWHN2Vkhr?=
 =?utf-8?B?alF5bVFNZk9NcmVFUFRoZTJYN25RNk9oY3I1ZFdQdGZsQTNnY05sdklRSEdP?=
 =?utf-8?B?bm1RU2R3SGlJcDZKVUYzb1NPRHRYaVV0ZEdMc2hSQ3oySUpVOFY4Y0RwM1ZQ?=
 =?utf-8?B?S2p5eVo1SVlZbHF5MXVlN2p2SUtLcmw5alRadkpnWGVtU1p1TENFazYvN0Ji?=
 =?utf-8?B?MFByZkk3MDV2YVJQN0NHZnNIMittZ2pDTlVMYmlZRTEzQ21NYUJDL1B0OGhR?=
 =?utf-8?B?SFZldFVXQXI5by91aUFLeW9adzZTTitBbnRVZWh4ZnM0ZGxUelZuSE9xYkJh?=
 =?utf-8?B?RTBpYmhHZlZPaGs2Uy8vbmVHMVBBN1FJT0h3ZjFBRzFtWjIxUDMzQ2djQkZz?=
 =?utf-8?B?bnNjVEpZZTY4OXFyT1FNdHRYL2ZLZzFjMmJTbnZ3bHB0aVMyQ2JPZjJxZkFC?=
 =?utf-8?B?NmVoK0pKY0pGcVhZRWYrTmZFbHQrYkJwRUNxYk5PWUUxd3lZYzRtSWd1d1Fa?=
 =?utf-8?B?TjRKWll0d3lTaGppZFlSckhIVjNYNDEra0JHL3Q1VWU1NnVIdGEwN3BoZzBH?=
 =?utf-8?B?R2xwd3lYVXN2ZXpoaXN1K1pyTW9qb0JTSHViTnJlVnBpM2xuR0ZwSWtBcUtE?=
 =?utf-8?B?K3FiRnZGVWFrY3VUWm1jTFRzbDlqb3MzL3JEMFhpWjhDZXFMRmRYMXNuMExO?=
 =?utf-8?B?QWhiVmg4MFBPVndWbzBoQURtUnBYWUlIWXJJSGJ3eCs0R2NyM0dsNUJzWVpF?=
 =?utf-8?B?TFQxWkFTT0lyNlpZUTBMNnMyOUQrNjZGZFNpeWY0ZGxQWjV4RlZ5YjZ5WEN4?=
 =?utf-8?B?RHV3bU1pZlJsWUlqb2piSElqS1VjNHJFd2JxcUZqdWlXNFUwNWtJRFZ5M2Ev?=
 =?utf-8?B?T1ZSdWZPWXJ4QWYxckV5V1FMSTlYR0VDMGZGSzNzNEg2SjlhWTFLMmRwZy9K?=
 =?utf-8?B?V1grSndrbHprMm1oVDFsRXJGTGYvTXN6RUpjSTVKT2dSZ3JpbnJ2TlA2Y1Q3?=
 =?utf-8?B?NkF5eFFHWHZqeG8xUUd4TXg1bWNFQjNsdWNBVVJBbkZtZjM3UTJnMzI5cHM0?=
 =?utf-8?B?U21GRnM1dFI1Zkx2TGZrM0hEVXFYbDlxWmNiSUIxWlZGczRmazlJdkhBaGdL?=
 =?utf-8?B?SGdQREJ0aCsrT1NGRlJDY1lRRmJ6b0Exa2hhOXJBVkZ1YkNIek5oUHBhOWhU?=
 =?utf-8?B?MXI2WjNIckgvRUxkR3BKU3haaXhja1FxbXp3T05EdzA2SS80dzdYaVNsMGcz?=
 =?utf-8?B?TW5EMENSREg2WjUySFhKRXFUNVkyUTdNWVNIdzZoRWxxNXkyS053SnIxL1J6?=
 =?utf-8?B?WWlLQmd6c3RXYkNlSXVBcmtiL0FxS01tK0YxVVliKys0cDZHMmoxN3ZkNkY3?=
 =?utf-8?B?NXJLQ1RIYllzSUNwUG1BelJ6RkVHcWpuYzl0aTArZS8wSldqMEptZmhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXVEVXVVejFvMmUxVGltYnBEazVTNlV5UGZ3b1psWmRuL041a2pwZ0o1MzhX?=
 =?utf-8?B?NTBBN082VXNEVWRWYzRMd3l5SXVFRnNJSlMvV2NjcThSMmRMTFk2c3NZcGxh?=
 =?utf-8?B?VXdOZXoybmxrY2lweE1sS1ByeWNhMWloVyt2WDlLb0dYQlRKRWFBTUhlQy9M?=
 =?utf-8?B?RSsybFhYWkZEdmNFck9HM3lUTVBuZHFGNXhwTlU4cFcxOTY2bGNoNGJLWmN4?=
 =?utf-8?B?eTl1cDA0azQ2aWpNdm5JREppUkdCbHFadGNFdS9odENjWmVEOG9sYVhYWE5i?=
 =?utf-8?B?OVJScEZZYnJSd3lQUm5QQ1pvNFAzNkxPcW1TbzM2V3IxbTZhVHp5V29tdWVH?=
 =?utf-8?B?NjIvYTdnYjhpbEZGSkVnRjJZT2NnYWI2bHpRK0JzQnl5bnNvSTBBU3hCQld6?=
 =?utf-8?B?a0c0d2xqNXJKQ0plM2VmWHVobnpmM2tqM2MyTFJ5U0xBUGV1LzhnVzdMU0Ux?=
 =?utf-8?B?VXBscEtOTVYyRy9pQ1NkUTZCd3k4UVFOVjlINDdTbTgraG9Lb1dEUml4enZE?=
 =?utf-8?B?aUNBZXV0Zm0ySkF6TzV1aEhJSE01bDB3Z09JZFpwYU5GYjBRaUgvSEVKa0k0?=
 =?utf-8?B?dEsrSXJJelk3T2Y0S2JWa2dNZnZ2R2ZyeVVkUm1ybmlNZkprc2d1a3NaTVBU?=
 =?utf-8?B?TUQ5QUtERStSN21pQnNzaVZIOTd1ZXBYYXZ4bTNIN3U5Y1hBczFsWUlXcGo5?=
 =?utf-8?B?R0U4TFVYdyszNXREK2hlOVdWUzlkYmxrMWYzd3NKaHNKRkFXMEhMUXJ2QlQy?=
 =?utf-8?B?WThERW5kT1ptUTNJL0lYVlRPTWpwcDBqUklNQjE0dGI0VU5pUHlWdit6dU1h?=
 =?utf-8?B?QTRTM0pPbmRrUGJydURmWFdJRy9OMFhXQlhjQnRoTW9qNDhlU0MwTkFqaGgy?=
 =?utf-8?B?Tlp5L2p3UFdtQzBVcU0xSGZQeVhJL1QzY2EwQVlRcXM0TXMwb3p1S25nM2h1?=
 =?utf-8?B?RFYyM3pJNE5nbWNtMGFxRVYyVHcwQU5qWG1ob1NSenJjNjJSY0dnSE5CSm9Y?=
 =?utf-8?B?UmZNWjFpaWh5WDdqR2tXemZzTitSbC9FTU5vYm1TK0xyQ29qOG93Qk9QUlJT?=
 =?utf-8?B?cVhaQVRFaWVVd2g5S1RBZzZhUW5WVWJPMUFEZng3L2hsSGtUREhRdUl3U0lq?=
 =?utf-8?B?SjlGTFg0c0JUclgrdy9IY2w1VVN4WVpCZnVKYVlGTDNCV3lLVHlRT1RhWDBQ?=
 =?utf-8?B?allHREZBRFFpY2RGTTlzNEdWby9oSmdEVmZ2alVuaVZoTWNuRU9YcmZTWS9q?=
 =?utf-8?B?L3BXMlNQT2lUQ25OdHdKN3hTclNnZnBJaXRXLzJEMWx5VkhaQ2JMcC9vMS9H?=
 =?utf-8?B?MmVEaGl0Q2Y1WDA4S1JETnYyYzJscUZUTU9KWVFtS0NHWHFqWEg4eFV0MzNO?=
 =?utf-8?B?MDFqR2lWUmpVZzhsSWlJdjEzV2JiZ0dkTmc0UUtlOHJVSlRJbm9uNnlDZlkr?=
 =?utf-8?B?TTRzSEx3Nk5iZkNKRURSV3NQcStmUUhtakRUcnUrU2FtU3BjOEw0UUZacW9S?=
 =?utf-8?B?Wm4yaDNsaVVEYzBQb1Job29hWStBd2RuSENJMXZWdk9XaTZianNtdjM5Q2Vp?=
 =?utf-8?B?VlVSMjV4TVoyS2hYWVBIRTlXWjMvZFEzSE9DQ0VpVjJtN09WMGxMQ0NqVlN2?=
 =?utf-8?B?eUk1QVIyQTFVYm5ueGtWQjBBWVNoZjhTU2orbWxQdHYvV3Vwb0Y0RzY3Q2tx?=
 =?utf-8?B?YkZVSjlkMmhiRVMwdGM5MXlvQ24vbUhyd1lPSzR1QjZuL25Mc3hwZVE2WEpm?=
 =?utf-8?B?dG5MS3BCS2lQbzVSb1pGRHpFYVdGL1BZdStldVBRU2VXbHZoT1ZTWnprcVFN?=
 =?utf-8?B?N2RvMG44S1R6andMV3BKZDloR3o1OFUrRUljdjc4eHhJWmR2Zm5lYldLNHBw?=
 =?utf-8?B?bDczSmNRQ1JLWXJqbmlNSkw4SlA5aDJqTitPblhPaEdHYzZ0cFhLQVJwMmFk?=
 =?utf-8?B?cEV6MkR6MW1LeHdmQ0J6cXlicUZONjZUVUhwbW1pZ3RuOXpJQ0I0QlhES3pi?=
 =?utf-8?B?RkZ6ck9sN242bVVvWk55UXd0WktXREs1YkJMTytHM01FOVVaeXpaTHVHZ2tK?=
 =?utf-8?B?aVBDYzFPcDRMNXB6eERLTkdXc3QwbmJJdGFVMjdTTWtNUDMrVEVaTHVhZUtB?=
 =?utf-8?B?R3R3U1k1a1kzV3hoTFVKZ3RPdWN4a2k2Q0grSVlhTlRaMGp5WkxWVktzaWVo?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5762d215-08d8-4e5a-b35b-08dc630b5dd2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 20:32:45.0993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPdZWEKkZk6ic+oZv9K0c47beqHLKMW1/lVzpLTpGx22eLkS3wOenjO5pm+n4eMfZyDk9Klu9uEg36ICgfw79Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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

Quoting Rodrigo Vivi (2024-04-22 17:14:54-03:00)
>Fix the new sparse warning:
>
>>> drivers/gpu/drm/xe/xe_pm.c:72:20: sparse: sparse: symbol
>'xe_pm_runtime_lockdep_map' was not declared. Should it be static?
>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202404191329.EZzOTzwK-lkp@in=
tel.com/
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 37fbeda12d3b..c1831106ea4b 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -69,7 +69,7 @@
>  */
>=20
> #ifdef CONFIG_LOCKDEP
>-struct lockdep_map xe_pm_runtime_lockdep_map =3D {
>+static struct lockdep_map xe_pm_runtime_lockdep_map =3D {
>         .name =3D "xe_pm_runtime_lockdep_map"
> };
> #endif
>--=20
>2.44.0
>
