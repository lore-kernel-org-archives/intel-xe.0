Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56603C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 17:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D6B10E2E6;
	Fri,  1 Aug 2025 17:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vmpywz6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5676410E2E6
 for <Intel-Xe@lists.freedesktop.org>; Fri,  1 Aug 2025 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754068235; x=1785604235;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7S20GyBZFGCizD1mX/50olThQVmwi0rw017XceLyeWI=;
 b=Vmpywz6he/LOQnCb2BpInwrj1mwPPDVLkA8CzUSWNaljvZu009O1bHYP
 fq3p4uo4j5gFl2cCVkYJ669zz7j9aDJvxCYcjyNz1zQaxbOuvElLMC48I
 nqRsGNoMv+KOenQ216Qr/bmBrN58THH4+J5DcVFgyJY19uXhpCmPj8gVe
 Ii0Z/9odnxqFRP14Z7dTJfILH+W7MOVLBVWsIRt7Q/gOiiraHWgTetMgy
 I6rxWvI4ghZqmwKEixYD34Ns8LIJsWyzVR0BaXToQpEPuoc96z3x0qCTq
 B37oKoaS8nKnxC4NTtZCHTvGF6P15XRbAwltP05TW2WLnZuHq1UqEWTBx Q==;
X-CSE-ConnectionGUID: bKRagQBwTUObhIfRTswrDg==
X-CSE-MsgGUID: qxlMk0mrSjSuY9WbiMbJ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56124703"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56124703"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 10:10:35 -0700
X-CSE-ConnectionGUID: T4L4e0R4R8uaOT/cWnWG9w==
X-CSE-MsgGUID: zN/hGElIQBG7giGP0UFStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="164065370"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 10:10:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 10:10:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 10:10:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.61)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 10:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqeYRhjesksyZ3EEkaiylpdGl8Gtw+SuF+o9dU3nduWyfbvzqfn+fQvdXf+LBU+xBCXYYXWoyT77EvLN8uJh3+CYQV2XH1xwT2ii3w2T+wAz2RvslMAkYD1wmDh7wL/4of7poffcRJ5X3oAue+CIo+pLGRlaPSvXQEwrpDiLy0hdjD02E0sZeV+MuyL/SXCIiur+nkAmtnEWl1+CztIFbSL2zjM9C1hzN+OiXhnyK+qf8cqNXgOnFx1MQQi0wNrecwm/5BQCRdiIjQfqoFm+DIs+yMlBYqfT4www+DX91fGb8ny8glCqp4lva5vWLFVo10moI9TgfC733prUjEDUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB6YYyeT/mYOXg2uo+aw3IqRnxQ0mV2T841KwdXSS+w=;
 b=QIaALChmyKrR2z9PJET0D9wscwJJ45zoFnN6jDX4Q/Ld62D1X66Nd7lvRq0GDCESXGvCwmjTeDvDw4cZqZw3bb0NGZ06GbRref3s9iDtd/zv/Z1vZRQ/T4vaFIRiXiACgKWQg+FFDdJD2J230C/ch7E6UIoKmyJl0r+z5jnCCI4MAjFioPlD7dfybBVBV83SGVTByzrNjBVZ2fvJPM6Xai2LwTsysEFz42Bzo/cRx8yTEHGEFUQAFujVAyTulr9etXPmo5qgjbSlA+kMknkJDz4P3NgiO6TDQmyIMrsvfCOxs+8yNPGy3MUAqUmelQHH5aWsf8rdAewd8gw0sm4H/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 17:10:30 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 17:10:30 +0000
