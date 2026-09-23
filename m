Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC86FC98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 15:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691D910E92C;
	Wed, 23 Sep 2026 15:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljFzvUaI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E3A10E92C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790178572; x=1821714572;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YZCG9nFbbS5jamLe2KIkYTR3mxc26sFV5vurQ/M2f4k=;
 b=ljFzvUaI9/MScGJFs5i/d29CvfRN3ZnkRg02i45e5N4YOFbdtCz20Qnw
 WX12H95ojQmfnfBmWzGoZkLiR7mAf8mr84hpXqXSr5S2Wx+sRorEJR726
 HViO88R8900O+gaQwMNAIJVNWVJnnscsMYIK4na2KrOhLUMQk9hH6dHdK
 jpCc3KKdUTwdSv08KCWRx19IG1ubbgEffQcasAI0z/EKUDinwpzMv8KwF
 6VmzvsGX8L864i6x6y2qJJjVJXMjxAMPPr6X5UhlFo5sWTZGGy32y3Ipw
 GzBILgh9smTKUiilTZWTnwQc6kxRXDb5otsZfQwXHE+wIcwRpy3TtFjVT w==;
X-CSE-ConnectionGUID: YH2/kUb3TKaAjOTGBN772g==
X-CSE-MsgGUID: U5y0/O4vR7CqITZ5Sr0SDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93389374"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="93389374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:49:32 -0700
X-CSE-ConnectionGUID: OsM0ZsFVTvqgVaayBcHCbA==
X-CSE-MsgGUID: PB9ozTUzR9CP8DlBC9PnNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="301601076"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:49:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 08:49:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 08:49:30 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 08:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xH5o765p/AYOVXPYNpxGMTgGzWXnntjk6edKq1qQsiiMviIMAEkJJBJsbREAeuGJB/LR6EGJgwnjzdZM2QOpQQUYOf2XoIu6s8obHlqTgvQjjEiANCocW6o1FnGQkalLLSnXpEOiLES4iYUo23bSnaTWjhfQyczZjmaXC6fTwsX1N4LUWZzGoSNXGCThyD2buX07H6v/9yzfpSoylhon9b4OHY3qJzxlWqIRTg5YxhKzO6C7r++lMMCtpBJoue+83xaSyzpXGODXQpd2T7zU1ptpA6stUNJ6DVwNTo4ViKxj5LDyROQW0mqAfi+ZYW/vDBejrmfeBel48fL0RImD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9g5h/9VdYp+7ycjsAwHXu3RZ/jaevOKcgk1q1et8X7Q=;
 b=bP8DfeB2AVw+QU/uMoSK4cyNgM/hKiyTaXNRaFsBc4fuMV159UnqC7JM7WD5k9rFrzs+WsADg5Y8pE5h09Qh8q7HfFv6wpDZZjBn5tWppTitXJap+b5Rlx0oEXg4HI/0G9rwzVxzfAafKiGjnw3ntI+riTKF+f7SZIy3h1EYrQvm+j6883BmTFFlEdI2L+do+4tpboA+pNibxLaxJezd05pzGLEBg+Zs6XdhUS8Eaoe2CN+XQPW+la62+yN8dg2148Y20BWN1tfstTh7TdwydMCubYwlhLUOC3dzaCw702H98hTuG4Wq40uC5PlYupvLuAroB7Wua9MW131NvLN0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 15:49:27 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 15:49:27 +0000
