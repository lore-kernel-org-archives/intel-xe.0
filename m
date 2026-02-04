Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661BFEA7949
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 22:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D5710E17A;
	Wed,  4 Feb 2026 22:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwg4GF/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EB910E17A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 22:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770244822; x=1801780822;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OjI/dpiNVTf9qGihYk2OLxmQoROHKU/waaOgMEWMvaY=;
 b=jwg4GF/WPvAzxXrwz0LPeMbUrrISiU2Bck0ZnUM49GBfFB526URl+/sa
 vcjKm+5fMLhP+QiV+4NsPi0qVIv/KUDSfpJceGfs6MqkNEnBpTfNCv/Fa
 S4LI/99Y+xvCs+WA7Y8erzVNw8wF6kwDTG5tWjLlLHLDY00aVvOnOHEN6
 KwbtnIposCMvAv1WHURds5M8ljFGtE99Ks54Mr+MoW5ptAR/uCE7haojh
 QmMCqdgJO323RcyzB84aLlJyfjNzrGKIX+fubPZJ9xoWDBrbRGOkSyUxf
 lPFXyO48xIXJDAZPEbE/e7AGIu5osgPXS0MFg4Kj9Q7eHYhuIR4dprm6g g==;
X-CSE-ConnectionGUID: xPHAMzbQRQmNtVDe4UDDuA==
X-CSE-MsgGUID: 0tNcl3eRTsOsBpQpoUK/lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74045793"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="74045793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 14:40:21 -0800
X-CSE-ConnectionGUID: pknJ8jz8ToqoyjHpqJJ0mQ==
X-CSE-MsgGUID: MrLHRQCYRkGbyFvbabbxAA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 14:40:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 14:40:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 14:40:20 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 14:40:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftCJMPqusSa3ZbUuMzxqYF1GMVUPdjh6CqdnHr+ziCvTpLLzSgmH0Jr0jDsnhV9EPQxIme4rGXwefjqDMOUSqPrTC0awjL2G+sTnbr6/KaNKG6THQl/pCqvXitLtpcsJTIRtq7n8JSIhrAFg3gH00/iFSRUA0j8iY9cBphesQpzUXsKyP3OKh6Jlk3DzFZc0AJFQA/G9vygDPr3qipWdekB2yR2iarijk2nw7nUI+T23fJvfrASeTykI7Ykgaas547uKpnyhEG9HeTgZsC+Lpnx4s4NQc52YH9XXfIpq/ppPLCyeM1Y8fOQSjI7Ov5hUvkKR95PJZCmyeUx7m0oIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0CJtTLBiHPZ6vq+ZpHl2oplcXE4GDZh45gW4g2Yoaw=;
 b=ZbYInVU7+oogzH5DuxBI5fSVaqv0unSogXrnx6LYiSlBndDn9Zgr2cUOjKDb2zHOD5TkQvuvwYc5ssDanUS24CkXTf2iDU6pfB81NySu2TMgsa3leGqKGsnuEVr/lxsSZOInx/kFKut+IdF+IKyYHXieQSeK1lLOlzsFOVvq/yfr8krwuHauKoM/YWlmeYWGitpTNlVbHLLDNKR5iNNe8AKNwju9ScjM/d8X2RIUzKgNlGNAlGrlUg0YsVxETWo8ALeFs1GrGA09ATTS4+x8sVwHhiEm/QhcKlm0yodeCWNc5E67Ff4dhYRCt42SaKtyBN5BIKmDyY59gGb8agi0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 22:40:17 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 22:40:17 +0000
Message-ID: <f78dd7d4-2cf4-42be-94cf-fd8e4ce1491e@intel.com>
Date: Wed, 4 Feb 2026 14:40:15 -0800
User-Agent: Mozilla Thunderbird
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v7 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
References: <20260128022320.1054591-1-vinay.belgaumkar@intel.com>
 <20260128022320.1054591-2-vinay.belgaumkar@intel.com>
 <b677bcb0-7db6-4d87-9318-294e004b0167@intel.com>
