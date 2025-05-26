Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0187C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 10:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5474610E2D8;
	Mon, 26 May 2025 10:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyTtCmy2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA1010E328
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748253603; x=1779789603;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=m4EErzZOMP8pDCE6606O40+c0KRbjPhkSrLiPUddf5o=;
 b=XyTtCmy2xdYHDiUI/7tDp2aznJ4qXZf87lutyrwuEYKgFCZWoz4ObppT
 Eh4dqsmaAPgWvTHXVMDOsF+G95mZw3XwlJWe2EI1eb0yDVvz5JcksV4B4
 2i2fqdSgoDumXU5E3dwwQS+5+Wz7Kjhtkp+txKarPtxqzix9Nswp5LCwm
 A2H7o2PYUzisrTnoeypuuNSgvDEFNWP+LrBibAfauLceIA/FEChlsmHD1
 ZkZqIO4LiKcEm/a3btIQEQ71pcY/lNq/pJIvQxzYL2x5N/u5IyY7f3n91
 gJfaQrk/6BKh6WO0xC0QOv8aNcEqLgZIsdJJ1xXL2TQZ6K8GN1VRcb41h w==;
X-CSE-ConnectionGUID: 2u1QXRVUSF2l/rRh10gIpQ==
X-CSE-MsgGUID: WfK1Y+TjTjy+WCDvnDDIhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50384583"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="50384583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 03:00:02 -0700
X-CSE-ConnectionGUID: AaJdzSkkT/aA/gnaFTCYXQ==
X-CSE-MsgGUID: R8mn053GSnmGJcj9xNJgGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142244963"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 03:00:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 03:00:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 03:00:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 03:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMtOuMOfxkD4JqJM10eHYU2UDrcsxoOEPedSjxNf1fq4awfeE8pXczutZTMJG4XVD0o2LbDBbJNiMOelIHQ7sJcbekj16/dNcBXX5qefkVFCrLVM1LIUKi2s93lB4GvNna6fPwgigLj4eWShQo/ihc96xAe60n2YWDqe7pCddvNqg0zEC4xEjsPtkoqjpXrXWkZdfinEy5Azx+uQ4s0tUzA7krVVNX3r3PjmFT8lC3QoQiAth8dzuUdOk88t5FIXx8c8Ts7mGTWyCBn363KBL4TQ4o3h6zPHK8RmKA1nEcsxri+AxgGtS6CwPQGtYupypC8AYLehhWBUCvo20DZeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdGDdRdC6g4lxGZaAM5yUf3vMA3/gsk5vIa7bRRSUf8=;
 b=o4B2wDOH7+oWL0XPBqHHC0xvUy+rdZw3hkRJFz/tif3JZmj/bZiOFVo78USJf06JHbaRSkpgz5GKB+bX2z++n5TgbXZWBdS+u8RF4vEV0NaDnknSkqSz3ZCovVWFkn8Bfhvnl5yVqsCVM5edofELkLgDPjMITpK3SP3OuyVHMMcY16emUJq75TZtr59BuNN7/7w2IbadGdg/YuJlmW9J/S/IXGcUwpWwFJV7qxU08MiS1ztDTmE5gVhANWsG+SjvIxUTE8Mk0voTJsEUJn3xJaj636oh0jZ+hUXzBEh5fEeEWWzmDuTIw3W9dnQxXA3/asej0eb7e+31zelDNbfOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 26 May
 2025 09:59:18 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%4]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:59:18 +0000
