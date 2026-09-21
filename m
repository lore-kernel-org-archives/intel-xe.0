Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8A1C982DA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 04:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A306710E0DA;
	Mon, 21 Sep 2026 04:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCEB/vJk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAF210E0DA
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 04:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789966123; x=1821502123;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l02SgwvJ1arFEkPsfsgt7AF/JbJTKXtagtXt+QgD6is=;
 b=hCEB/vJkOJ7zCFdyyANP8najMRUYu3WYvC/oYrrqTYWJhyWyhlCgfe3b
 pA+cXbFFfulby4YEbxJBgQpT3zwVAjhsNhxRoSD4X1PoXcfQTmYJcgN4D
 ebD3FXvTLQoUObAxBU+7obxogCzS7AdFhhHxmDa1MzHYfuaA43EJZcRB9
 Ebm9vewdUEIPkqVKR5phwQQLVSLI+uPlm84JLlkqdyn/lGXGqnh7LPmuc
 nmiP766pBjn+ykcrFlezuCErJIro2WqPU03VZgpuEl+77pewjvySLEBPw
 d0PSgCL546tMJCGFd5wEUSbEwvBYXUkbnnDl8RjJuet5YVDBZKhXQ0ziX w==;
X-CSE-ConnectionGUID: 6tfZT+xISHixGiMtzD2qYw==
X-CSE-MsgGUID: DGDzzFpiQ5ae6OdNPraIYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89593035"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89593035"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 21:48:43 -0700
X-CSE-ConnectionGUID: eBz8514nTF+3cDpSSIzAMw==
X-CSE-MsgGUID: bSceJmFcTtSbQWq6qHckVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3496100"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 21:48:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 21:48:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 21:48:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 21:48:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGPmRXhqpjZInQc4wgC7Xm/cVNM9YXYWXIFwBgCDD/2oedORQQi0dI9szJFpnAqk+7XpFm5vVXNtJ83G4Kom7TmVmRgQ5/7alWX2HfbbJFQDzsHNm2IilyR5/a89sqVz7scJ6832K010y1UDUlEa1mBK3w71Q9pWSxyaexmv3yFRTmFtZ1bMhf34JwTgIsr3bb4s0FXRSH+Nj4CiVEB7okXJkeqoR1oDJlHHKprHkivEQoaueYBn8D2FQ2ioeOxaI/pqlspZCefMo6rnMOf4toFOncpghug9MJDB9L98Ul6fOPJCK+cx2yE99v+1TR2A1jNO1EJsUfn9EV9MZkU3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+GrntSaZ405C/PWlvL2Ta+rLa4lNe0kYhE63en+ndI=;
 b=SZfN23mAV26FYG8QLCWpxtf9oKxRF2XzFUP+DHmOygMtLyeYpah40IF4bbq2fUvenWnHMZ4eLee/RscBeg09WSk9vBTH3UVnowQ8Vy3Fuh0U7TCdM61wz8aQTSSsvp6XqzMdBnoqtZrSMZZ23oqhlsPMCoQSgvevsOxyzityVHZ+7drnpi74eW7vJLMjwEmbHFitKSMoO/oldMvDxZZ7oUlvZ1iBmTmqb+vRComrasXAn5Tcx8hxumfLlbS9ONZOVVAidIIDiLUDWwBFhPOuzdOn08j9OEZsdVUUTfsxa2lXuA95UZgLQBTagzTMFkk2fn9zDeax+lmWs190OlS2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by PH3PPF2CAD058EC.namprd11.prod.outlook.com (2603:10b6:518:1::d12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 04:48:34 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 04:48:34 +0000
Message-ID: <f785b014-5091-4aba-b239-e49a05896847@intel.com>
Date: Mon, 21 Sep 2026 10:18:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't wedge shared engine on stale faults from
 torn-down VMs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
References: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
 <aqRoWdaMm1VH1OW0@gsse-cloud1.jf.intel.com>
 <878c1246-d4fe-466b-a109-8e3f617ac546@intel.com>
 <7aaa165f-e426-4e05-9811-9aa96a48314e@intel.com>
 <aq16/9tdIZDDqN5m@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <aq16/9tdIZDDqN5m@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::17) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|PH3PPF2CAD058EC:EE_
