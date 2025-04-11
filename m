Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996F9C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 14:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE5410EBD3;
	Fri, 11 Apr 2025 14:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEsjwIHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A4010EBD3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744382298; x=1775918298;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jfRpfV01MT+jgdeC8WUABp9lnc8BuAjKsw7Oz2WJ4Mc=;
 b=ZEsjwIHgL/dxE6Rq1dKJjAx45O+SaDaF7Jp5EG8CiutzJZpTxQz2H3bu
 /aOiiwERbivIhXEcWMrq0vjaut+NQpG8c0SN4nVg6CK1gi/cE67nme3N8
 vuLTRBXTM1W2E6E40gQmDAJCsSlcREZPUyWbLEXWjKGrzCOSUXAyB1p14
 r7xGo8oYNC5B1JcQjHjxMOhGA6ssSVo3NaVivODLODWestw2XsM0dhPJI
 5W7TduPBdFUUNFbJKp2HshkcEaLCBWrRxTGtzrfM7/jINrNxqkofeIote
 szNEaYF49wjv0NCOAfCVLQdO9xeKDzcmy8ZMMnNUhO0vyP35PyX0f0MI6 g==;
X-CSE-ConnectionGUID: HRyc97lOSkGkwgSi0BNwcg==
X-CSE-MsgGUID: 4GjUJfXcRBmNd8nd7TVOTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45075602"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="45075602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:37:57 -0700
X-CSE-ConnectionGUID: HYB2wdPYTaG1kXfwm8gh4Q==
X-CSE-MsgGUID: snmOBoXdSIy+sqgium04Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="166404732"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:37:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 07:37:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 07:37:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 07:37:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTIbXQcFYLDCgp38JGvXjnChU77ZHg86MG/jNm/s/NYhwPOZmSIx9KeNBcBEjyXEnwZjTnbOSi65sv5xk2iSWe/pWkpvErtIIKx2NaKJ38AlD5EqcxRH5ho+MbR7XUz08liiTxqCchh88j6IpSCZpgWguqZ7ZoEDMz+1UboKXvF9/yA1isY1gqW+R4TNS/VIfV+Hfn30SDddk9TsRiJM+gIe+ZjeRWVUOlgYFTmKmnZ5J/FT17E03EFpqy4tKK+KC1am83xzl+SzUqF9KkdLgQjErMgHlfvhRy2RakqB5H/hRS9EhY5jgXIakDBSxwOXXZBzBu0E3js5oU9hlbH+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YM/oqqfLCT/0XRj7lZh7SHktFzP6Kangf1jCh1ZM66Q=;
 b=qaQEUc7lGGH4VYbwgyz3mqZnH+tICb9nzHfqLv1x94gFJJRh7UqFDGUMdZw+gdOomcmVaNuYrmyGYvcJ5zHn+J6y3T7Qk78Z7DLBAjZsiTI+wzoj+z9zRDdz4zOUhgjxM7EMNSdHkzAWOItBkVNFy9eAkQsxsy/UGl+PMyO4c2pSCIPjldJEBQMANJXyX7CS43EL8pVcnjHItRZu/4CIfUpz5L4Ohj4ly7uBCEY3SVUJ0y5GruIYYk4kbch0RMZ6O1hP9IoapuQ9Ai2CTVL9QbifqIXH5pKI8CJDbPmI90h9YtvK2ikcY9gCHV3Pa1fZtzU3ne2ku3u1A//RozscDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by PH7PR11MB5959.namprd11.prod.outlook.com (2603:10b6:510:1e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 14:37:40 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:37:40 +0000
Message-ID: <74484744-7b87-4f68-94a3-dc872ab21a58@intel.com>
Date: Fri, 11 Apr 2025 16:37:33 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v8 2/4] drm/xe/vf: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
 <20250409211340.3046931-3-tomasz.lis@intel.com>
 <a258522e-bdbe-4dd5-ab40-c1c7ba74527b@intel.com>
