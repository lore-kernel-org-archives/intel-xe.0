Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E17D4335B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6062310E113;
	Thu, 11 Dec 2025 22:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cqg+9uR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8832710E113
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765492819; x=1797028819;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R9BiINKPV6mRyWjpyf8XdCNQiKbc7/CPyptYX8ZsDGE=;
 b=Cqg+9uR7jYEII31zZfYaWU4BIfzec6kJZcN6l0mUnk99BNDq6+PwpcpL
 cPZq8hq7SuEzgHYQkxPRwbkAycXaSlg59wdGs1T0g87gr2u80ki4YLWQT
 ZN582zr3lan1u9RB6TC4WFO4TRyzEm6zwCS7IADCSOKh3RpApcRI9pnMV
 IRNIuYZCuDllFjxHZOErpykac7QNM1upWM76jqO8ifDOcGy7SJvb+WmUX
 27bxDsFPovnXT1vrkyIIPrNaMmsEjVriKMBn+PtjiBSASZJHhe06Zmtd4
 OoquMUgnTxuIxUm3Xvf+iAItiKorzMhJBFoMDIv0ZDtWklA7w/oN5BA5F A==;
X-CSE-ConnectionGUID: l7/4MLf8TsumGWZGMtDnlA==
X-CSE-MsgGUID: B+LVcUoOSvW1CVeuVowVZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78852575"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78852575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:40:19 -0800
X-CSE-ConnectionGUID: D2KZ2qh1Q8OZouaSb/1vTw==
X-CSE-MsgGUID: c/4phmMLQOeO7ZnX3523QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196971940"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:40:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:40:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:40:18 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl1As6dVPR0C/GrSTFVX/i+EhArb6VLwlJQWRNVDcLG2Q/lOAwGrXUGW/F0mlpa/6Xz85lp50o1LGwNolTGlmoRIfA2BvoR0kS74pPoWFhqwX2cFezaBMeeFXhnCBy1o8tyfQl7DjuCJYjI2eKlW4KBTaiKN+iW5v35ryFo33AAc58DL5Lf7RdIANEI6Is5T6bi00fb3tEs+bcEj5TQZIPm0dctnjGBWZItHXaiQ2RrpX5tjovBWjWUGMmSXRowq7LriXwDV5YWKDy3CJKsCZt1XyOC5t9uJN7IX6THAQWNHaDwk1DVqlVhI/8uXu7lOU74SWWDi239nAjaisRodPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZcAW8mxlnp2rfjy2CCvKfn9X3r4zfNsFCq3tgR8Qbs=;
 b=uFfiwPnJZD7CeOloFh4LNxfgKt7q8gu3TPRhOL4U4SKbPKE6ZewWfyzNEjpz0wf2byOe/8xGgBVoKbP4jUfb2OOR4GxPmftXd5ER9araqXS0oGH6hJ6ki4d2uzlw8KwIHaawOJ+eweFrFgb3gyMuky6Lw52EC3dOH273zLaXs07zl4lISv667TC0DxO/RiDvSX695KkytdmZwG58UqdJzRUbDfcLIlYbJViZrXs8H+dN4KoKjsn2AqXPVX7EdCbRPmHbW8A/nzq4YluqDeOH8b9yy72sjRWiHhsAiz820+vK2GvJoXy08Sut+4Ap/oKBX9963vk+7j5QCiMWqsTPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9419.namprd11.prod.outlook.com (2603:10b6:208:564::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 22:40:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 22:40:16 +0000
Message-ID: <fb7cd4b8-f5a6-4fc2-b58b-5460cd23e8ae@intel.com>
Date: Thu, 11 Dec 2025 23:40:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] drm/xe/sriov: Add debugfs with scheduler groups
 information
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-22-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-22-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0155.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::39) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 2863ee74-185d-4bac-87e4-08de39064134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXJoanMwUVRpVDVUcm5VK1lZWUdCZ2V5ZDF0WVhLZHZ4YVI3cUpCWTEwekFW?=
 =?utf-8?B?a2VLc3pKMjk1cUJ2NjB1M0kzMmR0TVVheitTS2lSUzI0azFpY01BQ3JWYzFi?=
 =?utf-8?B?bUZwQk9OUzNRL3ZicitLUG9qejhUelZjdDRpY3VCZTQ0K0RETGtSZ29qOWJS?=
 =?utf-8?B?TWx0TUo2K05VTkxpSHk5bmoxcXBjUkZPbDFQNTA2UlJKUUtJRC9uaFVaYUw4?=
 =?utf-8?B?V3B0TCtSY0JaQnB1V0xxWWpIVVJ2NW5XRTZlMnd6bSttSzFreEd0eE1NQnZx?=
 =?utf-8?B?T3RoRjhpbmFEOFF2SFNpdy9lU01vWnFCZmNFOURXYVRoeVpvSnIzUHZtM2cw?=
 =?utf-8?B?ampxRjhrU28wSWs3V2FneVRGb2cvZy94WkVGMmJXS2dVWkVsZEJKSHNQWUF0?=
 =?utf-8?B?UG9NK1R0MThqSGdnelNmMW1TNmVSYXAyZmxuU21qa1pzU1ltL29sa1p2SlIw?=
 =?utf-8?B?MlM4OGFTRi9WRElBZU5tYmY4NzJVdTcvajFBY29Vd1YxSFF4ckVXM1IwcEVF?=
 =?utf-8?B?RTJZUDVSOEJXblcwU1JxTE9DaFpCZTRWMzJZRDhRMm1VU3ZCM2l4NlBqeFU5?=
 =?utf-8?B?SnN3clpzWk5MZDlZVXhlOVUxcXM5cEViSWpXbDVpTWY1RWErcHFVVjJEREx5?=
 =?utf-8?B?dEJTejBYL29FTVdZeXQ2REJ0SHZXR0x4MWJxL3QwRmc4blBqNmxqNWU0eFRZ?=
 =?utf-8?B?OFBCdTlIdjNqOUJRM1h1WHp1c0I3RFJ1VEQrMEJidmEwbjJrVzFKU3BJSWVV?=
 =?utf-8?B?by9sQkpjZ05ESjBkRWlXTVplT2crWHo0REdYeHBUbHFQT3ZCaXAwekVydTVU?=
 =?utf-8?B?SDVPTkw5V1dLL2wyVFg2a2dSaGk3Y3VIemFlM2VZNERyejdndUlvSUpYeFI2?=
 =?utf-8?B?NzRtTktrM0VIVWR2ZGd0WDdHUnhXUjhvb1EwdEtzK1k4aDlPb1QxbUgwREMx?=
 =?utf-8?B?Nng0eUJLeFJsYWpwUFZQZlF6MFhtV0JBZ00vb3k3WW1oRnNvNGpaVDBjcjMz?=
 =?utf-8?B?Tlh5bElkS2NvV2JydGtkWXRvTE5GZHIwUHQ0bU9qUWVSUDFQS1Y4dkJpOXpw?=
 =?utf-8?B?dDNkTENvYXpWeDN0Q3FnQUNyOTIrbU1mSzVPQWJkc3NGdVRmV1R3cDZ2cFU3?=
 =?utf-8?B?Tjh0SnJacXAxcHJhNWxTblBtMGNZUEFjQWhYSkZIWUJOUmpLVnFJY3FJVVli?=
 =?utf-8?B?MGRtRVJFcTA4YmxtWUY4c3RubXFyYTNML0NwNGlIMW1ZQ25wNXlKQ3ZqelVF?=
 =?utf-8?B?MElsRFZKS0VEL2cvUTFIQWo5NFEzR0dKOVcrMm5sRUYwOXh5a3luUDdZZ2NG?=
 =?utf-8?B?ckRXSENNTElPN0dqczRXRDFhS2hFVFBHd2k2TGM1VDFYb3lNTUxXUEdUdmdF?=
 =?utf-8?B?SXAzb2JMOGs5cU5Td21STnVWNHNNQlhxcm9vT2MrUlVZdGFrOEhQRjdrVWY3?=
 =?utf-8?B?ZmVUSE5DMVJyc1dkYnQrM2RaLzBBNWxaTDBCMkFsY0VvOXN0M0ppOHBsMHND?=
 =?utf-8?B?aEt5VFVjdFZZa1pZRVc4UUFiTjVQNjlMcGIzTnhwZVJWWHVxeHE2M2ZaQ1FB?=
 =?utf-8?B?aDQ5K1gxTmhmVjJVN05PNmw5VUtjdzE0eGltVDNQQmxXOFQzQVFHaUkvUEg0?=
 =?utf-8?B?SWNDY1JIMnQ3Uk9mVDBIckJxK2F3empJVXZ4bnNNUzlicUQ5NEQ5dDk1OWtO?=
 =?utf-8?B?K3ZiS3RxQnFGbFB5Nnh6UnYzTFY3YVE3eDlHQkVlcXZwQXBkLzdCWnMvbVJM?=
 =?utf-8?B?SGZVZDVORmtXRWNzaWFMQmt3YkxrZis1TEZOSk5UaU01QWttZ2IvMGpGd2Jl?=
 =?utf-8?B?TGNwT3czc1pvWVphMWd4bk5wRlZNWEk5aGRHN1Q5Mk1NN1RzczBySW5xSW1M?=
 =?utf-8?B?UmsvNDdQWGdMNlg3NlVEWVFmbU5JakVLOEFUM251OXZOSWpRTFNraG5wb1M5?=
 =?utf-8?Q?wlS3s4Ftsw96PE8Mt3jQN48nj/AJtrtW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25HTXE4RlkyRDA2eEw3MU9qd3lOZkJCd2JxMHAzNTNTeStpUWs4eG9jZ3lW?=
 =?utf-8?B?Skg1QTdmYk12M1B4SkF3N3k0TUg2UDgxNWx1RGxIYlUzNFZSdjFGWWpSWlFV?=
 =?utf-8?B?YTg1aytrOHB3NmY3bG9KTjhVNm5iMG44cGIyRm5HKzBNeHFzaldrWmVPdkxy?=
 =?utf-8?B?dHRQSTB1Mk5GUHZlTldQTndNdEI1KzhIYzh0eHZkeWhKYlJVYmx2bDhGYnZ3?=
 =?utf-8?B?UmdTZ1dVSVd2NHA2ZUVGd2VQc0kvYXdVcEU1MUZXM001Y081a2FhNGJrc25k?=
 =?utf-8?B?azVHRVdCcTUxWDF3MDhoeEdRdGpTZ0tiSmdLRzI5Z1ZDVEFndytML3Vwc0pp?=
 =?utf-8?B?QVF3MHhJMXZXQUVCVHoyRE0xU3FQTlRrd0VEVFRMODZIVVFHdUR3Z0lmejI4?=
 =?utf-8?B?V05HVTZiNjZpNy9XclJKVHgvZ1FXMnUzd3F3RzhORjh3TURmam9zZ2NFUDIy?=
 =?utf-8?B?bXp6cHBFNGZRNHVWWk8rYVd5MkpQUmt5eDNmSE5vMzA5Y29XRGE2RVl0Q1R1?=
 =?utf-8?B?UzlqVzVNZHI1V0RSNWh1aVRFdmZJQzZnNTAwbGphYlJhampMUjUwWlg2UDZZ?=
 =?utf-8?B?cHg3anBkWnJFdTRPZVQ1cGNaT3lwaTN1UC9iZ0FTYlB2czJZNWJkVFNHOUVH?=
 =?utf-8?B?VVlGQnR2d3pSK0g3S2U5RDRBcXpJR3loTGgxZlhaRm1UUDRmY01kMkNnUU9Z?=
 =?utf-8?B?ZUx0V2RRaUsvRmtHWmY3anJmZ3hvbkpaNENjR0RPMHFYOFBkK0lURkwzT1c4?=
 =?utf-8?B?Rm12YXh0SUw5c0tXTnZVT0ZGRHpOMGpHbW5ZeEpZQWZ1UG5raTg5MTNJa3Br?=
 =?utf-8?B?a1Z6RDY2QmY5am5XVml5U0UwNkE3QUo3WnlGRmc1cTA2T243b3VsR2dHSkJx?=
 =?utf-8?B?VG5wQUNWUmF5djBhb3VxeWR6bHFvL0l5SWNmWm1WWUZ0dXk3L0J3SGFKb0RT?=
 =?utf-8?B?VEtwMmlEUGlSSGVaall0YzczYlRGbGtEMk1YdWhJSTcyZ25EQ1ZqWHU2SGRa?=
 =?utf-8?B?eTZiUXQzL0RhbkZkVWZ4R1ZOcDdGYTdyQ0JjQVRnMTJvN25SdGErLytBa1oz?=
 =?utf-8?B?L1FWdDB4V3o3RHY0akNmbDlzRmZ0cTRNSzd1Z2VCY1lXcklWT1hZN1BWZFZF?=
 =?utf-8?B?WG1UbG9MODcwa3NTSndxeWtsd084NTcwQ3VSZW9LQjAyWXZRNnRJZDRUOWhF?=
 =?utf-8?B?dmtTZzcyT3U5dVpYL3E0Uktqd2JDV1p1L3JSOWxOUkFqeXJtVVE3ejJob2Vk?=
 =?utf-8?B?NmJPTUFwWHl6ZCtoaG5yZmh6Um9ORElWeHVuc1RUblh3VUdyQ3RqLzU1RFl6?=
 =?utf-8?B?eTB6Nm05bEZLNlE3MUdQcTFLcnY1d1dYVE9sS25OaWhISC8xR0NZbmtyaENu?=
 =?utf-8?B?d2hzNSszVS9Ya0x4VW1rZEhqcEU3SE9aenE2QXVVVkdvUnN5U3lBR1VLV1Ju?=
 =?utf-8?B?dFY0L2s0ZWZyaG1VTWtrQm1KUnl1dVFOR2hyQlRWTnlVci9hdklVMUdKSzNT?=
 =?utf-8?B?TXZrRmxzQzdZcEFpSVhkYndjZ1o4M1VTaGNnZFNXOG92RnFLZFRoRkRTZnF4?=
 =?utf-8?B?WUFpalBIR09kRWQ4Z2h6MzNmMm5lYkZJdG85OTVncGc4YStvbmhGMWttTHo4?=
 =?utf-8?B?c3RBR08xZzVWbE1JaTN5OHJTNXVLMFZHMzlWZGJvZDl5N1pmWngzTWxiVFNi?=
 =?utf-8?B?WExYZ1QyaVZCQnNsTDNIaVRRaU1vQUIycVVITWVmeTBvMUpWTHBKQjlMWmIv?=
 =?utf-8?B?UmJnbEtmK0d1a1hDMkRQWk42bmRkbkNzZjQ5Q0FoeFcxWXBCcGlUMStaT0di?=
 =?utf-8?B?YWpJWGViT2RIUjRKcUhYZVJuWENOaUNFSHZiZFBSQ005clR5OGRQays3QUZm?=
 =?utf-8?B?dUxKTUhDbUhuOFh1TFFER3VqM1lXbDdQUy8wQm85MEJHVThtWDd1N3JSQWFZ?=
 =?utf-8?B?OVZTMmVvMEIwdE80dzZQUkdOdFNSRGhUK2M0RzdDSVk2dENtb2o0LzJ3R1h5?=
 =?utf-8?B?ZmtZWjdNaFRUZDhyZlVQOVorQTNQdkRlaFlUUTZ5Nmh4MkJQc0ZqUnFsNVJi?=
 =?utf-8?B?SjZSbVpRYlNENXhEV2tNdnZveUt2UXNScWNoajV3cEZ2cUwwM0lOWW81V3Uw?=
 =?utf-8?B?WTlIS3poSElOa3A4RzJ3WDZwWTd6enFoOUhsUjNlU2pjMmEvdFEvYW1taTlM?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2863ee74-185d-4bac-87e4-08de39064134
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:40:16.1749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvpR0VmjS336b5CaDL9xTNaYv+Gre6E5kS5170C1gmfboEpqi6fhkiVafZdx8XPKK7YpFn6v0TCO24PPqckJ3sCIAkYvZw3XyKrHLR7KYGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9419
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

