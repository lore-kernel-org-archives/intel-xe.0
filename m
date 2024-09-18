Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9F1CCD1B3
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 14:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA39210E26C;
	Wed, 18 Sep 2024 14:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwP2CGlU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504C110E26C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726669295; x=1758205295;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=frxlQcA8OaYPgm+KSma1mo+4oGhpQ3M/a3DjGzhbIdE=;
 b=dwP2CGlUG5FGg9kMD5F1sviYeWsDIHvaNUd+Oqw+NdSOSJrTjZvTt9cL
 XR0sLMaVK7LPa+rO6hbFzFFLp+GZgi8YzPuKDQGwY8mE7hnz1BOd5KBCy
 /qqYcypEnWIqfDKnMnfdqMwRgs8lS6FQBq7HlwJlA5yXbG2Z7BUZyNX/5
 k+kfEp5zG1TcV2GI+Hja7n9URaagGVTzjXhlk2e2yFJ8h6hYUV5Lnzi4K
 6plNBZmFbq6q+7hd49BELJyhyX7hEP/SmPWZCfmpdrKIG163VywWiA5mk
 VTqm3qMoVhJydx3fPuSzA2gwNnqAN/tED/2RqZsH3Hu/1Pj/1LGBHsnnt w==;
X-CSE-ConnectionGUID: usutajpcTNWrJCmjVX59Nw==
X-CSE-MsgGUID: vibP2fkOQ4KBm/yzK1w32g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29327546"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29327546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:21:35 -0700
X-CSE-ConnectionGUID: mwMt6S7YSUGa8OSWVOIhRw==
X-CSE-MsgGUID: /e9mvoQRS2CTXSkU6uVsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="70059386"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 07:21:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 07:21:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 07:21:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 07:21:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 07:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7XY2upBm6XX7VXO5mVO4P/2EqEGeh2JmX4iAu2tu9MzzBpsFNFEQPGFsP4p8XvU5Za6ZT/MLsDspYsqxL8hw9FubOZLSndy296f/Jr6Kfjh/rFUAKDL9E9mTs4robJ3G2zbk6UGF1BmKux780iekWGJXQxIeGXwANVmt4HVnEnTDVqw5s9A04re4AIgOxHCD+Qxy62106/9gz+sX8wO5Cgyn0iLkn4JaQNTfa4UM5paxL5FlytmttKZOb7nAxgSu2hVMxrcnXGo5BslLV/wP+5aPD7o6pGZhnyH3jUcSbfAF/F015e+wyTQC/LyKLqIUuduEFjcB4xv147rspvV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjImTWeXQl0VmxkUFz2j9seWOm3M5yneoqeP75l7qxI=;
 b=dSPyhDu8e/zN53EgZsc8L8kDtGupQsBptYObL0uhKsHOOc0aJxWDwRMth6N4oW3ysh3ktMsLA0gKjnaIYewpV6BaylkOkHKLGzMjhcXiWzKO25d6mb2tddljNwAYu/GgVXmwtpP7YZu6zNS2p/kLIvyCBRbzJJn2kccMmRgpqdMsEcYeTzhQJF/rOvJ3OCCbLSwApHv8I20N80AQN6Bd+95Z27U93qHFywIHzWlCCGo6BVE+PgCOLQ/1iZRtgOROcYmwKMpqGl5D1vXXPncqtTgPGiL+vOugOqKjGHx7o6qq+kFvdNLMDeO3bH32d3exGLuvREUhkep+109cYdzhmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 14:21:26 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 14:21:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240917224243.GQ5091@mdroper-desk1.amr.corp.intel.com>
References: <20240917165400.40592-1-gustavo.sousa@intel.com>
 <172659255821.1857.18423882338010122836@gjsousa-mobl2>
 <20240917224243.GQ5091@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Extend performance tuning to media GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 18 Sep 2024 11:21:20 -0300