Content-Language: en-US
In-Reply-To: <a258522e-bdbe-4dd5-ab40-c1c7ba74527b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0140.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::24) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|PH7PR11MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: a66e809d-c844-4c15-0cca-08dd7906691a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGUzZ2hBQjd1UFBUK1NQaSs5S1IvZEEwaXlJYXJ2L05xNHhaT1ZCZXZ1MTRn?=
 =?utf-8?B?QnFiNUZiZzhRWkRadkNiSnVQNGRLSHVDcmZqRGV6U2lmM1pSUUMrTkFOWVA4?=
 =?utf-8?B?Um1ZdXUvbk5zNUJIZ21BSmdRdjdDd3oreldSeFZKbWFnNndXdjl4STlhemt4?=
 =?utf-8?B?SGdwTVl5OWxURnF1aWNIcHV1NlNZYkVUb2NpeGFrL3p5dGptZERFaEtpaEha?=
 =?utf-8?B?VnA0d0RzSDRoVHdGd1ZJUHhlUy9aQ2NHOFV1RWgwN1V5NjFwWWkzb2Ftb2NL?=
 =?utf-8?B?aGJlZ1lxdW9pd3QyOGxFLzZCdVpoWmlPWWI3bmxGbmEyR3NOWjI3cTg1T2pz?=
 =?utf-8?B?TVEwVWZvaHhsNWVVbDd2ekp6Mk9Bb2ZrbGhhQUV5Y0kzUHlVUE5EQUtsZWor?=
 =?utf-8?B?aDlZOW1FcDgzb3dGWCtnMGRyaWloc3o1NUMyRXJnbG1RTVdGSnBjSmlXLzZI?=
 =?utf-8?B?TnpiTmVwNTJib3krZklFRkFocWJ4TEtEMElVK0JsOW9pVTJkekwxdjZaZ1pp?=
 =?utf-8?B?TDF4V0Fka2NNZHA2YUMyOW1xbk5vTU9KVzdpaTZHa3phYmxoVkcwQlRueVFi?=
 =?utf-8?B?d0Y3RTFPT0tWd29IWU9GVHpEWk50bEl2eXJQVDJkT0dYVXMzdjJ5OVdkc2Ju?=
 =?utf-8?B?V1JERzVuTjk0RE5GRmI4RzIwTVpoN0ZZTFllNnlOdWJPeTI4bnNqZjJBNkdY?=
 =?utf-8?B?NlAzQVhuTTR0bmV0U0NjbWg3SEhsTVRvblFNNWxacXBIa2pZMHhFS0c4Q3Nw?=
 =?utf-8?B?OWJ0V1NHb3ZrbEhCcUNaME14RFpIZ3RTOEQ4MHVvVnNwNUFTYzV3TjV3eU14?=
 =?utf-8?B?a3d3UmZSMFh5SmRVR0E3UVErWHJEV1RhTlhoZk9FNDZlbjRWeldvemFQRWdz?=
 =?utf-8?B?TEg5b2VrMWhEb3BxckM2aHpERE5rQm9jVUllR0dpaDRDTzBSZmJIU0VMeDgr?=
 =?utf-8?B?R0Rqd1dIWk1XV2FTRTJGOENOOWhaU1dZNEtwVzZrUDRkampTVHAyYnRpTC9j?=
 =?utf-8?B?TzF3RUEzeW9LWVBrSWR1bWkzK2syQnlIZEg4MHp4Zk9HYUwrNjRYVTNyV0xB?=
 =?utf-8?B?V29nSDhEN3Azd2R2N00yMHdtdWRVOXRjdStOdkFzRWVQY2g0cXZhWk9NZkRU?=
 =?utf-8?B?MHlnTi82RzZyTTlKTERqQmp3UVhlL2pvaHNtYTA2U01DSEVINTNYQVdoamZG?=
 =?utf-8?B?VHNOYTFEdVhBbXhLQUwwMWtXNnVCUVFadHdBbCtXQzVRQkZGNXV1cW1RcGxU?=
 =?utf-8?B?OWdVSFJVUDRVdWsvZzI4dEtUclEySjBBbytkaTlmVHlPOUR3YlhudUlpcXNl?=
 =?utf-8?B?ZkpiY1RXeDcvNXpCdHl1RUZpenh0eHFkY3gweEV4K0V4RFRSSUlLWGNYeVYv?=
 =?utf-8?B?WjloTUJjbHdWeVN3bGpEOERZeUxkQ0pZcWN6YWZud0dGWjVmTUdMK1RWd3RV?=
 =?utf-8?B?RXhlUW9NakYzcUJUdjhvOG1jcGNQbENHSFE2NWZLN2p5WkxoT05uN1R1anVX?=
 =?utf-8?B?bWdKQ2tRMWcrM21idTZXMjBIN0Z2eG1RSXNNbjk0SVhobGRZNHNqdW11K2hP?=
 =?utf-8?B?Wng2bXNXK2FSRFo5SXMyUjNQM0wyQVc4eFVVa1c2eTQ0Tkl0ZkZvNWs2MXhi?=
 =?utf-8?B?MGd3d2tCTmNOd1p1a05uSkFHaDZ0WmlLT2Q1cS91cmRYU3pDYXVCemdyYWdF?=
 =?utf-8?B?SmN0ZU5GaysyS2FnS2JEb0F3WFE2cGZoUDg0ZnM5ZHROY2Q3SXg1WDlHbFF2?=
 =?utf-8?B?OVVJQVZSOVkzTm5lcnZESEVPNnY5SWNxR3hybk1XUU5FdjBFTmllL1UxbHRV?=
 =?utf-8?B?d3dxakp4WUMycllDV0R5MGJ5QkE2YjlMS2tRQkI0ai84UE1JWkdXTHJ5SDNR?=
 =?utf-8?B?bVdsd3VJL0dPV0tneCs2NGhBZWlibElkczRjTUNKaUVSN0RWMjUzdkFaL245?=
 =?utf-8?Q?WWdbtb68P4o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXhCZ3dTSzFtZEErOEZsTy92M25jZ0FKNlNRVnJEVG0vNDZqWU10QXFNdVNC?=
 =?utf-8?B?dlJLYkJMU1dCU3Z4Q3RSLzF6cThSV2hnemRuKzh3dmJ0cE5pdnYxWnZDay9L?=
 =?utf-8?B?NEtIampwNmE0NjFDV3VXNm5DVXZBWXV3SkFaVTJRVWhJcityWDZzYVlRNFpH?=
 =?utf-8?B?c2cydjJMSy8wenhQYVhLVVM3aXNIcm9UOHVMdzI5Vm5WZy9ubHQxUk5Mem9H?=
 =?utf-8?B?Qjd2REdDM1dIbjJQVkU0OGtvYUN4b3Q4YVhkcG9scnFsV2hONE1jUVk0a082?=
 =?utf-8?B?aFBKOG9iWlMwT3NSU0lzTGlDOVNOQkJjZ3paZEpyeHcxakF1My96Tk8zU3Nj?=
 =?utf-8?B?d0xsNkFJc0R2V1BCTnFMaHlJbGJ6bWptb1RFbUszaE9EYjYxcHZDaFduSHcx?=
 =?utf-8?B?eUxXQzlaVFNQMlhvVzNkZk5DTDlpcmpDR1M0bHZZNi9lY2hHaFlKQytyUDh1?=
 =?utf-8?B?WllWUXRmSTFEY2FSMkpMQkFoTEx0Qm1lTUhHaThoVHRORDhKazVyMmpsK0VF?=
 =?utf-8?B?UHJDVWhjVU05RGQxdlh5ZzEvR0NmM0NGbmRyaEFOSU9JS2lKamhZNVJlRUph?=
 =?utf-8?B?VWhWYlVMUUg4bXovTzFpazdZNHVic0kxdXpFV0RlTndqTjFLMnRlSUl3OFoz?=
 =?utf-8?B?VlZvWk1EVFEzUkpHaFZST1BBblZrUHRNcFVoS3AyaEk4L3pPdUk5TEV6RVg4?=
 =?utf-8?B?b1NKb0tBY0p5RzFuV01td3BKQ2F5QXhtaVJueU5RZ1RWbGdjMGRtZmxuaE13?=
 =?utf-8?B?a1duZkQwdHlPNkpLa1VVUUpDLzB0QmlyZitMVVlBYURYREFFNGc5NkppVWtL?=
 =?utf-8?B?SW5pbE1LeUhJUnlFYzJXWkwrWitwODhhdHl3UmlkYm5BV1NGSVBhMWFZeW1D?=
 =?utf-8?B?SEhYOXhHdXVsV3lCcUtHWHdXOTJrNVV4MmpzNVc1aXZWbUJuNVRqRzZDaTdv?=
 =?utf-8?B?NmF1Vk5sdmkrQ2t0dFdmVnVFMjI2NGV3ZGFHZjVFNkIrYWQ3dG56UVlHQ3pQ?=
 =?utf-8?B?ZnpIZVpKTkkxaFFia3RqcDlMTDZJeEkyTU94MHFGN0ZVM1crS0d4WjRZSE5P?=
 =?utf-8?B?dk5ZZzBnNG5XYzk5K3FZM2RiRTRLeXFBNWh3c3VLd2JPWk1qc3dyMTFjczdy?=
 =?utf-8?B?V3p6REI5YnhTZElSbG5QZkpxNTMrb0tXejR5V3Fxa0pqcnlDcEZkZHRRVFp3?=
 =?utf-8?B?ZkpZNW0yU21PVjJsVzlxZmdXZ2p0Y29LWVNCd213eVdiZWw3TWlRbkcxZHBY?=
 =?utf-8?B?aGNxcldDSEJOYU85ZFphVTdhQzhQYkxXQ01aZzQ2U3BDL1d0TlBUTU5LYzcz?=
 =?utf-8?B?VjhENjBYWExyT0JnQ3JnTExBanlaaDNBRy9QR0hiZW5uUEFOd3BqcTlQN0ox?=
 =?utf-8?B?UnhPZzY0bE1XN2ViRWJQdDlXMTVNbE53U3BpYVJMR1JnbHY5VXpncklYeHhF?=
 =?utf-8?B?YlUvYzBhUXMzRkpYaEhwZHBxSWhIeHVCejJRVkRlcWpoc2pYTlFmamtzZlhO?=
 =?utf-8?B?MUx3YXNlYmhETnV0MExaVXNhbDAzYzNGNldRVFV5Vjd6WGFTNC9FZmtlbHN0?=
 =?utf-8?B?MXRtYW9WdDMxejRUTldsMGVFSXJqZ2NkNXkrbVNPTk9Nck96cVF1M2hGOWxM?=
 =?utf-8?B?ekk1cXRmK25pWGRCSkhRZWRyTHYzdEdLNzROOERha0hEejNnL0dqbTBWaVNF?=
 =?utf-8?B?bXRkQS9PdHNaQzgyOXE5UkNUUm83OWVPR3VtYlM5d05NSTBIZHRiaXdENWlX?=
 =?utf-8?B?dHFHYTJ5TEFoYzJrQzdyU0hDNkFEdUt4OHZNbDA4bjFJMm8vb3R2QTMvaUIr?=
 =?utf-8?B?ODBRVTJzalRGVHNYcEh2R1pHemZNOWFHR2JqOHpIU1dodVBYY2NsVGliT3hQ?=
 =?utf-8?B?aUR2MmlRZHhoTTNiY2tvU3U3Vy9Tcy9oRGJ2RVFRc0NESTRpRGNyYnhlRzND?=
 =?utf-8?B?elMxM01MUTEzc0svaHhldXg4WGc5TXRJWDdkRTF1aFVFOElPL21MV3BYOXl5?=
 =?utf-8?B?N0FCeXlSaSs4dE9oRWpMRU9tOFpoT0p6UytZTDV2VFg4OWxYcUMzOUR5dHhY?=
 =?utf-8?B?YU96UEtpcWNJR3BVcEw4V1BUa1Q0QUxsa21NRDlkMDFjc0l1UFZzYW9MbFJL?=
 =?utf-8?Q?odNMgFT+wKyF7rvegqTaL1rmN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a66e809d-c844-4c15-0cca-08dd7906691a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:37:39.9807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHZvxI4Mj3gj7tfQDBCPjasI3rnjG8OYIvVbvmAw+767VgwBuJdaT31MPCRYpGT+6DhSEhuXLbacq564WeePQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5959
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