Message-ID: <1b5beb0d-6a1c-4831-afd0-1fd2b62a9f4b@intel.com>
Date: Mon, 26 May 2025 15:29:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mocs: Initialize MOCS index early
To: <intel-xe@lists.freedesktop.org>
References: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f5a8c5-d3fe-416f-d7aa-08dd9c3bfad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFzTHJxQTArems5dmpDWS9QUDRjQ1VaQUE0T292ZUVCMk16SXZuS0FCQ3Uz?=
 =?utf-8?B?MEV5R1JWL3hjTkVVV1JBZjlYV0QvMmtrSFYydFh4VUdXT0ZSZDQ1OWlMSVlF?=
 =?utf-8?B?ZVl5QlAxdXdQd1B1dDgxVTVBeWZVTDV3bUszb2hJaDcveXBZU3FJZmtBWUtp?=
 =?utf-8?B?NFp1TmlJTDRKcFk1MkhaYWhEZXN4b2JZbERMUzNDVi9MV09aUVphcUdvK1cy?=
 =?utf-8?B?VHR1d29OeU9ORFMweXE4MHhHcWgrMmF0a2lvUWhLK0hieTFHRVgrQmQyL1Vl?=
 =?utf-8?B?Zk5seHRRcFBMSTdKRTVVcE93OXpERVQwNVBKTGZRc2xSZWEzRFljeGNscDVx?=
 =?utf-8?B?RitIUTdsUURIeFlxRWE1Nlc1aE5lbGJJdHhONnhUWGMzUzBoUnFuNkcyQkh3?=
 =?utf-8?B?YmdkZXQwOHZBWEFsbi9FZXJuV2cvSU5vY21MMFZPdjdJNFdqSThyZis4MGFQ?=
 =?utf-8?B?ZUtrbzM2NjBqTjd3UTcxTWVvTkhpQVkvQTNsL244Uzl6NHRFcmR0SnZwWFdK?=
 =?utf-8?B?SDAvb1JsTUl3Q2lSNWNERWdpNkJ0a0F4blFWNHdRSUVndUFSR0xtd2RidFdJ?=
 =?utf-8?B?VEJYZzNzNXExa1NnVDZKUUNOdno2enVjc2ZVcld1N2pIN201c0VtSStWbUc5?=
 =?utf-8?B?SnhEMkxuZWJwOU9uUldjWEhJdGpNQWU2MHhiSnY2anJRdndYaWd0ekpkbnVI?=
 =?utf-8?B?UlBKSjFDdEphNW16WlR1T3ZzQjhSRExrVXM5Y0t2QlZJZnFwZ2dMelJnZ0pG?=
 =?utf-8?B?SC9aSVlRTG41MHJQOWR4N080S2FsNTVvckhVU3N5cU9VRzh6eE4ySWZKZHdG?=
 =?utf-8?B?UExIQ1lldlVxeEpQbWJsUmxiVEQ3cXVGT3psWVV4LzV6anVwYTNBZzZ4WWJr?=
 =?utf-8?B?WUJ1MTFqeDBGUnMxSzZRVEFWbGhleFprZGlUZHk0eHc3QVk0U1R4RVM2Q0ZW?=
 =?utf-8?B?c3B6ZldoWi9WV1VvVlBNRG9EQ21YeHgyTHI0OWt2dHZaVituWm1RNitiNng3?=
 =?utf-8?B?b2cva2dyaUxIY3c2WXNvcVdMSzFoUzE0c2lYcWw4TEoyVHh1SDN3THluaGxl?=
 =?utf-8?B?dGxJNVNoaXo1bGQzTUlIZ3JsVTRlbkN4KzlncTNQam4ydWN6U2Q1SlMwSHhl?=
 =?utf-8?B?RitkK0JFWW9LV3lnUnRPTkNnRVRYb1B6SVFIKzBZcVYzVzA0REZaMGxkUXM3?=
 =?utf-8?B?amdVT0J1RzhqVnhaYUFpaEpjYzJDcFd5ZThDd2taSnEyVHBFUS9wNEhIcENh?=
 =?utf-8?B?cE5uZDl5dG1oYm9LWXpSRlkvNExYVkRNemxmZkQ1WVdidi8vc3BsaGhMQm85?=
 =?utf-8?B?S0VaT3ZLNFdXT0hnWlRNK05tNS9MQjhrYkZxWmYwQlkvVkJ1S2ltUFpoc3pG?=
 =?utf-8?B?S0ZYcFhKVDNvajgreGwxQXVONnF4OTdPS20zMzF5Z29RdTVkTHVhbUF5KzEy?=
 =?utf-8?B?cmpubjJSQjE2b1hPdXFkc1NVRWx0dXI0WjlPRm1tNjZZWGVTR2lhMTlvd2R1?=
 =?utf-8?B?d2Y4anZtdDhWQkZBbFZKSVFLZ1hBQ2lJaklqdDVacjJaTE5kZDk5TGgwVFpW?=
 =?utf-8?B?a2kveCtQOVZEWjVHeFpTNHlLWnJIV25PR3E5NFVhMkl4R3RVYmUvOEJtR1Nt?=
 =?utf-8?B?aGtVOG1mMmljVUg5enYrc0VsSEdtb1FRb2pvSTEvTk8rUWU3bE1KdVc3bCta?=
 =?utf-8?B?YUZkU3hQNk5GVSsrZDNic1JjcGhKNTZwQlBRRnFUaXhmUmEvVjlTczZMZW5r?=
 =?utf-8?B?dzJEUG1DQ21DK0VFZlY2Qjd5L2szR1pyTzFqVVNtZk5xR2tLU3NoTFdzNkxL?=
 =?utf-8?B?aEFjTXBrUzFJTzQ4VWRlVHZJSmtYQnR3eDRmT0RJcUczSHhUSTJrVjZ4MXB2?=
 =?utf-8?B?MFVHODE4NnNFZHdBNWJJajZzMTJURUErTVNzZCtZeFBKMkdNUzkyNFZObWJS?=
 =?utf-8?Q?QIKQlUiUnNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXlNNmQyRWRiN3J2V3JoUXNNczZFOVlmMk1uWTRRbWQ1ODVXQnBHSCtqbmFL?=
 =?utf-8?B?L0xTT2FCNUd0R0doNXBIanYvMU1EdUw5UlJ1ZkVCd3BLQjV6QStuMjZ6WW9G?=
 =?utf-8?B?Yys2Uk9kV0oxL25YU3JQU2lIUWVrUU4wM09RbnVMMlhUSFJkSFZDclFkQ2xz?=
 =?utf-8?B?Z1YyLzNiWFRyUTUxclA2eTJlRmp2V29vY1RTVURSNjFSNUd4UGR0WGZqcUtC?=
 =?utf-8?B?TVF6NkpQb3F3UjNTL0I1dFk5UTBxTFpsSVJ0MkxhVEVFMmxpZUFNMVlPQXpY?=
 =?utf-8?B?eDRyVFgyaHZxU3paK2RGVFo1aDZKTThpZ3RBb212Tk5CVEFQUHhkN0hRQWZW?=
 =?utf-8?B?MzRudnNyV0RndHd6NkxaZmRDSkJFQ05pUUkzL25GUDNEdVE1cmxpK0pHdjdI?=
 =?utf-8?B?Smt4VlRRWkNMc0M4YnBxYjlxUmZjOEt0S0VzcTh6RDFtK2NrSndnQ09zd2Vw?=
 =?utf-8?B?d2NrSEhkV1lQZXlWRUNTOGdKZndZTWhyZ1JYcjEzR1RVUHk2eTdibVB6Vldr?=
 =?utf-8?B?QW80aWlXeVA4REtLTU1mNEJtckg3NjFrUWZXcncvYklhY3c2bUlNQ1hqNk5p?=
 =?utf-8?B?emp3TWIzaWxzZ0tKNSt0RXhoL0p2NnEvZkZUZFFQM2IyNm5MdnpYOGxXZkZL?=
 =?utf-8?B?T0M1OXF2dE5MVnRHQmU2Rk8xUVVOdFpWZkdUQmk5bTFud2FvckF3a21zY0ly?=
 =?utf-8?B?TTZrZnZNUkg1eVdEYUFBcDBzcEh2QUxPaXJ6UStJeUxKTVJJNWFUbW1ZVWVr?=
 =?utf-8?B?cUJkRkdLTGVsREdxMCtLNGNZeTI0SW4wV2U2WDY4amJjdWVyUFlsclZTWEFZ?=
 =?utf-8?B?aVRLWFJzekZQZHNBbUlXVzBRTldpU2RaVW5tcVRlZ2hTTFlVK0tIaGI0bzNn?=
 =?utf-8?B?T3RJcS8zc24yRW5Kcmp1Y1NEUDJtRXhoeXRQckFlSm1KMXNGcVppMU9BQ1gy?=
 =?utf-8?B?YUh6Rnk0NmFpS20rbktTSjc2T2NPR0FsTytmaXRpQWJvUjI5Qk9MR3l3aVBu?=
 =?utf-8?B?THlHSFNCdVF1Tm1KaGdFYmo0UndYTzJFYlNTWUk5T2hBNHExbFNnenphNmRo?=
 =?utf-8?B?SitkejZIQkFIc0JGNHI0bkhLTHpWL2ZzVlMwbmt2R0hQeWUrWFJvOVdFbTJE?=
 =?utf-8?B?NU9CTG9jTHhWYyt4YzJMTnpncEJKWFp5MmR4emVNWWJhcFJzeFdqOEs5bHUy?=
 =?utf-8?B?ZEVIU1haNmFRd1V4Ukh3Y0pHbnJTbFROK1RYb2xldTNFVHBZWkFINEdUdDJY?=
 =?utf-8?B?YlNpUyt0aVMzd1JJazE5aVp4N3E0QUtHeHFVSzlXQWFYZ2VwZjdGR1NBaXcz?=
 =?utf-8?B?a0c0YlJRcUNSVENhS1VpSStUYTZKNVlpaDR1QUFTaTJ4TzQ2bmlkOWRZNk1Z?=
 =?utf-8?B?aFVkWkE1NDlVZnRxcFVEcTlXOHc3NEx1K1lYRnpCNjJLRjJSUlRITmlpZ3Vi?=
 =?utf-8?B?aGVCdjh0Tk8vZ3paVzJUa2MycDg2U3N3T0JNamxsM29RWk9DeFk1UnRVbTJo?=
 =?utf-8?B?S3NndjNxL1liS3RHc0lNTEUyS0EzcjlydUZSWE5yTHoxblVsYzYrUGYrNVh2?=
 =?utf-8?B?MS9NNVg1eVZtVEtRMFVBdHhsNW9JeERiYW54UDV2Q3FLRms2cFlTeTFsSFJC?=
 =?utf-8?B?aVI1KzRlbXYxcXdxZmdCSDNzdkJJbEd6MTFsaDZLUjBUWnpqV0tlOE1lNlBu?=
 =?utf-8?B?UTV3RGRVNHVvdkIyZTZHYm1RaVFUZVlWZXNueXJKZk11L1R3MlA2eHFERFB0?=
 =?utf-8?B?ektib0FoYnY2TjloUFJLT3FCK00yUndvdlAyQVRPbnRJajZUOEJkSG1nSjhX?=
 =?utf-8?B?K3hJT2xNQUplb3ZDUE44RnQ4clVIdGlGSDN2dEZ2dE9UWDczaHdRUjN3Y2U1?=
 =?utf-8?B?Zmp6Q2UyWXhSNkFUOWl4QnBxR0ZKNW9YZ0NSb1FWbVRCM0xUMHJnYW5EZ0gx?=
 =?utf-8?B?eEk4VmtWdXZMQXgwNmRTOHZXTFFIZEcvYmQwdHFHdDJ5TTdZd0ovd0VlS2g1?=
 =?utf-8?B?YVZJbGp6Z3NIZVJjZ1RvNGNaa2ttKy9xei8rOW5EOWsxVEZMWjVzSkFYeEhv?=
 =?utf-8?B?a3Zvb0h2MkNncjVwWmxITVpwTldlS3Z1S3RSV1NlTng4M0RZVUxtbDZ2cThn?=
 =?utf-8?B?bHdqa3pqZUlqUnRGeXhrSWU5U2poa0swdTlLeWpaWjAxMDV1M1BZSUFPT3dK?=
 =?utf-8?Q?WqHSDQsZ1hOqhaqZgWw2xSk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f5a8c5-d3fe-416f-d7aa-08dd9c3bfad8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:59:18.5802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jt6AMkE6DDExinkvay4Kc3syIZxcM4uVtXCPooV92BqKsWJk/taCvUJiGg38KPuLJ3lcbo/YCwr6FTTEmEdKkyexf3gLjyWgJGwfhUsBNZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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



On 5/20/2025 7:54 PM, Balasubramani Vivekanandan wrote:
> MOCS uc_index is used even before it is initialized in the following
> callstack
>      guc_prepare_xfer()
>      __xe_guc_upload()
>      xe_guc_min_load_for_hwconfig()
>      xe_uc_init_hwconfig()
>      xe_gt_init_hwconfig()
>
> Do MOCS index initialization earlier in the device probe.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0e5d243c9451..858b5398c01b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -417,6 +417,8 @@ int xe_gt_init_early(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	xe_mocs_init_early(gt);
> +
>   	return 0;
>   }
>   
> @@ -634,8 +636,6 @@ int xe_gt_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> -	xe_mocs_init_early(gt);
> -
>   	err = xe_gt_sysfs_init(gt);
>   	if (err)
>   		return err;
Looks good

Reviewed-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>


Thanks & Regards,
Ravi Kumar V