Content-Language: en-US
In-Reply-To: <b677bcb0-7db6-4d87-9318-294e004b0167@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d0c0ce-a241-4c02-fce7-08de643e5ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG1zbmNKYlBIMlMwanhMdG0zT0Y0ckVQOGpaWHhDZkk5V0JNQTY2UVc1TGc4?=
 =?utf-8?B?L1gvTGxKRThRVU9LVmRXNjVYa3locnc0S2FIUkd4OHExTmF0S1V5cklOSEMy?=
 =?utf-8?B?YSsxTkVjZDFjd2dCUStxSmVSNG45cFpXRncyMVpMM09mUC9FdEtJdzdWR1o2?=
 =?utf-8?B?ejVrZlc0WFRIOFRGQ2w0cmxadE1KNk9nSm1hWCt0RDZZZjIzSEljSnppOHU1?=
 =?utf-8?B?MGVzMkttWkNZblBlVGwrTnYzazRyY085SWNMRE5SYUFEYzZ0bER3cHVJRDNv?=
 =?utf-8?B?T3MzeVEwRHdwMXJoa0dGVFNuZG5NU2hJb0lVZkJkb21sd3VERTQxSEViMGVy?=
 =?utf-8?B?a0tUYU40L29yUXZ1UlhPb0EzWG9QZ3BmaVBidUdzbG1kU2YwTlU2dk5ZSjNQ?=
 =?utf-8?B?aEhzWXlMYi9nYS9FV1NwSUc1NHdTNzR5R1J5ZlNwVXhGblc5VStTUzNWekZV?=
 =?utf-8?B?UUJHWjZBMFRNNERHUU9GckNHdEpzbGF4R3J5YTJ6TnRXWlgwNEJuTmVKNnpP?=
 =?utf-8?B?OVorR3pUSkdsOS8ydUY0QXNmbUI0WU1BdUFyV0Y1SExJS2VIeU9CUWp2ZFFR?=
 =?utf-8?B?dmtmbHFwcVNHdG4wRE1oWlhzVHVaY2xHNDkvYVVtVnBPYkw5Nzh6czM2ekFk?=
 =?utf-8?B?VHNyMHBLZzg5MktKUkNkdm1TWDhFM1ZDRU5kY0Z2TDhBSTVpQ21CZHdPSUdD?=
 =?utf-8?B?OVM2TVFnR2ZPS2wzdUFVUmVuMm1pSnN4WndKUVdidW9qbUUxVEFCQVA1em81?=
 =?utf-8?B?alFLdHc5UWRzdjhmRVQyWm1BNWZJZnkyekVkeWNhVWErMUlhYncxWG9pV2F0?=
 =?utf-8?B?YTN2dEZzVUFuNUoxQ2s5dG9nNVFsR1JzRXBhMm1iNk8rd0hnSXR1SFNHeWt6?=
 =?utf-8?B?UENLV2VGZ2U2OTQ3bnorT1RNSEU4eWtKWkw2Wmc3WDlqeFF6Vnhua2Y1Wi9H?=
 =?utf-8?B?ZVZ1bloyNDRvNFdpc3lmREp6QUZ2MGk1THp2VlBJUGdJdzlieUNxbW1XZkVl?=
 =?utf-8?B?R0Y2ZkUrTG1tVlAvVVZ3d2JUcForRU5UVDJTRm5ZbTBHek01dEtwWlk0OGFx?=
 =?utf-8?B?blRSTWp3NUhIL2N0T0huOVhIcmw5dHk2ZkNhNm1RSFFRcFpQMHJxMGlLQXlt?=
 =?utf-8?B?R05pNGwrSlg2MHZLUzIxV3hwelVOeDl4S3kvcnMxd2Y0Mmcwa1JnbHQ5S1RH?=
 =?utf-8?B?Zmtvd05idGdxSUJIUDNCSHdQelhxWkF5ZklLdm1CZHJMcGRORjlBcktKRDRl?=
 =?utf-8?B?UWx0Q1grSjBNOVQ2UkZ5VzdPcTYzTDZ5d01SclphM2tlQkgydmxIdFJYaW9Q?=
 =?utf-8?B?WUhxQVFZTE8xZU15U0VwYXFHWERQSEVCWk5PQjhUaHpVZjFDN1BGdXdMVXRh?=
 =?utf-8?B?SkIvL3M4MEwxb2lQNDA0N2p1TFdBL25NUkt2T3R1VnNuaVJVdFdUYW15SnZG?=
 =?utf-8?B?bjQrdTI3M2VTRHh2clNNWWJYZGNDMStMeUdsMU92QnJYQzJVbzhQWmN5Qk1N?=
 =?utf-8?B?TlV5anJkMFNEbTIycmFjVnpEUmRzL0dCWHc2eW9VbWVYMVMyTFJTT3IyMHJ5?=
 =?utf-8?B?WkxvaWxkaHJrRFRsME8veFd5SnUzSHMrOE0zcGJPcDhlQ29LemVIb2c1c2x6?=
 =?utf-8?B?S0IrNERNN0IrN3l3eGZPYmZnSHFLRlJ2Q0duc2YxNVZqejhKSEFXL0dmOWZG?=
 =?utf-8?B?YkFyTWIySFhFUU94RzVOY3ZFZEdBVmxKZ3VaV0YySnNZL253MEdBa0c3WWRY?=
 =?utf-8?B?YmpUVG5GRWpnV3ZISjd3NWc5L3M3Q2pkZW0xOXVPYm4vMXdRWkVDN0YzL2Q0?=
 =?utf-8?B?SWw5T2dLUk1IeDRUYWFKamFxN0xTc3V4TS9XU0RTN2ExL216SW1tWkdzMkxE?=
 =?utf-8?B?ZmdPQ2g4ZUZwcXNVOEg3OVpYTEhoS3NKd3Z1eXZUM09JSnR4QWhnTjE1YVIw?=
 =?utf-8?B?VzNZK29OLzl2YUpZbmlRL3JQanlEN04vTGpONiswVHJ2UWxPUWJ6Q3BTK0Vy?=
 =?utf-8?B?eU8vUUJOSnZwQWQ1dXU0TENkTE9xdTQ0WlpQSWR5Zm9JVE5NT21vMVFob1M4?=
 =?utf-8?B?akF1dXg4RUQ5U2JlWktOTVIxYm9RVnlpTGEyU29kVEpMS1FBdFpDbnNjb3cy?=
 =?utf-8?Q?2+LA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWFVTjM2RitxbitERzlYSE5TZHBUYWVzbnJJUzF2UDlqVFdySktWZHRlemtY?=
 =?utf-8?B?NlBWMDk4Y3ByV0dRYWxLR2RocEhIcTBLdm5uOTlkTmNaWVlnQ0xZZXkrekUz?=
 =?utf-8?B?bkpVZTBYbW5TS0tyL3JGSDlOOGVNUnJuR1U0S214WTBPNGhSb0s1NXBDY3VT?=
 =?utf-8?B?OXZTT3A3cGFTTDB3TVRWUmQxeUMzUVZ6WDJyUHhsRHZyTUZMMCtBZW5ldGZv?=
 =?utf-8?B?a3o4MzZYRS9jZ0wyeEtxTzlLcUo3OVFMZ2l5aHBjSlhTV3M0VExUbnZSYk5V?=
 =?utf-8?B?QkhWUHVkU1pZdUlQVXIxSzljdy9GRXovWGNkeGNQMXdweS9CNlYyaVBYUm1D?=
 =?utf-8?B?SU5KdDhKY1F6WFVldG0vaWVLZElxcU5rdjlPU0V2RnpINHEyNzNjREVUNDRh?=
 =?utf-8?B?b3JSczB2V3NleldIRElrREFIdnJJUCtkTmlldHlPc3lFQ1h4NWs1MS9XUVR3?=
 =?utf-8?B?c2loNVQ1ZGZmbEZmTXJwUUpKUjJkY1pSenltY2EzV05TSERqUDdiSXdEeHp3?=
 =?utf-8?B?L0tKVnBmSSt6R2VDTGlhZ2lCakMycjYzeERDdndyUUpqd0YxMmRab25BVEpN?=
 =?utf-8?B?YnZUWlM4ZEg4bXZhS200c3Jha1g3RytOeFM4SGlSQm1hZWI0bjdEeTJGcUNo?=
 =?utf-8?B?SmROM29Xall2d3VkZTZlSU1zZHR3d3RPRHBEMW1XVWN2VGlOVUdadXpuQkFV?=
 =?utf-8?B?UlFZVUtwQldlbDV0K0N4cUpaMEhGNW1acloxWDZab3hwbEtqeTZCVkx5Z3p0?=
 =?utf-8?B?NExhUlRobFQ4TmFlT0hQeloxamtFeUVZOC8rMnlBOUhzV0xpY0V5TlJIdHVC?=
 =?utf-8?B?Z0tJQnJlampjMTRJYWFDSEFWOUxjL1pwOXNUVnhUdUhUeTNYR0xFMFR6NFBz?=
 =?utf-8?B?ZUYva2lRNzEvSzllL3hsTWRFdEhRYUROaHZtblR6cm1wQ3RSZGhRNDBUVzBM?=
 =?utf-8?B?bWxtbTdIYnJmWGl2K2wvbjNzOFZCdXY1akNzREo0V2wwTzBQcEVnbVErOTVJ?=
 =?utf-8?B?TjUzMkhsWkEvUkpvd012eG5oVlJjc1h1QjhpNUtSZmlEbm1HdWk0REJ3WG9B?=
 =?utf-8?B?TklkUUtxOGwxQWlRbVN0YmI3eXFiRE5vanNqUkkvQnFsQWVCaS84OW9Ka0lY?=
 =?utf-8?B?dC82ZDZUVzdILzFDU2hqN05LSThZNyt2RUVYQm82S3E4MHpMbEVMZlNqd1lo?=
 =?utf-8?B?Y1QrT2J1SS9nNGt5emI3Z1ZxZnN6RDhPd28xQURqYXlDcUJOQXRqc05PNjVr?=
 =?utf-8?B?ZE5ZeTlLdlU3a2xydSt1YTY5bU54aFhlVzJNNjZmcTdCNlNhcTRxdy9TREw1?=
 =?utf-8?B?NGFWQm1xbmVxejlhMlI5aVVSdXA2N3pKa0huK0ZsQjBkQ0tPY3IxVzV4UCtJ?=
 =?utf-8?B?OUZid1FiR3VtQTVCTG96UG5wM3RJWDJ3aWlGbDAwc1BZd013QytTNkZoNks1?=
 =?utf-8?B?amFKYmFUc2NIQ2g0N3F1M0NEN1lzRG5iZFFhaCtPV2JDQmRiZEw0RTdGT3RT?=
 =?utf-8?B?VzNBTUJVUXFFVWRZK0p3TGdqQ0VTVStsdlNIYXJOWkNiRk1XSzJPbVl6OWw4?=
 =?utf-8?B?ejI2Z055aWpxQ1RjS2V1RVBXOXA2OHJuOFVTUzd5K1dCNXpsTnFxN1pGVjhs?=
 =?utf-8?B?S2NsVDlCdFZzTzVjTUhnVllPQWFtL3VnOUo1TzRXRTh5SXpGUXprWEFOY0RC?=
 =?utf-8?B?Sk95TSt6ekg3MUhyVTFhdWlyYWRUSXNCNHI1bGpFKzY3Nk9od0JDTjlBOUxS?=
 =?utf-8?B?bWhBS2dua3o5RjlvWmlUanEwTUprSFFDZWF1ZzhQVzYzQ3hKTUtjUFZIc3dr?=
 =?utf-8?B?QUMyeDhqQmZuTmhWcDJPWkJlMCtSdGdROTJ3Y2U5Qkw2akRNUTlLSDg1c1cz?=
 =?utf-8?B?bXE0OHhINXdNQ0ppRzBSc29yVG0vZG9JN3FSNTZ2SmJEeEQ5UE83M1lteVRw?=
 =?utf-8?B?VlFwbkdPQ2Y0Q0piUWFhYlpNdEgrVGQxNElaMGVGMVJYWi9TY3BDSEhDU0lD?=
 =?utf-8?B?M3JJUXFhWDVIckkvdkNnZ1VVUHdJaU5MbkJ5WXZiWEI3dHM0Nmt2Tk0vWUZU?=
 =?utf-8?B?bFlOWW5aU1dVRkNiMjhwWlJkaXJSeUNqZUdmajhaa28vZ1EwN0ZGR3VKaHRZ?=
 =?utf-8?B?MEFYZEZkNEsxVGJ2QnduZEpzK2hLK0MwdFdySmcydXBLN08xa2RHUVZYY0NE?=
 =?utf-8?B?cWxQTW1UWGI1SU5SWDk1YzhOdTFSQ2RPOU9PN1VOQVdLUHA1b0I2cDJTK2hL?=
 =?utf-8?B?cWZLaC9QVUl0d1pNS2x1WEtreVZNNGZYOUtIVEgrb0ZFKythUm5BWVZBU0Qv?=
 =?utf-8?B?UTBydVJQWFZtaW14clhTSTNRd1oydlRiZ1BWZUFwZzVqMmxUdTIrU0xlVEN4?=
 =?utf-8?Q?NJD2bi/ngxe2synw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d0c0ce-a241-4c02-fce7-08de643e5ed3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 22:40:17.6568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DlJ/Vn+ijzwd6unZNdFyUBQHB0QlZJOa4zG4VOJ8YZRLWg3riIsDr0q7zTJruGlxreI3AQVbfADLbRBQSNFRFr63zS6Tdsyuth/WnLLf18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
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


