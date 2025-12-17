Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC69D6554C
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 10:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A0810E2DD;
	Wed, 17 Dec 2025 10:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAgNGCMR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033A610E181
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765969025; x=1797505025;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Zs2wb15KXSG8lH6nECDzvBSdtPn0xN0yNUqp/oHJUmA=;
 b=BAgNGCMRgMj5qywhuvM+c5ci3ifdGt6l4PJB+882hrROJPEAc2ZJN28V
 N3sdjs9+S0d8YDJDTeij3f0QhrDo3meUG0EOPyO192J6HenK/ozPCSq/3
 RfNZwrc+e16LJnj6biROeexEC002kmrC9ruJhwxc/0kvlcDEDA03xH60A
 eM07qzo39GIM/i/g37+EtYHrkiOxIv3ubqD/IYZ7Ur/TnSL795Zapf0fn
 /5kKrmxslSlsmwiCtqk9fGKNokQ/qAkl1TbLBu1/kqLX3djuAKvFfpmxn
 3B+wcvfuSdjPeVqckQL5ogSIzRdQiygjFnFK3lIAlRN34TnRr32AcyomR w==;
X-CSE-ConnectionGUID: 5ZbADEmNRPSDRBpvb32XTg==
X-CSE-MsgGUID: 4WzjrBN9Q2uVTaVEId9q3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85493091"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="85493091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:57:04 -0800
X-CSE-ConnectionGUID: K3mMiI7CTpWrqbZ73EjhtA==
X-CSE-MsgGUID: 0BAqm6ydRpC8p2U9ARef3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198160539"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:57:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 02:57:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 02:57:04 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 02:57:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmhVhhGClJilch2Mb4wMPYQHOrbzc29fRUZd6kKI9rT2OKoBEQuGUDd9X5TaBghQ60CahPQeezM4IoRwqP+MnVVy6ZVFhvmC44DmSS4CDi9hD7Of+SZR1vgI3Bv0UTkAHf42iqkVS2hnJWI1ux5AwZYLtqrJjUjv/Xi5xYKAuDRbOZIwdghnPECxPH7Qxg1ik+faLWcFhNgXtD7sGDClDm+sOKz5cpQ31VMheTeubJb6XU09o8be/WY4Bb19wxXNzLTVyt7l99+0XqQjNOXe/nBHJDzo7BwwO0rofsRS/4UQPqoj9WZhpJlYvRh2lqdxNaManrf6orEpLPm0LqMCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmx8LrpxDxn7W+uPHRa0EQ3H3nD+ukJ5/MzlRXypVIw=;
 b=bFKi5QyuUB0i8HLNC3DQLO7d49XN9vl9paXe8kG5U3YvdPxi7xl1Mh9eAyui9cmxMi9Ob/z7BsunaWomWsG5YWBTo3cjQuXHPDSM6BWmHV9bGKk2KZKt0qYMpBp0uaV+Miik/H4SpDofuZV09QHK/NL4OJvtb4XnqpOvYvflJoWkZvD8EEPldHGKg75nz3HYnIl+G37G4pwOL9OYDdIkSjoNg3T9WX5NnBTV029PaYegw5zT5xYgvcAckXdX2AEusbBjj36Yem8VuVgjKfi2Ern2BQNPSDSTwrdD59vi9uzzs4xl34o/RUNm+NaSSEnDpObEPag6MCpkLNrDw2SK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF0FD67B0BC.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 10:57:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 10:57:01 +0000
