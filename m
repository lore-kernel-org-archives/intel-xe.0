Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE0DC71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 10:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ED710EB41;
	Fri, 20 Jun 2025 10:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZ25doo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB3310EB41
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 10:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750415901; x=1781951901;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fjrjN0s0NmHtP3l/GAGQFJCvxsM5NY6uooeQ3D93e7c=;
 b=fZ25doo//E8F2qz1XisE+dI+GKGrXk0qAw4N9Ama4AoXz1mBjCCuQy2z
 Qhg1nLH1sPk8XR0meuPaEiirdzWNCro/+50ThdQTw7FOFblSdjF+ZMylx
 NYfWkfrpg0ugr/ztY8KLg8JtgZoOfvuWZH4g6u4zZDIF9DZj5tgAskFbs
 YTvD7RYYJz45+7zpFVfw6Ay5xIQg2piqppOlmM2jMlKF1WKC3wRbBfN2b
 /+yJ2Lw0KpSIeHn8qCXq8YBcd7tKZqrHXxSdkH0MdIL61JRtWnVDJ6Q7G
 H6JxcRlk3Wk7eAwh06bd4xaSH0pncO+Kz2OVRx6AnlPXQv4azpzckJI8c A==;
X-CSE-ConnectionGUID: qVcQFipuQ42ZGXrUAs1woQ==
X-CSE-MsgGUID: q4L43TsLQbWEz8dnMyE1Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63726586"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="63726586"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 03:38:20 -0700
X-CSE-ConnectionGUID: LVQn8P1BRNGRNIRBoqbPFQ==
X-CSE-MsgGUID: jLRRMatKR6Sz2DEtzgC2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="150474699"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 03:38:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 03:38:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 03:38:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 03:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRjcLE/eE5Gf4rIhp+SAEosFnUq8OxkaAJraF+Y1EgzPB6NbHlJ+caHKIcjb6mRRrLV7qt54Qz9JhMr+8HaoP9/eTa4c0YwIzGyw4A2gxIv8EaIvWRqoKyrB4dyT5wYMt7psyOGYbJ3B5d+GQO9amVnM8dWRBTSgKlyx9Y6AGdksfFtJR9lPlU6RKNYVon/fhxLt18Pwh2lOK06YjD47TuKylpNITCTOOKI2Yn6pk7aNPqUSg5LZ75//wnRpE6ra3wd/Ej9B4DgQf+VJ6SNUkC0RP338/rOQFnOQeA5Kf7AmLH/aaj/tUpvrZA1XQz7bcFAd3cKeTisJP3o4PPShMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuoYRK36pf4qr5VqQMZ3K+en7ASWHa7v1kFNKoZ2VSQ=;
 b=vPWbm25GsCotJzR86oprBzgOae/TuEksjg08KkCjSFoaZmLEbfhUmmzVBHamtNgxM4gCdDdq+rLPP//8DLtYc/FJKdZ/VAyfzBJjLwyZm4CsREBSTHBl9vci6O7c3FXBKdKGmp+CnWD5cuesuqcHNDfQxs9wsEasRTPcl/JUsC6WAq9oa+wgwvTsT2sd4flZmqWH706sAKbyMf6RUTfp0ptc7oz+0uo4DGHDJaIiWpcpP6wPhbL+WziADao8lukNBxgKyiocW5r13PIr15mzNXSm85UMeBNN38U9h+iflbfqSwXHKcNwjrsfAMgWT8b5uqW1Gt2JbNGA7fBMfUa+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 10:38:11 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 10:38:11 +0000
Message-ID: <9c6f2c57-fa69-4bbb-b887-5e02aef15208@intel.com>
Date: Fri, 20 Jun 2025 16:08:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ptl: Apply Wa_16026007364
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <karthik.poosa@intel.com>,
 <riana.tauro@intel.com>
