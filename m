Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4143BC54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF33D10E5C3;
	Tue, 28 Jul 2026 16:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPWbIXYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F422010E5C3
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785256279; x=1816792279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4ArKnUK80DVq015PAFnJkTDMtNCz0eMHYUVp7GPWwIk=;
 b=lPWbIXYY++9ZKH60BS6VPE8OSAmg+xunLy8tWYxFttMofoKj3Yp4wA+5
 SxkoJmJehyWdA1nFZR0ZmKdMAbWmnWgoFln1+Mpp3QOUJ3ciwDWyfiP+k
 b3IfrheechaVqQ0/D6LtCqrheYtqvp81/qv1dXjBNFcZEniFpffGo0nZA
 bDa7JDCFR72w3c8GR+qrI/7NhHRfQQ5GyFQLAtjOKQ46tulr5+u7zg2JH
 JPrDv5d2w429BKgzp9B10XtryeqPK7wXx1ql/yUwVjVAC0/+iAI53+c2c
 mzedkW4hFV8lfxHJfyYxBhHwhuluMI+rJ1DPDvoN7D69EJR36WHEsbA00 Q==;
X-CSE-ConnectionGUID: HW+cv2HUTkqBmpkkn7Umtw==
X-CSE-MsgGUID: y62+GnJTQY2ufVdEHx88cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85929080"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85929080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:31:18 -0700
X-CSE-ConnectionGUID: sTW62/DATZKoyM7vOR40wg==
X-CSE-MsgGUID: HGPzyLlXSb2O0xXvRPzRnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="264048353"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:31:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 09:31:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 09:31:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 09:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwxj9sRxbrh1vzshAPMMIRrP7C1kOLY1BL4PdooYRFcZu1fR66DjDIBc2fwy6AeyBu+0lSKohOGRTjcT9bknsncDgzRh9wG9gB6Kt78ulN7UD0HvOqVP1RXbg4UYxGHFi67JcqgZ/AjS/HipjBK5sSgAQM0bigxWprf8D/roj1IXgfO3x09Ajccw6QVYu5xEc5ZL4jGLlA8nszv3X5zCy3gzyGm7Gsm43mL1DtUGjpxE899srm0GIZ3aJQgooBnwRQMUZZnycTVP/G08eRqolgSTeGT6qaIstV1pzSMMJSeIEi5Af3J3ARrruvhszEXlef5u5DyxQJLa6FzMPTXV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pvdGv5/pUWUO++LEsjTj4pm/DCYLzr8bK+ovzuxThk=;
 b=uj0M3zjMRDeSfvgWxpx9B68ztJyNe1Z0v3HKJnLRogK2hNZDGJ0vUWbIu/+VfFr0UjlTQqfPBG6vkP0dt7OLY8SoS2Fcoa9sWyFWP9GwYHPcf2ZzpA62dH/Ap75fDTyznmembyQhqdk6DmZodfAPWCra4RIicwnSaGviBbj4jV8WAxhCdGRFk/5+VbVkU4O8HHeEGrz1WQ4AiUYpGId2MTyb/h3Pty+GvIulalUEnZeKqqEvAb0YB2hlADLrWTORbzx/oUjQAoD4AhYH7yf48aweOPXdkPYfHB15mewnmim+nisWLPetrpzWOI4rnzkrHXKNeBKcCOXU6fFSbzkiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:31:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:31:15 +0000