Message-ID: <172666928049.2301.8057233356990184953@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:303:6b::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f899bc-b161-499c-79d6-08dcd7ed2ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHp6NE50WDRHMGYxdGUvbldLUU5LT2M5MjBKVjBEZ1FhcFExUXk4SUFwYTJy?=
 =?utf-8?B?OVpnclJBbGhZY1J4UUZUaEpRYnJWME5BVlJ3U0c0ZDdjWHBEbC9DSFBBTzBk?=
 =?utf-8?B?NUdnZGpMVkc4cGl5WnZyWDRUVGQ2UVdCRDVKcllnOWw2QTJRSXkyN0RvWnJW?=
 =?utf-8?B?Q2J3WTVFY2lkWE1tTGMrU3hqc3cyK1dtQjNEdVJBNytmM24wcGxjSDJZbzNJ?=
 =?utf-8?B?cFdjRXZYWGFldEpUSG1COXFJb2Rxamo1K2dOUDViVHMwSmNXUm8rOHpFVHla?=
 =?utf-8?B?SjVsYm55OTFJcnVLa1NRL0NreU14cllrK1lqRS9oTGlwTE1oeTlqRFdrMHJU?=
 =?utf-8?B?cFZSQXNKa2thZEpmTjJ1N3c1ZXBUNEc4VkJNUUQvVU8yWVJZbFhDeTBkNEsx?=
 =?utf-8?B?Z1BGcWc1a2s4aGJFcUNYOWhKNmNTWEY0ei9ER3JPRkZ4eDg4YUd6TWN0ZWNV?=
 =?utf-8?B?Zk5CQ2FpSFFuMXZFem0xOUNYLzIvSkVXTWxaWDFnaDNia2hjSk9GM2FlbCtS?=
 =?utf-8?B?dmpsbyttZjJTM0F0VTRBS1RsRHo1d2J6TGJQWmo2TkhyMmFDNm1LU1J4MVhq?=
 =?utf-8?B?Ni8xWTFseU9IakpMU2NFU3N0K1BxVmJtbExUUGlFUjczR1dlcFBkZHZKdEFU?=
 =?utf-8?B?Vy9WSElIRUlWTERUZm1OMXNaMWE3VktySytodG5ucHY5THRMMExsN2pHK2FT?=
 =?utf-8?B?eDRRWXRKZ2J4a28zOTVmWEpKL0N4aFRhb2hleEl3RER1ZnE3b3BpeC9jeVYr?=
 =?utf-8?B?a1A4NU1jeE5paU13UzA5VFJ4eFowSnV4YlMrOURBT01CKzNRUmYxTU93OXR6?=
 =?utf-8?B?ek00S2JJNzB6ZXJZeEp6YkJVSzJaeS9DZE5Wb2JnM3IwanlaK3lUYUZCSGwz?=
 =?utf-8?B?YWVwekJ1c0lKNlh1SXp0Y0FNd243dmR4OGhybkkyVE4ybnpsTjNYVVNmNDgw?=
 =?utf-8?B?ckYzb3cxLzJNNVNFTGtVVUVHV2hsSkRaWksxMFlOaWtlSk9EYTd0TUVjMExS?=
 =?utf-8?B?Qll6UHZKZ3daVStCeWdIdUN4UUZCQkUrWXIyUUFZSW12dzNZL0VZYytHVnRj?=
 =?utf-8?B?OUhJWGNIalRYR0VjY1hQRDNLeWd2YUI1MmlMMEx4V1VBTVoxRVFxYWtIZG5t?=
 =?utf-8?B?V05ya3BlY1I2YzgzUEFUa05vTUxGa2NsNzlvOVBaR3htSUZJRFdBaHJMbm5y?=
 =?utf-8?B?ZytBTVQrdzZMRHltRnM5ajZSS2pPVExPbjBOUFg5c2JKNzRVdzNDamFZeGtw?=
 =?utf-8?B?MzBLUHdjWUNaZGRoRzVWUXpvR3BjbnJmb0VzVzJBSFlITTRHd2V5Q0E4MHg3?=
 =?utf-8?B?clpsRGk5RnJVZGhGVERBRGJzTW9WcG5IVUQzSHF0SXYzV1FtbjdCV0xFQXRJ?=
 =?utf-8?B?c2RuQzA2bTNiV2dlN0VOTlJSTHhVeUU3aE9scTlCTHpaMjZvNDVRS3I5TEdR?=
 =?utf-8?B?K3BnYnk0WGJtMXhoSDNKNVc0bm5yZmpuOWJyaEEvUGRJL3hBQWNDMHNSdVlJ?=
 =?utf-8?B?OUViYS9yQ0dpMWhRRWFZUVZZZCt6NnphbXBjbHBzRmF5WFhJUUdtam85enVq?=
 =?utf-8?B?aXpKaGJ0NUxMRk5UdFBVc2JKdERVSWlpSU45ZUppTVV4WnVBc2ZGZjhUcEtK?=
 =?utf-8?B?OTBWWXVzU0J5SHN6TVdBY0o0MHQ0aVFCL3crcW1OKyt2cTRrSjhXa3RxREdU?=
 =?utf-8?B?c20vNkpNd3FSWW5PZk0zak5iSTIwSHU2Ulg3SFl6MU9hcU1GQ0JYVmw5c1pK?=
 =?utf-8?B?NzE0bXlXMjRHWU1mMjVkV0tIVEh1THJRL0ZsSjN4cjk3TWtvalI2UXZjS3Zi?=
 =?utf-8?B?QkRya0p2TWcwR1ZibG5BQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUpycVk5bW5zYWRoQ0ljZU45bWJmQ0N1SnVTeCt1TjFJUlJ6eEd1REp3S2di?=
 =?utf-8?B?SEQvMlgvS3FlYWJDaGd3b1VvY0NqYi91VTFOckY4OUpiRVExY2dNU2lKaUlW?=
 =?utf-8?B?Y0lXWnJ0a2lEaG5ZVEtqWkNmeWp2UUJ2S0wzakEzVWVGZXY0VlYyY3dnUEVN?=
 =?utf-8?B?dU1zYzNoTlBML25JL1IrQk9xaytIZFVLRjlpb0VyeWhLY1NmUlhKTXZ2VkpV?=
 =?utf-8?B?a0NEVGNFeHNjOXAzME9kU09UcE9EdXd5REtzbHNOeG96WnRkUTcyT3VkMGx4?=
 =?utf-8?B?Z0JqanJ3Zm5xZzRwK0JRODhGMWZQWDJEOU9uMjVhT2UxeWZJMFBHZ1BGUERi?=
 =?utf-8?B?SnhOYWoveldPRGZ4T1BwVmw0MEU0VVJ3NzBIbG5BY1NUY2ZjM1JKYlBnalNP?=
 =?utf-8?B?c1VqTGRCV2c1eTBndE5zZVlFS0syTjczQkNBUWU4aEhybE9FMVVOY2tlWEF6?=
 =?utf-8?B?dk95UFBBRVBwM0xkT0FCVDgvSmdtdGJmREVHd2UxR21jSDJmNEtvWTBqbFJW?=
 =?utf-8?B?K1BobzF6VnFLaGtuSXNOMmZVeTFkVDVMcXhEVFp6cHQ3N0hEejY0UHFFb0px?=
 =?utf-8?B?Z1loMmVlUDM2WTYvMEZ6ZkRVUXFMZUFtUFBtaWdCUFRHekVPWmZWSlpTRnhl?=
 =?utf-8?B?RzRrdlltcDdhdC9MT21iTmRJaE82d2d6OGwrK09Kb2hDbTdrQnFQTmZTckNS?=
 =?utf-8?B?WXBndllUeDlyNXh5Y0NDMnliQlhzQXRSZTRQL3J3RHVuMjZwcURCdy9jY0p6?=
 =?utf-8?B?ME9CSUYrTk5nR1ZiZ3BzLytudUxUUWRQelZsYkFxbE5jTElWejBuOUdmVXd1?=
 =?utf-8?B?YmNlTWhrSzdTandMQkNpaGJ5b0FjUGlFWmhJZXJ1TkVrbERrMjV2Tlg0ZHow?=
 =?utf-8?B?QnJvWFFnYmp6WSs0U3lFYjUwR2MrRDlzY0kwZ2YyRHdDS1pyMU1LUjcxSXp5?=
 =?utf-8?B?UkZ0TUdZWGhueHJFbG90ak51V1NKS052RlE2QmlpS1ZBMGl3aVRaWHIzbjlj?=
 =?utf-8?B?OVAreTZsSmFKWG4xVGg1Uk1Wb1hyay8wY1U2KzdrM2NlNllhazlxMGpXMnhm?=
 =?utf-8?B?SHlndzZIM0YyU25UaU9mbm9mTUt3OTVGaWF2Z2t0bUw0NnY3cjhKZjRUN2pu?=
 =?utf-8?B?ODg1a3ZvT0JCRFJDUGxBR1JnS0Urby9INUVVREF3RHNLYW5Md1BxRWV4VXNC?=
 =?utf-8?B?dk1ZbHdnK1ZhQjRUc3hxU0dKZWRWMmMrVy9MSWJhTWtIY3dVdHQzUWwwbWdu?=
 =?utf-8?B?c1BkeGd1ejJMVWdNTDF3V25SQVRtcTVrVDVXV1VSUjNKd3lrUE9WenVQeW9J?=
 =?utf-8?B?Ylg1czlZTmcyNitXR0NOaDI1UFlQYXc5V1lZN0tHdUliUXRHZVRMaE5UaHo5?=
 =?utf-8?B?aFpYNENaU3I2NHNRNFVQSklDUkhOWEdMVTVSSnlsR1p1SHYzZU13cmZrVGI1?=
 =?utf-8?B?YVlyQm1ack42MjV6YW5EblFzM3BTUkxZWFU4NWE4TFNSZ1h0enUyV3NISnRt?=
 =?utf-8?B?YXo1U3JDNTNYT05LZ2pOdnRvcWxQemtVV0JFRnhpQjJrdGRUWnZMNUZYQy9o?=
 =?utf-8?B?N2oxajh0cE9KZGhSYmlteTEwSlgwdThaWlBkYnFHTjlkZnRhczVZM0wvVE0v?=
 =?utf-8?B?Vk4yODlhSTJCcHBNK2FRSUpGZVl1NEQ1L0ZMY0NjYjlHci9CQmlTK3J0OWRr?=
 =?utf-8?B?RStjUUpVbjBVV1lxRlpIcWJ5RWpRS2k2bzJRTlRZUDFYUHAwVDNWc3l3ZXQz?=
 =?utf-8?B?TTkwaWZINzJ5RU1yZzRQRUxLZHF1MDBQTDZFSWIyT3Z5Yk9BWlpsRWVjdkR1?=
 =?utf-8?B?M0ZwalpYQUU5a0lNTnh2U1JwZkpPbFVGT2M3QnBLbVRzTmNmbStmZ2FPN1l6?=
 =?utf-8?B?czJkbU9xVWQ2dUdyODd4UmFWYXFhNW5CMDByUHpiN0RUY0xlQ05UOHdoTmU5?=
 =?utf-8?B?N0ZxZWp4SGxJckE3dk95K2had1lnMnExbGlNU0FLR1EwdkZvTlNVTFdDcmlU?=
 =?utf-8?B?MkthU25iZmVJd1BPV1MvaU9xOEJ5YzhGUXRla0Q1RXJrN3MzSW16NEtkaTg4?=
 =?utf-8?B?ODhaMHZZaFVBQWZxR2xGS2RHU1NlUkxyN3pjcGYwaWZYMkx2NmZlTUlvaUF6?=
 =?utf-8?B?TjNwTThoY09saXkyUTZaRFA3djJqNmZRcmgwM2JUWGR2dXh6R1dwWjczbFFv?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f899bc-b161-499c-79d6-08dcd7ed2ddd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 14:21:25.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXzNf0cgrQj5rZ//aaT9VNCHPh1Dnbynu5bXU/z8ugEIm2827Bgq/41v4l7OpK7ECDtzcBqDhjM8N4gOUX0ifA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
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