Message-ID: <052a4e3e-8993-44ec-842f-a500c5268459@intel.com>
Date: Wed, 23 Sep 2026 21:19:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/hwmon: Detect unavailable temperature
 sensors
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-2-karthik.poosa@intel.com>
 <aq0HHDqoXxXFlsam@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aq0HHDqoXxXFlsam@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a9d5d7-ff6d-4657-ab6b-08df198a3f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: ij+/2IyF8ANzj/WY9wwDygOaLOD5kbH4SLEOHVIvAEdcqVIAaUp9DT1M3efzgiNx3OAmqSOwBPKOwmlOJQFSZVdIM129c3K9srhlLtJSuBBy1nPQm2q2/31mr423/fD5jzALDJZkIK2BmGdi03p+LQ55kVDDid5BS8/Oz6RtYVGkkXh8t6nwhcNFFB6hb80K1w0K9AzLQBAQFejxhynkQMG/+tuaGa0UCuvQKJYlgCasW6BpCeVGj7xY4x4HPT6bf1jHcNCaVrvkpGxEvypMIQUsNSGUJR6IecTKTZ33b6sC8vDSc//ivqP3KTf7q4suKynN51MljwCDbV1FdWY4AmAVYATanfvzuzyKgvRxNC1WviwuLGONf/0Q+v+0DfHJQhrVSQNBqJMrl7RT540FBBCi+UTtPMi4UNwKcivgr7GLV9D6iYsqYqO+IaY+AAyx0uc+vWLjEiVtJkg3t28/Ge9ndkWf7GdNchh1EOUAONVhy3sXKf69pylC102ZkySAbSzysTUZ/IjIS7YrchEDLOytxSOPrphEjZVgKKtLmhLeJVEE/I5m8dfuyQCvrnK2XfKb3M82y37UYoJlvRoGUy380EqzsaT25gFtARlyd6HD2CIBpoaPg63qniV1zKPdF25VrpDGIDhVYKzTdYWgF+9dWRkpmth7UmJ1p8QkudE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emNFQmJkdVRWUVdnRmJxTHRuamNPdjM3UE43TFh6eDhmUmFuMFk4VjBFZEc1?=
 =?utf-8?B?RVZ5RVROcVZZTkFnNjhKbXp6cHRkRU54RzNvSC8raldiek1RZ0JVNmtNbndk?=
 =?utf-8?B?RWtjdGJiWnVGQmFuR0E0ZW5nREhzeXg4dmcyaFBQRnNSeFUwUWVWVGk4VXVq?=
 =?utf-8?B?cnZYSVNCaThXMW9vOERTQzFJTE5tM3l3N0l5OTNnZlplQ0FLU3BpbDNkajI3?=
 =?utf-8?B?QlJWSndpTHZvME5PdXo3Nmgva24wOTNXdk9oRE4wNGhZV1V4VUExWW5LY2M5?=
 =?utf-8?B?aFl0SHcrUGNNTk9aeUJsVVhheWFqVzFSbE1WUzVUdFozNjluVXBsWEtmem1w?=
 =?utf-8?B?TzlqT0lhZ1MzRTRhYUpKYnRQNEx3ME03U1BNM3BBQ0RhcGltN1BlbFptUS9y?=
 =?utf-8?B?OVBUVy82cjFDbm5JWWNBbXAvdE5mYXpZQ3BhOTJxM09VNjBKbkE4ang2U2Nu?=
 =?utf-8?B?QnFXcHdyQm15WlVoVWRvRTA1Z3hxTnhMVExFOEJYNFhib1IyK3p4aUNBZEp4?=
 =?utf-8?B?clBJWkppalBXS002S0hsUmIzV0tHdktpLzZuOGFYQVFEeEN6dHdsMEZtMUs1?=
 =?utf-8?B?YStyZWhIL3A0Y2ZSeHZ4cTJqbDI5Tk5Cdko2UTRSTUFjcUxnOU1iZmd0cDRx?=
 =?utf-8?B?U2R3L3JTUU80bDhYOXl0a0JRamJSS01UU2R6YzZwM0FZV0YrbUR4djRzK0No?=
 =?utf-8?B?SkJOb0lxZjdRbWxlQnI2TGdJRGFCd3lwNFZuVVZCaEFUWEFoNEM4bk5sb0VL?=
 =?utf-8?B?STJrZUZ5a2lyS0dLS2NvTFdEQVh0OExCakhBVzFub0o5Y2IwWHBMWXVMaE5w?=
 =?utf-8?B?bHRmWnJnQ0hZWXBucUlzR1RFdWh5SmUrckJGNmxDb2NXN0tHMkt3Ny9hWk1u?=
 =?utf-8?B?OGc3MWRUeUhVNVg2MGdHNEs5bGVhdnZSK2tkSThFU1VDalZybE1hblovcDZB?=
 =?utf-8?B?Snh5Wk9sRzJQZUR4bmJuTk1LL3pZSFZhVURnT1Z0d2hIcHlidGpmYXg2dnI0?=
 =?utf-8?B?VkFZVk1QL09XS0FLOFJBaVd3L0JSUTBXRWhIV2VwRUllYXpacUxSN2N2TGla?=
 =?utf-8?B?NktpQitvL3dHYWNUVE9qU1pTYXk1V0YyK3JsYmxZc25USmI5WkNZbktlczNN?=
 =?utf-8?B?MHl1dzhWMncrYmFob0U5MEg4YUZYeTByY3M3RitNU1BLdjVmV0xYelJDTGdv?=
 =?utf-8?B?RjEwYUtwamU2MFBOTnlib2gyU2pEVFdXclJhWkVVc3JYSGEraTY5cDV3NGtU?=
 =?utf-8?B?dU9jSzl2NUFTS1Iwc3hlcVR4Q1BENTlVSmhTMTZnRG5tVVlZTEw4UzNrVmtr?=
 =?utf-8?B?V1lSWVkxTk9MNXRKWU03T0FYSG41aGZ2cGVuYlpTTmFqVmxtTnJ3L09mSG5O?=
 =?utf-8?B?TmNJeXJoNWtqdDQ3ZmM0ZjdCWjBlVFdTcnk5WUxURTFFWVZVRk4zcU1RWHMv?=
 =?utf-8?B?ZURpSDEvRk9Ncnd5c3VBTFNiK1hKdXJ0MDRSZXRTUkRCVTVEcFpoK3lYbjRj?=
 =?utf-8?B?b1o3Nlh1a3JJdEF4cWRkYitaaSt4MUpwT2w2Wnljd1JvSnl4bjBBWU1vRjdz?=
 =?utf-8?B?OUdEenNiYzQ4Q1p3NU51SUF1MVh3YmlmOXdNZGw5ZVk2eXBGM3FFVHlRK0Rj?=
 =?utf-8?B?V2E3Z29wbFNHMmZVSTNTR3lZZDNZVXdTQ24yNnE1QWxEM0VwZ3FpV2QvYWdD?=
 =?utf-8?B?NXJLZFNwZldvTmJSZGdBWnp1cWJSMXE0Qk9oNUtMM2ltTzV2THR6SFdDTWdo?=
 =?utf-8?B?a054UUs1S0xMb0VhdnlqMTU1UnpXaVMveUZJVW8yeEpSNk8xWHJtYktQanlv?=
 =?utf-8?B?Uk9zckRGV3BkTVRuYmIxZCtqWUNpanA2Uy83R2NPcmdRTGNxUkkyT0F5cVhZ?=
 =?utf-8?B?NmZ0VmJCRGtpZ01GZzBzaGhqSy8yLytKTXdyU0pPOW5qSy9pRHFSUERGL0R1?=
 =?utf-8?B?QVFlMHFYdzRLeTJpNDBFM0VqZ0MzRFpXU3IvQmVPKzlJWUx6TnlCQ2JsMkth?=
 =?utf-8?B?cVVMK1ZHc3dvM3FYd1BEL1g1QW9yUEpkakd3eEJCT2NlUXF2ODlSR3czeCt3?=
 =?utf-8?B?eVMxb2pBOXFFQmtsbFluSFVYMU9MUkNmYVVqZkZqSEFMUkxleUU3NUdYYjVt?=
 =?utf-8?B?Q1c2cFU1N2RjUzZWVnpyT0NSNGsvS1k5WDR0NkpsTW16UGRUZy84cjdOKysz?=
 =?utf-8?B?cDBTeXpCL3llclZtbEhSVWdpYk56S29YeUJzNjVrbm9qbmNWVjVCb0RCMEtM?=
 =?utf-8?B?RC9QS3AzQzRHTE0yemxOVGpJV2JkZEdDb0NQSXlMZnBXRG56OEloM0ZUWkRj?=
 =?utf-8?B?TjNOdVY3dW1kbG5Iay9CWVU3WWVaQUVtaWl1UDNOR1BZS3dYTFRXUT09?=