X-MS-Office365-Filtering-Correlation-Id: d25dd010-0391-439e-cb1c-08df179b974e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|5023799004|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: g0KoM/4GbT6XscCPiu4XZm3cCf1IrKd9YU1bjzYo2pwaa+yzx80kqrIvEAhPHLOjzWIRIhGKHHPeGxl2ZKucUBrOYSXsOmAazsYYrt3h8ARTFrwtmkN90Nbc4dCPTPUPUSBrUNx4KaU9R2ipmdQKICsjn7cmFJZnv2MWsWA4GWFI8fOCJ7174WE5K3DXD7FT+Fgv4atu9mfrIsxriFs6Mr3G9Olz0H3OXYm1TTxcbhDT13F7GLpqljoIHb34b9spioD1Pj5EcYn2trFTSB0zynnL0d7RC4JLHCt6nGZhnxw+Fg35/SLLZyGK9XpOSaG8xIOWoXGz1mTb0suGcGF001Y64yjlCfdUANtfBIuasD/hZCTQb8D3wunKjHK5EUxu5PbwBQfTQ2mc553DVeO5D96RAT+LTWRQbKaZtqg7nq2vVgKt1Suf2ybjOSvHvBdNKrJrvuV4sYYXJiqOMAmoIz8kyHw2yhBPkpFxIDOjSlWqD017xwMG5GxedsHQoS4hjujWKi4nNxhHpElkiNHllc1Qz3ZeG3Qg1I42vyJ7rJLaBjmaM7mo5XGPu37d563vnylwDhkORK2kPVWaT95d6wYBchLf/ZFSasu9e0lQ9RHOgcG/Vw6GNhL47l9h7OE4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(5023799004)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0JDSFBDN2svUFJSZm1Hb0FwZjcyWWN1ajVIYVhWK0RPYU9VTmxNKzVSZ0dP?=
 =?utf-8?B?dG5GQzlvS21sTUpwa0VhaDg3aC9SVU44aHluTmt5Q1Zhb0h0TDBEYWwybnln?=
 =?utf-8?B?NmNPaHFPM0xHbmZLVXFrYnZPRGw4WUZWc2pUSDVkNzFySmpLNWJBL0NBU3ds?=
 =?utf-8?B?YmttZHV5c21SNkFCQzgzWWRiUlJ4ZFlQK0pleEx2cVV0ajJBUVVnZVlIT1F3?=
 =?utf-8?B?NGFBK2UvWWplUW1rK0hsb1cyS0dmZThxNjhQMlV2L2Y3dFRyZ0Y1VDAzaFlX?=
 =?utf-8?B?WFMvenRlTWdYQStHOGl0NCt2eUNwVWUrQTZKRWNEZXluT3NMUjkydmhRd3lU?=
 =?utf-8?B?V1NSMmY3Y0xUUk5BZ2VvdVBPYmtON0JsQVlVR1hHNnRpRnNrNjNQdCtYdmZR?=
 =?utf-8?B?MGs2WXNJaVNzc0k4eWVCZ2tjRmduRkdZSklNVTY5WjlKS2NOaUFLam1NMWRH?=
 =?utf-8?B?SnFHK3NmMEkwMjRYclp0ZHlQMnQ3T1htQW1OTmVWVzRlZWR2TkxzOEx0ZVVO?=
 =?utf-8?B?VGhEVXJuc0VLQ1MvQ2dqRnVKSjBwaUpUK0xqNVE2c3ljNUpTbXdlZE1icXlt?=
 =?utf-8?B?QjI1TEtUeUM3Vy96OWtpTWJYR3ZuVkhjUEJHOStldVZnRVl4Qlc2WTl4OTVY?=
 =?utf-8?B?Z2dBaW1iOUJoc2FabjY5RG5LMzZ6dlNHM0ZYL3ZhbE9XN3BOUWFVYklMVnZY?=
 =?utf-8?B?eVFwVTFBdGE4NlhMaXYrZ0RJMUNkR1owZWdLQTZINzVhUlh0WVhkMWVNWTBP?=
 =?utf-8?B?Y3pLYU1VUUNnZGNxOHdVWHAzWEVRc0tQbnlEMlVxcVZkc3NpdmZld1JxdUVz?=
 =?utf-8?B?clVOUmNOMCsxNy9leXZnNXVsbUhET3dmRGhWbFkzV01SZllZbVdmb2R1SSs2?=
 =?utf-8?B?eklrdkk0Zi80b1NLS2lPMVVsQlVoR1N4TFVKbzYreWRoS1N0QzVITkk1QlpQ?=
 =?utf-8?B?QzBXeFN5RjdHQTA4UnpTQm8vNG5QRENEd0JQOXljQ2Y2TXVYeUNXYjFnell6?=
 =?utf-8?B?QUF0TjZEVjhITjk4S0IxbjFtcEFrMHU5anJKcHdJeGxzWW1nVjVFWTFXZnhv?=
 =?utf-8?B?QzNWbFRQMDJBUVJQR2cwSENKd0FSOUg0U1BJRy9vOERFdWFpTndVR0YwV1ZN?=
 =?utf-8?B?Qm1tc3VXVXczaVBPdFhWS2FOTGFJZmtTbTVLS1pMcWgrVW01NW5sRXVzT3VP?=
 =?utf-8?B?R2pra1ltUGozdTA3WStZckJEeTlJNzVnd3hPREh3WjRVbng1MmppTWJOdEp5?=
 =?utf-8?B?UUJ6RTNGYWY1TzU1dmpETitNOWViemhuWDJXeGpJOUZUV0hRZzNkYmJSK3I3?=
 =?utf-8?B?aytUdHd2VFg4TlRyQzdJUE15NEVxQTJpcE0xOENjQUp6NlFtdWlXZHA2T0ps?=
 =?utf-8?B?VFlvUlpiQitYWTR2RkJZcEFnNFNCb1VKM3krWTh2MEUvUVpyL21pcFg0Mngy?=
 =?utf-8?B?eUdDOWg0dytPVklzaWRlUGdxTUR2TGx5MWl1MWxUL0h6N2Jrblc2bFluV2Qr?=
 =?utf-8?B?Q3h3cWV5cUxhOGpGdlR5ZnN6dTUwUEQ2eEY3K2UySzNDUmRUL2tXQnk0bklv?=
 =?utf-8?B?L1NvNWNMVE1KSmxGRWd4eWNVQTFYdnNZQWdQSFRiSG9hUTFEVG94a2hvUXhY?=
 =?utf-8?B?dmRsazdmV0Zqa001ekJRT2E2Qkl1eXFjd1dLRjFCVWgyUDBMWmxTSnFSenNI?=
 =?utf-8?B?WTdIWExwOElXR3pQam1xd3gyaWNYWldQSWlJajlsbFVxUlNvSjZ6QnJyTlNH?=
 =?utf-8?B?OEhiUzFIaXdTMFNTbXdVRDZ1eTdRUGpMeTI0NWl3TFJLWTBXTVpzd1lkMmgz?=
 =?utf-8?B?L0RTdXVzNmhFYmlQbUpNNFh1NUVPMlpySjJCdm9rdFRYNkdKamk1d2VIRlR1?=
 =?utf-8?B?V1ZrbHN6VmVWRjdndlJJOHRqQ01WNXNxNjZHbm90cnA5QTRkbVFoNFFMc2h0?=
 =?utf-8?B?dVczVSt5WkE0TGtRc0Y3cHdROUViS3cxaHRIZS9YL3NXMnFibktzMDJEa3dS?=
 =?utf-8?B?a2Nwd2UwU1RxZWtiLzg3SmpaamV0YzZOQWsxWmUvVG4veE94dlZIbjZzZ2Rz?=
 =?utf-8?B?Tmk1WHprWkJrMFRVc3RwRjcrQklKby85QkEzemw4RkY3eTJRK2w4UXpFYXV6?=
 =?utf-8?B?SmlOdjBDTnNBOXUxS1p4N0FJV2YyVmRPaEtvMWRRSnljZStiOHVQNjlVVStQ?=
 =?utf-8?B?bUxzTklqeUFMU05xNTB4cG54aEY0aXNtVG5NUFp4aERVUERpY2pTL2ttS2Nt?=
 =?utf-8?B?M05uRjUwcmxGNlFBOWFLalpuSnZpSWNxT1pseWtrREt5cW5LWWMzVFk5Sm5N?=
 =?utf-8?B?Q2dGemFHWUhLYkRmMDVLaEhYdEJXV1lEVUdiWU11dzhCNy9QUm5wNnVqVXhl?=
 =?utf-8?Q?/eFNXtGPFdn0+pqY=3D?=
