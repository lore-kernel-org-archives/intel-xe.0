Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73555CF34C1
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 20:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199E10E24F;
	Thu,  3 Oct 2024 20:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6wXl2VZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAE610E24F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727987291; x=1759523291;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=MIKHOQVOUQZ+ReruAxKq2feqtlps64QHknw5huy5l0Y=;
 b=J6wXl2VZdUY34I3mHGIP4mIC+8y5Vl15E5Edwv6FHPGoHdiR1IdI8HIr
 LgS4gLNGoVAGYt+EYt9R4RHh0W0QqsLWqz7UFH1qorkbO0AhhTmdzfwta
 HjwBWv4KzA4bx64WzMx4+LnaCy6/tZ3FKnUghS5yrSTSziuohoyg635bG
 55+MhBqlAxgk1EAU128FloKrfl/KPSjN5a+l5ZJmcmfp68xgNqgNPmGyL
 Y6dv1Aa24xqoOGwVVRk9mINklJsYQGVALiB27OsLOcKUniKzvB48XmAxG
 9Lfa+4Kjwb2NFzN/7CiSA4azxL8ybrSNFiSYQM+Z5cr9CEnXEigovvFC/ Q==;
X-CSE-ConnectionGUID: BF9xnfhbRnmngjzpvK1YbA==
X-CSE-MsgGUID: P6r/OKkCQjuaQqhT8lnknQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14820899"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="14820899"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 13:28:11 -0700
X-CSE-ConnectionGUID: mPLHtwWCTN66bmpnwDtFUQ==
X-CSE-MsgGUID: mfpZqTlUToam+XYpsF9Icg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74311612"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 13:28:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 13:28:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 13:28:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 13:28:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 13:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/N6eFCZ60On/LYXWAsUfT3RP/TUMBlxBEdLxgJDzs/7fcXmMU+QmCyyYRWfXkhn52+6yyIaILaqakYuuQRNj4rw1FUotMaNtYwaJCfx4IFpCQY9+ipYqmxL+zfM7EWyizUuBm9Rl8jEBo3MCzof51P2T83urlTXN8mf5qnHiHgSqdWm0rGmIyBf5uOOwBbdPDh0cXlsH77PGdixEG+Zy4XHOT5god+t0rIvT4fvpHRg/8jnloPcC9MU/RKcmuEiqbBn97tWs/Kpo+vCdxbeu3PoigsbB2Sv0yy81Ngy/w9wVEv6k7HAKrGPhBo9NUzKM1Kxn4VVwN01A7OjNlNFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMIPaj1mQvcy7xCJ6A8O7C3jPMjO43KFLWd5gugtsiY=;
 b=u6eLwCSJ+gI5FTWXxvVRNws8KOTLe9yrAJ+UeTy47HFnBuHaWTH6Qv0lBMD4ZnXusEFi+3It/AyFPfN1DZZdCq4ebf2h43JDIVkpnDoG7vOl6SWdY/v2gQgfCeYBRIspAE5PZq9ss2CQMF8kBY5r8fHoEIaGRAKSXnFV95rCTtRZNh/XZtreXvLEB9lW3ve8YS9iPiCFZwllq/gL06h5zMTppBaywzlbPKdc62WpvhHvZKeA2ERYrvUjUsVfIR1s5+73dU3GEMDEXQL5ePYbyjFappFssXMEzYXWeLWfKQ6UqKIot/cErdyti+ZQl9UkzmNPR9zAjwl+gPwXuhzDRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB8011.namprd11.prod.outlook.com (2603:10b6:510:24a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:28:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 20:28:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241002230620.1249258-2-matthew.d.roper@intel.com>
References: <20241002230620.1249258-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Make wedged_mode debugfs writable
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 3 Oct 2024 17:27:35 -0300
Message-ID: <172798725577.181352.17815957512474383729@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:303:b6::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 6607f2a5-2f47-4b83-e74b-08dce3e9e493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlBUNVFyMktEUG5jMjBab2VxbEgwKzVvcDZMSDZQUk4yL0tqc0pKUlJnQkRm?=
 =?utf-8?B?SmFWUHRGK1crN3lsTWlPOTNYK3VQc3Urc1BvWXN4eEFYTURWVElGZE5wSG5U?=
 =?utf-8?B?VmVSTEp1RVZKa2lnZHVaMERPdkNuMUMrUllNZFZia2Rtb3Q4YkRIN1M0cDlT?=
 =?utf-8?B?QmdUM0FPZ3J5aUpPbkhDbmJiNzluT0RtSXEzRDM3UEFFWUdaa0haR254SHlR?=
 =?utf-8?B?bGNWRGE4RmhpVHd2ekpDajZoNDNHVkdmZUN1Q04vaXN0RDVwTXpBRmV3Wjg2?=
 =?utf-8?B?ZU96ZDV0T0UwY0J0NG5yMmMzbEpuQUR5emM2YjVSaTNVM3QwZk9kei91VFJz?=
 =?utf-8?B?TUVlbWFFRUtZWGs3UjNRU3AzbGdWWUlPcnM3WTZYdzNSUHR1d0RkOFBZWjdZ?=
 =?utf-8?B?Y3VZQ2tzeWpUZzJHbzFqUnpwRnlkSEpLMlN3UnZnZkVmU1VneFR4aVQwQU8x?=
 =?utf-8?B?OUhENUFEeHBaUlNXeGhFbmFhVkJTQk16Q1pRSmhrL2oxemdrcGxkM3lYZ2pB?=
 =?utf-8?B?Ujl5Ymh5SklaeEdOTThSM1FuOFdLUDQyeFNQZWlBdDB0M29ZT3VmbUk3WXQz?=
 =?utf-8?B?UVc4a3k1NGtwTkhRdDhXdGRxRDFhSmVWUmQzL2N0Tm9PTXpYTE9zNVh3ajhN?=
 =?utf-8?B?NGhaZjZlRkpWai94KzBnbDc1aE8wYVRINWRaeUhEdjNDYm0xL3lTcWtMYUI4?=
 =?utf-8?B?QVRBVFdwZEpmWTB3OUk3ZEVMMGF2S1FPVk40Q3FUald2cURvYWFtVXMvR0Y4?=
 =?utf-8?B?NkQ3WWtIOXA3bGVTQURlZFdyN1ZrQlFBWDREc2lCcC9zYmVTVG43Z3prVi82?=
 =?utf-8?B?aG5VcUp5ZTA5WGJFSEh0R3BQVUdpbW9wUjBqa2ZGMURDRDF6eDFkcytIdkZa?=
 =?utf-8?B?aHdVS1lodmI5NVJGeS9OVkFIeTI5NXJPYjYxaktaUEpMZnZmaXEwdnJLRmlD?=
 =?utf-8?B?MjFnY1FiWnNzL09DT2VXd0F2ZFA0eFJtTlU4RHlrMSsrVWtMbmdBZEo4M0o2?=
 =?utf-8?B?WTk0QWovcFZCU2t5QkNQOU8zYjRBVFVyNWpIUzZLallGdTZqazFQZ1FQdHU0?=
 =?utf-8?B?VGJNcEllR212RFhsNEZBdTdVNW9rRmJOUVVVQlAxTzF3OGc4TTNRVk8wQXd3?=
 =?utf-8?B?R0oyM2w5UzI2Z1dYeStSQjFzV3F6OE1hNVRMRFlJRFVBNWdoUXZOdXZMdTdJ?=
 =?utf-8?B?YWZmV0xDRzlDdTFJbGREWEVIMXFMcmFKdFp3dUx5UTJYTjRXU244dXMzS3NH?=
 =?utf-8?B?WDVENFN6RkIrYS9nV09CRXBtK2ViWVFSNXVxS2tWa0QzazQ4QUN1cjNMaFlX?=
 =?utf-8?B?TjN0cDVmbVJrWnN5ZkJyYjE2V0c0QUwzMGRhb0FDamxISkhtS1ZDdjdqa1ZM?=
 =?utf-8?B?QXZRSXJ4RnZmSnl0VlRSYXcvZzQvMDBnR3UxSzhWbmR4M3htSEptdGJoVE50?=
 =?utf-8?B?RzBteGpwR1ZQSTJoZktJdERGQ1hZVnRPdmV2VW9UQWthWG1sSDNUR3lBelhj?=
 =?utf-8?B?T3l6eXhjUVEwc1BFMHlkbmtPelFNcjF5TXI5U1pLaDdqL3EvTkpPank4ZXdL?=
 =?utf-8?B?K0dqeDQ2dkRLVHRxWXF6c0NWMUJIZkNHRzJVSnJrc3hpM1BFRUdIS1czbUc4?=
 =?utf-8?B?V243VzZkZE5EK1JaTzJqN1V3cC94cHFKWjBEanNLaytEVDBROGNDZXhYcERD?=
 =?utf-8?B?MWdzYnlzWFJXTUl0QTBiMkxNODNPemx2anF3YTQycm85VGhFVGhpckV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJHRDA2a21HTmZ3L0xPcGJ0UnNlajBsMkRMVmZqSExmYlhPUE1ybjAwaUxr?=
 =?utf-8?B?YXlQUHlBWGY0bGpMaTJEL3FCT3ZhNnB5LytmU3ZBZi9vVXZyQWEvN2tXS1dm?=
 =?utf-8?B?ZTcwYmM5ZmxoeHFMSkM4S2o4T3NzV0ZUMy9OejJYUU5OUkZwUlM2VUJZclVN?=
 =?utf-8?B?Q3VIRFNEUGRnUkJHSkJiSEsxMjBzY1Z4WGc2ck1CVGhQRjlxWU9sWjl1YUJz?=
 =?utf-8?B?WDduSndITGpvbFVWUko4UE5KRTFpNkV0QXord3dzN1NBcEIzWUJwcUhQeXYx?=
 =?utf-8?B?bklRampwbFZRMVE2anI3Tk1zVDZTSDV1aDJ6YnBFT2JROU5rb3BXVmRJMzIv?=
 =?utf-8?B?YkxpU1JmQ3RmZXNoenpENXVEY1Q1TE5KRFdvWlZtYWc0TVJJZ2tIVmFVbUo2?=
 =?utf-8?B?VXhYZTYvZzF0N3VFR1JUcldFb1BEdzJWeXUxaWUvd3RLQldheGJzaHNkSGkw?=
 =?utf-8?B?ckN2ME04cjI2ZEdscTBzL3BBeEEvRVBSM2pQOHRpN3R1TnBMampzNUtuVkVD?=
 =?utf-8?B?am5sZzAyMWs5NnkwT2M0YTBTYzFFRDM0UTg0VVRnZUdSMTdLMFRvUWVSajR3?=
 =?utf-8?B?WXZSdHoxMnR2U1hCZFQ0dTNScThKUHp1QUFCL2N3T2NVbGNkL09lLzRvM2Nv?=
 =?utf-8?B?MmpUdDRiS2JFTHQyYzVYaUxyS3hoRkJON3dCc1ZHaTV1OEpVeGJPMlRNKy96?=
 =?utf-8?B?MTRTNGUrL3ZaaElCMFdFV2FWS1BzMTljclV3MzhXRWphczJqQzI0ODJ4UEE1?=
 =?utf-8?B?cVRrNW1ONm80S3AxNEFKazBtM2p1UE9uMS8xdHJ3ZThkSjlLdE1IVUM0MDlM?=
 =?utf-8?B?T1M1eEZ0emlxdUFQcXprUC9weEhHbk1DcFdvOFdaNTJ2cjZiQTVxMVZtNmtr?=
 =?utf-8?B?dkR4Z00rWXF2VktzNUlRK0FZbVpUeFFSa2MrMVdHQW5kYnhuUkw3TDdFMEhD?=
 =?utf-8?B?SC90WUV1bDdoY3J6UDZmN1dYL1lQbHpuUXREUW1kaVlsdDFQMlZkUjduRk0w?=
 =?utf-8?B?MHV3Vlk1Q2MwWDhiZEZpajRZVVpmNmgzS2IwNWtNRnF6d1d6dVlFcUpyQzRV?=
 =?utf-8?B?U2ZRSkFLc09wbDhCbFFGWDRNbEI5TlZIR1NidC81aWJpbDZ4bFFmOHc2aW9j?=
 =?utf-8?B?aHlBV1R4M3RsanhQdkJTSll2OEVscjExUVg2d0lrS3diUU5idFk4WU5OUEo1?=
 =?utf-8?B?aDgyaWlqQWl3UVNHWjJZdVM0VWNCbUIvRE9DMFcwa0RaZE4rUzdha0NKMFdS?=
 =?utf-8?B?elJZcTZESjB4N2pnQkdhZXBWWkR1MG00YlJjNGdPbXAxcGRWYm05TXBja05z?=
 =?utf-8?B?KzVPOW5ZY2xiSnRyajB4S1FiMFloYm9WbHlFUWFKRjZaRmQ4bHJDcnhHczUw?=
 =?utf-8?B?dGhTUWVRRUo1ODhTQ1JWdUU2NXl0S2dLeDQ4VTFIZ1p2T3RPWDdGckE0Z2N2?=
 =?utf-8?B?UWUrMmlyYVpmVXpZeUZkc2FzZU5mNHh5Z09KYW9WeDJPeC8xdzkraFNHL0JQ?=
 =?utf-8?B?MXAwSWZCNzBZWk1DNU9ucXFwcThQSGNFRU03Mk5RTk5SU1FiK1I2emExSmUy?=
 =?utf-8?B?aHE1SGJxY0tra1pLWjYrVVJOZ1BCdXVDVlMzNG9zUytzSkE2eUdqUDVBelo2?=
 =?utf-8?B?WHZXazRYVmxiZmJ3TkFQVGkwQnp3Mk9VUEZzaUxQYkovUmhoV1FIVFhOc2gx?=
 =?utf-8?B?eHpTeGp4RC81S29IUFZ3MlJBU1p2a0pWYzVRbFd3aTN6TUtQM0tPVmZ4RGZm?=
 =?utf-8?B?cG1tcjd4c1dmWVg3WkRJMnhjdHpGdE0yOC96VklKeVh0UkhNQ04wUWlYLzVN?=
 =?utf-8?B?TGVCRGxiVlRScVl5SmpSTUg1bCtWVVVFL0tQcFF0eEZsT1QrMDd0WmRmTS9w?=
 =?utf-8?B?VXJYTlZvVGJQcjBCQ0FVTXhicGdTOXNRZkxGSG01NkpPWjZJUG5tWDZBay9y?=
 =?utf-8?B?RFp1U2N3dXM3enpwWm5PQk51MWttTGhEd1RUTmdBZjdHRnJhU3Z1Mno2aTNu?=
 =?utf-8?B?akhuS1daVGwzKzc3VlhoUlhrZXg5dkhmaUZpeTNBZkNSb3RUcDA5ay96K1V4?=
 =?utf-8?B?dkd4allkU2lpMlVLT1pzMUVUbUtWcUMvZm9xVllkU2x6WmNOMHMzMmZSY1Uv?=
 =?utf-8?B?c1A4WnM3a0VoUVA3WU8rOS9EOGJuejMrVklXWGgvVnpFUWNicUh4dnl6aWdt?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6607f2a5-2f47-4b83-e74b-08dce3e9e493
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:28:08.3027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOmTo6Wmt7svNcGqjvj+5KyK9mgrh6ALS7PVyicnFVwDUWEmi4nZPE+x/LvFLwyWaYzj0sF3OBLRZLP2RvO63w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8011
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

Quoting Matt Roper (2024-10-02 20:06:21-03:00)
>The intent of this debugfs entry is to allow modification of wedging
>behavior, either from IGT tests or during manual debug; it should be
>marked as writable to properly reflect this.  In practice this hasn't
>caused a problem because we always access wedged_mode as root, which
>ignores file permissions, but it's still misleading to have the entry
>incorrectly marked as RO.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debug=
fs.c
>index 668615c6b172..fe4319eb13fd 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -187,7 +187,7 @@ void xe_debugfs_register(struct xe_device *xe)
>         debugfs_create_file("forcewake_all", 0400, root, xe,
>                             &forcewake_all_fops);
>=20
>-        debugfs_create_file("wedged_mode", 0400, root, xe,
>+        debugfs_create_file("wedged_mode", 0600, root, xe,
>                             &wedged_mode_fops);
>=20
>         for (mem_type =3D XE_PL_VRAM0; mem_type <=3D XE_PL_VRAM1; ++mem_t=
ype) {
>--=20
>2.46.2
>