this is PF only patch, so

	drm/xe/pf:

On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Under a new subfolder, an entry is created for each group to list the
> engines assigned to them. We create enough entries for each possible
> group, with the disabled groups just returning an empty list.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---> v2: drop subfolders, always register debugfs for all groups (Michal)
> v3: store the group id as uintptr_t (Michal)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 66 +++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 8ac5e0e01e36..c09a89c69fad 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -163,6 +163,10 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>   *          :   ├── tile0
>   *              :   ├── gt0
>   *                  :   ├── sched_groups_mode
> + *                      ├── sched_groups
> + *                      :   ├── group0
> + *                          :
> + *                          └── groupN
>   */
>  
>  static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
> @@ -254,8 +258,56 @@ static const struct file_operations sched_groups_fops = {
>  	.release = single_release,
>  };
>  
> +static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
> +					size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct xe_gt *gt = extract_gt(dent->d_parent->d_parent);
> +	struct xe_gt_sriov_scheduler_groups *info = &gt->sriov.pf.policy.guc.sched_groups;
> +	struct guc_sched_group *groups = info->modes[info->current_mode].groups;
> +	u32 num_groups = info->modes[info->current_mode].num_groups;
> +	unsigned int group = (uintptr_t)extract_priv(dent);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	char engines[128];
> +
> +	engines[0] = '\0';
> +
> +	/* If there are no groups it means that all the engines are in group 0 */