On 10.04.2025 19:13, Michal Wajdeczko wrote:
> On 09.04.2025 23:13, Tomasz Lis wrote:
>> We have only one GGTT for all IOV functions, with each VF having assigned
>> a range of addresses for its use. After migration, a VF can receive a
>> different range of addresses than it had initially.
>>
>> This implements shifting GGTT addresses within drm_mm nodes, so that
>> VMAs stay valid after migration. This will make the driver use new
>> addresses when accessing GGTT from the moment the shifting ends.
>>
>> By taking the ggtt->lock for the period of VMA fixups, this change
>> also adds constraint on that mutex. Any locks used during the recovery
>> cannot ever wait for hardware response - because after migration,
>> the hardware will not do anything until fixups are finished.
>>
>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>    after querying; improved documentation; switched some warns to asserts;
>>    skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
>> v3: Updated kerneldocs, removed unused funct, properly allocate
>>    balloning nodes if non existent
>> v4: Re-used ballooning functions from VF init, used bool in place of
>>    standard error codes
>> v5: Renamed one function
>> v6: Subject tag change, several kerneldocs updated, some functions
>>    renamed, some moved, added several asserts, shuffled declarations
>>    of variables, revealed more detail in high level functions
>> v7: Fixed typos, added `_locked` suffix to some functs, improved
>>    readability of asserts, removed unneeded conditional
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c              | 48 ++++++++++++
>>   drivers/gpu/drm/xe/xe_ggtt.h              |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          | 22 ++++++
>>   6 files changed, 171 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index e7d474bd0cfe..d19878f6bd6b 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -487,6 +487,54 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>>   	drm_mm_remove_node(&node->base);
>>   }
>>   
>> +void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> you can make it static for now
> (and you will saved from writing kernel-doc for this)
yeah, I have to - this is what caused build fail (non-static without 
previous declaration).
>> +{
>> +	struct xe_tile *tile __maybe_unused = ggtt->tile;
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	u64 wopcm = xe_wopcm_size(xe);
> it's likely "wopcm" that requires __maybe_unused annotation

you're right, wopcm definitely needs it.

not sure how that may be affected by optimizations, but current 
compilers can probably tell dependencies of optimized out locals, so 
that shouldn't be a problem.

>> +
>> +	xe_tile_assert(tile, start >= wopcm);
>> +	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
>> +}
>> +
>> +/**
>> + * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
>> + * @ggtt: the &xe_ggtt struct instance
>> + * @shift: change to the location of area provisioned for current VF
>> + *
>> + * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
>> + * to represent allocations in range formerly assigned to current VF, before the range changed.
>> + * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
>> + *
>> + * The function has no ability of failing - because it shifts existing nodes, without
>> + * any additional processing. If the nodes were successfully existing at the old address,
>> + * they will do the same at the new one. A fail inside this function would indicate that
>> + * the list of nodes was either already damaged, or that the shift brings the address range
>> + * outside of valid bounds. Both cases justify an assert rather than error code.
>> + */
>> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
>> +{
>> +	struct xe_tile *tile __maybe_unused = ggtt->tile;
>> +	struct drm_mm_node *node, *tmpn;
>> +	LIST_HEAD(temp_list_head);
>> +	int err;
>> +
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
>> +		drm_mm_remove_node(node);
>> +		list_add(&node->node_list, &temp_list_head);
>> +	}
>> +
>> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>> +		xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
>> +		list_del(&node->node_list);
>> +		node->start += shift;
>> +		err = drm_mm_reserve_node(&ggtt->mm, node);
>> +		xe_tile_assert(tile, !err);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>>    * @node: the &xe_ggtt_node to be inserted
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index d468af96b465..4337a279ff3b 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>   int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
>>   				       u64 start, u64 size);
>>   void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
>> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index d2f6bfb3aacf..06f93bce2fa7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -415,12 +415,25 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>   				start, start + size - 1, size / SZ_1K);
>>   
>> +	config->ggtt_shift = start - (s64)config->ggtt_base;
>>   	config->ggtt_base = start;
>>   	config->ggtt_size = size;
>>   
>>   	return config->ggtt_size ? 0 : -ENODATA;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
>> + * @gt: the &xe_gt struct instance
>> + * Return: The shift value; could be negative
>> + */
>> +s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> this should be s64, right?