Message-ID: <ad0014ca-8846-467c-b38a-c3e928b8d69d@intel.com>
Date: Wed, 17 Dec 2025 11:56:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
 <20251217013702.3597539-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251217013702.3597539-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:803:104::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF0FD67B0BC:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e2404d-15ed-47e5-70c0-08de3d5b01da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkNEc01pL1d0Tk9ha2pvTTR4ZmlJYTBVU295cHNOM2N0cEZ6VTZLZ2VxSGdY?=
 =?utf-8?B?RXRyOFFIRE1Ub3lvVmlTaXVhSWFpZklSeGt4TlhNQnAzNy9WYlNyM2hJZlJS?=
 =?utf-8?B?dG9ZQ1NqUlV6QkkwNWliUDNiUmhQWVBEVkNDUE1XSDM1SUhpMFh2WGZ5WEE5?=
 =?utf-8?B?UUZuOUVwK0VJeW1NbmtlSFlxUWdDTTE3aG1PYXJ1ZUpZejcrb3B1ek9jdjR1?=
 =?utf-8?B?MWc0OWp0ZGxlYm50QTZBN2RhZXJXUVFoSVNNVWJiOWVOaGJ3ZEFFS3Q2T2RK?=
 =?utf-8?B?bStnakpqeUhXM245TjFtVU4yWHpUN2JvTnBjZVlpQzdaTmtQUVF4KzYzSVdM?=
 =?utf-8?B?TmJpVjcrbXpiUzErUnNJV0tiTEIzdWp3ek4xQXhJMHEzdTdwZjF3MHllMnh0?=
 =?utf-8?B?WWYyRjNCVG14NFRwbmJEUDByaVd1NHF4cWJLNXNYWDJDMUtGdG9ndlhQYVZi?=
 =?utf-8?B?NnNCZURuRmgzOEdhVmdpRFM2Ulh2YkR1RVlsMkpLdTI0SG5pc3RId0t3UlBI?=
 =?utf-8?B?WTJqV2dIQk5KbUhwdUNmOWdhZm54Umc3SFBVQnIrWHM0ckxSWTBlRUJsaXk5?=
 =?utf-8?B?T1RJRXBVbDhaaXdMUGs4b3VDWjFZNzgranlqSmNsODZ1TG42eGtBTzJMd2p5?=
 =?utf-8?B?VkdUcFp6R1FQb015cHU1anFaZWkvZnU3b1NRYmJ2RzQzWkM1cjZUbmxmdFEr?=
 =?utf-8?B?U1ozR1RESWwxczVKcnFDc2djdElIZFA5U0lzT0dpV0V4dmJSeUVZMFRwRVFT?=
 =?utf-8?B?VnhWMGI0Z3Zvdzh6K2dHWUM4Rm1CdjRkeURUbU16SHUrbDdmVnBQYWtHSUdp?=
 =?utf-8?B?aFZUandsQU5QT05HNmxqZDlmMTFiQTUzL3h6YUh6bFVKdUxNbjE1MmRLd1RP?=
 =?utf-8?B?WkROdnNiQnF4VFZTSm4vK1BSMzM2T0VLaWp1Zk9jVGF3a3k3K3BqTUN6YVhR?=
 =?utf-8?B?MU43U1lDZ1YwclcwQW9JRlBsNXFieUVuajNQTWU3L0ZpdEN3WHlEK3VNUVNI?=
 =?utf-8?B?NExoVjNqRDdjUEVSVjJvOUIzWWV6OUJrNitqQ1g2NHY2cXMvZ3lEdXlKOWNO?=
 =?utf-8?B?TmRyNmV3NGV0RU13YjVWaHVxS3QwNVA4TUNQcXAvdHNiRkgvZThrWkNDejFh?=
 =?utf-8?B?V3JxRkpiaUtleFBjS08zVnJaYTcrMWVLQ1lYV0ROYXQxZjl0dWdYcWNjUjBD?=
 =?utf-8?B?bzNqRGRIdWI0VjJHOWRVbzZnaEwrM0JaT1NpQzRnaFNUbmRocHpTQjYxU001?=
 =?utf-8?B?WjdZdGsrcCtOaHREZjJwWGdCc0REMDNMeFM2Z2xnZ1puazRSMjlhaU5tSGQx?=
 =?utf-8?B?L1ZaYk1sVnVGdVM1OHdtT0NVMVRkVG5Lb055T3E2bUhkUWhqRnh1a2lmYzJO?=
 =?utf-8?B?SEg5YWxxTVRqWEFZWFZnNHdjcDloUjcxR3Y5VWlGbzlxTGc4Y2N0a2RmNms1?=
 =?utf-8?B?OXFPYWc2MXFlVVh0MHNLdkFTelZnSnNFendtbzhDcUdHME5oTW9iL3pnTlZ1?=
 =?utf-8?B?V1FOTjFROU9uTWJ3MHpQbWRlejNXekFJWERmc25WRXBNOGR6N09VQ3h2MldF?=
 =?utf-8?B?a2FUeTFQOUxrd003VldJTlhzaFJSVDZlVkFtOEtybSs0OS9oMXJjQTVPM1dP?=
 =?utf-8?B?TEFTNG5EUGs0bUFOeHE0YTdrdWRtT0JtTHl3Sm5uaW0zM1lmd2w3M3RyUzFo?=
 =?utf-8?B?eW0zY0pLbXcvZmlOOURLOUFkanNOYkJSazRrVEZJUUZCNmpZcGhML2poemlW?=
 =?utf-8?B?VXJWbHY3dzBFcUxkV3k4ekV1RndwQjRzRGhwVWE5SGdRUUVnT3VVYTFrY0NJ?=
 =?utf-8?B?S2ZEa1JJYnhzbFVFZ3lPMmhVa1hXNHFrT3dEeEpITG16OVVDQ1QyR1ZaR0FW?=
 =?utf-8?B?b0FaZUlCVHV4aFFYUlgvdFRuZVNQcmtQWUExalJKZ0lGanRmMllJajFyMVgr?=
 =?utf-8?Q?VhMbQNYvGMP8/oUT+pvbP4Yhm40bwjhA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlNoL08reGJtZktKU1V2N29QRDV4VzZ6bUlwbmVhaHVXbmFWUC9DNFBMc094?=
 =?utf-8?B?NGhXNmdQQjZRYXZwZkMvMmhSYkZ6WEZWbDg0K1dIK1o5M1JLUVNKbXQ0dTJ4?=
 =?utf-8?B?dno2d0I1RVUzNVNJMGx4dFdyQUFjRk0zWmJJUEgvUEFUdFR0aVF0OHVqdGpm?=
 =?utf-8?B?VDZ3M3Z6UDBtTnRmS0NhZVFQM01ld3FQL0VyOFV4WGw1SVZXWlV6amlFdEoz?=
 =?utf-8?B?TFBqVzc3ejZ2TWdSclFWOHp5b0hBdTg4aXA0MWs3NTZIZklQeFpia3l6Ymt1?=
 =?utf-8?B?ZEhwODZPcG5ZRGI1bnZGc0M4S0JrWUYrK2pGeWxrZ3pxck9LdDFyVXVlYmJC?=
 =?utf-8?B?MjJGMHJoTWNiZE1CNHB6RFc5c1RncElhZEJxbFRpTnVuakdzeU9YUk9wUHkz?=
 =?utf-8?B?S1JZK2ZvZ0FIeGlpVHUzR0lEaFZZWUdLR3pWeU4rRzl5SEZycWN3UDVEaE1M?=
 =?utf-8?B?QlBKTHpXTjhRTDVCTUJxa20xS08zNjhDejAvUkM3ODU3VlhHMzVTS2R2b0ho?=
 =?utf-8?B?L05WNmdGNGZZd2lPSDcvVW51b1l3amtDMU5QZXVJL2hSejhGZWt2U3c2SmRZ?=
 =?utf-8?B?dWxKWDRCVXRkd005bzN3aVlCeUFvWkI2UXNOR1I5U3ZrWmNOV3gvTzJac0dZ?=
 =?utf-8?B?eUd6R0RubElPbWQvZGlhRUtzb1VZeWR1dmJUWVVkY2d4NHE2SmhaY09NZ0lI?=
 =?utf-8?B?bVl5VDlob09qN0lFYTg1cHZIcEszMzU5R3VJeU1EQkZEOVE4cEZObUZoR1Y3?=
 =?utf-8?B?ZXVsVFF2MUFId0w3Wk5waTBPN2xhNWdadTdPVnNuZGwyRWFlSFZnMEJHNDJH?=
 =?utf-8?B?V2daeE5nQ0l2MDNRMy9QbDgzK3hJeVRZcXhEcnJpNXF6WEpMakFOTE9aM0g5?=
 =?utf-8?B?WE10QVdpZlVEdkQ1QjRWL1FkdkMyVTlXaDFpVnZUU2dSeUJ5R3Y2NDBVNzdF?=
 =?utf-8?B?NndqYnd2Ui81V21UWmU1NWhuQlFRSEViMjRXaUZDZ0F4M05GaExtdWsxZ1FC?=
 =?utf-8?B?aDZiVG9Lb1VQL0tmVWp0NEc5UmJWR2w1VU5aY3dTT08zYW1wQk9ydzNNZE52?=
 =?utf-8?B?bXhJQk5DZUdXMEdxTkhsWEZqeFZ1dkUrdmRlaWcvRWh6WHdjVWprZzdtZm9v?=
 =?utf-8?B?SGl3SExlL1VDU2NvVXh0THdvNC9jWGM1SXZwQmtNTkFuVU95TnFTa0E0MitI?=
 =?utf-8?B?YnY2TEtCT1ZkOUtoMWs1MkNaeUd5ZlpLSUVaUDhIRktoZ2d2YjdXZWRzV1hP?=
 =?utf-8?B?anVSMWpIbnFqNGRnVCt4UzBPWUNmYWcreVBYYWkrOXRCekhvN2dPcFFwR2FC?=
 =?utf-8?B?Uk5qRjVrQzJHTGU1SUhJY0w3VGhPQ1Q3NzYyYWNnMGswdGIyQ1MwQ3dOZnBR?=
 =?utf-8?B?dHg3SHVaM3c5OTkvZ3ZBeStvUW4wQkl0U3lkOEhYakdtbWltd0ZYNmJKbzBq?=
 =?utf-8?B?Q3JjVW1ERWh2cVE2RG8yNXZicHhmZ0gyTk9JWWlkMGFQMnQ4eWx1YzBYNEFi?=
 =?utf-8?B?R0xIOVJGNWV2QkJJWEdkSTFiTUo3eitDcWVvLy83aGZtbzdpbS9nc0pRU1g2?=
 =?utf-8?B?TTVjS1pzWWs5UEljOUJUR3NNMzAxZitJTGtQZzRIQUZWQjBpbWlHS2tjTXNN?=
 =?utf-8?B?elI5WXRjUGtJSjgyWit4NkdOT2NzOC9wSEN1R3F1a0h1VUFLc3JvVkpjUTdq?=
 =?utf-8?B?MUMweUJJT1JEdmkxQ2tuVlZvS3orVVFSNXpBV0pqcEFVWjdoQUswVm1lUjky?=
 =?utf-8?B?U21JM2pVODNxcm9rOC9aRXNCMVJDbzRsZGlpcXdreVNPQmkyWGpGNUR6Wlc4?=
 =?utf-8?B?SXFQekswdURnai93Ums0OFgxWWZyZ1FxTFY0cERlS05UU2pBbmRxNTdpakZU?=
 =?utf-8?B?WWk0TU0xRVpiQkRjUW5IOVBjZ3NQOG5sS2RLNWZ5Sk0rdjJtKzZIcU1sUEcz?=
 =?utf-8?B?djBCdng5UnY4eVU4TVRsV1YrSy95a1NYOEI3S1NjWW9DcHdaY2Zyc3JhVTJl?=
 =?utf-8?B?UnYvM1RrRkNJcEgvVlRiY1p2N0lFNUF1ZmZhSHV2SWRWS0xrOFBaZFZqK2s0?=
 =?utf-8?B?M2prOXJ2dCtmZWEvNk9vYXh3VERSZ2luSVk0ZlBmWm9mODI2ZDlESEpCc1Q3?=
 =?utf-8?B?dXR5WDVFQVlPMWwvNnc2YnRNVVBWOTlDUzRSMWp6WmQyRGg4Z1QweFA0NC9s?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e2404d-15ed-47e5-70c0-08de3d5b01da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 10:57:01.7747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXhXB0rv3eoNasQllhODT4ZxTwl7BEPZKMwP0IsXuPEwSprGtf2r6ojEhA+j3oDImGFVbef1sEv0ioEdc7wJ25JHx0WJ4r3WpG9SS45xJvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0FD67B0BC
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