Quoting Matt Roper (2024-09-17 19:42:43-03:00)
>On Tue, Sep 17, 2024 at 02:02:38PM -0300, Gustavo Sousa wrote:
>> Quoting Gustavo Sousa (2024-09-17 13:53:54-03:00)
>> >With exception of "Tuning: L3 cache - media", we are currently applying
>> >recommended performance tuning settings only for the primary GT. Let's
>> >also apply them to the media GT when applicable.
>> >
>> >According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exis=
t
>> >only in Xe2_LPM and their offsets do not match their primary GT
>> >counterparts. As such, we need to have Xe2_LPM-specific definitions for
>> >them and apply the setting only for that specific IP.
>> >
>> >Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and the
>> >offset on the media GT matches the one on the primary one, so we can us=
e
>> >the common definition and apply the setting to both IPs.
>> >
>> >Bspec: 72161
>> >Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >---
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
>> > drivers/gpu/drm/xe/xe_tuning.c       | 19 +++++++++++++++++++
>> > 2 files changed, 25 insertions(+)
>> >
>> >diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/=
regs/xe_gt_regs.h
>> >index cf21de3adca6..2e655291a84a 100644
>> >--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >@@ -169,6 +169,8 @@
>> > #define XEHP_SLICE_COMMON_ECO_CHICKEN1                XE_REG_MCR(0x731=
c, XE_REG_OPTION_MASKED)
>> > #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE        REG_BIT(14)
>> >=20
>> >+#define XE2LPM_CCCHKNREG1                        XE_REG_MCR(0x82a8)
>
>It looks like they forgot to fill in the complete row of bspec page
>71186, but I don't believe this is in an MCR range on the media GT (and
>we're not considering it an MCR range in xe_gt_mcr.c, so defining it as
>such here will cause a mismatch --- looks like CI already flagged that).