X-Exchange-RoutingPolicyChecked: xI5GQDjCKy5UiO8Zoq/AaWhpnkIYdBQXNLNIAbCQsJlIonp4uZ99+0IjL7p+/WFpLFDKGJ9HzTWAanuYj5TX/jWZnfZetFg1VL/NEdkVJ3gpJt2ieu2hPDtH45C1CY68Pg2hSOkHPmlpsMOXkBFBwRIp/Rt0mQcFQhG+ajULRVbMtmk/PJKnVVlVlPr9DppoCNCLJlivyVyKPeQHnNuYvwr1vwNtAsUoU1riaBuSuC0BwW72df+9dzVk9tnL350YIfRwGu4eDXzf38+HsXcgBs3xQUl30SwFABmlnqnAcrsANnu9dUo18HCjrPUA6nrXuQHhFYbfzkO4pqUwo84CMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a9d5d7-ff6d-4657-ab6b-08df198a3f81
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:49:27.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U4la9SZNwS2D04xNJYD2QR3e3CUkxPEYmHkhyBzFQX0dYQTQEBRCNXguuP+D5/rPRDMZjMtDpyhQtWi1cjWjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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


On 18-09-2026 15:10, Rodrigo Vivi wrote:
> On Thu, Sep 10, 2026 at 11:57:52PM +0530, Karthik Poosa wrote:
>> Add is_temp_available() to validate sensor presence.
>> A temperature reading of 0xFFFFFFF on MMIO and 0xFF from mailbox on CRI
>> platforms indicates that the corresponding sensor is not present and
>> should be treated as unavailable.
>>
>> Use this check from xe_hwmon_temp_is_visible() callback so that attributes
>> for unavailable sensors are not exposed during hwmon device registration.
> I'm afraid this patch is doing much more than what stated here.
> Please split this patch into smaller sections.
> It is likely regressing older platforms becuase it is hard to spot the
> differences.