References: <20250619133413.107423-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250619133413.107423-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 2507307a-0681-4c19-6b7c-08ddafe68da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0g2UXl0MUVmS1ZzQnpMWGVCd1pMYUN5M3A2R1E1V3V0OGVLUHEvaFdQV1g2?=
 =?utf-8?B?OVF5Y0QyTjBZenBKZFpRdTJzTlZMZFhpS2N0S3p4TzRzQjloZHBVSG1MSFg2?=
 =?utf-8?B?Rkg5UUFIc1NVcmlXajYxV0c3TVJTaDc4TmZuRE9jak91MjlOaDJXcGJORXN4?=
 =?utf-8?B?UVpubkhMZysyWmI0VDVrV0RZcVFBRkFYQWVLek13NU9SMWsxbGRMNk4wNC9R?=
 =?utf-8?B?VzMySTFOQjRLd2V0MTZKWml2U1BHdmVMT2F5eWRPTUt2UCtOS2xoVDcrdDVl?=
 =?utf-8?B?VE5MdGZrRU5YZitxbzNnOTRXd3ZEYVBaMjdsRDdmOFV0bUV3eVYwdGpQVE5j?=
 =?utf-8?B?b2ZUdTQ1SDZEQTJZQlc0eTZYbVV4Y1Z1RTY1WEg2cXR2LzdZVkQySGtKc3gz?=
 =?utf-8?B?c29FMGlBS3A2VzFtbTd4QjRxSlhJTGZka3dBdkNaKzJoVUZteFEyNWF2OWhv?=
 =?utf-8?B?RXdWZWd1K0V5K3k3RWNzSXJZZWptdGlkS1BaT2ZWOFM1Z2V6UU92S0VTL3ZR?=
 =?utf-8?B?QSs1cU5lK2NPVnJhckx0T1RGZXN5MUkrRVFWdlhhZmMyY1NaRDZaQUJYcmtP?=
 =?utf-8?B?ZFVNZnJuazdCUmRkd1ZHcVB5MTg1SEpLb1hmMkxiNmZNazRoYnhGbllYWXpn?=
 =?utf-8?B?MHhsTWFTVzB1a0ZqSE9oWTVSUnpMUk5Ldjh6LzM0cUgrYVQ3WGlNM1ZEUEdQ?=
 =?utf-8?B?ejltUFJqd1FPSzNsSkNXNFBaa3lRQ2xnN1MrTUU1Z2RjWXpFTTRKZUYvWHBI?=
 =?utf-8?B?T2ZIRU5KYVE4SzlvcTc4WDk4anRPRFNoZkJEQU5rWEdWOTdBSk9LTU56VXhI?=
 =?utf-8?B?TGFGWW5QSmNIV0xRLyt6YWRqc1VCelpJbVFhNDNSOGJreUxpdEVWekJpa1k5?=
 =?utf-8?B?alE5UTUrUnR4OWEyU2hGMFN2NnFFcE1jTlpSZlpzeG1yQjhFWnl3WGZMcG9F?=
 =?utf-8?B?RnlWVllsRHVObWh0MVpuTlVRUjFvQTR2SHJTZm9hYU1RUWllcWs1L1lKTEhI?=
 =?utf-8?B?d0QwT3NYSG9ZK3ZxYlMxN3AwY0ppbHB5VzNncXlWamJ4dzYydmROOWxWTzR1?=
 =?utf-8?B?RURFcG44L3hva3BaOG5PRXo0dXBNK2I1T3MraS9icWtkajg2d05aY2xPSk9n?=
 =?utf-8?B?ZDBRK1Q4dmpYSlh2VXJ6OVY2dnVCM0l2OEh3cVVzUE1iMVdCN3NSajhSQWow?=
 =?utf-8?B?emF5eXowODI5ak5qeDhqOTl4NW1SaG50Mm5tditOTlhtNUV5S01tYVpCekdo?=
 =?utf-8?B?cmhGa3BzRUl5MVVtRXlSVGRHRWx4SVFmd3JWWHJjWXJNbkRocXBQSmZJOUVo?=
 =?utf-8?B?L0E4Z3laaTdqYVNkSnUzcGUraFdYOWhDbFViaCsya1BTZllldXFjN1RDckNw?=
 =?utf-8?B?T1g5a1VjdGs5Y2hqdStPODN6VHhNZnBibXlrcFlHUDhtWmQzaEY5Ri9NMVc4?=
 =?utf-8?B?YkI1TWp0bmlSano5QXQ5L0Y4dUVGWTBCakJkUGVuT3RGMERsZkpKZHBOdkVa?=
 =?utf-8?B?V0NQN1NnS0g5WUMrdTA5NytiQUNXTHRxTjYzVVJYRjVxa0VGQ2ZTTXd1QnRu?=
 =?utf-8?B?Y0VkSjRrcDc1QVlmMW5MN3ZFRzdCYndNM0cvenNxbHQ2dkhobUNtQ09PeWls?=
 =?utf-8?B?SmdreWJMc09mYjUyaUxvLzNGZVpaQlBuNnhFMFE0QXB5KzlQNWN6Wm56bElP?=
 =?utf-8?B?OVh5UTArZ1c5ZEJEdXZRQzc3SzNXQzlYR1NLVXlJWE8ydEF6SEpvTnRORVRX?=
 =?utf-8?B?QVpmL2RlVzV4WFNQQVBVUzBPSWNpYWQ0N1FoZmM2NmlzNUdJQjIxM1VKYmwv?=
 =?utf-8?B?TlVEUDVBbndNK2lReTF1QmF4b01GakJlb2lmcjhKSE9oVGNuSXNWdDZZRjNo?=
 =?utf-8?B?V2RDK0R3SU1xOFN6NmtBajI0WWdQNlNMdEFOb0dIa2RjMlFacGNuTWwwK1BF?=
 =?utf-8?Q?FK60XBdh/cA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWUvUGl2ZllaaHpNNnR2SjZ1ZnhGR052bkdFVGNtaHB0R0VBa0N2M00rTGpq?=
 =?utf-8?B?TUMvbDlIQldFRy9tNUtuVGxsYjVnSWZybUh1bnpTZ1R1VlR5WmZuS1BlWUQy?=
 =?utf-8?B?cFRoSjVHYkx2anJKdThYWldiVFFTVXU5V1BiT2FWK3orMHVwMWRKb0dwV2I3?=
 =?utf-8?B?ZjVGLzVhb2VEUnNsdE5xREhPY1orV3V1QkN2ejFpNW1KT1ArMUFZcjlsdTZW?=
 =?utf-8?B?VjkvSGJYaVlFRS92bHdtSE1XUkJkOXRLcHhLNVBmRGk1dzZJeHljSGpVdFBR?=
 =?utf-8?B?M1UxN1lJdm9IODNjWE1DbDNPaXFJTVhsZEt5aEVmTVBzVmpiMk9KRE9WQjBn?=
 =?utf-8?B?aTNEMjU3Z3UrdC9zcVlTc2UwdEVyV3pKejlBRVNIUnYrUzc5SUppTEZjK1Bt?=
 =?utf-8?B?amNCL1BrdjZpUk90YTlYNWNoa2pBa2RxM2szbnpZTk5lUnpZZUdIYW5GZ0dy?=
 =?utf-8?B?OUtXRzg2Zi9kVW1lT3h4NHBOK0VjMzBDVVl0N2cvSTJ6Y0tFblpUQWJnWCtP?=
 =?utf-8?B?M3I2ZmhXaFJ1ckp1cEhyYkRCQmJoRmsyMWk4UTJSeEdjMlF4azFoaDhtc2VX?=
 =?utf-8?B?L2gzM01BaHQ5T2Q3OXVqRHFGdC9zWGlBVENkeFRDRnp3alYyeW8vbW43cmtG?=
 =?utf-8?B?RW4vTnRhL2hTM0NqWkpIYlpLUVpsYm1vSit1cldUV1Vtc3dNRklLNDlwUzJz?=
 =?utf-8?B?WXFnemIzRC9wYitobktEZWVwRTJIUHNwdUNpMDRnN2RSVUZyVGgxeWorRHEw?=
 =?utf-8?B?N2hrQ1JHVlVKTm84Mko5aVpBbWp3MVdwSm1QamE4SHVOYTgwZXEyc3hYeENX?=
 =?utf-8?B?RFdJb0YrcEk2UjBhL3J4clh0UWgyUXk1eE9aL2tUQ0s3S0lnQ3dweU9nZnUz?=
 =?utf-8?B?WDJKUXl3dFlMdnN2MTJHY3E3QW0yQ3dpMkQ2Mk9JT1JKWnpUU1RLR2pWQmRB?=
 =?utf-8?B?VzZ5Y1prN2FGVm5KdnNTSmhaZmxGeStJc3htYVVwKzNENXczNVc2UWZtRjM5?=
 =?utf-8?B?Rm9vVWF3UGRZTlJWRUl1VGEwTXhodTZzMnluRDFlR2U4MmtBSkpQOXNLYlVn?=
 =?utf-8?B?UVVvU0d3dVBuTVpmSWgzdmNka3cyZFZhbnl5TzFyNyt2d2lwOENZMVowMW96?=
 =?utf-8?B?ZWNvbmxubldacmNJNEk3bHpSV21pS1ZzR3IxbGVJbkVZcHNzMXRRNGRXRFZE?=
 =?utf-8?B?ZkZpT3kzYXUrZlNUa1BtUmVwWWVDdjZpZXIvYm9UNms1amM3UkpaREU0UjE5?=
 =?utf-8?B?Q3ZBWFY0UVkrSW5kc1RUaGJwSEZRTlZOQytrcURURjJxQTZHMVVyMmdoSEUv?=
 =?utf-8?B?OVkwVUZXRlBpdUFzaVlSUjBHQStFcHI5Y3NvQ1dJcG5rbzRxZVBkbXB6Tk1m?=
 =?utf-8?B?K3FOWmlWVHR5bXVPdFpuaTJySEorN3doZ1JzTStCalFOdVgzOFNJTGFoMkVT?=
 =?utf-8?B?U3E3V3BOZ2dMNXMxMHBKaXgwLzd0MmtKUkgveGUzUW1qeVhvK1pxdnFzS2JG?=
 =?utf-8?B?YmJvc1NTYW5NVktseWkwN0RCU0VCak8ydHFSVnNqMUNvbFkwWUExOHd3UTg2?=
 =?utf-8?B?c3VSUWhDS2VMRTJLT2hXaFpzK1dlZUEwOHk4cVVUQk52YlpJNlR4eEVNUUlz?=
 =?utf-8?B?Ti9sNGd2MUZ3dHhSV3E5eVRkMmZRaW1LMDVPZHNhSkJYd21TM0Y0cXU3RzYr?=
 =?utf-8?B?RktPME9HU3lNUG5IVDBaVE5XRDJrSW00b3JLTUJwVDk0bkIrbHZMTDlROFM3?=
 =?utf-8?B?L3Q2ZjA4SkFQSGk3U09xcjZNcWp1NUpDU21haG9qT1g3VERPWFF1Z0ZZM1FQ?=
 =?utf-8?B?M0YxcnBXNEt4UnpKSGJLblFMQ2NiSVdkeko5ZExsOWVCMVBGcUVJZ2tkbG5y?=
 =?utf-8?B?M1BvNzAyZExoZXF3TFd3MW1PSG1kT1lQaE5lSnAvM1M5NldNYkpkZlM1L0Uw?=
 =?utf-8?B?T0hjTG8wKzJQYXVkd2lxTDd1S2J0YldOK1ExQm4rZ2ViVlNVRmNOVzdjQmNi?=
 =?utf-8?B?OXhER0V5TFBTdkQ4QjBPK2tFTWhuRWJQTzlJUmFxRHExZStQZnY4eTJpQVcx?=
 =?utf-8?B?YzVLSVo3K1JIMG8zTlJMclVjUFFFbzVJZHRmSERoTkhEaEZoV3ZIVGp3a1ly?=
 =?utf-8?B?aDJtUjNyWlI1akx5VVhQREtLeTB3TzVKdWFueXA0NFNXV0VaNm15M1VWZVRT?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2507307a-0681-4c19-6b7c-08ddafe68da9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 10:38:11.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOTWh9dOLV5zIlkzXO2RvCXX5E9TRMFpF6lYPd+q5RtSyRUCtoof2YIVlV/Ra8mgtDuakZ4Ruy15d9aosdKfSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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


On 19-06-2025 19:04, Sk Anirban wrote:
> From: sanirban <sk.anirban@intel.com>
>
> As part of this WA GuC will save and restore value of two XE3_Media
> control registers that were not included in the HW power context.
>
> v2:
>    - Update klv name (Badal)
>
> Signed-off-by: sanirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
>   3 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 7de8f827281f..e2583761a70d 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -368,6 +368,7 @@ enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
> +	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 07a027755627..f3c74f9a40c6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -382,6 +382,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
>   					&offset, &remain);
>   
> +	if (XE_WA(gt, 16026007364))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> +					&offset, &remain);
> +

Looks good to me.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 96cc33da0fb5..8c2aa48cb33a 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -70,3 +70,4 @@ no_media_l3	MEDIA_VERSION(3000)
>   # SoC workaround - currently applies to all platforms with the following
>   # primary GT GMDID
>   14022085890	GRAPHICS_VERSION(2001)
> +16026007364 	MEDIA_VERSION(3000)