Yeah.

Although this is also my bad on simply copy/pasting from the original
definition and forgetting to check the steering table!

And looks like we will also need a non-MCR definition for Xe2_HPM's
STATELESS_COMPRESSION_CTRL.

I'll revise the definitions of registers involved in this patch, thanks!

>
>> >+
>> > #define VF_PREEMPTION                                XE_REG(0x83a4, XE=
_REG_OPTION_MASKED)
>> > #define   PREEMPTION_VERTEX_COUNT                REG_GENMASK(15, 0)
>> >=20
>> >@@ -399,6 +401,10 @@
>> > #define SCRATCH1LPFC                                XE_REG(0xb474)
>> > #define   EN_L3_RW_CCS_CACHE_FLUSH                REG_BIT(0)
>> >=20
>> >+#define XE2LPM_L3SQCREG2                        XE_REG_MCR(0xb604)
>> >+
>> >+#define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>> >+
>> > #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>> >=20
>> > #define XE2_TDF_CTRL                                XE_REG(0xb418)
>> >diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tun=
ing.c
>> >index faa1bf42e50e..ea1444358b4f 100644
>> >--- a/drivers/gpu/drm/xe/xe_tuning.c
>> >+++ b/drivers/gpu/drm/xe/xe_tuning.c
>> >@@ -42,20 +42,39 @@ static const struct xe_rtp_entry_sr gt_tunings[] =
=3D {
>> >           XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>> >                          SET(CCCHKNREG1, L3CMPCTRL))
>> >         },
>> >+        { XE_RTP_NAME("Tuning: Compression Overfetch - media"),
>> >+          XE_RTP_RULES(MEDIA_VERSION(2000)),
>>=20
>> +Matt
>>=20
>> I used exact match on the media version here because that's what is
>> already used for "Tuning: L3 cache - media", but I wonder if we should
>> make it MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
>> similarly to what is done for the primary GT.
>
>Yeah, based on the way they're documenting these in the bspec now, I
>think we should start assuming "undefined" upper bound for all of these
>until/unless we know otherwise.  In this case it already looks like
>PTL's Xe3 media needs the same setting, so we already know this extends
>past 20.00.

Right. I'll use an open range in the next version of this patch then.
Thanks.

--
Gustavo Sousa

>
>
>Matt
>
>>=20
>> >+          XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
>> >+                         SET(CCCHKNREG1, L3CMPCTRL))
>> >+        },
>> >         { XE_RTP_NAME("Tuning: Enable compressible partial write overf=
etch in L3"),
>> >           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION=
_UNDEFINED)),
>> >           XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>> >         },
>> >+        { XE_RTP_NAME("Tuning: Enable compressible partial write overf=
etch in L3 - media"),
>> >+          XE_RTP_RULES(MEDIA_VERSION(2000)),
>> >+          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>> >+        },
>> >         { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>> >           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION=
_UNDEFINED)),
>> >           XE_RTP_ACTIONS(SET(L3SQCREG2,
>> >                              COMPMEMRD256BOVRFETCHEN))
>> >         },
>> >+        { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"=
),
>> >+          XE_RTP_RULES(MEDIA_VERSION(2000)),
>> >+          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>> >+                             COMPMEMRD256BOVRFETCHEN))
>> >+        },
>> >         { XE_RTP_NAME("Tuning: Stateless compression control"),
>> >           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION=
_UNDEFINED)),
>> >           XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED=
_COMPRESSION_FORMAT,
>> >                                    REG_FIELD_PREP(UNIFIED_COMPRESSION_=
FORMAT, 0)))
>> >         },
>> >+        { XE_RTP_NAME("Tuning: Stateless compression control - media")=
,
>> >+          XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),
>>=20
>> Also in this case, where we are already using a closed interval.
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >+          XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED=
_COMPRESSION_FORMAT,
>> >+                                   REG_FIELD_PREP(UNIFIED_COMPRESSION_=
FORMAT, 0)))
>> >+        },
>> >         {}
>> > };
>> >=20
>> >--=20
>> >2.46.1
>> >
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