true. we have 64-bit value stored in config, so it makes no sense to 
limit it here.

>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +
> again, you're accessing vf specific fields, add proper asserts
ok
>> +	return config->ggtt_shift;
>> +}
>> +
> vf_get_ggtt_info
> vf_get_lmem_info
> vf_get_submission_cfg
> ..
> are all helpers for the xe_gt_sriov_vf_query_config()
>
> why are you placing xe_gt_sriov_vf_ggtt_shift() between them?
I placed the getter you requested just after the function which sets the 
value. Matching getters and setters is a well established trope.
> right after xe_gt_sriov_vf_query_config() there are some other public
> functions of similar purpose like xe_gt_sriov_vf_ggtt_shift()
> put it there
>
> really please be more careful where you place your changes - it's not
> the first time that your code is added to a random place, breaking
> existing groups of related code
will move as requested.
>>   static int vf_get_lmem_info(struct xe_gt *gt)
>>   {
>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> @@ -812,6 +825,89 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * DOC: GGTT nodes shifting during VF post-migration recovery
>> + *
>> + * The first fixup applied to the VF KMD structures as part of post-migration
>> + * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
>> + * from range previously assigned to this VF, into newly provisioned area.
>> + * The changes include balloons, which are resized accordingly.
>> + *
>> + * The balloon nodes are there to eliminate unavailable ranges from use: one
>> + * reserves the GGTT area below the range for current VF, and another one
>> + * reserves area above.
>> + *
>> + * Below is a GGTT layout of example VF, with a certain address range assigned to
>> + * said VF, and inaccessible areas above and below:
>> + *
>> + *  0                                                                        4GiB
>> + *  |<--------------------------- Total GGTT size ----------------------------->|
>> + *      WOPCM                                                         GUC_TOP
>> + *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
>> + *
>> + *  +---+---------------------------------+----------+----------------------+---+
>> + *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
>> + *  +---+---------------------------------+----------+----------------------+---+
>> + *
>> + * Hardware enforced access rules before migration:
>> + *
>> + *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>> + *
>> + * GGTT nodes used for tracking allocations:
>> + *
>> + *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
>> + *
>> + * After the migration, GGTT area assigned to the VF might have shifted, either
>> + * to lower or to higher address. But we expect the total size and extra areas to
>> + * be identical, as migration can only happen between matching platforms.
>> + * Below is an example of GGTT layout of the VF after migration. Content of the
>> + * GGTT for VF has been moved to a new area, and we receive its address from GuC:
>> + *
>> + *  +---+----------------------+----------+---------------------------------+---+
>> + *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
>> + *  +---+----------------------+----------+---------------------------------+---+
>> + *
>> + * Hardware enforced access rules after migration:
>> + *
>> + *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
>> + *
>> + * So the VF has a new slice of GGTT assigned, and during migration process, the
>> + * memory content was copied to that new area. But the drm_mm nodes within xe kmd
> "drm_mm nodes" is an implementation detail of the xe_ggtt

I assume your request is to remove that term, not to add a remark about 
it being the implementation detail.

We've discussed that before, I don't think I have to repeat my POV.

Will change though, it doesn't matter to me that much since the doc 
chapter was moved to this area.

> s/xe kmd/Xe driver

we use both terms in various comments within the driver. Let's be 
sensitive to purpose of requests during the review.

Will just remove.

-Tomasz

>> + * are still tracking allocations using the old addresses. The nodes within VF
>> + * owned area have to be shifted, and balloon nodes need to be resized to
>> + * properly mask out areas not owned by the VF.
>> + *
>> + * Fixed drm_mm nodes used for tracking allocations:
>> + *
>> + *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
>> + *
>> + * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
>> + * overlap; but our node shifting will fix addresses properly regardless.
>> + */
>> +
>> +/**
>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
>> + * @gt: the &xe_gt struct instance
>> + * @ggtt_shift: the shift value
>> + *
>> + * Since Global GTT is not virtualized, each VF has an assigned range
>> + * within the global space. This range might have changed during migration,
>> + * which requires all memory addresses pointing to GGTT to be shifted.
>> + */
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
>> +	xe_ggtt_shift_nodes_locked(ggtt, ggtt_shift);
>> +	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
>> +	mutex_unlock(&ggtt->lock);
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>>    *   or just mark that a GuC is ready for it.
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index d717deb8af91..904a600063e6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>> +s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..5ccbdf8d08b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   	u64 ggtt_base;
>>   	/** @ggtt_size: assigned size of the GGTT region. */
>>   	u64 ggtt_size;
>> +	/** @ggtt_shift: difference in ggtt_base on last migration */
>> +	s64 ggtt_shift;
>>   	/** @lmem_size: assigned size of the LMEM. */
>>   	u64 lmem_size;
>>   	/** @num_ctxs: assigned number of GuC submission context IDs. */
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c1275e64aa9c..e70f1ceabbb3 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_pm.h"
>> @@ -170,6 +171,25 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>>   	work_pending(&xe->sriov.vf.migration.worker);
>>   }
>>   
>> +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>> +{
>> +	bool need_fixups = false;
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +
>> +	for_each_tile(tile, xe, id) {
>> +		struct xe_gt *gt = tile->primary_gt;
>> +		s64 shift;
>> +
>> +		shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +		if (shift) {
>> +			need_fixups = true;
>> +			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
>> +		}
>> +	}
>> +	return need_fixups;
>> +}
>> +
>>   /*
>>    * Notify all GuCs about resource fixups apply finished.
>>    */
>> @@ -191,6 +211,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>> +	bool need_fixups;
>>   	int err;
>>   
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> +	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