Message-ID: <2b8779d7-4ae5-44c6-9385-b9adcb163c2a@intel.com>
Date: Fri, 1 Aug 2025 10:10:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/guc: Update CSS header structures
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-2-John.C.Harrison@Intel.com>
 <7b046038-f7d6-4833-9907-836d905a5d7a@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7b046038-f7d6-4833-9907-836d905a5d7a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:303:6b::9) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 98728bc4-9af5-4043-b8c8-08ddd11e519c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkZOUVdhczlLdnBWYXlDNGk3QzluK2gzMitGdkJNZmpKNUR5aHR3Z3N4RldF?=
 =?utf-8?B?MWpNS3RVSEwwdmxVaExCUGVBak4rSlF3WmI5WDZpbFl6R2dhaWVBc3JYOW1Q?=
 =?utf-8?B?cUtLZUpXRkFCRk1ERXpQNDVmQWlSTjRrKzQwRVdnU244YU9zQlYwbk1xckdh?=
 =?utf-8?B?aDNXbjBSNG9CR1I1ejRSN25aQXc0b211UENzWVk1NDk4cFNvSFkySUlOQjhM?=
 =?utf-8?B?QTFZNlIzQU1wWjAxQVR0VjlLalRzK2dTNVF3MGFVRXlDRzl3bko4NTNreVVu?=
 =?utf-8?B?RTlTbk9RK1FJeHk1cFB0NDA5SWdNdmJNL2dzSzJrMG1PZmRja3BnamdXeVVF?=
 =?utf-8?B?YjVkcG9jNEJOMEtpQnRSbTNsTURUeThyMkxHdERnRjlTY1RhNjJUbkppak1k?=
 =?utf-8?B?ZllmcFFLT09RVDJtRFBxeXg4M1p4OU5uT2s1WFo3U1pYM1ZwREtoK0N5UE5N?=
 =?utf-8?B?aHZPbDR1YkFvK1dqd3hCRGdLM083YzJZT2JFZk5BdWhZcDVyS1NXK0QvQkM4?=
 =?utf-8?B?ZU1sTlV4bHkybEZEMFZWR1ZJS0txTGlCTVJvR1Vjc0tWZ1ZhUlk0MmxTT01K?=
 =?utf-8?B?Z2owZFJvMHdpU2txVVQ5aXRjYTF2TEpBNnNiU0FabnZQWFhNeklqakcvSE1G?=
 =?utf-8?B?ODRCMElCWUlSYlUxUVpWUXpvK09talFTMUVpVzVqSUw5N21ZQVpJSEYwMFo3?=
 =?utf-8?B?UkF5b1QzN0Jta2VvWEVEVmpmNzhqbjYxbjJkWGlUa2Q2S0FpT0V2WXNFYXM3?=
 =?utf-8?B?bUZiOWQ1WldONzZFcERZU3pMNnAxbno0RGt4WndIcytZazFGMUE0WGdPT0pk?=
 =?utf-8?B?U1pMUWNQU2JGeGZrMk1OWmlMbWxBZDkyQndZRTJTTW9wT1d4SFFhNDJLWW1K?=
 =?utf-8?B?dUJycCtBZTZyWk1FNCtRT1Z0ZXUrWlVBK3k1K3VsVFpBNU5nYm5kUXMwaXY2?=
 =?utf-8?B?blBYQTFGZzdMUklkaUFlbTdOMHhMS1RZQ2M4bTRuVEl1b09qY2hiUW11WW9k?=
 =?utf-8?B?eUFTN0JMQmhYTWdNdElWazlIQnFSS1BNRGErSVN2Y3c0TGFpOUg1Mkc4WGtU?=
 =?utf-8?B?czZ1aWpBT0FxeUdteDBXWlRLS0ZhM3lBMFE5TmtrZW9tWXJvUGx0ZWZXTFRJ?=
 =?utf-8?B?SDUrR1M1R2RmNmRLR0k2cnB5UXdSeldlak9lREMrNktqWVN4VENQTGtkdWVT?=
 =?utf-8?B?aFBPcHJSTEthOWx3eFBOTStCMWh3RkpGYUUvT1lZOVlxOTlxczlIa0JPT0Mx?=
 =?utf-8?B?czhQd3lqSEcyN2JiUVpCRktEZjJZMG4yZHR4N2kxVDJuWjdjeFBOckNnTG9N?=
 =?utf-8?B?VzRSa3F2dndJTUlsYmtaZmxDZ2wzb2RkMmh5M3g4ejJCa0VwRkluZm5FQmx0?=
 =?utf-8?B?aEg3QThodWJoSW14SXdzUllmOC80R3hhQUxTSENDZmxMOXpyMGJ3NTlUQTJz?=
 =?utf-8?B?UnlGdlNiTkdhdWZkdVZobkVTYU5lc1dBZ2FxUms5M1JPUTBLb3h4b0o0QzRs?=
 =?utf-8?B?TTJCRmdyQy80MExqbGV6bEU2bVFlUzc1eTVlWWZ3MVRGeC90WXNRTmo3bGxl?=
 =?utf-8?B?WmwwQzJoTzZGMTJZb1dvZm93REtpeTZuejA3NTl0MkR1bGtNT0pEbDFyWXA0?=
 =?utf-8?B?cUt2dFYzTHcwQStIR2pDeSt4Ry9XRlMyUlI5WWU0bDlzdFdYTHJ5aVFmTmEv?=
 =?utf-8?B?Myt6bjM3eXJ5akQ2RTRhTWFqYWdtWmkzUUhBTVlZL2o5WkFseER0bnhzd3ZT?=
 =?utf-8?B?b1BCMUFYNlZoSmNEaHV2NVRGTFpGTVF0MUZyU3JxNHZBazFBdmdQQ0kzR3hv?=
 =?utf-8?B?NUQ0ejB1a3RMV00xMW96am5xWEZFZzdBeE5GVkp2UWNzM1RKRUhxaEFCdzMx?=
 =?utf-8?B?bjR0M3UzR2Y4WjlIVi9HbjVGNnBXTko4RThuYkpSNzFENTAxSzNIUk1DZUxR?=
 =?utf-8?Q?y628u6FNjcM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGN5ZmRiSWxRN2tWZVp2bEJ1cmVya29tSWxUK0tGaEhjU3BPeDQ5Si9DclRQ?=
 =?utf-8?B?Yi80T2R6R3lKZ2JUVFZSREpxTHFsTU5xVTBOQWRVSWZUbzVDKzdDamJKQXZX?=
 =?utf-8?B?NzJiQVRkVW5OeUxHWjBzVkE4akVnSldvc1lIbVE1OTNKYWpYR2lVZzlGUDhC?=
 =?utf-8?B?ZGdwdGhwd3NldmYyMDZibHpaSXROZ3g4ZnRTNVQ5aE9mNDZBaXNnWmFnaUdE?=
 =?utf-8?B?WTZ2cEtvTzdhT25reDhsUy9ORHdieDVZNlRjeG5kZCtJclhXV25XWnpuYzlE?=
 =?utf-8?B?dFY1STZuTDQ1ZUdoeHpZL3JTU0ZsN1RLQkRFMHgzSnF0MWNJcXh6b0pjL1dC?=
 =?utf-8?B?aEMrYTRnZ0NHOEJPSHJ4ZmpyemxOZC9jblJwUTdKMmVxTjU4WG1lUEtoTHBS?=
 =?utf-8?B?aVFWMk02QVQvNmFzTDFBeklkcXJ4RDlpc2w0enVKV0tpZXlEMG0zS3pMaVR0?=
 =?utf-8?B?TW9RNFFxSmREdWZzRlpOVGV0dUxHRHowcXN6UlJOa0piTHFEQ01zVHRkSmhy?=
 =?utf-8?B?Yno5RitzUEc2VE5BMk1EVEFQVW5YeE1qelpEanlpeTNnb3NXM3djd3lXK0pZ?=
 =?utf-8?B?ekgyS282MFhDSGtSeGtrNzFRK3BhSnhXOVlqb04vNDE4WW10dkpMUEY3OGhD?=
 =?utf-8?B?SWJjeWc2TVRMOUdjYys3RDBFVTY3eWxVcDd2cTJ1Wllla3V3YkxuV3M2Ni81?=
 =?utf-8?B?VzE5S29qcVUyYXMvblc1a0RrTWpqeUtaRHlTZzBzR1I3K0NoK3Z5YzhaWTJz?=
 =?utf-8?B?aWtmbjhKbTk3d1l0OGNHSmk0R3F4a0dlYUd2Z2pZSHBtQWxtYnhkU2NTM3Bx?=
 =?utf-8?B?SjZmVmlOcUF6RWxablVROWVGQWlobzhRNDFRVy9Td25UaUI5TzgxekFFdVBt?=
 =?utf-8?B?MStrdFNEQWJVOGlBckVKWHgxOVlRc0JvOGoxY2RyYnBSajhFSFdnQzlvWXlt?=
 =?utf-8?B?L2NmbnZ1REhKemplYTNtdU9jbnBGclFKRExhRkJ2T1IrbUczVG5xWnBnc01U?=
 =?utf-8?B?aStVRlNCdEg5REVORWtmeHFzUHJ3N00rYmNyZW5pbDVSZ2xEbEdkUFozU040?=
 =?utf-8?B?czdEV2FDYUk4czFyMWhNRzA4ZTVGeXI2S0dxMktFVytiWU03bG1KdzZPajM5?=
 =?utf-8?B?YVY1ZEJZVkt5UkowQ2FQV05mVEtUQ0JZMUJkbkhERExmcWFEN2E4VjRrakxF?=
 =?utf-8?B?c1hURHhGKzlCQlV4VG1oM1UyR3BVUzFXSkF1d3I4OVJDdTZZVmlBazFleGlO?=
 =?utf-8?B?NHM0K09FZXdpWFJ0RTdPTDNOLzM2eDBCd1RnLzA2a21qOFV6aElIVXNmSmdr?=
 =?utf-8?B?eUF2ZjNFMEpzU3N5Z3ZDajRtZFRGNlVNSENNbGwrQ3RxSzBqTXJuS0lka3FF?=
 =?utf-8?B?dHJkVzJ5M1ZOYjIxNmFrS2hlckVURmllZGE0dEphbHhpdEN1a1Evemd6VGxP?=
 =?utf-8?B?T3oweVl3VkZFMCs3aWNXTk1KYnVQa0dKSnBoeGV3eVlHQWh0QnVpQ0VhRksz?=
 =?utf-8?B?ejZBbElTamJvcEFJeEFZZExTTWdNL0g5QTgrMVBqMlZqRjJpczdFd2JFb3RP?=
 =?utf-8?B?YVBLTW5GclRmU2hpaXN3MEVpeURaL0VpVHd2UnJkQVVkUDBZY2NXRThoWS9S?=
 =?utf-8?B?Rk11U3pBQ2hCNDBQMmIybDAxMXlUMHR6UW9oNHkyWXN2QXRBQXJYbjhmdXdx?=
 =?utf-8?B?QlpOaVg1TGZrTjlEYXlmaGVwNDR0RUhmNWNlRE5EL29Kcyt1dmJwQVNzelNk?=
 =?utf-8?B?SW11bzlQZWxHSXUzWjNzMGFBeHhmNlVOR0RqelRlZVdjMVROakVCcFRQdVJ4?=
 =?utf-8?B?YXlxb1FvN0JDOXBtY2xmd3VKUEcrOUZWd055SFNsSS84dnVkemUvWGZwWm1P?=
 =?utf-8?B?aFJIQTJlc2I5S0pUOFZMekNjOHVQaWltR2xKdXljVkVZVWI3RThRZzRNQjVS?=
 =?utf-8?B?Q2NQejZyNXA5ZTBMUlJpUThVbWo0Y2tpL1dSemNRZ054bUZ3aEFSakR1bTVF?=
 =?utf-8?B?eEFTdHY2Wjl0M2N1WGd1UUZRZUNGNUJ4cTlrWVY2dUhYR2V5ZXRvYmpxbGZ0?=
 =?utf-8?B?QnFGWHNlL2ZlME92QmlvYXYxWWcwS3BRZyt4aWxWYzhzdmZHcnJkQXNacm1N?=
 =?utf-8?B?Q0pYb1lBa1prdnU4OFlhczBGeW9oOXI0S1FXdHpqRnR0LzlLakdMYi81N3B4?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98728bc4-9af5-4043-b8c8-08ddd11e519c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 17:10:30.6191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+QdU5ipv0AaPmHfDZ4RGXjjtw8aHsIPfpBxtxA0NwmPnm3ReV09ttXkEBdwXVD54QYnvMLAiv7UGzx1UgDVPoCzAPR42ic/zw1Sq70W2f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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

