Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473C0C021B8
	for <intel-xe@archiver.kernel.org>; Sat,  1 Mar 2025 22:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998F810E038;
	Sat,  1 Mar 2025 22:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etMQnOEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E664110E038
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Mar 2025 22:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740869806; x=1772405806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CP20D9YguSCPPjqimdiGSEhDJ0IjXefUOxGxOXYFMp4=;
 b=etMQnOECZEQGix1bZVS/dkGNGzirML7bQljcXsNvpaAfqQAsAdtKFGMI
 kgf2gUYl2rDHUcyX7LhAzcS/fy8sdTDEVjjKbSHIxcnwCWJ5CUkScAg/x
 w0jCUumbW62IkOPPL/ZdpfHOGWEQkfjFTqKIU+BCjB/mCQNIJOF/hy6oX
 cbUEyc4IpzpJ3DJmRMx8Fx8tJGpDdsWg2q96k/O1B3FSlrDxm7ixNiJAX
 uY+3KwSbJokKLmA6I5JS6Hen8rNmjHfhf1u3cr/gAmgg7LHbbUS5JQRpD
 DXCX9FIz7bFMdFpE5y9AwAYej2Grr59cpQ8rO/qeggjGUlWo87qI29iqD g==;
X-CSE-ConnectionGUID: ojIfdUsPQRCVWOz3SOzVPQ==
X-CSE-MsgGUID: xTmR4FxgSYa5JbHzTJIXhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41801404"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; d="scan'208";a="41801404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2025 14:56:46 -0800
X-CSE-ConnectionGUID: GIwhjIo8SwCKsvy9Qiy+Dg==
X-CSE-MsgGUID: 5BtYXYjpSfiXVmoKxTFSYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; d="scan'208";a="122659958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2025 14:56:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 1 Mar 2025 14:56:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 1 Mar 2025 14:56:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 1 Mar 2025 14:56:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwqTOdUdITuIPb6JKFAF2ptnYX0OrH8J/SAu5dyEhdjOD730Udf6wI2gLbjFRZxLbWKKe/il4M14YX/SPnqdgjtltKRv+y0ut5FQEkR3GCSooBVHDYnPdapJslRELwaEdWqqghrVYl56dkXjzVBmJcpgfnBu5Tz+VYWy02yjtmaeK1c7cbWLBWGSaYtk0YtskFtS/pT6GnuzTopCVV/ksXnT0T5gnTpKkrHmhOyQgJPd72mjfw75p+Wdon80Q65iBT24hNgYopfNu6koBHmOx3aXWmkiObp5UukXLH1FukGoONQirHVgydFyHMA6L6+9GDvJNu1AhGbHlcPKXIWV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSl81U48FuXtpNO0nY091f4o4zck9RCHopX+PNGlmwo=;
 b=vNun8yd9gK56XEOfKdjUl7cSOznAPZtmThRyTRRLBMksWSQBuBezdShdlwEfEUYWV2Zzxh/tcTdMkyAuA04F7U6df9ucyzaUAhB09SXBBGDuQVsjmI03slDZ6pbKhizyrlp3K/mkwRtdlU5IURxI9Zwa5uMCWKPz4EG4GVwMYHCeEwP/zsIGciUb0yvddV/bIu2LQ3lB7xoo+EpDMkiQEV+OlLFNO8sat3BtRKwZa+6vDY1ntVI1TDEfVpwnjz25BnrxD/l8mmBJeE74s1oAdU+sqRQyNcm4eCSCqM47NvAkyJ2p9jbs+uxdZcHxMae67Q9aLozuz7om489SR7HClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB8861.namprd11.prod.outlook.com (2603:10b6:208:59a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Sat, 1 Mar
 2025 22:56:15 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8489.025; Sat, 1 Mar 2025
 22:56:15 +0000
Message-ID: <99e79e7e-9f3b-44c9-97d8-4a54c08adab4@intel.com>
Date: Sat, 1 Mar 2025 14:56:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
 <45qgg5bemip4eihjl6bpen5hbi7babw2itp66q3gjmej2lvs4z@gg5bp37gcweo>
 <d1a12315-878d-4186-aed9-c84662a1a81c@intel.com>
 <sgpn7n3tvy2pumhhxzy44xxs2hx5prcyaqasmlmheemqqoco7k@cttb2dr7xosm>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <sgpn7n3tvy2pumhhxzy44xxs2hx5prcyaqasmlmheemqqoco7k@cttb2dr7xosm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: c47dec89-023a-4464-b73b-08dd59144546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXJiQTE1c0wxMEVRZ0RGSzhhYmZ0RVViVmdoOFRybkFQSExnM0c1V3ZiN04x?=
 =?utf-8?B?dGN0Rmloc3RuYmNyTlNxQnIxTTlJQS9aZnM3VlNiV1NwcDRvNnQyLzYzR2Zt?=
 =?utf-8?B?RmkxR0tFSG5mUjgrZEs5TGZwS1ZFRURWckFsbHhWWVM0M1NrekgyYWtuVVdj?=
 =?utf-8?B?QVRkdmRPSGs1a0RjYkM3THVtWWJpeCtOMzJFMDNMSzk4Y1NTTFVLZGpsemNn?=
 =?utf-8?B?UmpWVDFIaTZHbExmUWtuWlltdmovT1IvMHpkbWNRZDUvengrU0F3TjlDNWRx?=
 =?utf-8?B?RGxvdnFJaTIzZGovWTBsSGlkS29pRXZlOWU3VjZXTHBnVmY2YXpkdUdCZG1R?=
 =?utf-8?B?Z1FMZ2ExZ2htRTVkSytMeGxISlBTUUp1VG9TR2pTWnZnVlZlQTlWWERiaVAy?=
 =?utf-8?B?bTdPUHZwRkNHWVhCNkE1NUFyaXVna3hyWWZYQ0txQUt1ZUoxZzRZcWpPRDVa?=
 =?utf-8?B?dkc3NDVEQ3RvMDcyQklLandNVlpIV0UxOEpMN2FqcllEcyswNlJOY2VpU09x?=
 =?utf-8?B?MlluWVo4RS8zUVRUQUM4QUdkZUZHNmQzb0wzSkJqRVRMc3FlTFFya0VtV3Zj?=
 =?utf-8?B?OHF6dkhTRmQyWkdQa0VuRzc1bzlmSkd4VzE4NXZjZ3h4TjlCNVNxRW1uemxh?=
 =?utf-8?B?aCtkSVJRU3EvUk5PbFdSMU9IcHh2MU82WVB5L2E4QkxvMklmcEpXWTlpZjlZ?=
 =?utf-8?B?aWJ1N0phcFBJTGNScThnM3d6a2F4VXNiamFOY0hxWldERkxyT05VRS9jNXk3?=
 =?utf-8?B?QURtS2Qrd3FISHlmbGJjRG81dzhhTFFuSkxoa2tPanpyeXZIVjgyUTMrVkFz?=
 =?utf-8?B?eU8zcllqT2RSbjgxbUc2MWo1QTd4UHJrcEhuSTJEdlR4K3c2cTdieCtaRm50?=
 =?utf-8?B?bjFkZ2MxeWZnRStsVndBazdUZkc1T3VQWU9JSkdoN0Y3ZmovNHpLTi9DMVhi?=
 =?utf-8?B?cWlFalRiejNKQXJ4UStXUEdzd3VpZHZZTC9LYnJSNDRYcjB1OGM4VCtQMkR5?=
 =?utf-8?B?K1ZKUXVaOUlVOEpiaHQyRUg5UnZLK2J3TExNQnhwNURiaFJHZWNFb2I1aVli?=
 =?utf-8?B?c1hwcnd3My9FakR2V0JSUlArVEhNNndhNDdmMnAvWUpBZTZlbW9BTXc1NnVp?=
 =?utf-8?B?anIwWWQrc05LNmxnK3hIZFZXZTBzYjVqaFlMZ2t1eE1JMGFyV2d5QzBibW1l?=
 =?utf-8?B?c3VYcU82NVUwNVdoSWxIaGtGK2UzZElUckRVUHVsY1NQOGdKdVE4MS9KblFr?=
 =?utf-8?B?MVNSOWhuUmdDSHVDVllkNHJXanZoZTEvWXR1dFFrTFMvT3hVQUkvNWRYdjgz?=
 =?utf-8?B?K1QzYk1GYUlGZUMvWlJVUi9ud1NqbW5Xdkw3allHdWZwT1hTd1o5QWR3SFZZ?=
 =?utf-8?B?dE83bnorNDR5V2lFTk1qb0d4eG5VTUJ2NWpNZFNUMklWQlIzdkRtMENmNjVH?=
 =?utf-8?B?OTV0NTJsQWQzM2JzNWJQWnF0L09IUWg1ZERUWlJHQzhlakNnTW1aQjdYMURR?=
 =?utf-8?B?Wm5zMmtLQUZXU2NZZGJJWWJzbTlIZFFtdjRxWXA3eCttYUJqb2dFZDZXQW1P?=
 =?utf-8?B?OXFYdWs2cHBOSWs3blAyQjAyZkJZL0x5eUllU3VmR3NqVHlrNXhkWEpwN0V5?=
 =?utf-8?B?bndiSVMrZWxhdjdoR1U2SENWREFIR2h2WFJtd0Q0SW1HMWxUdndPMndhVTgr?=
 =?utf-8?B?dUxHWWlHTlN3Tnl0dks1NFFXMEsxa3ZmaHJNZ3RRcksxZGhERTQ0SkIvOEY0?=
 =?utf-8?B?ek14bG1pSUdISWFtR1hUbnk0cFJUNkpWdHFzOXV0bDA1UkZsdE42ZVhEY0lp?=
 =?utf-8?B?VGdtRDlQZXpFNzBpcGRuVytQcTJ3REFSa3VRa3FuNm1GUkE0cFMvUGs0dndv?=
 =?utf-8?Q?lP0qzMHgauCcu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzNkUnNsSERwMkZRQ3M0ZXE1cGIvMUhIcGVCRGRVT0JTSGJET2ZPaE8zSGpV?=
 =?utf-8?B?bnVTbkFQdEQzMUZ0aFJDMWFPNVNDSnErWUdGU0NUV01oRmVWUkI3UXpRdTV6?=
 =?utf-8?B?a1RSeEsxaGRLYnEySmxjeDNLTExoVGh3OFkyOEU3dms4SzMyT2QwRWRQcjlG?=
 =?utf-8?B?RzJqdmlITElWQlg0OEVNV1hNMER2TjRaU0JQYytnT3crYlBmWHJtbmpjK2l0?=
 =?utf-8?B?YVhsL3NtZTIvLzJEZllBRW1rMUo1UitobEp5ZFphNTV5SHNjUllQbHN5VFB2?=
 =?utf-8?B?R2xiT2UxY2Y2eHlrcXZoVnZYaTRKQllCaWlDZ2dydUtqMUhqUUV3RG1rbW9Q?=
 =?utf-8?B?L0NIQnFIYk5JUEdsTit1ODQ5S1dDWGhtcjNsSGdSODg3RkxEZTVyR0l3c3Y1?=
 =?utf-8?B?dVkzYVpHQ2dZblpzSzQ3YjVETGtpbkR2QXpKRS8zVG14cG5DQjBNbHZaQlFJ?=
 =?utf-8?B?eDluOXdtcXlxMDh0UXhRWDllNVM3ZCt6SGtCSFRtMkpjamMzMHFncmdxZHZW?=
 =?utf-8?B?MVdmWSthQzk0WStvL0UybWlFS3UwU1d1U1ozWENaOG5DSFJFWjBLdnY0Mklv?=
 =?utf-8?B?RjJRRW1ZVDhhNjNKU2Nva0g5MThpcGxLTFplU2FmWGE3QkhQcDRpUjRkVEZ6?=
 =?utf-8?B?NXJCU3h3Vm1GSlprOWRtTEwwbWFQWXo4UXFWbUFwbG1vdmkrMzdiUFBpbWlv?=
 =?utf-8?B?V1VLR09Bem5oNWN0a08zRkM4ZktCWVVSSy90QTd4ckJpVG82akNNOUpteENa?=
 =?utf-8?B?bi9zSUFGUjZrTm1reW1XS2hrOWdNSVo2MUk5RDNpSnJpbjkybHJUanQ3ZjJP?=
 =?utf-8?B?bDFaWDQ0NUxlMUR5cFJhVGtNZkpGMnY0c2Q0dTJUSlVzcTA3QUdvWU81NWZC?=
 =?utf-8?B?TXRzSlhxdHdRZy9COG9Sd1hibTlwMXVPQkJDTDhNWEtFYXV2aXF1aXphanEz?=
 =?utf-8?B?eStPdUwvZWJSVXJPVnMwelZ2RkdxZGtpWXZkdHV3QkVyQjZTRXdNMFVkaThr?=
 =?utf-8?B?aHZCam5VWjdCUys0ZnBrRjVVdkdZY0xFOXpqdzRNNzNvSmp0VU50QlRTZU9w?=
 =?utf-8?B?Q0ZVTUtqblIrTnNzQi9OSG9tUzJUS0I1VE5mT1hML09FcHVrZ3F3TnhwUTlI?=
 =?utf-8?B?ZE1LZjRmVkZVVFhnenAzbkdoUjF0emd2dzFybXR1OGlCNjRFNU1xL1dvbUQ3?=
 =?utf-8?B?SFNIK0tDTXZmTlI4T29USU5kNEZEY0g4UjZQTk5tQmo2YTVmK25xKzFteGd5?=
 =?utf-8?B?SnJMOVZMd29pM012UVRZemU3WFhVQzF2Wm96eU1ISERxZlI3d3BDc0wrdFZa?=
 =?utf-8?B?elQ0NjY3T2tmNWdLSFg5WmR1OS9EZ2dkdDJFbzBsaTlYZ1hBc3dySjJvaUt1?=
 =?utf-8?B?emJaN3NPNXc3Rkg2cFloZDBnRVBYRkZyTjJpczJmTjZCMTVJWHRsSUYyamVL?=
 =?utf-8?B?QWlaR2NaVEJ5TWtKMVVzMCtwZThIaXlQMCszK1BTMHp2N1VSN3N4Y1lEZ3ZI?=
 =?utf-8?B?cllCb3VWUnJjSC9PSlJxcTZpdVZvNERmdUIzN253R2ZPQm9pUHR1WHNmeUdq?=
 =?utf-8?B?UXhYbU5oRkZoZDA4dVhwYjFaKzA4Yy9HSUt0TzNLYXpRVGtCbUFDQnEzWENw?=
 =?utf-8?B?L1I4RXNYOEFkQktNOE1PVEdlSjB6cUsxOXhmT0J5bXVJenlXMVc1LzFXSEVH?=
 =?utf-8?B?L0pHWFVyY3ZuV3JvN2VQMVVObzY4SUZMWlBCNlh3RVJiZGFPRVVoQ3RNV1Zp?=
 =?utf-8?B?cHJVM1pzcjgxQW5aVTVhRVJVa0NCell5TUZtRDU5cThQdTkrZ3Brb0Z1dDlm?=
 =?utf-8?B?SDdSMVk4NXQ0TkhiUklBM0dpRW5uNzlkY0JIV0JsNkxadkVlbVJZS3RERHRN?=
 =?utf-8?B?UklRUkUvbUNkeTVjTWVSUE9PSVV0NGRERVpIN1FvbDhkV2g2UXdDUHY3a1o1?=
 =?utf-8?B?MXhsdHJYNEZwS0VUOUY4NkxVeTZpTUZ6RVVUUjl3NndkSW56ZVE3UnYzSHFM?=
 =?utf-8?B?NWVKMjRZZVIwMWZSQS82aEplaWp3c01lblhMYjBHR1VyVE1EREd2M01jR3Nw?=
 =?utf-8?B?Wm9oL1E3eFdkVWIvNnd5cjAza2pxenhDUy9mVDhHV2hldTY2Qk4rUlNqTXZL?=
 =?utf-8?B?cnRTTWxocmxsdWZOZWNMUHNZVVNCLzdxR1RLRWdHMmRKY1RFWUFDdFNRTDNo?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c47dec89-023a-4464-b73b-08dd59144546
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 22:56:15.5016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8pVogrHkocaoU+1zOUM+wP2clW8wNkM+r/mirXeDe670M2xLYkw9TETKp2/HZIB7pYvZgLgL2qJ6ky/csb3ToUSxv0GcIILpgz1c8GmdDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8861
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


On 2/28/2025 5:19 PM, Lucas De Marchi wrote:
> On Fri, Feb 28, 2025 at 04:59:56PM -0800, Belgaumkar, Vinay wrote:
>>
>> On 2/25/2025 9:47 AM, Lucas De Marchi wrote:
>>> On Wed, Feb 12, 2025 at 04:02:20PM -0800, Vinay Belgaumkar wrote:
>>>> Define PMU events for GT frequency (actual and requested). This is
>>>> a port from the i915 driver implementation, where an internal timer
>>>> is used to aggregate GT frequencies over certain fixed interval.
>>>> Following PMU events are being added-
>>>>
>>>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>>>
>>>> Standard perf commands can be used to monitor GT frequency-
>>>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>>>
>>>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>>>
>>>> Actual frequencies will be reported as 0 when GT is in C6.
>>>>
>>>> v2: Use locks while storing/reading samples, keep track of multiple
>>>> clients (Lucas) and other general cleanup.
>>>>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_pmu.c       | 211 ++++++++++++++++++++++++++++--
>>>> drivers/gpu/drm/xe/xe_pmu_types.h |  29 ++++
>>>> 2 files changed, 230 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>> index 3910a82328ee..ed76756403ea 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>> @@ -8,6 +8,8 @@
>>>>
>>>> #include "xe_device.h"
>>>> #include "xe_gt_idle.h"
>>>> +#include "xe_guc_pc.h"
>>>> +#include "xe_macros.h"
>>>> #include "xe_pm.h"
>>>> #include "xe_pmu.h"
>>>>
>>>> @@ -37,6 +39,17 @@
>>>>
>>>> #define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>>>> #define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>>>> +#define XE_HRTIMER_INTERVAL_NS        5000000
>>>> +
>>>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>>>> +{
>>>> +    return container_of(event->pmu, typeof(struct xe_pmu), base);
>>>> +}
>>>> +
>>>> +static struct xe_device *event_to_xe(struct perf_event *event)
>>>> +{
>>>> +    return container_of(event->pmu, typeof(struct xe_device), 
>>>> pmu.base);
>>>> +}
>>>
>>> we shouldn't add refactors like this in the same patch you are adding a
>>> new feature, it creates noise in the patch and makes it harder to see
>>> what's going on. Please drop both event_to_pmu() and event_to_xe().
>> ok, will add as a separate patch later.
>>>
>>>>
>>>> static unsigned int config_to_event_id(u64 config)
>>>> {
>>>> @@ -49,10 +62,12 @@ static unsigned int config_to_gt_id(u64 config)
>>>> }
>>>>
>>>> #define XE_PMU_EVENT_GT_C6_RESIDENCY    0x01
>>>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x02
>>>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x03
>>>
>>> this will need a rebase
>> yes.
>>>
>>>>
>>>> static struct xe_gt *event_to_gt(struct perf_event *event)
>>>> {
>>>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>>     u64 gt = config_to_gt_id(event->attr.config);
>>>>
>>>>     return xe_device_get_gt(xe, gt);
>>>> @@ -70,7 +85,7 @@ static bool event_supported(struct xe_pmu *pmu, 
>>>> unsigned int gt,
>>>>
>>>> static void xe_pmu_event_destroy(struct perf_event *event)
>>>> {
>>>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>>
>>>>     drm_WARN_ON(&xe->drm, event->parent);
>>>>     xe_pm_runtime_put(xe);
>>>> @@ -79,7 +94,7 @@ static void xe_pmu_event_destroy(struct 
>>>> perf_event *event)
>>>>
>>>> static int xe_pmu_event_init(struct perf_event *event)
>>>> {
>>>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>>     struct xe_pmu *pmu = &xe->pmu;
>>>>     unsigned int id, gt;
>>>>
>>>> @@ -104,6 +119,8 @@ static int xe_pmu_event_init(struct perf_event 
>>>> *event)
>>>>     if (has_branch_stack(event))
>>>>         return -EOPNOTSUPP;
>>>>
>>>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>>>
>>> I was going to say that we don't need the other ones. But then I 
>>> noticed
>>> XE_PMU_MAX_EVENT_TYPES == 64, which is a lot more than we currently
>>> support.
>>>
>>> I suggested it before, but what's the issue of keeping a linked list of
>>> the events like rapl_pmu::active_list?
>> ok, will add the active_list. However, still need the 
>> XE_PMU_MAX_EVENT_TYPES, since I am storing the samples in an array 
>> based on event_id -  u64 
>> event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES].
>
> can't you simply walk the list updating the values in place? we are
> likely going to have 1 or very few active events:
>
> a) read hw, which may involve locks/forcewake, and get the sample
> b)
>     raw_spin_lock(pmu->lock);
>         walk the list of active events, update with the new
>         sample
>     raw_spin_unlock(pmu->lock);
>
> I didn't try it though... may be missing something.
>
> Considering we now even get the forcewake for other events on event
> init... does it make sense to still do this with a hrtimer? Are we
> trying to smooth the curve out instead of reporting the instantaneous
> value?

Yes, we are trying to aggregate over time since frequency is not 
monotonically increasing.

Thanks,

Vinay.

>
> Lucas De Marchi
>
>>>
>>>> +
>>>>     if (!event->parent) {
>>>>         drm_dev_get(&xe->drm);
>>>>         xe_pm_runtime_get(xe);
>>>> @@ -113,16 +130,50 @@ static int xe_pmu_event_init(struct 
>>>> perf_event *event)
>>>>     return 0;
>>>> }
>>>>
>>>> +static u64
>>>> +xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t 
>>>> id)
>>>> +{
>>>> +    unsigned long flags;
>>>> +    u64 val;
>>>> +
>>>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>> +    val = pmu->event_sample[gt_id][id];
>>>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>> +
>>>> +    return val;
>>>> +}
>>>> +
>>>> +static void
>>>> +xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>>>> +            uint32_t val, uint32_t period)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>> +    pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
>>>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>> +}
>>>> +
>>>> static u64 __xe_pmu_event_read(struct perf_event *event)
>>>> {
>>>>     struct xe_gt *gt = event_to_gt(event);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>
>>> gt_to_xe() avoids the additional helper and you don't even need it.
>>> You are intested in the pmu, not xe... so you could just have used
>>>
>>>     pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
>>>
>>> ... like is done in other places.
>> ok.
>>>
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    unsigned long id;
>>>>
>>>>     if (!gt)
>>>>         return 0;
>>>>
>>>> -    switch (config_to_event_id(event->attr.config)) {
>>>> +    id = config_to_event_id(event->attr.config);
>>>> +
>>>> +    switch (id) {
>>>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>>>         return xe_gt_idle_residency_msec(&gt->gtidle);
>>>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>>>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>>> +        return div_u64(xe_get_pmu_sample(pmu, gt->info.id,
>>>> +                   id),
>>>
>>> keep in the line above, it doesn't help readability.
>> ok.
>>>
>>>> +                   USEC_PER_SEC /* to MHz */);
>>>
>>> why is the unit nsec -> usec when storing, couldn't we just use
>>> NSEC_PER_SEC here?
>> Yup.
>>>
>>>
>>>>     }
>>>>
>>>>     return 0;
>>>> @@ -143,7 +194,7 @@ static void xe_pmu_event_update(struct 
>>>> perf_event *event)
>>>>
>>>> static void xe_pmu_event_read(struct perf_event *event)
>>>> {
>>>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>>     struct xe_pmu *pmu = &xe->pmu;
>>>>
>>>>     if (!pmu->registered) {
>>>> @@ -154,8 +205,105 @@ static void xe_pmu_event_read(struct 
>>>> perf_event *event)
>>>>     xe_pmu_event_update(event);
>>>> }
>>>>
>>>> +static bool gt_pmu_event_active(struct xe_pmu *pmu, uint32_t id, 
>>>> uint32_t gt_id)
>>>> +{
>>>> +    return pmu->active_mask[gt_id] & BIT_ULL(id);
>>>> +}
>>>> +
>>>> +static bool pmu_needs_timer(struct xe_pmu *pmu)
>>>> +{
>>>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>> +    struct xe_gt *gt;
>>>> +    int i;
>>>> +
>>>> +    for_each_gt(gt, xe, i)
>>>> +        if (gt_pmu_event_active(pmu, 
>>>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, i) ||
>>>> +            gt_pmu_event_active(pmu, 
>>>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, i))
>>>> +            return true;
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static void xe_pmu_start_timer(struct xe_pmu *pmu, uint32_t gt_id)
>>>> +{
>>>> +    /* Timer is per device */
>>>> +    if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>>>> +        pmu->timer_enabled = true;
>>>> +        pmu->timer_last = ktime_get();
>>>> +        hrtimer_start_range_ns(&pmu->timer,
>>>> +                       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>>>> +                       HRTIMER_MODE_REL_PINNED);
>>>> +    }
>>>> +}
>>>> +
>>>> +static void
>>>> +xe_sample_gt_frequency(struct xe_gt *gt, uint32_t period_ns)
>>>> +{
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    uint32_t act_freq, cur_freq;
>>>> +    int ret;
>>>> +
>>>> +    if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, 
>>>> gt->info.id)) {
>>>> +
>>>
>>> drop this line
>> ok.
>>>
>>>> +        /* Actual freq will be 0 when GT is in C6 */
>>>> +        act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>>>> +        xe_store_pmu_sample(pmu, gt->info.id, 
>>>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>>>> +                 act_freq, period_ns / NSEC_PER_USEC);
>>>> +    }
>>>> +
>>>> +    if (gt_pmu_event_active(pmu, 
>>>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, gt->info.id)) {
>>>> +        ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>>>> +        if (!ret)
>>>> +            xe_store_pmu_sample(pmu, gt->info.id, 
>>>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>>>> +                     cur_freq, period_ns / NSEC_PER_USEC);
>>>> +    }
>>>> +}
>>>> +
>>>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>>>> +{
>>>> +    struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>>>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>> +    u64 time_diff_ns;
>>>> +    struct xe_gt *gt;
>>>> +    ktime_t now;
>>>> +    int i;
>>>> +
>>>> +    if (!READ_ONCE(pmu->timer_enabled))
>>>> +        return HRTIMER_NORESTART;
>>>> +
>>>> +    now = ktime_get();
>>>> +    time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>>>> +    pmu->timer_last = now;
>>>> +
>>>> +    /*
>>>> +     * The passed in period includes the time needed for grabbing 
>>>> the forcewake.
>>>
>>> I don't think this is true anymore, is it?
>>>
>>> xe_sample()
>>>   1. calculate time_diff at the beginning of the function
>>>   2. for each gt, readout freq samples, using the time_diff, may 
>>> include
>>>      delays on forcewake, but that is not included in the time_diff
>>>   3. htimer is adjusted to timer_last + period
>> yup, makes sense.
>>>
>>>> +     */
>>>> +    for_each_gt(gt, xe, i)
>>>> +        xe_sample_gt_frequency(gt, time_diff_ns);
>>>> +
>>>> +    hrtimer_forward(hrtimer, now, 
>>>> ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>>>> +
>>>> +    return HRTIMER_RESTART;
>>>> +}
>>>> +
>>>> static void xe_pmu_enable(struct perf_event *event)
>>>> {
>>>> +    struct xe_pmu *pmu = event_to_pmu(event);
>>>> +    struct xe_gt *gt = event_to_gt(event);
>>>> +    uint32_t id = config_to_event_id(event->attr.config);
>>>> +    unsigned long flags;
>>>> +
>>>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>> +
>>>> +    /* Update event mask */
>>>> +    pmu->active_mask[gt->info.id] |= BIT_ULL(id);
>>>> +    pmu->n_active[gt->info.id][id]++;
>>>> +
>>>> +    /* Start a timer, if needed, to collect samples */
>>>> +    xe_pmu_start_timer(pmu, gt->info.id);
>>>> +
>>>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>>     /*
>>>>      * Store the current counter value so we can report the correct 
>>>> delta
>>>>      * for all listeners. Even when the event was already enabled 
>>>> and has
>>>> @@ -166,7 +314,7 @@ static void xe_pmu_enable(struct perf_event 
>>>> *event)
>>>>
>>>> static void xe_pmu_event_start(struct perf_event *event, int flags)
>>>> {
>>>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>>     struct xe_pmu *pmu = &xe->pmu;
>>>>
>>>>     if (!pmu->registered)
>>>> @@ -176,26 +324,53 @@ static void xe_pmu_event_start(struct 
>>>> perf_event *event, int flags)
>>>>     event->hw.state = 0;
>>>> }
>>>>
>>>> +static void xe_pmu_disable(struct perf_event *event)
>>>> +{
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    unsigned long flags;
>>>> +    uint32_t id = config_to_event_id(event->attr.config);
>>>> +    uint32_t gt_id = config_to_gt_id(event->attr.config);
>>>> +
>>>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>> +
>>>> +    if (--pmu->n_active[gt_id][id] == 0) {
>>>> +        pmu->active_mask[gt_id] &= ~BIT_ULL(id);
>>>> +        pmu->timer_enabled &= pmu_needs_timer(pmu);
>>>> +    }
>>>> +
>>>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>> +}
>>>> +
>>>> static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>>> {
>>>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>>     struct xe_pmu *pmu = &xe->pmu;
>>>> +    uint32_t id = config_to_event_id(event->attr.config);
>>>> +
>>>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>>>
>>> if not using a linked list as suggested, please drop this. Instead 
>>> block
>>> the event init from succeeding.
>>
>> ok.
>>
>> Thanks,
>>
>> Vinay.
>>
>>>
>>>>
>>>> -    if (pmu->registered)
>>>> +    if (pmu->registered) {
>>>>         if (flags & PERF_EF_UPDATE)
>>>>             xe_pmu_event_update(event);
>>>>
>>>> +        xe_pmu_disable(event);
>>>> +    }
>>>> +
>>>>     event->hw.state = PERF_HES_STOPPED;
>>>> }
>>>>
>>>> static int xe_pmu_event_add(struct perf_event *event, int flags)
>>>> {
>>>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_device *xe = event_to_xe(event);
>>>>     struct xe_pmu *pmu = &xe->pmu;
>>>> +    uint32_t id = config_to_event_id(event->attr.config);
>>>>
>>>>     if (!pmu->registered)
>>>>         return -ENODEV;
>>>>
>>>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>>>
>>> ditto.
>>>
>>> Lucas De Marchi
>>>
>>>> +
>>>>     if (flags & PERF_EF_START)
>>>>         xe_pmu_event_start(event, flags);
>>>>
>>>> @@ -270,6 +445,10 @@ static ssize_t event_attr_show(struct device 
>>>> *dev,
>>>>     XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>>>>
>>>> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>>>> XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>>>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>>>> +             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>>>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>>>> +             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>>>
>>>> static struct attribute *pmu_empty_event_attrs[] = {
>>>>     /* Empty - all events are added as groups with .attr_update() */
>>>> @@ -283,6 +462,8 @@ static const struct attribute_group 
>>>> pmu_events_attr_group = {
>>>>
>>>> static const struct attribute_group *pmu_events_attr_update[] = {
>>>>     &pmu_group_gt_c6_residency,
>>>> +    &pmu_group_gt_actual_frequency,
>>>> +    &pmu_group_gt_requested_frequency,
>>>>     NULL,
>>>> };
>>>>
>>>> @@ -290,8 +471,11 @@ static void set_supported_events(struct xe_pmu 
>>>> *pmu)
>>>> {
>>>>     struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>>
>>>> -    if (!xe->info.skip_guc_pc)
>>>> +    if (!xe->info.skip_guc_pc) {
>>>>         pmu->supported_events |= 
>>>> BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>>>> +        pmu->supported_events |= 
>>>> BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>>>> +        pmu->supported_events |= 
>>>> BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>>>> +    }
>>>> }
>>>>
>>>> /**
>>>> @@ -306,6 +490,8 @@ static void xe_pmu_unregister(void *arg)
>>>>     if (!pmu->registered)
>>>>         return;
>>>>
>>>> +    hrtimer_cancel(&pmu->timer);
>>>> +
>>>>     pmu->registered = false;
>>>>
>>>>     perf_pmu_unregister(&pmu->base);
>>>> @@ -334,6 +520,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>>>     if (IS_SRIOV_VF(xe))
>>>>         return 0;
>>>>
>>>> +    raw_spin_lock_init(&pmu->lock);
>>>> +
>>>> +    hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>>>> +    pmu->timer.function = xe_sample;
>>>> +
>>>>     name = kasprintf(GFP_KERNEL, "xe_%s",
>>>>              dev_name(xe->drm.dev));
>>>>     if (!name)
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>>>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>> index f5ba4d56622c..cd68cba58693 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>> @@ -10,6 +10,7 @@
>>>> #include <linux/spinlock_types.h>
>>>>
>>>> #define XE_PMU_MAX_GT 2
>>>> +#define XE_PMU_MAX_EVENT_TYPES    64
>>>>
>>>> /**
>>>>  * struct xe_pmu - PMU related data per Xe device
>>>> @@ -34,6 +35,34 @@ struct xe_pmu {
>>>>      * @supported_events: Bitmap of supported events, indexed by 
>>>> event id
>>>>      */
>>>>     u64 supported_events;
>>>> +    /**
>>>> +     * @lock: Lock protecting enable mask and sampling
>>>> +     */
>>>> +    raw_spinlock_t lock;
>>>> +    /**
>>>> +     * @active_mask: Bit representation of active events
>>>> +     */
>>>> +    u64 active_mask[XE_PMU_MAX_GT];
>>>> +    /**
>>>> +     * @n_active: Counts for the enabled events
>>>> +     */
>>>> +    unsigned int n_active[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>>>> +    /**
>>>> +     * @timer: Timer for sampling GT frequency.
>>>> +     */
>>>> +    struct hrtimer timer;
>>>> +    /**
>>>> +     * @timer_last: Timestmap of the previous timer invocation.
>>>> +     */
>>>> +    ktime_t timer_last;
>>>> +    /**
>>>> +     * @timer_enabled: Should the internal sampling timer be running.
>>>> +     */
>>>> +    bool timer_enabled;
>>>> +    /**
>>>> +     * @event_sample: Store freq related counters.
>>>> +     */
>>>> +    u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>>>> };
>>>>
>>>> #endif
>>>> -- 
>>>> 2.38.1
>>>>