X-Exchange-RoutingPolicyChecked: fTWgzqyFd9DJSv0Uq73LdgBppzPfx4TlWv12mIAa/gCPTlAKgxOip/X1E9wVIq4tN6WkXWpZ4otFjVxcxSqSQYkRZCWCThAWFrYRJUu6tFmHpNvpQ9kxyIkzf67rU6QCXTWW5MiLTE/cC86cPRCh6e9yDb9GUJPbgXNo+TbBozkR0mqL6IlGjOJmGbzuy463F19ejrx9Nta0jpR7G/a/xj8NogC28wnYTpTjyGreJL7hCyOSMzEC6fbLGwwdeMtjz+TqCd1Nx58RQjGAUGEiLuwtQ7XRYh+z/NyInJq2QxFEGyxVLXkScohziv+WGi51/TCds/T+GLF2Vd8tF5HS0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d25dd010-0391-439e-cb1c-08df179b974e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 04:48:33.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBOFnSrmMRTFlqiBMDJzi6wcbRJmXCONzkZJf+PMKHEy/vhiCKkUq7heiV5b4T7MC6fNo1smEc2yp1CXFdPlhWCTRakifNw5Sn4yoH2Wpko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2CAD058EC
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


On 18-09-2026 23:25, Matthew Brost wrote:
> On Fri, Sep 18, 2026 at 10:45:24PM +0530, Yadav, Sanjay Kumar wrote:
>> On 14-09-2026 16:05, Yadav, Sanjay Kumar wrote:
>>> On 12-09-2026 02:15, Matthew Brost wrote:
>>>> On Sat, Sep 12, 2026 at 12:53:01AM +0530, Sanjay Yadav wrote:
>>>>> A recoverable page fault generated by a process's completed migrate/BCS
>>>>> work can arrive after that process's VM has been closed and its ASID
>>>>> removed (abnormal exit while GPU work was in flight).
>>>>> xe_pagefault_service() returned an error for such faults, which is
>>>>> reported to the GuC/HW as an unsuccessful response. Repeated
>>>>> unsuccessful responses eventually escalate to an engine memory CAT
>>>>> error. Because the migrate/BCS engine is shared, that CAT error
>>>>> wedges it for unrelated processes, which then hang on their own
>>>>> copies.
>>>> Yikes. Do you have a reproducer for this? I wouldn't expect this
>>>> behavior from the hardware, as it appears to violate the expected
>>>> process isolation contract.
>>> Yes, there is a reproducer, "l0-abnormal-exit-repro", in GSD-13290 on
>>> BMG. I have also attached the dmesg logs
>>> in the GSD from the drm-tip kernel, as well as from the older 7.0
>>> kernel, where the issue was originally reported.
>>>>> Detect stale faults whose owning VM is closed or whose ASID no longer
>>>>> maps to a fault-capable VM, and drain them instead of replying
>>>>> unsuccessful.
>>>>>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Stuart Summers <stuart.summers@intel.com>
>>>> Fixes, CC stable if this is an issue.
>>> sure
>>>>> Assisted-by: GitHub Copilot:claude-opus-4.8
>>>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_pagefault.c | 22 +++++++++++++++++++---
>>>>>    1 file changed, 19 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
>>>>> b/drivers/gpu/drm/xe/xe_pagefault.c
>>>>> index c82b8bc8bc70..2827652ab8a3 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>>>> @@ -238,8 +238,10 @@ static struct xe_vm
>>>>> *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>>>>>        vm = xa_load(&xe->usm.asid_to_vm, asid);
>>>>>        if (vm && xe_vm_in_fault_mode(vm))
>>>>>            xe_vm_get(vm);
>>>>> -    else
>>>>> +    else if (vm)
>>>>>            vm = ERR_PTR(-EINVAL);
>>>>> +    else
>>>>> +        vm = ERR_PTR(-ENOENT);
>>>>>        up_read(&xe->usm.lock);
>>>>>          return vm;
>>>>> @@ -260,13 +262,27 @@ static int xe_pagefault_service(struct
>>>>> xe_pagefault *pf)
>>>>>            return -EFAULT;
>>>>>          vm = xe_pagefault_asid_to_vm(xe, asid);
>>>>> -    if (IS_ERR(vm))
>>>>> +    if (IS_ERR(vm)) {
>>>>> +        if (PTR_ERR(vm) == -ENOENT) {
>>>>> +            drm_info(&xe->drm,
>>>>> +                 "xe_pf_debug: drain stale fault (no VM)
>>>>> asid=%u addr=0x%llx\n",
>>>>> +                 asid, pf->consumer.page_addr);
>>>>> +            xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
>>>>> +            xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
>>>>> +            return 0;
>>>> Won't the page walker hotspin on faults until the executing queue is
>>>> descheduled from the hardware if we successfully acknowledge them? That
>>>> doesn't seem ideal.
>>>>
>>>> Matt
>>> agree with your point
>>> also with this patch[with_patch-752845-fix_run.txt attached in GSD] from
>>> a 1.5h run (3,373 torn-down contexts)
>>> 95% of ASIDs re-faulted exactly once before being descheduled, 0 CAT
>>> errors, 0 hangs.
>>> So the existing async teardown already deschedules the context within a
>>> fault cycle or two.
>>>
>>> can I move it to teardown wait for the ASIDs queues to deregister and
>>> drain its pending faults
>>> in xe_vm_close_and_put() before erasing the ASID, but that a larger
>>> change. Happy to change either way.
>>> -Sanjay
>>
>> Gentle ping
>>
> We have actually discussed this quite a bit, and you are not the first
> to complain about it. I agreed on an acceptable approach in this
> thread [1], particularly in this comment [2].
>
> I haven't had enough time to implement and fully test this solution, but
> if you or anyone else wants to take over, my latest version [3] can be
> used as a starting point. The idea would be to implement [2] on top of
> it to serialize queue teardown before tearing down the page tables
> (xe_vm_close).
>
> Matt
>
> [1] https://patchwork.freedesktop.org/patch/732703/?series=168398&rev=4
> [2] https://patchwork.freedesktop.org/patch/732703/?series=168398&rev=4#comment_1349875
> [3] https://patchwork.freedesktop.org/patch/748380/?series=168398&rev=6
Hi Matt,

Thanks for the reply and review comments.
Arvind’s series[1] appears to implement similar handling. I will use 
that series as the fix instead.

[1] https://patchwork.freedesktop.org/series/174252/
FYI: Arvind
>
>>>>> +        }
>>>>>            return PTR_ERR(vm);
>>>>> +    }
>>>>>          down_read(&vm->lock);
>>>>>          if (xe_vm_is_closed(vm)) {
>>>>> -        err = -ENOENT;
>>>>> +        drm_info(&xe->drm,
>>>>> +             "xe_pf_debug: drain stale fault (closed VM)
>>>>> asid=%u addr=0x%llx\n",
>>>>> +             asid, pf->consumer.page_addr);
>>>>> +        xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
>>>>> +        xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
>>>>> +        err = 0;
>>>>>            goto unlock_vm;
>>>>>        }
>>>>>    --
>>>>> 2.52.0
>>>>>