On 7/31/2025 4:11 PM, Daniele Ceraolo Spurio wrote:
> On 7/24/2025 5:21 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Rework the CSS header structure according to recent updates to the GuC
>> API spec. Also include more field definitions.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c     | 20 +++++-----
>>   drivers/gpu/drm/xe/xe_uc_fw_abi.h | 64 ++++++++++++++++++++-----------
>>   2 files changed, 51 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index a236f1d37248..c8378f3e0032 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -344,11 +344,11 @@ static int guc_read_css_info(struct xe_uc_fw 
>> *uc_fw, struct uc_css_header *css)
>
> Since we now have a specific type for it, it might be worth changing 
> this function to accept struct uc_css_guc_info instead of struct 
> uc_css_header.
That works.

>
>>           return -EINVAL;
>>       }
>>   -    compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>> css->submission_version);
>> -    compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>> css->submission_version);
>> -    compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>> css->submission_version);
>> +    compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>> css->guc_info.submission_version);
>> +    compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>> css->guc_info.submission_version);
>> +    compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>> css->guc_info.submission_version);
>>   -    uc_fw->private_data_size = css->private_data_size;
>> +    uc_fw->private_data_size = css->guc_info.private_data_size;
>>         return 0;
>>   }
>> @@ -417,8 +417,8 @@ static int parse_css_header(struct xe_uc_fw 
>> *uc_fw, const void *fw_data, size_t
>>       css = (struct uc_css_header *)fw_data;
>>         /* Check integrity of size values inside CSS header */
>> -    size = (css->header_size_dw - css->key_size_dw - 
>> css->modulus_size_dw -
>> -        css->exponent_size_dw) * sizeof(u32);
>> +    size = (css->header_size_dw - css->rsa_info.key_size_dw - 
>> css->rsa_info.modulus_size_dw -
>> +        css->rsa_info.exponent_size_dw) * sizeof(u32);
>>       if (unlikely(size != sizeof(struct uc_css_header))) {
>>           drm_warn(&xe->drm,
>>                "%s firmware %s: unexpected header size: %zu != %zu\n",
>> @@ -431,7 +431,7 @@ static int parse_css_header(struct xe_uc_fw 
>> *uc_fw, const void *fw_data, size_t
>>       uc_fw->ucode_size = (css->size_dw - css->header_size_dw) * 
>> sizeof(u32);
>>         /* now RSA */
>> -    uc_fw->rsa_size = css->key_size_dw * sizeof(u32);
>> +    uc_fw->rsa_size = css->rsa_info.key_size_dw * sizeof(u32);
>>         /* At least, it should have header, uCode and RSA. Size of 
>> all three. */
>>       size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
>> @@ -444,9 +444,9 @@ static int parse_css_header(struct xe_uc_fw 
>> *uc_fw, const void *fw_data, size_t
>>       }
>>         /* Get version numbers from the CSS header */
>> -    release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>> css->sw_version);
>> -    release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>> css->sw_version);
>> -    release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>> css->sw_version);
>> +    release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>> css->guc_info.sw_version);
>> +    release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>> css->guc_info.sw_version);
>> +    release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>> css->guc_info.sw_version);
>>         if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>           return guc_read_css_info(uc_fw, css);
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> index 87ade41209d0..44d529dbce3b 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> @@ -44,6 +44,39 @@
>>    *    in fw. So driver will load a truncated firmware in this case.
>>    */
>>   +struct uc_css_rsa_info {
>> +    u32 key_size_dw;
>> +    u32 modulus_size_dw;
>> +    u32 exponent_size_dw;
>> +} __packed;
>> +
>> +struct uc_css_guc_info {
>> +    u32 time;
>> +#define CSS_TIME_HOUR                (0xFF << 0)
>> +#define CSS_DATE_MIN                (0xFF << 8)
>> +#define CSS_DATE_SEC                (0xFFFF << 16)
>> +    u32 reserved0[5];
>> +    u32 sw_version;
>> +#define CSS_SW_VERSION_UC_MAJOR            (0xFF << 16)
>> +#define CSS_SW_VERSION_UC_MINOR            (0xFF << 8)
>> +#define CSS_SW_VERSION_UC_PATCH            (0xFF << 0)
>> +    u32 submission_version;
>> +    u32 reserved1[11];
>> +    u32 header_info;
>> +#define CSS_HEADER_INFO_SVN            (0xFF)
>> +#define CSS_HEADER_INFO_COPY_VALID        (0x1 << 31)
>> +    u32 private_data_size;
>> +    u32 ukernel_info;
>> +#define CSS_UKERNEL_INFO_DEVICEID        (0xFFFF << 16)
>> +#define CSS_UKERNEL_INFO_PRODKEY        (0xFF << 8)
>> +#define CSS_UKERNEL_INFO_BUILDTYPE        (0x3 << 2)
>> +#define CSS_UKERNEL_INFO_BUILDTYPE_PROD        0
>> +#define CSS_UKERNEL_INFO_BUILDTYPE_PREPROD    1
>> +#define CSS_UKERNEL_INFO_BUILDTYPE_DEBUG    2
>> +#define CSS_UKERNEL_INFO_ENCSTATUS        (0x1 << 1)
>> +#define CSS_UKERNEL_INFO_COPY_VALID        (0x1 << 0)
>
> I'd skip defining CSS_UKERNEL_INFO_COPY_VALID and 
> CSS_HEADER_INFO_COPY_VALID. They're only set in the HW's copy of those 
> fields, which are only consumed by bootrom; we'll never see them set 
> from the driver POV (or even from the POV of someone hexdumping the 
> binary), so having the define has no use.

It's more about not having holes in the definition leaving people to 
wonder if that is a bug in the driver, a deliberate obfuscation, etc. 
One could call it _RESERVED but that seems inaccurate when it does 
actually have a definition.

>
>> +} __packed;
>> +
>>   struct uc_css_header {
>>       u32 module_type;
>>       /*
>> @@ -52,36 +85,21 @@ struct uc_css_header {
>>        */
>>       u32 header_size_dw;
>>       u32 header_version;
>> -    u32 module_id;
>> +    u32 reserved0;
>>       u32 module_vendor;
>>       u32 date;
>> -#define CSS_DATE_DAY            (0xFF << 0)
>> -#define CSS_DATE_MONTH            (0xFF << 8)
>> -#define CSS_DATE_YEAR            (0xFFFF << 16)
>> +#define CSS_DATE_DAY                (0xFF << 0)
>> +#define CSS_DATE_MONTH                (0xFF << 8)
>> +#define CSS_DATE_YEAR                (0xFFFF << 16)
>>       u32 size_dw; /* uCode plus header_size_dw */
>> -    u32 key_size_dw;
>> -    u32 modulus_size_dw;
>> -    u32 exponent_size_dw;
>> -    u32 time;
>> -#define CSS_TIME_HOUR            (0xFF << 0)
>> -#define CSS_DATE_MIN            (0xFF << 8)
>> -#define CSS_DATE_SEC            (0xFFFF << 16)
>> -    char username[8];
>> -    char buildnumber[12];
>> -    u32 sw_version;
>> -#define CSS_SW_VERSION_UC_MAJOR        (0xFF << 16)
>> -#define CSS_SW_VERSION_UC_MINOR        (0xFF << 8)
>> -#define CSS_SW_VERSION_UC_PATCH        (0xFF << 0)
>>       union {
>> -        u32 submission_version; /* only applies to GuC */
>> -        u32 reserved2;
>> +        u32 reserved1[3];
>> +        struct uc_css_rsa_info rsa_info;
>
> Do we actually support any binary where this block is reserved instead 
> of containing the rsa_info?
Not yet, but there are plans...

John.

>
> Daniele
>
>>       };
>> -    u32 reserved0[12];
>>       union {
>> -        u32 private_data_size; /* only applies to GuC */
>> -        u32 reserved1;
>> +        u32 reserved2[22];
>> +        struct uc_css_guc_info guc_info;
>>       };
>> -    u32 header_info;
>>   } __packed;
>>   static_assert(sizeof(struct uc_css_header) == 128);
>