Message-ID: <9b83d35d-499d-450d-9673-27001a048b33@intel.com>
Date: Tue, 28 Jul 2026 18:31:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] drm/xe/log: Extend components list with hardware
 items
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-11-michal.wajdeczko@intel.com>
 <91c76e0f-073c-416c-969e-5cf81c0a330c@linux.intel.com>
 <2b075c91-db8a-4099-84cb-0102db5d3225@intel.com>
 <b935fecb-ad8d-4e4c-b63e-8bcbc764320e@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b935fecb-ad8d-4e4c-b63e-8bcbc764320e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0098.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: 490c616a-d815-46fd-2459-08deecc5a4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: UrFg+/l7Id6wLYI6OMVuhsidp+Q4OimrEq8WgNXNjxg/UicE32LVCisaFRfiiYvwueA6YElU2sio9WfSszgtYi3Yu5WiedX9XAUbwA7oYs/DdGKpGY8LH76E85/lrPpUCoeYYHmemmwWnI7f6F0oFzr6yNXFj2nrd+F6JEZXGCvzN5xOF18JdhO5WCgnvUc2vbK7lhbW7pA8il2suizp5K62ukdQne2Tde05fVa+scNANo2Ex1aCHXNXG2juOzh24Mq3vpCSkpIndTCHizvRHfTnQltUS0TUJl96p/GVAigXbAj95z90AKtGM/NvzxilgCV/1mD4+A8Bp79rbCwl/y+d6hKVCY9WFid/G3eV4RNzie+IXwyMMJ14xHyhysjqTwZHLdoMtXlKoXXITX20pAYsJz9CGXnTLzVVYDCNtgWCmsUi9sMFabIh+4llgnDpjge7Se5lCFPLLCXqjwwlg1DyzTBdymUPmB5doK4v0KCguji6SCuvsQYtNUDT77XdUkoc5QyAtHlkrmhj6/WD/8pO9sDcUTZ3kTSwyCa382cDDPB+EDx2i5H42uPQIjCxzAzBogRDWVK+DSJ8f4zXUsLUAesqQ4zWWorX8sPqUgOR7dqK4MsFMyK28295/FOk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFBbVZjSWFYMWJrTHl6WEx3KzFzVlVNZkgwV3ZpaENDVURSSkJzNS96WEJL?=
 =?utf-8?B?YUNqam4vRkIxNC9yREFmWWZOczc1NnMzM2RmTGYxY3ZhRnBJaGJYMGlnRVYr?=
 =?utf-8?B?VnhOMTZuTnRuRUVjZVNKTDBXRDVmcGREZC9PbkNzcm5JRW8rblYxNkMzM0Z0?=
 =?utf-8?B?NGl5RS9pbURUYnJuQ0Jlb2FFR0ZWeXozV3RBMm5pSmp2WnhVMFFnR3JLaGJi?=
 =?utf-8?B?RDE2R29xRkRxajUyblpBOW1FREVHY3kwTW8yeFZXU1R5UkRjVi9LaXZuQXBs?=
 =?utf-8?B?STd1QlpNTXdrVUlINUJ6SjBwb0FJQ3BzM0xBSXFGVnR0WXJyT001Rm51YVhk?=
 =?utf-8?B?ekRDbHYrajBWNENsdXA1dTR6QnRxUWNtY1E4Q1V0TVRPZHZZbDBFUGhrV2M5?=
 =?utf-8?B?WWVoOVl0TTRORE5janB5dXFIWmVMTHJndzJtcUxFNmNLdU93b2k2R1FLR1hZ?=
 =?utf-8?B?SmRoNXNndEpLcFA4ZXczamZzeFZhVVdPdWUzd0VoRXQ5cTdCYklwa3o2cTh2?=
 =?utf-8?B?cHBTbm56TGtZemJ1M2tNYldHeGF0YnJCRW9PeXhRSTcvaGxzVHh6ZDFuMXpN?=
 =?utf-8?B?R3piZTZ1clpGU003YWJUZFZpcFcvSEpLWkVrKzJpbGlXTWt3d1RqYVJ1bzFX?=
 =?utf-8?B?aGRRMTl4NjBtS3NmVzB0YXRiOExza0liQ25PQkhuSHVjdEo2WHF6MFZ4YkJF?=
 =?utf-8?B?aHg3VFh3K3JPRm5HWnU3OGQ5eFgzczczVVNSU2YrSjc4N0xqM0VEQUJDLzQ0?=
 =?utf-8?B?K0ZnY2Y0ZDFxT2RSODZNcmpUZ2ZTbjFIZEVoM0pMZEgwcW5rR3pOeitSMlo1?=
 =?utf-8?B?T09nZXhBbVVHLzkwYmwzc0ZqbVp5TG5uTHgwRFlORlpuOXJhWmtUQnpGR3VC?=
 =?utf-8?B?NzJiQ1BhdUdUT3VjSTNSSEpJL0NrKzcrOGVHVjZMQjlQWUFSK0UxSlpvS0dh?=
 =?utf-8?B?ODBrK05VUU5HYVZvanFPQ3VBZ2RBVTNjUnkvOTBSRG0vcTZEQjBLSm9OZk83?=
 =?utf-8?B?QXZEUmxTdlcyeFM1MnBpcm0xeG9wZXJESE5ZM0ZQMjJVcjhCM1YrUzRub1la?=
 =?utf-8?B?bUFlVnR4UUJWa1dZVUQ3VUlLN2UrVDAzQzhVWnE0MTBPd0RpSzBWeUVjcVh2?=
 =?utf-8?B?dVVzRzNhcmc4S21EOUVBWFhrVXZOOER6NWNYb1FObnNManF3NnltNnRwd2Zy?=
 =?utf-8?B?N3p4M3kzYUFBc1NBYjJraUlMSTY2eDk2empCenVNSW0vSklQcEZDd041MlFZ?=
 =?utf-8?B?WVl4MFdtQlpBUmJqREU0ejhENGFhc2grQk5SN1pCZTlUaUpMTENzY0dHRlBh?=
 =?utf-8?B?QmREMzEwQk83NW10NWxIeW0vUnRoL3RaZXNVN3EwQ2U2Nkk3SkhoRFhaTTBt?=
 =?utf-8?B?WG04cnNXVGNpL3U4MDUzR09RQlFReStDS3U1MDBkbDY2OWFkcExPa1RMRGl2?=
 =?utf-8?B?UWdTcG1HTENZeW01OWpmMWJQaWkveVpTa0F2NzRuWWNWZU9UbDI3ejBBY2ly?=
 =?utf-8?B?aEdnT0NRU2dZdHh6T00vMCt5dmRkdDBhMDF3UFZ0cERlZDlxZHlmemJKUGRn?=
 =?utf-8?B?akhrMGtEbm54cElxUE9WZmFVNEY0RXZ5dHNzdGc4QjBIZlE2L0RtR2tsNW1U?=
 =?utf-8?B?S2RWYVJELzRRUksva2ltTm01eXNsSjQxQjFqRHlINjlnOUN0K0xKUnBLaThX?=
 =?utf-8?B?TFJHcktrNm9tYWpIWldMVTM3TEJhNXN3VGlhcWRySkUyMDM2VVlaSkxxczVw?=
 =?utf-8?B?YTcvZi9Td1M1WTc1NWF4eEc4OUY5RHRTMHdHazhDUEQ4eTdtOUE3MkMyTGlr?=
 =?utf-8?B?NnMrZS9yQ2hNQ2E1Uy9raXlSV2pEaTY1L2trblZYaGwwL0hoTVQyRDdaWnRI?=
 =?utf-8?B?RGNJTWJzYWovNFByejIvb1JXeS9TSUZwaW5acmVKd0k5amY0TUxEa0pHYjVO?=
 =?utf-8?B?MThTYlZLYVRjd2JKeFJiRmhLc2RSMWh0aERTT0EvblY4dVdFbDNyZFc4VXFK?=
 =?utf-8?B?TTlYeWlKYStzR29XekJSUVVVbXhJa2dNY1pmdHdVbElaMUdXUnFYMHdaUEtC?=
 =?utf-8?B?TDlzblM4L2FqQmVwaXROcUNUQVlYU0tGZDBCbEN5MDAxa3dDbjBBY2tNOS92?=
 =?utf-8?B?N0lwT21TTFplYkhCc1U2MVRGZ29UbjZ3YmtTL25tMTRRNEFPQ3J0Y3NjWGJh?=
 =?utf-8?B?L2hGQ1RseFVva2FpWmxWb0NGRHU1RnoyU0o3SzVFQTNSWmpUaGxBNG5ScGlB?=
 =?utf-8?B?UDZ2Y29mandaQ3VNRWJIRU02SmhNaEpGYTNjWWsrVWJ5ZWdYdTl4b2sybEs4?=
 =?utf-8?B?eUtBWUwwV2pYeFp6MDhTMGlIZHE5VHNmZm1EYkE5TERiZjZOZDFvSjFOUjdK?=
 =?utf-8?Q?G3R8Taw8NJkVGXi0=3D?=
