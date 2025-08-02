Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27983C87FD2
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 05:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB82D10E03B;
	Sat,  2 Aug 2025 05:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIDun5X8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412F10E03B
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Aug 2025 05:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754114197; x=1785650197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rs/KvuNxsTEfycgMZcUEivdbpvmBCL5yvL6S/7+2U5E=;
 b=OIDun5X8K091QZ2J7LkdvRyqAMzHdLJM81LW+Sxzbt/Ay5cjhgXBbmsJ
 e6zZkDfG+/FOclR/JdoqYWCU6uU7AfePnHvyhH4rW9hV9eY+8xX6QvOKE
 to6uE/DF9VOr39VmiE7zpCtwGrpZZZ5hC4gVTrwML/Rdtf5hzse4XPhrr
 s+McvqzuxaPty/v+zdyeHQTmcGat5hc95xUWGa6A7hX1ddxSe4EB/VlT2
 GdrDcR4LeOh8XvzxzePgmNT/q7KzY/jZCNZm48zPpNZf0Umxnqsxy1gWO
 h+ge4ovQNW6iL2h9BohaUm3em4H+00OopnbiA51KLe0M8IpNsHesM/Yxi Q==;
X-CSE-ConnectionGUID: algak59xQLWDL7JqLRfnzQ==
X-CSE-MsgGUID: ja3E2z6oT7GOCvH2Ywe4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73915504"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="73915504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 22:56:37 -0700
X-CSE-ConnectionGUID: 44puWnV1Q82UtuVDcULrIA==
X-CSE-MsgGUID: Y7ZtI9ABSPmOuaZ/bNZBqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163013055"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 22:56:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 22:56:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 22:56:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 22:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JECcfimxe6qv4kjBIyAR1YHff9LERWsLtGDZD7uQS+ph1+XQB5J2llDcMpMo5u7qBmyt/CNAYaUyGHMHWp9Sv1R8233naxYiYfaupJTG0wo+NCtZUNo9/ZtEwjZNIP9l2UxAOtXUKGE2aGwB+fG5wtHYUzNZ2shTZI/M65XojZfcQiW/2gJgIrxris4NUqd9E1mDU7QVir/IK+nJ0mYwd1WgDamCGs5mcz7MT2/tAxhm5OahUWdiLS0ma38qHJpIVzuwle2Ehk+m4Nhq8qHx/x9mMnc2oP07VZ5wY/Ja3RhGRpdxog0iqkqKyxPWH2l/iwZbuDz/fswVg+inkJg+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs/KvuNxsTEfycgMZcUEivdbpvmBCL5yvL6S/7+2U5E=;
 b=zL50ouDKe+imNuJBAAwk5r0XlFa0lHeRTNbD5FoMORVi3JenZtPwnbXW8JnWTSpAB8/+Au1YfLyKIO0haTZm28GyC3lN/A+lThUTmUAVsVYD7vD/fXe0V6+nCxqc88fuwaElAiXna2s+I8sg/DiFrQdrAFsNayxo9KhJICkAjSVrkQ9t3xrDdkb4+20M+XK/AMHiYoj26CZ977CMsxezEoJPQTWgufSyzJl8FxHD2m1RkaPDrub2xm1Xu1Bi0eLclcW3r8Ih+aCUW35/Na+eEPmQuA7n01ubk5fTw2+/UoY6lgyreIvqX4MetpcuK1aZjtH1NBg+5mpvwvt08lyZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Sat, 2 Aug
 2025 05:55:53 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8989.011; Sat, 2 Aug 2025
 05:55:52 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>
Subject: RE: [PATCH] drm/xe/gsc: Don't create mei-gscfi aux device while
 running in VF mode
Thread-Topic: [PATCH] drm/xe/gsc: Don't create mei-gscfi aux device while
 running in VF mode