On 12/17/2025 2:37 AM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> v2: Comments (Michal W), remove duplicate c6_enable calls from
> xe_guc_pc.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile    |   1 +
>  drivers/gpu/drm/xe/xe_guc.c    |   5 ++
>  drivers/gpu/drm/xe/xe_guc_pc.c |  57 +-------------
>  drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>  drivers/gpu/drm/xe/xe_guc_rc.c | 133 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h |  20 +++++
>  drivers/gpu/drm/xe/xe_uc.c     |   8 +-
>  7 files changed, 167 insertions(+), 58 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6ecba27d85f7..90f86ad11498 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_log.o \
>  	xe_guc_pagefault.o \
>  	xe_guc_pc.o \
> +	xe_guc_rc.o \
>  	xe_guc_submit.o \
>  	xe_guc_tlb_inval.o \
>  	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index f0407bab9a0c..d05380893f39 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_memirq.h"
> @@ -865,6 +866,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_guc_rc_init(guc);
> +	if (ret)
> +		return ret;
> +
>  	ret = xe_guc_engine_activity_init(guc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e2e6edb851ae..f8b683189f6c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -253,22 +253,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1034,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>  /**
>   * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>   * @pc: Xe_GuC_PC instance
> @@ -1217,9 +1177,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		return -ETIMEDOUT;
>  
>  	if (xe->info.skip_guc_pc) {
> -		if (xe->info.platform != XE_PVC)
> -			xe_gt_idle_enable_c6(gt);
> -
>  		/* Request max possible since dynamic freq mgmt is not enabled */
>  		pc_set_cur_freq(pc, UINT_MAX);
>  		return 0;
> @@ -1257,15 +1214,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>  	/* Enable SLPC Optimized Strategy for compute */
>  	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> @@ -1285,10 +1233,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +	if (xe->info.skip_guc_pc)
>  		return 0;
> -	}
>  
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
> @@ -1310,7 +1256,6 @@ static void xe_guc_pc_fini_hw(void *arg)
>  		return;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_gucrc_disable(pc);
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>  int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..a526405b686b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_guc_rc.h"