Sure will split the patch into

1. Add helpers to validate thermal sensor readings
2. Ignore unavailable memory controller sensors and PCIe thermal sensors
3. Consolidate temperature sensor availability checks

>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>> v2:
>>   - Address review comments from sashiko-bot@kernel.org.
>>   - Address review comments for Badal, Raag.
>>   - Update is_temp_valid() to check values based on mailbox or MMIO.
>>   - Add is_temp_is_visible().
>>   - Update is_vram_ch_available() to is_temp_available() to check if sensor
>>     is present.
>>
>> v3:
>>   - Rephrase a debug log.
>>
>>   drivers/gpu/drm/xe/xe_hwmon.c | 100 ++++++++++++++++++++++++----------
>>   1 file changed, 71 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5284cab6703d..faed2f5da394 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -813,12 +813,20 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	return ret;
>>   }
>>   
>> +static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u32 value, bool is_mmio)
>> +{
>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>> +		return value != (is_mmio ? U32_MAX : U8_MAX);
>> +
>> +	return value != 0;
>> +}
> first of all, please use 2 separate functions for this.
> second, you have a bug here and the mailbox logic is never protected s8 is passed,
> so U8_MAX will never work.
>
> LLM suggestion:
>
> static bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 v)
> {
>          return hwmon->xe->info.has_mbx_temp_sentinel ? v != U32_MAX
>                                                       : v != 0;
> }
>
> static bool mbx_temp_valid(const struct xe_hwmon *hwmon, s8 v)
> {
>          return hwmon->xe->info.has_mbx_temp_sentinel ? v != (s8)0xff
>                                                       : v != 0;
> }
 >

Actually mailbox temperature is of format, bit 7 i.e MSB for sign and 
bit [6:0] bits for magnitude.