Thread-Index: AQHcAmb0wqaK0SSPVkij5fj8wYpJdrRNTlCAgADosLA=
Date: Sat, 2 Aug 2025 05:55:52 +0000
Message-ID: <IA0PR11MB718510D948EE20A085258374F821A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250731220124.3113996-1-vivek.kasireddy@intel.com>
 <14339103-f014-41b5-8f5f-7df17a5650c2@intel.com>
In-Reply-To: <14339103-f014-41b5-8f5f-7df17a5650c2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB8203:EE_
x-ms-office365-filtering-correlation-id: 2c865f4c-11f2-4da6-f3c2-08ddd1893d75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QW5YamVYT3l4NkJSTU5CQmVuaHFIalFZblRaQnZ6dEdCckIxNlpXcDlBU21V?=
 =?utf-8?B?T3lwbUo0cnJkbjQ3N0FHSFdFVEFTUHhJZFZHbngrMXBTY0FDL1FXeEQxaEhx?=
 =?utf-8?B?WVdJdUJYNkQ3M0ZxekE4bm4wR2liL084QzcvZWRDTmpjY3lDYXJlZU9SMmNp?=
 =?utf-8?B?VlZjaVVwZjhHRldkc3BQam1lSUZ5clhJdVpER0x4NTV5NUo1bml4OHRVMTl5?=
 =?utf-8?B?blBXa2Z6N21wUzVNRU1kWjIxZU5KaGZCZ0JsaW5wTUc3TzhSWjBKRDk1eUhF?=
 =?utf-8?B?NllLSnFlbVNNN3ZxOTlMVkdER0NVS29keFAyS0ZxRjFYS0NJaVRLM0ZWUTU3?=
 =?utf-8?B?b2UvaVZnZ000T2g5L0FFNzViT3A0YXlXTGt6SDNCMWtnMDQrNDRPZVNqZi9w?=
 =?utf-8?B?Y2VNSzdERlZkd3ovelk3VHVDUzAxVjdHOEtxdlFmT3ZMalhPbkduQmZOTjZi?=
 =?utf-8?B?YjVONmJFaTBuZThHNVlpVFBIQzVDNzhKS0JnVUxzUkRIc2ZYeHFrMkR5d3Jp?=
 =?utf-8?B?aUlrZnJUYVNKZ0ZINGlIOWVtZUdDcDcwMWE4djVNQSt0eTdUd3UwTENLV3Y3?=
 =?utf-8?B?RTZuUld5cEcrTFJMRkp6MUVobTZUM1VhOURFOWd0VllaVVdBWlprbmQ3Sm85?=
 =?utf-8?B?cldQMEkvK1ZBVEx2UWpyL2JDNENVRXYvTHhHSzlUMDQ5MFZDdzZvV0NKMmRH?=
 =?utf-8?B?S2o0M0RkdXFTMVltZXhEVEJwKzdkLzM0UENBN3lzN0tHSlVBT2FMbHdVR0dI?=
 =?utf-8?B?TjN6a2g4TVVYV0w5UzRzZDMrSlhqMEdTUmNwSlE4bTVnZjJ4ZUFTOUJmVG1H?=
 =?utf-8?B?SVJhRjlXZWRrb1Z0YXo1dEJsNXhKZk16Y1dlSlJNK1JtSmVWZGl4akx1U0xG?=
 =?utf-8?B?TFA5OWpyVElVai8xQnp0S2s5MmFmMWcreUdLa1dGb3F6TUJVeXBkR0kxdzFR?=
 =?utf-8?B?eWR6VjlYNG9nSjhEd2wzK3lLU3gyVnlSNmpiYlpVSHZVQ05WNzBVQWlPV1kw?=
 =?utf-8?B?NFk2S21Fa3hJNllWZGlBbWh4Vmx1N0lvRmMvVTZYTEczVnpOSHF1anZZMjRG?=
 =?utf-8?B?MXE2ZnhWZDFkK1NERWhVTkJEMWhHdjl3bnRCYlBwb2xXSTZPcnZ2SmpqWnlk?=
 =?utf-8?B?WEM2NUgxUWU4bEEzb3FIMFZ0cWhleURHbkE5SU5uOFB2UzBQQmdtK3NJUkJS?=
 =?utf-8?B?U3BlRDJCWWNpZDZFYlBHNnZ6dGFjYjFiaHNBTlQweWxGaTQ2byt1ZDdZSXJK?=
 =?utf-8?B?YWhWQndodXJ6OXhaSXdWRE9FcmMzeXkxRVVFT1UxanlFVG9qSVBOelBTY045?=
 =?utf-8?B?RkROc0xqcUxIRW9YUFl0ZHpoZkhlZzh5amtFOCtBVlZlTGxyWTFGak5keHV2?=
 =?utf-8?B?OVRPSU4wckVOd0xYazk0aDU5cHhBT0pEQ0JySVRvZ1p2cEZmWWZ5NWdVa2gr?=
 =?utf-8?B?S2wyY2dETFJTaUJ3NDVFblJBdDgxTUsrQWtQMlBlSnhOb0hLWDNYY2FHLzFQ?=
 =?utf-8?B?NWNEbVVSODBEb281YkFDUzcxTVNQZVlaSTJkQldHTm1BdmFFbUV4TWhIUFBi?=
 =?utf-8?B?UCs4SmFzZXNwejAybGJHZ3JQb291NDZIcHlmVkFlNk5SYkZ5S0wxeWt1Q1JB?=
 =?utf-8?B?clMwVUUyNnM2amhlNk9XWGtxTzRkbS83ajVpY3g4blN1ZFZVWGRDZzNIN2hM?=
 =?utf-8?B?aHM3bHZGNFBWVXVvRitWVXNYVjBtbHQ4WWZOZEI4RmRtUWF3SU5vbFdhUllL?=
 =?utf-8?B?RUJjbmE0UlRsakxWcVdWSm5mK1lmeEUzQmdMRE1xZ3k0TnRwdnd3MmlKSm5l?=
 =?utf-8?B?NUx2Uy9iV2tHOHVUR2k1R0xoalpDOE9rc2dPSE9jNE9zenV4QVZId1o2UjlB?=
 =?utf-8?B?bDJyUGhPN25qZTRuZnlPczFMTzdhZ0dlS3FKKzlhWHc2T1RWaDN3a0hRT2xV?=
 =?utf-8?B?SS9WdGVweEw1dlFUaW90Tk9IT1lGMjJYeDZwMlhTNm1UQUZLWUNQa3diYUJp?=
 =?utf-8?B?eGhBenRpaUR3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDNpOEoyS2t4THNuc08wemx3K0syTHFscU83cGs1V0VUaVh3NFNTWnpjSGZy?=
 =?utf-8?B?UktKYkptUnBXc1pNelNrNDRxdHFtYktYazlvWjQyamkrNWJJYlI3RmVKMDEz?=
 =?utf-8?B?RVNIY25HS0x2YVJKSVZIcWpHZVppZVlCRTcxbThYSEdLL3dIcVRWKzZlTmRt?=
 =?utf-8?B?bkNyZ0RPV0lIV0RXYXlhT1lnSGhOQTY2cWptaVdyTThOTFZDbHN0VU9EeWZ3?=
 =?utf-8?B?QmpvbGUvT1N1YmpldVd5K0pLUmpUdXlySDJiNlVHVlphYXNSZytlbzJ3TzMx?=
 =?utf-8?B?K1k5ekI0TStERGpxQ0lBTGlrTTF3ZFlSd0ZGd2xPaUdUcTlZbHZQQzNvZ29C?=
 =?utf-8?B?bmMyWjZPcG9qYlJvV0l3ZWt6K0NEZjExVWlsK2pSL3hoMUZ5UkxIcEk3NXRD?=
 =?utf-8?B?dHFXejdTb0N4NGhOdVp3MEVxMFFGdnpCTERHZlk5MlZEUjY2NHA1RG0wNm9U?=
 =?utf-8?B?bGFJZExuay9xcnNpL29sYkUyYXZCQmI0cm8vQ0NwcldXdHMzU2p4UUMrekZC?=
 =?utf-8?B?VEpnYTJFVWdUcVVFeDdzNE1IM3F4SzhXOU1IbXExNnVGZENMUiszUVRRbURj?=
 =?utf-8?B?OWROTGVDZzVlWnkyRksyeVRURDRhUVJFWlE5MEVlY2hBYmtOUGducG5VZjNn?=
 =?utf-8?B?TG8rM3VMc24ybU1WYWdLOGZhdXBMUjNtUmdOUFdNbWRVZHFKWnd5S2h0WWt4?=
 =?utf-8?B?OXpXYUhkby9pSndIQi9ZUnFnZkFXUmZzMGNpdkFUSEVqRzdhaWNnNGt0T2hM?=
 =?utf-8?B?TFI5VnlBcTRVRktRSFRpRGFPOEp6RUFldllLcTNiY1UvNTVrWDRFbzNoMTdv?=
 =?utf-8?B?c2NobVRTWlQvcjVjNGo2bGUwdm9TV1hrRU9ZTDNqT0RVeFNXQkxaa1JKOThm?=
 =?utf-8?B?dFFUK3g3aXIwV09CRFdaTm9zRE52VVhFNzlmQ1Vlem1ZdTQ5RDVOY2JidHB5?=
 =?utf-8?B?QnNmbm90NXlTU1Q1Uyt4MnNYWkxjb3JkVjFkcmpUNjBwVU1ZMDlpUkYvanVp?=
 =?utf-8?B?NldpL0RnbVFBQjQ2K2ZLZVhmR1cxb2pCblEvRUptQVRnVlgyZGtWWmsvTWV6?=
 =?utf-8?B?QjFBbWNGZU45VnVldGMvSTZERGlFaklPSGJSL242UTVabnBuNTdTUjJROHBJ?=
 =?utf-8?B?TUdkSWduMklzdGhOOEQ3SEpPMmlaRFVwaW4zYXU4Q3oveUFla28zTWI5TmNO?=
 =?utf-8?B?K2tBRXN2bEVrSk53a09mU2dxeEp6RzNJTWtTY3VKWVVoaEFkRExORSt0Qmxk?=
 =?utf-8?B?KzRjQngrbFpobEQzVkVESzE5NGZrMXZoam9QT21VM1Q3KzUrTlhnY3FyNkNa?=
 =?utf-8?B?akhsZklGYXluajBHOGRDVTRMZGp2NzZRTTZPLzZPT3c0R09HYVMrYjJXM2tx?=
 =?utf-8?B?Z3E1ekpIUTFXSk1kdytMNEpIWUxPME9OZkhxNExvMVFOWWkxZzNsR00yL0lx?=
 =?utf-8?B?eWxhK3J1MW1PcmV6YmIwZmhHRmRBbmpUVlF6cVhpaFVEYkVzRjdZVFIzaU1O?=
 =?utf-8?B?dEhhNjRJSXZDaGcySmloOU9tNzdDSy9sREE1OXBWTkhMYWRqRjdURHY1Yjc5?=
 =?utf-8?B?YTZsRHNTelhHZ2JWMy8zRmh4VEhrY2ZKV1dlbjVPWDliK2ZzdDROMnVPSHQ5?=
 =?utf-8?B?dHg2aW00Y3VxaStUSWlpN0FhaGREZzFpUURlMGhMclErbXg0dFZTZlJDOE9N?=
 =?utf-8?B?RkxkUVZWTS9hUG1lMkpkSU1JTHdGLzhvZ0dkNDVPdFdHbFZxbkpHbE5DbExo?=
 =?utf-8?B?dmwyenFyd2xFOFd6ZldYODJ6WjExYzlLRTNjRWNBcXpzRUFRbVhOYkxadDdZ?=
 =?utf-8?B?R3RXaEdldmpOMjdQQUVNUWdDek9Ha0dEVCtKbGk5eEtZeEFZcmZNR2tYc3I3?=
 =?utf-8?B?RFoxcVhGaWkrNjRnV0JJWWE3SlFnbUYvZzA3bnRBVUdOZnpoeHFJVG5BcFp3?=
 =?utf-8?B?UUptbE1OdzhYbU5icy9iUkVoNXNMajdGaDJjZDcrdkNPUGxNRUJhS0dkdXFR?=
 =?utf-8?B?QnNzYXAyKzVrejJOZ0NOcmZDQUx1Vk94ZVdEdzBiT2dzVU1oOXhQcStXTlpl?=
 =?utf-8?B?MG5Jb2M5MUJUQ1lWWGpFM0t2ZTExU3R6d0ZlQy9STEtocDAwQkV6Z1VrQU5r?=
 =?utf-8?Q?u0b5qKOatdLGO08LMZgxZKCXd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c865f4c-11f2-4da6-f3c2-08ddd1893d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2025 05:55:52.8203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIzS68eGyjSLbIPDjCChIlRhf7XimWe1hsSvH/5ety9Oc/U4mBL+vM4dwFCjjqNces8WPKqSFxycAZ/wQpWARa12rwnlQu29bgvjtflpxN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUvZ3NjOiBEb24ndCBjcmVhdGUgbWVpLWdzY2Zp