nit: since we're using HDRTEST targets it's not needed to have this .h here
move it to the rest of the xe headers below

> +
> +#include <linux/device/devres.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_guc.h"
> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ct.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC
> + *

can start with explanation what RC stands for?

> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of DVFS, which is also controlled

what's DVFS?

> + * by GuC.
> + *
> + */
> +
> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
> +{
> +	struct xe_guc_ct *ct = &guc->ct;

nit: ct is used just once, you can use guc->ct directly in the call below

> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> +		xe_gt_err(guc_to_gt(guc), "GuC RC enable control=%u failed: %pe\n",

maybe:

	"GuC RC setup %s(%u) failed (%pe)\n",
		control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
		control == GUCRC_FIRMWARE_CONTROL? "FIRMWARE_CONTROL" :
		"UNKNOWN", control, ERR_PTR(ret)

> +			  control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable() - Disable GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_disable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret = 0;

no need to initialize

> +
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
> +	ret = guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL);
> +	if (ret)
> +		return ret;
> +
> +	return xe_gt_idle_disable_c6(guc_to_gt(guc));
> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(guc);
> +}
> +
> +/**
> + * xe_guc_rc_init() - Initialize GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Initializes GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_init(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
> +}
> +
> +static int xe_guc_rc_enable(struct xe_guc *guc)
> +{
> +	return  guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
              ^^
double space ?

> +}
> +
> +/**
> + * xe_guc_rc_start() - Enable GuC RC feature if applicable
> + * @guc: Xe GuC instance
> + *
> + * Enables GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_start(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.platform == XE_PVC)
> +		return xe_guc_rc_disable(guc);
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_enable_c6(gt);

hmm, it might be worth to document all cross-deps between:

 * guc_pc
 * guc_rc
 * gt_idle
 * ...

> +		return 0;
> +	}
> +
> +	return xe_guc_rc_enable(guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..2500b0d1c151
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +#include <linux/types.h>

not needed

> +
> +#include "xe_guc.h"

not needed

> +
> +struct xe_gt;

not needed

> +struct xe_guc;
> +
> +int xe_guc_rc_disable(struct xe_guc *guc);
> +int xe_guc_rc_start(struct xe_guc *guc);
> +int xe_guc_rc_init(struct xe_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 157520ea1783..91eaddad331e 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	if (ret)
>  		goto err_out;
>  
> +	ret = xe_guc_rc_start(&uc->guc);
> +	if (ret)
> +		goto err_out;
> +
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
>  	/* We don't fail the driver load if HuC fails to auth */
> @@ -246,7 +251,8 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  
>  void xe_uc_gucrc_disable(struct xe_uc *uc)

hmm, this function is called only from one place, where it is followed by
the call to xe_uc_stop_prepare() - so maybe it should be part of it?

>  {
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> +	xe_gt_WARN_ONCE(uc_to_gt(uc), xe_guc_rc_disable(&uc->guc) != 0,
> +			"Unable to disable GuC RC for gt: %d", uc_to_gt(uc)->info.id);

hmm, this still looks weird

* why is it just WARN_ONCE ? it will hide other occurrences from other devices
* no need to add "for gt %d" as prefix with "Tile%u: GT%u:" will be already there
* can't we just move this error reporting to xe_guc_rc_disable() ?

>  }
>  
>  void xe_uc_stop_prepare(struct xe_uc *uc)