nit: this comment is more related to the 'else' below

> +	if (group < num_groups) {
> +		for_each_hw_engine(hwe, gt, id) {
> +			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +			u32 mask = groups[group].engines[guc_class];
> +
> +			if (mask & BIT(hwe->logical_instance)) {
> +				strlcat(engines, hwe->name, sizeof(engines));
> +				strlcat(engines, " ", sizeof(engines));
> +			}
> +		}
> +		strlcat(engines, "\n", sizeof(engines));
> +	} else if (group == 0) {

I'm still not convinced that we should list all engines in group0,
even if this is what GuC uses internally, as from the ABI POV,
and from the data you have in your groups structs,
this group is still unpopulated, and mode says it is 'disabled'

IMO on debugfs we should rather focus on exposing data we maintain in the driver,
without going into detail how firmware implementation might use it

so with this "default" group0 removed and nits fixed,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +		for_each_hw_engine(hwe, gt, id) {
> +			strlcat(engines, hwe->name, sizeof(engines));
> +			strlcat(engines, " ", sizeof(engines));
> +		}
> +		strlcat(engines, "\n", sizeof(engines));
> +	}
> +
> +	return simple_read_from_buffer(buf, count, ppos, engines, strlen(engines));
> +}
> +
> +static const struct file_operations sched_group_engines_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.read = sched_group_engines_read,
> +	.llseek = default_llseek,
> +};
> +
>  static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>  {
> +	struct dentry *groups;
> +	u8 group;
> +
>  	xe_gt_assert(gt, gt == extract_gt(parent));
>  	xe_gt_assert(gt, PFID == extract_vfid(parent));
>  
> @@ -268,11 +320,25 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>  	 * We should rework the flow so that debugfs is registered after the
>  	 * policy init, so that we check if there are valid groups before
>  	 * adding the debugfs files.
> +	 * Similarly, instead of using GUC_MAX_SCHED_GROUPS we could use
> +	 * gt->sriov.pf.policy.guc.sched_groups.max_number_of_groups.
>  	 */
>  	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>  		return;
>  
>  	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
> +
> +	groups = debugfs_create_dir("sched_groups", parent);
> +	if (IS_ERR(groups))
> +		return;
> +
> +	for (group = 0; group < GUC_MAX_SCHED_GROUPS; group++) {
> +		char name[10];
> +
> +		snprintf(name, sizeof(name), "group%u", group);
> +		debugfs_create_file(name, 0644, groups, (void *)(uintptr_t)group,
> +				    &sched_group_engines_fops);
> +	}
>  }
>  
>  /*