On 2/3/2026 8:46 AM, Michal Wajdeczko wrote:
> On 1/28/2026 3:23 AM, Vinay Belgaumkar wrote:
>> Move enable/disable GuC RC logic into the new file. This will
>> allow us to independently enable/disable GuC RC and not rely
>> on SLPC related functions. GuC already provides separate H2G
>> interfaces to setup GuC RC and SLPC.
>>
>> Cc: Riana Tauro<riana.tauro@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>> ---
>> v2: Comments (Michal W), remove duplicate c6_enable calls from
>> xe_guc_pc.
>>
>> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
>> (Michal W)
>>
>> v4: More comments (Michal W)
>>
>> v5: Remove rc_init and use enable/disable (Riana)
>>
>> v6: Link to kernel docs (Riana)
>>
>> v7: Don't call devm_add_action_or_reset() in rc_enable (Michal W)
>> ---
>>   Documentation/gpu/xe/xe_firmware.rst |   3 +
>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c           |   1 -
>>   drivers/gpu/drm/xe/xe_guc.c          |   6 ++
>>   drivers/gpu/drm/xe/xe_guc_pc.c       |  70 +++------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |   1 -
>>   drivers/gpu/drm/xe/xe_guc_rc.c       | 129 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h       |  15 ++++
>>   drivers/gpu/drm/xe/xe_uc.c           |  10 +--
>>   drivers/gpu/drm/xe/xe_uc.h           |   1 -
>>   10 files changed, 172 insertions(+), 65 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
>>
>> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
>> index 5d23e9f27391..9c15a300bc62 100644
>> --- a/Documentation/gpu/xe/xe_firmware.rst
>> +++ b/Documentation/gpu/xe/xe_firmware.rst
>> @@ -31,6 +31,9 @@ GuC Power Conservation (PC)
>>   .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
>>      :doc: GuC Power Conservation (PC)
>>   
>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_rc.c
>> +   :doc: GuC Render C-states (GuC RC)
>> +
>>   PCIe Gen5 Limitations
>>   =====================
>>   
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 51a9a531fb7e..41ec698b3cc1 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>>   	xe_guc_log.o \
>>   	xe_guc_pagefault.o \
>>   	xe_guc_pc.o \
>> +	xe_guc_rc.o \
>>   	xe_guc_submit.o \
>>   	xe_guc_tlb_inval.o \
>>   	xe_heci_gsc.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 9d090d0f2438..c8a1d44bbf3a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -852,7 +852,6 @@ static void gt_reset_worker(struct work_struct *w)
>>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>>   		xe_gt_sriov_pf_stop_prepare(gt);
>>   
>> -	xe_uc_gucrc_disable(&gt->uc);
>>   	xe_uc_stop_prepare(&gt->uc);
>>   	xe_pagefault_reset(gt_to_xe(gt), gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 2efc4678fa73..dc198d499da3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -35,6 +35,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_log.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_memirq.h"
>> @@ -880,6 +881,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> +	ret = xe_guc_rc_init(guc);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = xe_guc_engine_activity_init(guc);
>>   	if (ret)
>>   		return ret;
>> @@ -1620,6 +1625,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>>   	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>>   		int err;
>>   
>> +		xe_guc_rc_disable(guc);
>>   		err = xe_guc_pc_stop(&guc->pc);
>>   		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n", ERR_PTR(err)); diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index 5e5495a39a3c..878eb273c3e6 
>> 100644 --- a/drivers/gpu/drm/xe/xe_guc_pc.c +++ 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c @@ -92,6 +92,17 @@ * Render-C states 
>> is also a GuC PC feature that is now enabled in Xe for * all 
>> platforms. * + * Implementation details: + * ----------------------- 
>> + * The implementation for GuC Power Management features is split as 
>> follows: + * + * xe_guc_rc: Logic for handling GuC RC + * xe_gt_idle: 
>> Host side logic for RC6 and Coarse Power gating (CPG) + * xe_guc_pc: 
>> Logic for all other SLPC related features + * + * There is some cross 
>> interaction between these where host C6 will need to be + * enabled 
>> when we plan to skip GuC RC. Also, the GuC RC mode is currently + * 
>> overridden through 0x3003 which is an SLPC H2G call. */ static struct 
>> xe_guc *pc_to_guc(struct xe_guc_pc *pc) @@ -253,22 +264,6 @@ static 
>> int pc_action_unset_param(struct xe_guc_pc *pc, u8 id) return ret; } 
>> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode) -{ 
>> - struct xe_guc_ct *ct = pc_to_ct(pc); - u32 action[] = { - 
>> GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC, - mode, - }; - int ret; - - ret = 
>> xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0); - if (ret && 
>> !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED)) - 
>> xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
>> -			  mode, ERR_PTR(ret));
>> -	return ret;
>> -}
>> -
>>   static u32 decode_freq(u32 raw)
>>   {
>>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -/**
>> - * xe_guc_pc_gucrc_disable - Disable GuC RC
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Disables GuC RC by taking control of RC6 back from GuC.
>> - *
>> - * Return: 0 on success, negative error code on error.
>> - */
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>> -{
>> -	struct xe_device *xe = pc_to_xe(pc);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> -	int ret = 0;
>> -
>> -	if (xe->info.skip_guc_pc)
>> -		return 0;
>> -
>> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return xe_gt_idle_disable_c6(gt);
>> -}
>> -
>>   /**
>>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>>    * @pc: Xe_GuC_PC instance
>> @@ -1247,9 +1218,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   		return -ETIMEDOUT;
>>   
>>   	if (xe->info.skip_guc_pc) {
>> -		if (xe->info.platform != XE_PVC)
>> -			xe_gt_idle_enable_c6(gt);
>> -
>>   		/* Request max possible since dynamic freq mgmt is not enabled */
>>   		pc_set_cur_freq(pc, UINT_MAX);
>>   		return 0;
>> @@ -1291,15 +1259,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (xe->info.platform == XE_PVC) {
>> -		xe_guc_pc_gucrc_disable(pc);
>> -		return 0;
>> -	}
>> -
>> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>> -	if (ret)
>> -		return ret;
>> -
>>   	/* Enable SLPC Optimized Strategy for compute */
>>   	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   
>> @@ -1319,10 +1278,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_device *xe = pc_to_xe(pc);
>>   
>> -	if (xe->info.skip_guc_pc) {
>> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
>> +	if (xe->info.skip_guc_pc)
>>   		return 0;
>> -	}
>>   
>>   	mutex_lock(&pc->freq_lock);
>>   	pc->freq_ready = false;
>> @@ -1343,8 +1300,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	if (xe_device_wedged(xe))
>>   		return;
>>   
>> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>> -	xe_guc_pc_gucrc_disable(pc);
>> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
> this FW_ALL => FW_GT change probably should be done in a separate patch
ok.
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 0e31396f103c..1b95873b262e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -15,7 +15,6 @@ struct drm_printer;
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
>> new file mode 100644
>> index 000000000000..55eeee7b1011
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -0,0 +1,129 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_slpc_abi.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_rc.h"
>> +#include "xe_pm.h"
>> +
>> +/**
>> + * DOC: GuC RC (Render C-states)
>> + *
>> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
>> + * GuC RC can be enabled independently of the frequency component in SLPC,
>> + * which is also controlled by GuC.
>> + *
>> + * This file will contain all H2G related logic for handling Render C-states.
>> + * There are some calls to xe_gt_idle, where we enable host C6 when GuC RC is
>> + * skipped. GuC RC is mostly independent of xe_guc_pc with the exception of
>> + * functions that override the mode for which we have to rely on the SLPC H2G
>> + * calls.
>> + */
>> +
>> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
>> +{
>> +	u32 action[] = {
>> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> +		control,
>> +	};
>> +	int ret;
>> +
>> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> nit: I still think we should have this 'H2G canceled due to wedge' logic inside a CTB layer as this is applicable scenario for other H2G actions as well, but this could be improved later
ok.
>> +		xe_gt_err(guc_to_gt(guc),
>> +			  "GuC RC setup %s(%u) failed (%pe)\n",
>> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
>> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
>> +			   "UNKNOWN", control, ERR_PTR(ret));
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_rc_disable() - Disable GuC RC
>> + * @guc: Xe GuC instance
>> + *
>> + * Disables GuC RC by taking control of RC6 back from GuC.
>> + */
>> +void xe_guc_rc_disable(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
>> +	if (!xe->info.skip_guc_pc && xe->info.platform != XE_PVC)
>> +		if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
>> +			return;
>> +
>> +	xe_gt_WARN_ON(guc_to_gt(guc), xe_gt_idle_disable_c6(guc_to_gt(guc)));
> nit: maybe it's worth to have local var:
>
> 	struct xe_gt *gt = guc_to_gt(guc);
ok.
>> +}
>> +
>> +static void xe_guc_rc_fini_hw(void *arg)
>> +{
>> +	struct xe_guc *guc = arg;
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	if (xe_device_wedged(xe))
>> +		return;
>> +
>> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +	xe_guc_rc_disable(guc);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_init() - Init GuC RC
>> + * @guc: Xe GuC instance
>> + *
>> + * Add callback action for GuC RC
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_init(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>> +
>> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_enable() - Enable GuC RC feature if applicable
>> + * @guc: Xe GuC instance
>> + *
>> + * Enables GuC RC feature.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_enable(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>> +
>> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>> +		return -ETIMEDOUT;
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		xe_guc_rc_disable(guc);
>> +		return 0;
>> +	}
>> +
>> +	if (xe->info.skip_guc_pc) {
>> +		xe_gt_idle_enable_c6(gt);
>> +		return 0;
>> +	}
>> +
>> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
>> new file mode 100644
>> index 000000000000..35fabb82cb0e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_RC_H_
>> +#define _XE_GUC_RC_H_
>> +
>> +struct xe_guc;
>> +
>> +int xe_guc_rc_init(struct xe_guc *guc);
>> +void xe_guc_rc_disable(struct xe_guc *guc);
>> +int xe_guc_rc_enable(struct xe_guc *guc);
> nit: maybe they should be listed in the use-order?
>
> 	init
> 	enable
> 	disable
ok.
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 3f63c2a7e86d..d9aa845a308d 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_huc.h"
>>   #include "xe_sriov.h"
>> @@ -214,6 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   	if (ret)
>>   		goto err_out;
>>   
>> +	ret = xe_guc_rc_enable(&uc->guc);
>> +	if (ret)
>> +		goto err_out;
>> +
>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>   
>>   	/* We don't fail the driver load if HuC fails to auth */
>> @@ -242,11 +247,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>>   	return xe_guc_reset_prepare(&uc->guc);
>>   }
>>   
>> -void xe_uc_gucrc_disable(struct xe_uc *uc)
>> -{
>> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
>> -}
>> -
>>   void xe_uc_stop_prepare(struct xe_uc *uc)
>>   {
>>   	xe_gsc_stop_prepare(&uc->gsc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 5398da1a8097..255a54a8f876 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>>   int xe_uc_init(struct xe_uc *uc);
>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>   int xe_uc_load_hw(struct xe_uc *uc);
>> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>   void xe_uc_runtime_resume(struct xe_uc *uc);
>>   void xe_uc_runtime_suspend(struct xe_uc *uc);
> IMO one change deserves a separate patch
> also few nits, but otherwise looks good,
>
> Reviewed-by: Michal Wajdeczko<michal.wajdeczko@intel.com>

Thanks,

Vinay,

>