IGF1eCBkZXZpY2Ugd2hpbGUNCj4gcnVubmluZyBpbiBWRiBtb2RlDQo+IA0KPiANCj4gDQo+IE9u
IDgvMS8yMDI1IDEyOjAxIEFNLCBWaXZlayBLYXNpcmVkZHkgd3JvdGU6DQo+ID4gV2hpbGUgcnVu
bmluZyBpbiBTUi1JT1YgVkYgbW9kZSBpbnNpZGUgYSBHdWVzdCBWaXJ0dWFsIE1hY2hpbmUgKFZN
KSwNCj4gPiB3ZSBkbyBub3QgaGF2ZSB0byBpbml0aWFsaXplIGFuZCBlbmFibGUgdGhlIG1laS1n
c2NmaSBhdXhpbGlhcnkNCj4gPiBkZXZpY2UuIFRoaXMgaXMgYmVjYXVzZSBjb21tdW5pY2F0aW9u
IHdpdGggdGhlIEdTQy9DU0MgZmlybXdhcmUsIHdoaWNoDQo+ID4gaXMgdGhlIG1haW4gcHVycG9z
ZSBvZiB0aGUgYXV4IGRldmljZSwgd291bGQgbm90IHdvcmsgaW4gdGhpcyBtb2RlIChhcw0KPiA+
IHJlbGV2YW50IE1NSU8gcmVnaXN0ZXJzIGNhbm5vdCBiZSBhY2Nlc3NlZCksIGFuZCBjYW4gcmVz
dWx0IGluIHRoZQ0KPiA+IGZvbGxvd2luZyBlcnJvcnMgd2hpbGUgbG9hZGluZyB0aGUgWGUgZHJp
dmVyOg0KPiA+DQo+ID4gWyAgNzYyLjI3NDIwOF0gbWVpX2dzYyB4ZS5tZWktZ3NjZmkuMjQ6IEhf
UlNUIGlzIG5vdCBzZXQgPSAweDAwMDAwMDAwDQo+ID4gWyAgNzY0LjI5OTIwM10gbWVpX2dzYyB4
ZS5tZWktZ3NjZmkuMjQ6IHdhaXQgaHcgcmVhZHkgZmFpbGVkIFsNCj4gPiA3NjQuMzAwMzM0XSBt
ZWlfZ3NjIHhlLm1laS1nc2NmaS4yNDogaHdfc3RhcnQgZmFpbGVkIHJldCA9IC02MiBmdw0KPiA+
IHN0YXR1cyA9IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwIFsNCj4gPiA3NjguMzMzNzA2XSBtZWlfZ3NjIHhlLm1laS1nc2NmaS4yNDogcmVzZXQ6
IHJlYWNoZWQgbWF4aW1hbA0KPiA+IGNvbnNlY3V0aXZlIHJlc2V0czogZGlzYWJsaW5nIHRoZSBk
ZXZpY2UgWyAgNzY4LjMzNDQ2Nl0gbWVpX2dzYyB4ZS5tZWktDQo+IGdzY2ZpLjI0OiByZXNldCBm
YWlsZWQgcmV0ID0gLTE5IFsgIDc2OC4zMzQ5NDFdIG1laV9nc2MgeGUubWVpLWdzY2ZpLjI0OiBs
aW5rIGxheWVyDQo+IGluaXRpYWxpemF0aW9uIGZhaWxlZC4NCj4gPiBbICA3NjguMzM1MzQ2XSBt
ZWlfZ3NjIHhlLm1laS1nc2NmaS4yNDogaW5pdCBodyBmYWlsdXJlLg0KPiA+DQo+ID4gQ2M6IEFs
ZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogVml2ZWsgS2FzaXJlZGR5IDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+IHYyOiBSZXdvcmQgY29tbWl0IG1lc3NhZ2UgdG8gY2xhcmlmeSB0aGF0IHRoZSBt
ZWktZ3NjZmkgYXV4IGRldmljZQ0KPiA+ICAgICBkbyBub3QgaGF2ZSB0byBiZSBjcmVhdGVkIG9u
bHkgd2hpbGUgcnVubmluZyBpbiBTUi1JT1YgVkYgbW9kZS4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2hlY2lfZ3NjLmMgfCA0ICsrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9oZWNpX2dzYy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuYw0K
PiA+IGluZGV4IDZkN2I2MjcyNDEyNi4uZWI5NGZjYjNmMDNiIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2hlY2lfZ3NjLmMNCj4gPiBAQCAtMTMsNiArMTMsNyBAQA0KPiA+ICAjaW5jbHVkZSAi
eGVfaGVjaV9nc2MuaCINCj4gPiAgI2luY2x1ZGUgInJlZ3MveGVfZ3NjX3JlZ3MuaCINCj4gPiAg
I2luY2x1ZGUgInhlX3BsYXRmb3JtX3R5cGVzLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9zcmlvdi5o
Ig0KPiA+ICAjaW5jbHVkZSAieGVfc3Vydml2YWJpbGl0eV9tb2RlLmgiDQo+ID4NCj4gPiAgI2Rl
ZmluZSBHU0NfQkFSX0xFTkdUSCAgMHgwMDAwMEZGQw0KPiA+IEBAIC0xNzYsNiArMTc3LDkgQEAg
aW50IHhlX2hlY2lfZ3NjX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gIAlpZiAoIXhl
LT5pbmZvLmhhc19oZWNpX2dzY2ZpICYmICF4ZS0+aW5mby5oYXNfaGVjaV9jc2NmaSkNCj4gPiAg
CQlyZXR1cm4gMDsNCj4gPg0KPiA+ICsJaWYgKElTX1NSSU9WX1ZGKHhlKSkNCj4gPiArCQlyZXR1
cm4gMDsNCj4gPiArDQo+IA0KPiB0aGlzIHNob3VsZG4ndCBiZSBuZWVkZWQgYW55IG1vcmUgYWZ0
ZXIgY29tbWl0IDU1MmRiYmExY2FhZg0KPiAoImRybS94ZS92ZjogRGlzYWJsZSBDU0Mgc3VwcG9y
dCBvbiBWRiIpDQpSaWdodCwgdGhpcyBwYXRjaCBpcyBubyBsb25nZXIgbmVlZGVkIGdpdmVuIHRo
YXQgNTUyZGJiYTFjYWFmIGZpeGVzIHRoZQ0Kc2FtZSBpc3N1ZS4NCg0KVGhhbmtzLA0KVml2ZWsN
Cg0KPiANCj4gPiAgCWhlY2lfZ3NjLT5pcnEgPSAtMTsNCj4gPg0KPiA+ICAJaWYgKHhlLT5pbmZv
LnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UpIHsNCg0K
