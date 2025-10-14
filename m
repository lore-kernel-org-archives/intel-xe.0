Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1141CCCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 08:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E7410E57C;
	Tue, 14 Oct 2025 08:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUWXz0pb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8B10E577
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760429391; x=1791965391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=105QfLbolQgX+PCuehre3Bbikedm0Y7LcnSdl2vwGkY=;
 b=eUWXz0pb7qRRaVUSkv635uYBGQdhkV/5Lbll1JfUk8q2mcK+4UToYw+n
 FgmLrWESbNol/GuxcLrRvfFTbrWUx9suPcxxxyqtaF0ftuccxSIaZGTDL
 EvyNzFWkqAqVuZgEplSYYfERbhdFhoK49OUGzpkInq1S0MZeKyf4QFQkQ
 LJbg69Vj1VSJyb8gvUPieUT4wgI3LXBO7MQyzAydqxVimSCqYWdO11r3S
 akOq7Tm6hfPOXKGzGzdJg6qXhPEnNT6Y44pMYojpyQwpEztqjmSev0LLA
 cGTGTl2PguIdgI0I9IIbFtHI/PAptr6fqI0Ds89TvOuJUGSOOC24wOpal A==;
X-CSE-ConnectionGUID: 3A6/aqxSTqO7Tnh8NGJsdg==
X-CSE-MsgGUID: +WjelcNBT8GOf8exHucz3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61620700"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="61620700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:09:51 -0700
X-CSE-ConnectionGUID: SS5MoU5HQvOmVw4KfCQJXw==
X-CSE-MsgGUID: w04a//q9TcKvCYVG/n3JIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="186234093"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:09:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:09:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 01:09:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPgm4Hvi13TLFqZHX0h2HPuGdl0qUil+Lw7l2NoqKR1Ojhz7SNJMlqZ2DRe9ST9gZ5DvBx7LxaZyVJOe9a/sNO1WzJpTUDjcb7j62GIRdybYUKoYwUz/J0F1mvJ0Lf3hh61yC9huZ3CQosL0FWkqV2L6jP8XQWhKHbbTinbiRpDIGCr+APPJXqIcOeTMqiaEUXYc0kFVWKhYrOD78OoBYcuowhl4dRUUCnS1uRu1hxJU9ke3t17OIb7em/vqi50WE1UcnMsa/qOg2L1JeAmqUZHfvaXXCKX/Ql4Ztwuns9VJPnRKc9UEpq2T1uZ7Z+YKVHaJ/bwz1Rf+O/9tzM2JnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfjAEHEWZtJgauPQpUiifIaM1OOM/W8WqaF7LJQNC+8=;
 b=CeuUMoxkcJXOGdS7qGMXGp+YMinhcxGzLXCu5zKiJ2ouYHKGoEjHcF6ZWB+Cpq23CfxXCuQZ3y3jhuTZZOG036OpyPVCdM5jkRwhnk7ETwnntP4ILTjjpIkH32TIOMx+xZdzjm5pGVQG64TzjZLe9Mkh1JfJEWHEAk0n5Htv8+sFApcGSc4kqjsMRARkzCOF1E6bdSEI1l6FKJ/+SgkxXaOty+qlHZuZMuaIy5sdmQ8DSBObgTlZ5mP8wfPVWSfFBZwK/g7PKOqhgYpkvDTg91oiMCmJA0jQzTe+kzD+kk6XjUaM756CD9l/MhiXpR3fHuvEBzCR0h6v7jsbPvw/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 08:09:48 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 08:09:48 +0000