X-Exchange-RoutingPolicyChecked: ofM/8THBOdvPRSasJYRuVAMEUALcwROQ4bEND9z+BoIHilE/k3Nvv6AFqZ0KzuI2J/Rn5Z06Aqi14if1WLZ1KNvC7n32whONmxqOME0ggeIbGwLLwTCPBPuKiDhPLiz9IRKiW9HQlez8OFNsijDdJB4sdiVpIBe4KwaM+TQ8uuWehPPTEeYoZdbxhEsKe2StD4EAxOZau/nkW4ZMK0lqolLl6+939sw+ZaRNb17q3ytiJVxR5tNJYLCZuWerYqRLCnRAA/YBHtYZoue1XDWv9jnT6WrkaErmllQHSsK6lKTwShVe75SCbxMjvggP8/FpK3hDvXe5RgO4n+h0BZVEeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 490c616a-d815-46fd-2459-08deecc5a4bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:31:15.1294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjj3NZPCCkj6VenRlds0SnzB2LwLW/OiQ0uxstSHewqsw7LQVZa+sq/xj13qDHco+dDZSPgJdkISXAIpBZJkKFcnsjyNjeab1ZkTYLjk/8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
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



On 7/28/2026 4:47 PM, Aravind Iddamsetty wrote:
> 
> On 24-07-2026 20:41, Michal Wajdeczko wrote:
>> On 7/24/2026 1:49 PM, Aravind Iddamsetty wrote:
>>> On 24-07-2026 02:07, Michal Wajdeczko wrote:
>>>> Update our super macro with new top level hardware components.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>>> index cde86c6c08f2..edf4dc13377d 100644
>>>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>>> @@ -124,6 +124,10 @@ enum xe_log_location_bits {
>>>>   *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>>>>   */
>>>>  #define DEFINE_XE_LOG_COMPONENTS(define) \
>>>> +	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>>> +	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
>>>> +
>>>> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>>>  	/* */									\
>>>>  	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
>>>>  	define(SYSTEM, 2, DRM, SW, "DRM")					\
>>>> @@ -151,6 +155,13 @@ enum xe_log_location_bits {
>>>>  	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>>>>  	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>>>>  	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
>>>> +
>>>> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
>>>> +	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
>>>> +	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
>>>> +	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
>>>> +	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
>>>> +	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
>>>>  	/* eod */
>>>>  
>>> For HW errors FW already reports the components, we already have
>>> definition of component "enum xe_ras_component" that matches how FW
>>> reports the errors we shall reuse it not redefine again.
>> from what I can see in [1] this enum was defined just as local definition and there was no mention that they are fixed HW originated values and wasn't placed in regs/ (like we do with all HW related stuff)
> 
> check this https://gitlab.com/freedesktop-mirror/drm-tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_ras.c?ref_type=heads#L379

sorry, missed your response and I've already posted v2

> 
> where error details is retrieved from FW and component details are extracted into structxe_ras_error_class <https://elixir.bootlin.com/linux/v7.2-rc4/C/ident/xe_ras_error_class>
> 
>> OTOH, these LOG components definitions are supposed to be part of the log ABI, so shall be defined in more exposed place (like our abi/ folder)
>>
>> but there is still a solution for this.
>>
>> we can define HW LOG components in this LOG abi/ as:
>>
>> +	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
>> +	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
>> +	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
>> +	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
>> +	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
> 
> As the component needs to go to CPER in case of HW errors

I guess in case of SW errors we will also want/need to encode component identifier,
so we can't assume that only identifiers defined by the particular FW will be ever used

IMO the CPER/LOG identifiers are just different namespace compared to FW IDs

> it will derived from structxe_ras_error_class <https://elixir.bootlin.com/linux/v7.2-rc4/C/ident/xe_ras_error_class> given by FW which will go into CPER. We shall use whatever the FW has given.
> 

but with asserts defined in [2] you should be able to easily convert those FW provided identifiers to the LOG component identifiers (and back)
also, you still have an option to keep all these HW internals ids in the data blob that LOG infra does not rely on

Michal

[2] https://patchwork.freedesktop.org/patch/742837/?series=171022&rev=2

> Thanks,
> 
> Aravind.
> 
>> as this will include TYPE(HARDWARE) definition for each component identifier
>> so the XE_LOG_COMPONENT_SOC is still defined as 0x0608, not as a plain 6
>>
>> and have separate HW components definitions as reported by the FW in another abi/ as:
>>
>> 	SYSCTRL_COMP_DEVICE_MEMORY = 1,
>> 	SYSCTRL_COMP_CORE_COMPUTE = 2,
>> 	SYSCTRL_COMP_PCIE = 4,
>> 	SYSCTRL_COMP_FABRIC = 5,
>> 	SYSCTRL_COMP_SOC_INTERNAL = 6,
>>
>> and finally somewhere in the code we can make sure we don't change that accidentally:
>>
>> 	BUILD_BUG_ON(SYSCTRL_COMP_DEVICE_MEMORY !=
>> 		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,
>> 			       XE_LOG_COMPONENT_DEVICE_MEMORY));
>> 	...
>> 	BUILD_BUG_ON(SYSCTRL_COMP_SOC_INTERNAL !=	// aka 6
>> 		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,	// aka 0xFF00
>> 			       XE_LOG_COMPONENT_SOC));  // aka 0x0608
>>
>>
>> [1] https://elixir.bootlin.com/linux/v7.2-rc4/source/drivers/gpu/drm/xe/xe_ras.c#L23
>>
>>
>>> Thanks,
>>> Aravind.
>>>>  /**