So s8 is not right here, In this format, 0xFF represents -127°C, not 
-1°C. I shall correct this.


>
>> +
>>   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>   	u32 *dword = (u32 *)hwmon->temp.value;
>> +	int ret, i, count = 0;
>>   	s32 average = 0;
>> -	int ret, i;
>>   
>>   	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>>   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>> @@ -828,11 +836,23 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
>>   	}
>>   
>> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
>> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
>> +		if (!is_temp_valid(hwmon, hwmon->temp.value[i], false))
>> +			continue;
>>   		average += hwmon->temp.value[i];
>> +		count++;
>> +	}
>> +
>> +	if (!count) {
>> +		drm_dbg(&hwmon->xe->drm, "Memory controller temperature unavailable!\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	average /= count;
>> +
>> +	if (val)
>> +		*val = average * MILLIDEGREE_PER_DEGREE;
>>   
>> -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
>> -	*val = average * MILLIDEGREE_PER_DEGREE;
>>   	return 0;
>>   }
>>   
>> @@ -852,7 +872,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>>   		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>>   
>>   	data = REG_FIELD_GET(TEMP_MASK, data);
>> -	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>> +	if (!is_temp_valid(hwmon, data, false)) {
>> +		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	if (val)
>> +		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>>   
>>   	return 0;
>>   }
>> @@ -951,19 +977,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>>   }
>>   
>> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> -	int vram_id = channel - CHANNEL_VRAM_N;
>> -	struct xe_reg vram_reg;
>> +	struct xe_reg reg;
>> +	u32 reg_val;
>>   
>> -	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>> -		return false;
>> +	switch (channel) {
>> +	case CHANNEL_PKG:
>> +	case CHANNEL_VRAM:
>> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +		reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> +		if (!xe_reg_is_valid(reg))
>> +			return false;
>> +
>> +		reg_val = xe_mmio_read32(mmio, reg);
>> +		if (!is_temp_valid(hwmon, reg_val, true)) {
>> +			drm_dbg(&hwmon->xe->drm,
>> +				"channel %d temperautre unavailable, val 0x%x\n", channel, reg_val);
> typo
>
>> +			return false;
>> +		}
>> +
>> +		if (channel >= CHANNEL_VRAM_N)
>> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
>> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
>>   
>> -	/* Create label only for available vram channel */
>> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>> -	return true;
>> +		return true;
>> +	case CHANNEL_MCTRL:
>> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>> +	case CHANNEL_PCIE:
>> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>> +	default:
>> +		return false;
>> +	}
>>   }
>>   
>>   static umode_t
>> @@ -973,14 +1019,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>> -		case CHANNEL_VRAM:
>> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>> -			return hwmon->temp.count ? 0444 : 0;
>> +			return (is_temp_available(hwmon, channel) &&
>> +				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
>> +		case CHANNEL_VRAM:
>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> -			return (is_vram_ch_available(hwmon, channel) &&
>> +			return (is_temp_available(hwmon, channel) &&
>>   				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
>>   		default:
>>   			return 0;
>> @@ -988,14 +1033,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	case hwmon_temp_crit:
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
>> -		case CHANNEL_VRAM:
>> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>> -			return hwmon->temp.count ? 0444 : 0;
>> +			return (is_temp_available(hwmon, channel) &&
>> +				hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT]) ? 0444 : 0;
>> +		case CHANNEL_VRAM:
>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> -			return (is_vram_ch_available(hwmon, channel) &&
>> +			return (is_temp_available(hwmon, channel) &&
>>   				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
>>   		default:
>>   			return 0;
>> @@ -1003,7 +1047,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	case hwmon_temp_max:
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
>> +			return (is_temp_available(hwmon, channel) &&
>> +				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -1012,13 +1057,10 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>>   		case CHANNEL_VRAM:
>> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>> -								channel)) ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>> -			return hwmon->temp.count ? 0444 : 0;
>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> -			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>> +			return is_temp_available(hwmon, channel) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> -- 
>> 2.25.1
>>