Message-ID: <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
Date: Tue, 14 Oct 2025 13:39:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-21-bfb74f038215@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251013-xe3p-v1-21-bfb74f038215@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0196.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::10) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a330a1-1e23-454f-bab3-08de0af90aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZseFRubEVNZ1c5V1pvTHU2QnAwallEb3VFUTZ0aU1GbVl3a3p1OHVqalIr?=
 =?utf-8?B?OUNJNFN4ZkY3MGRXS0tSS2pWNGovM01ZSjZsaHhaa2c3YVhLamJ1c2xNa2VY?=
 =?utf-8?B?cTFOcGdWVk0wekJCR0tVVm95ZFBTTkNYbWJpbWV4ZzNlcVd0ZDJ0WWRVa2xH?=
 =?utf-8?B?Si9WUFpOMW5UN2RuSUlnUXNDOVFicVZGY0dwVTl1RXlaakt3Ymtya3RGZGMy?=
 =?utf-8?B?aG9YejNoQ3JYZjR0TW1ucnh6WVcxVllyU1NyZGd0NnZaMWxmZk1CTEZHZTlt?=
 =?utf-8?B?NiszdmVlNGZhVS9MZktqb1ZpUWQ2MUJ3SEFOU0ZQL2hHczdaeDB1bWQxdmhU?=
 =?utf-8?B?VkRMRW1VYUtIN3YxVzMzWWpmaXo1WWpvT2JXaGRWZVNiM2lua0FTYndTWFhr?=
 =?utf-8?B?NWRUbkJSTnYvM2xkYVVJRTFPVnhwMlE3dWhOSWVuaFRmb2Y1RjkreWlacTRx?=
 =?utf-8?B?U3pWVzg4VFBHS04zYnM5QzlCZWtFUndaM2owOWRuL1c1d3BHU0tPY2t0d0NG?=
 =?utf-8?B?cTdFNUkwMDY1TDhXTGtNVlgwQ3h2cUExUitaQTR0QmFZWi85QlFYTUx3b2xP?=
 =?utf-8?B?T2hVajE4TGpkeU9vWU4vdk0xSkFBYWFJcnA4azhPMG9tMWw1RFlnN2c0amxw?=
 =?utf-8?B?ZnFyVEZ2R05EZVloVm9zWGtJUCtpWEdCd2c3U1pKMVB2ZkFxWTdMUmZjQk5s?=
 =?utf-8?B?cmNFenlJYWp2MXczcUpCNndXb1NlZ1V1ZGVXYVFPOUVic2Fta3VRQjV6MHFm?=
 =?utf-8?B?c25YaUMzNW5aS1VMZUlUQ2xLNTJEak9Bb2I1YUM3Yk5JcEhDMCtIaENNdzho?=
 =?utf-8?B?bUhDeUo1cEVsTUV5WFVtZVB5ejNDMTJYSVB6VDVDUVJSUnI4eTBYUEJPS1c2?=
 =?utf-8?B?QnhnU3diN2tDM29ydmRFK2dzL200cm04ZjB5aDEyWVBGcWFxaWpTc2xGTjA5?=
 =?utf-8?B?d0thVFdKbDVUOSs3TUdPcGVPbVJ3dnJUZ0JjTk1PRVRyc0VudVRIRjVCakVM?=
 =?utf-8?B?OXJpcHU2a3M4NXQ5emNZdUI5QStlcldrN0ljRzBuanFqQU1odGhvYmtFMmE1?=
 =?utf-8?B?L3JIS0h2TnVEUDVwSFNvWDZ6aVBhR2FaZm9zdjVNbVU4aXZzTW5ZL0lVR2NG?=
 =?utf-8?B?eHZUd1dlSU9kdUtxLzA3NkFXTHpqOW10NDZUaXJHNlNFeENnaDZwMndpNzRs?=
 =?utf-8?B?VDc1b3YrZnQwOE8rSi8zVjl4Z1R1WWtCUXZmbThuRFVsbjdqTzRla0pHQmVQ?=
 =?utf-8?B?Q3pkZXdrSUk2c1dRblgrRjlyVkh4VklsUkJ2UnRNeTZYTjFITDFEcjY4ZU9P?=
 =?utf-8?B?MTVEY0Fhb3RKN3VPY3habjVkeC9sM0toRG8xYnIvWmd1NU5wUGZVNXRVS3NJ?=
 =?utf-8?B?dUZGTFFmbGphcGZWaUU3MStBdEtnZHl0YmRFRmRtSFl0K1VTS1c4bHRTYXFr?=
 =?utf-8?B?U0tqeVF5aEZCZ3ZBQ3ZsYzhRaGE5ZjdadC9KOGpQN0JYTnRZbEVvVDh6UjFp?=
 =?utf-8?B?aURndGVxTDBQZFhLVnpIYUdkY3pyVUw1ZkFkeHJOdFdTRFZhRDJLN3MySU4r?=
 =?utf-8?B?RkdKM1FRa2doaHpLNDh6ZnYrYzdDQWxOSnlCMnZlUkNQeGplMEZ5UkZWLzJO?=
 =?utf-8?B?eUhabVpZY2J4VjVzOGwyYTMzOEJiWkwrUzQrWG5INTF1TzJ6MGd6MHhlS2Rn?=
 =?utf-8?B?dGc3Q1FhanRSdzU4NVRqVUk5VkJ6dnI1NkxKMGRvZ2lMWUlURVMwYnJTUkhQ?=
 =?utf-8?B?ODJzRm1jZkhKbkJqaUkxbXdZa0pLOUdLeDNnWmlkcnRObkNYOWVtVVpxQ2ha?=
 =?utf-8?B?a2ZtOVEzSVJRSlBnUHZ0emp6YzBMN0ZCaWp2SzYzTzVrdHE1bnBwQ0FDVUZv?=
 =?utf-8?B?VzhvdGlSY1Z6Y2lRWlQ0MkhXazc4d1FnbTBhNWNsZU8yeFZvMlNwa2lTcFhx?=
 =?utf-8?Q?/BT3mtg4LS6psddKMKwTNNNOvkdnAV8q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGs4ZGpLQTJzc3NWNml2TDFDS0dPbGhZU0VFenVaeWduQzV2OW52UmZFcS91?=
 =?utf-8?B?OXJma2NBVHFONWFBWXBqbnNBOTJCWFU0eXVCSkJMNHh6YW5FWkdJOFEzdnVq?=
 =?utf-8?B?ejdDL1dSdmE5Y21VN1lSQzBzMCtETDBpZDM2MC9VRmo3dVNDSWNEcStqUnhQ?=
 =?utf-8?B?TXhYbWdNM3lrRXc0LzJvOHUybjNYV3JHaVpranE1NHhoeWc2M1RHbE5yQnNr?=
 =?utf-8?B?QWhGby9KVlRtMGM5VDcxWmNCejVEcGhtYUZiY0ZXZGRMRExrT09VM0RTQzVC?=
 =?utf-8?B?endWdHJGdmRSOHdBMWFxd2xrdHlZU2p3YU96OG5VOU5xekx0aFhtcUNQc0Vi?=
 =?utf-8?B?WlJXWFU3T0pLek1pNnlMUklQKzNYUXpoYXZuTlN2WW1rQmhxeTFJSkg4L1RB?=
 =?utf-8?B?MDNRaWtSV2Zud054YklZa2lCTTBNaDZyZjcyMnFsN1BJUElkekVEYmJuRHIr?=
 =?utf-8?B?MGFKbndBNHAvL2crcEx2VUpETzNkeHRkRU5pS1gyaVZVTDZkNUlzbU5WV296?=
 =?utf-8?B?Y1A1YVhVMWNHUmNsZU5rUFMrd0trNDRqT3FPN1RUMmZ1U283djBjUHRHSG55?=
 =?utf-8?B?LzV0MzZCS1Jaa0ZBQ0JxN21seXRMY0tOZVFFZEtlUWMyWEpSbGRkVmw4RVpT?=
 =?utf-8?B?UlV2ajVaL1lhNnJYZ1RRNUQrcFFOcmZweko0K3ptTFdXVSs3RDI4QS8wS0R5?=
 =?utf-8?B?dnRnSkhwRkNKSUI2RndyWko3QXBaY3VjRTU5SHBhRFQ1ODd1enlwbUJyZkYz?=
 =?utf-8?B?b3h1TFVBTmhYUFFQUXNybzdXdXhyUHBCdDFzeUlsRmVwMG81QUhScDlaTm9u?=
 =?utf-8?B?L1BQMHc1ZjljVlJDeElBSTBpVkZHeFBXSEhBemhlR080SUtYV1ZHdE5BWUta?=
 =?utf-8?B?Kyt5NG81ZDEzWUgyRXdpT3RVTjZUU1RDZFVnNUZlcTRoNkx0bDJCb25LVklO?=
 =?utf-8?B?QWx5MjVWemZiZk4vNHJFS2hYY3g0ZG9jUEhDamhuQjhEVjI4V0o2d08zaEZq?=
 =?utf-8?B?Ry9oT2ZZQjR5MEJpWnlYNjJCeVJjenZ6Yjk2Qk1Cbm5FLzJBVHRsekRUS3kr?=
 =?utf-8?B?bDFNaVNUeVBDSHlBWWVmM1RkUlpvNTY1S1FYMFE1RGJ1M0dvRDdUcmlJc2lm?=
 =?utf-8?B?eld3dmIvL3FwdzlaSkt1YTk0c2lvUUxUQ1dnOHpKTVh4SVBlRlZxTXZPMUto?=
 =?utf-8?B?MmVBR2o5RjZoY2phSDhuMDhiZ0NQMzNrZmRBYVBxQTAzR3B6TXQxTFEvbDA0?=
 =?utf-8?B?V2x5cjRTZHhSTW1OY1NrR3BvZVgyUFN2N1pibWlTTDlJemV3T2RScHU2eWE5?=
 =?utf-8?B?ejR6TTE2Y1FjaDM4bWhDaXQ4NUkwTzZubllBVHZiczZoeDdqM09ZNS94dUo1?=
 =?utf-8?B?QklFZldWbUJIRWRXOWMralZVNjNQeWx5bTBiK3hOTlV6T0E3aDFpR2lmeTB3?=
 =?utf-8?B?SGRvWHlRL09WV3RMbGlDWE1hOXN1M3dLUjVPY1hlTEV5TnBJdW9QaHgyZEJJ?=
 =?utf-8?B?amMwNmRBM2Y5NXk0K2NpVHRkQ1pISG5tOXRocUVKR2V5NW5ya1RpNEY5UDNa?=
 =?utf-8?B?YlR6d3VoRG5NdG43ZkdkUVNHL0QwYWc1UWxsZkJ1WU82WENFVGdRTmZjZXJy?=
 =?utf-8?B?dUczVTluTHR3N0tBdFVVb3ptQzFSVmlIM3o2ZjZ5a2NVZnM2U0hjNU9Pak1Y?=
 =?utf-8?B?L3NEZ2ttek9iSkMrMkdqalVsK1JwcjhRQ1MxOSsyUzdVMHY4Z0xOWWxHVnlL?=
 =?utf-8?B?OXl5TkpMY0JMS2ZqVlJnTU80SGF2YmY0emZhblpRMXJCcUc1WXp3b3FzREZu?=
 =?utf-8?B?c3pxRm9JVEg4THJMdHJwVVJuWW9vV2piN1JwemxCNTFNVVlTZjhpVFhmT0t2?=
 =?utf-8?B?VWN6T0szUThhN0VjRUxxRkEzdFo1VzNqYy9ZUjJVcnIreTFXRTJLbnNxaGM1?=
 =?utf-8?B?Uno5M25UZ2hXRXBmVC9CNHV1NERiSWdOUmE1bzAxL1lNL2R0OW9BSzV2UWQ3?=
 =?utf-8?B?N0VIYlE5Zkg2bFpTaXlYSUdOZU1XSEhiUExnVkhVK2I0MTRXUDdhandVeVM0?=
 =?utf-8?B?Q1ord2ZuSkVOdjk2S0oxYUpRNXF3Ync2WWFUWmxtYXFPTU8rQVpTVStuSkNs?=
 =?utf-8?B?VEcvT0pqUmFNTVkyWXpRbUhtaWdjbm82Z1VLc0JBQkhPNHcrMXJ5WGk4YWZ5?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a330a1-1e23-454f-bab3-08de0af90aba
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 08:09:47.9917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjDX125q2OSiMUA0j+ab0IwtIen68knSV9QhV/1jGIL4EdtBxhJ0epiGfrUYyc4DhWtgBCK9fWLyBkt4Wv3Y/w+K931X3Ky/3C4FqlVxzps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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


On 10/14/2025 8:54, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> The compression overfetch tuning settings only apply to platforms that
> support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
> compression) some of the registers being adjusted by this tuning will
> not exist or may have been repurposed for something else, so we should
> take care not to try to program them.
>
> Note that our xe_rtp_match_has_flatccs() function will also return false
> on platforms that do have FlatCCS in the hardware design, but have
> compression manually disabled in the BIOS.  On such platforms the
> registers still exist (and it would be fine to continue programming
> them), but they would have no effect, so skipping that tuning is also
> safe.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
The patch in itself looks fine to me, but, the patch doesn't 
specifically play only around Xe3p_XPC. Maybe we can move this patch out 
of the current series, or if we wish to keep it here, can we instead 
drop the xe3p_xpc from the prefix? Thoughts?
> ---
>   drivers/gpu/drm/xe/xe_rtp.c    |  6 ++++++
>   drivers/gpu/drm/xe/xe_rtp.h    | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
>   3 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index b5f430d59f805..22a879270c1ec 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -376,3 +376,9 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>   {
>   	return xe_gt_has_discontiguous_dss_groups(gt);
>   }
> +
> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
> +			      const struct xe_hw_engine *hwe)
> +{
> +	return gt_to_xe(gt)->info.has_flat_ccs;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index ac12ddf6cde6d..92f0d16110dd5 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -483,4 +483,14 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
>   bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>   						  const struct xe_hw_engine *hwe);
>   
> +/**
> + * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compression
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Returns: true if platform has FlatCCS compression, false otherwise
> + */
> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
> +			       const struct xe_hw_engine *hwe);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index fd58ea5e78bf6..7c140d8cb1e07 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>   	},
>   	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_has_flat_ccs)),
>   	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>   			 SET(CCCHKNREG1, L3CMPCTRL))
>   	},
> @@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>   	},
>   	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_has_flat_ccs)),
>   	  XE_RTP_ACTIONS(SET(L3SQCREG2,
>   			     COMPMEMRD256BOVRFETCHEN))
>   	},
>   	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_has_flat_ccs)),
>   	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>   			     COMPMEMRD256BOVRFETCHEN))
>   	},
>
