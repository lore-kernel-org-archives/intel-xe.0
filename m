Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC69C54FAA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 12:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDA18924B;
	Wed, 28 Aug 2024 12:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n19StlU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA218924B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724849662; x=1756385662;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=rNUj53qAhtrkw/nggwvOH00vTPe1ydfT4qVluPbe3xY=;
 b=n19StlU06RyMQAAO7ZNa7aRsQHy/CHzWFkNZAnKUgyOXQmbOS8wyEUV6
 BEXiDdSFVnOuNYVsBOBzFmIfQ37zqfwMnFv8u7/L2FKBHAxFRnUjakU1N
 BKJRP8bsWeH5eAGmWBBMrJJmXJrW3qPAR/whMWeNuLNAMhJv7ugFN52bO
 p0jtGiJjuTl9TObjypQHeM0spgX8qSateMkZ2xRLR9ssVSggVhtOWQ2Ql
 3Vlz7mq5L22aV4MxQz6PAZphRFfcwe5GL1PjNzs5VdCzLGl0TMoqTGX62
 GlZOKWV2AnAopMtEg5m+Tz7HadmCv24A0dwMQbQeb5I52r2MPCV9Z5ncL w==;
X-CSE-ConnectionGUID: I3sgXERTQK6LoKWZb0t7tQ==
X-CSE-MsgGUID: UwWPBX2VTnu/uK29OHMiZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34754566"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="34754566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 05:54:21 -0700
X-CSE-ConnectionGUID: 6MIHqVMjQYihwjBbRlxJHw==
X-CSE-MsgGUID: eF6Qhd5ZRLmOVosmnEu6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63055467"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 05:54:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 05:54:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 05:54:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 05:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxECKEYhUnK/3F8lojKtkHRQvC23k3pnuxlcCgg0aMEqfdH+924vX5hcZAsLygvX4dLuimyBAdNvsNK6QSLoE4SMYyFX2SjZJ0SxXfjSbvkI11IsRjRELs1KxHJFvCcq/mRrCXXgSNoVWyPO9v0bgBr2eDJ50A/kZ+LagNEcctdx1dwsHMgF4rRuxkC+eo2kG1a6tr7Fz0ZakkhwyI6X2Eg2DOLpvpUriecRIwSzg8ImVLXqG/mqcPFHlYLV2cSlqpbcbAuDNAc2F1MBWu+sCenfJxuv+TPRYmHwJ5y01iZ7hzQeGyKGPUQSFPnJxjX5LawwtFpA78pql21TMQDUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/nCWNz+YSJYjSrvHPVzfrl/DJIbV7XpCnYzACOlPkQ=;
 b=YUtRBImc9U13fxAlvFPPTo6zSSxOMDDfoCwUR4NrdmI3DIJtnUj5nd6XKX4HdwWshhCa48dmBS5+C6FRVsKNw98v43c9oPokoG737EqOvfAL081dtuQEbSwAmUWfE8uEy3TEAssbsZOupJ61nE5QD+2qTRCQ3qZRZN5fsqEYI0Swf6X0zaMJ9ru3af+GeZlO8CoUHfpzMcwdR6IXGv+DMpDVMkQqb4/rucKVCmdqCVRtrWusg9mc5K8fmV9nSad7pY7CUKOwI+mBONlJsbHjhH53XMUicgW7UEpDDCfxVMbpYGutTlCW4l4WCdjP1XULWu/xO1BmHOduSj2GEzqtwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 12:54:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 12:54:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240828084016.1699041-1-tejas.upadhyay@intel.com>
References: <20240828084016.1699041-1-tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe2hpg: Add Wa_15016589081
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 28 Aug 2024 09:54:12 -0300
Message-ID: <172484965245.10303.6832474261653861316@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: a0201c07-ca6d-4fe2-16b5-08dcc7608766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TC9WNG5ZOEZvVndGVVlWQ1ArN1FWcVQ2WGFOZFRib2I1OUp6K2JQZisxdkxV?=
 =?utf-8?B?TFJpSWgvbWh4a2dsNHMwcEhyTmh5bW4rajNKN0QrcWtFa2o5OUxQRGtwRmgy?=
 =?utf-8?B?NWlyZlFNZVJXZXl0M0pzeW9pckFOdmdjNXhvYVgvaTVVSFlla3VrVXREcHZk?=
 =?utf-8?B?bmpmd0VqNlFNU3JNZW5CZTErTnFBeW5TZnhEQzAvb1hlcjZJRzFHS3hrcUJy?=
 =?utf-8?B?ZDNVdWtqeHJNUVRNNC9zbzVZQTg5NGR5Y0tRa09NdmdsZmJMNlJXRWdxVy9M?=
 =?utf-8?B?MXNUaTNWMlZ3ZmlVWCt1MWdSTUI0ZUJRNDZKK293alA2OFlnU2ZyaU1HWVRJ?=
 =?utf-8?B?V1BNeDRSSktZVDdqVXRHVDVoeU5EWk9DcW1QNFkyekhDUDc3L0pCNlNxMjNr?=
 =?utf-8?B?b2tzdUIxazFqT0U2N1huYWxNeUVxYXJ1Q1dTazlOdGh3Q2E2TVZoWGlVMCtI?=
 =?utf-8?B?Q1JrTTlRT2srSzkrc3ZieExFYmFDWUZVSE5VV1NXYmNaV1lNWlBlTllqcGxZ?=
 =?utf-8?B?eXF1N1gxV2tlT1BrMWZ6dU5ENGU2WXVGV3pxaUxtc2tkTy8zU3g1NFZLc1pS?=
 =?utf-8?B?czhVWnFHQVBmR2R4NkpmdTFuQUdYc3R6RURqNmxQNlp4Y1ZlSlVlRDZEMVBD?=
 =?utf-8?B?QXk3LzFGMWRISklTbnppcXB3RWRMZGg5UkVqZEpKbXNWM3RBRm5lVzVBUFls?=
 =?utf-8?B?ME8xSkN5UHBaMzg4ckRsWUdGZm05elVXM01kYzRYZG55U1B1NFYyY2ZmeEtB?=
 =?utf-8?B?ejFRcGZsb0hNTTNWMXY4RHltWHVhRGlBK09UU1lLWEJjSG5XMFEvaFdnVXIz?=
 =?utf-8?B?cHhaOWRoM3JrR3pnSml6aHJ3a1YrT0JGNzZ2WTVMdTBPTEl6djdFMGpIVEFh?=
 =?utf-8?B?S1dlL1c0b1JVZER0L1lYTWl1TkpWTHZURlpJK1VHNk40YzJtRE5qK2lJZTA5?=
 =?utf-8?B?NktqRDNoQW9zbnJvdUFqUnVrYUFTb2k2a1B5cnF3VUJub2lLZDlMM1FGYTlu?=
 =?utf-8?B?Sm1DRDVMUXFMOGJib0FyMGpocS9mNGthWkhQbzZkSjE5QlJndTdSdGNLbDlV?=
 =?utf-8?B?ZUEwei80SDZMdmJPa3ZtMm5FcWJybEU3eWM0U25tdWJMYi94NU1sUUZaRFBE?=
 =?utf-8?B?Y3FnUkY2VHR1K3d0YWlhQ2NBaGIwT3NmYlZYVnBETEJ4K1RoeXh0cHNXZTk2?=
 =?utf-8?B?WU1Rd3h6UFVrNStySmtwQ3NxRk9vc1lRSHJ4eGdJWXNUNXlTWEgzWXFPbHNS?=
 =?utf-8?B?NXBUdjZBRjhDMW1hOWRuK1BNcGg2ajAvZlRKMVE2NThRMmFOOHVZQ1owWnYz?=
 =?utf-8?B?V1prRk5yUFVCWG1OaVN4NUtMNE5KZmNPRTA5bjM4RjR0clBNanZyanl6U2l2?=
 =?utf-8?B?UUpCazVaWjhLeGdVN1o1dmt0T1NoSnZNeXBMMThLS2RTdlJ6cjlNSFN6Qm9o?=
 =?utf-8?B?YTZ3TTBpYVJkRzdURCt3Z0V4ZGk0ZllzQXY4WnNvWXB1ZjdUNW5CSkFwSGI0?=
 =?utf-8?B?TmNRNVZpYW0yRExPdHc5em5oYm91TmdKbHowRmo5TzNkQnZseHd1cDVxcGxL?=
 =?utf-8?B?c1hiT29PaDZkUjdhK2tHbFJLUDR4MHBOdXF3SlpCVWJ2RFBzSXMzcDBOVGhl?=
 =?utf-8?B?UHdpQWRraWRERHZjbXFFWDBGYmlEdGdSRktrTnNnVGpqNTEySlBza1JaVU9x?=
 =?utf-8?B?d1NiKzFXd1UvYzdpdWRkMEhPMDJpdDg5YkNSVkI0dEcyUWs3WVovVE9qbTJY?=
 =?utf-8?B?eGRDemZWNzNsNW1DaFBMcHVWVnlocUdSdW9rVFFMMlVaR3VhTXZxeVRaSVpx?=
 =?utf-8?B?NEVONDl4N2Z6S1hvT3NCUHV1SlNrWUUrdmlGRGd4VkplK2tpU2xxbFJobFVB?=
 =?utf-8?B?cyttcThOZTZKUGhoRk1LQU1XNDBFZHdxWCt3Sk10RjlOdlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJhdGJkREVML1FMenRtSWFDdmdnSWxpbjMwUjFjTGZFNE41aHE5UVpuS210?=
 =?utf-8?B?RFUyWVprQ0tzT0xOVXdPQlBZNnhqU1lUTjNFTGdDdndaWGc5UkYzakNRc0N1?=
 =?utf-8?B?VEozbjQwWURBS1JoVGxUZ3Zwajg1MzB4ZWxxU3FnaEp2YVlveHFaQUVFUnJp?=
 =?utf-8?B?VVhRdXRWS0RRWkhJYlAxNlJtaGZLajRFeFZMQ2NkbXBDZmNMaTU0eEhmUGRn?=
 =?utf-8?B?RW1UZnhkZE55RE5hS0ZmMUFpMHZvZmUxMEIwd24xVEdOdWNMdzNYUGZuSFd5?=
 =?utf-8?B?Wm1XMGEyT0ZNQ3RDL25ISlBHWnR4WWFUa2J4NXZqdHdwdVB2cUkxaXloUWd1?=
 =?utf-8?B?dHNzQjd2MnkyM2R3LzNXbTlXQU51OFlXMGkvaVZYbzJ3bEZPOURoS3ladVlZ?=
 =?utf-8?B?MGxqK24vR2hXU2tGNWpOclhWKzUycDNlaFg0RnZSaE05aFpycXg5NjRUU2Ir?=
 =?utf-8?B?U1RTTzNoQmI2NEVqY2tNKzFkbERCUWp3Wk1ZRUE4OVl3d2xSUlBvSVRlTzVa?=
 =?utf-8?B?MktSQ0pXVGxRSkx2SmRINnBvOVRSbUJOM3FyYjZRZUU5djZzUDFaNXlqMVRH?=
 =?utf-8?B?cHBSWHZZUGZxRFFpeHpMOTZsQlRUTDlIT1NPZWlrRXJwaGJjNGFpTzdoVUpD?=
 =?utf-8?B?LzFPUnRuUGRueTFYR3FHdUJzMnptVHE3SUdSQ1pJWFg2TWxDdktuOHZpVGRo?=
 =?utf-8?B?Skt4SjFDRzRtNWsrOVp5eWFORW05UXZ1RUlGaG9OMmwreVVBSTFzU1BiekVl?=
 =?utf-8?B?SGNBelhObGtsbW51VFlHSGY3dmpSUmIwRUxBa2JYSjZlb3o0K3B0bTJuYSt1?=
 =?utf-8?B?WUNiTGo2dEtWenVKK0JZUWRqY1FCcVQxdEFjV1c0Y2JYZEZxZmFGMlA1MHZN?=
 =?utf-8?B?c05sb3VpRzdsSTlXenE3eXFXNGRFVXNUd2R6dDA4ZEhjUU96MnkvQzRzR2tO?=
 =?utf-8?B?LzlqM2lEZnViWURTYnlDdGN1cjhqNUdQcUt5Wi85eHVmR3hxOGl2Ri9Mdlo5?=
 =?utf-8?B?N0Yzd294SS8xMU1LT3FJR1FaY25CTUFwS25qV1llUWp0S2pXbGoxMmxnTk9s?=
 =?utf-8?B?TWJlWnlPSXRWWmNWVTFVcHo1QUc0K0hZdzVQZlI3RnhIMGp4a3lodzdmMGVO?=
 =?utf-8?B?WndwTTRPZm1uQlJuYnUybmRxSU01dm5wY0FxU0k3dmt6QUY5cDZXZ3ZjR1Qx?=
 =?utf-8?B?SlZ2dmlMYWxXRFh4ZXJvY0prSkhweXZnSkdrUnIvYSswRGEyU3plbG82UW5L?=
 =?utf-8?B?SzVJaXFIZGQvWW83UkRQZVRwWXlJOU5JYTFjVGxQVzVMaEorNzBGNkIzNm8y?=
 =?utf-8?B?OUQvMVVvRjBULzZseklsbjVPRG5pUWtNUCt1c1o3SlZHcTlDN3RaUUZJMWJ5?=
 =?utf-8?B?bktwV0NidHJtV2dRN2dQeEhYREdDQkhjendRTVFIRnp5QjdlZ1VoNDQ4WTRt?=
 =?utf-8?B?dk96ODVwSGk3K2Y4dnZmMGlZbUxwamkzSFMxVWExWnJZVE9VeGdPN1BqU055?=
 =?utf-8?B?dEFWcFlaLy9SOWFBS0FpODBqdU9pMHpuT25ESGQvcmFrN24vbGovcmE1K0Zl?=
 =?utf-8?B?WWtrd3BzcExzNE1pWnVOSnhiMUtwVG9EeHY1amlWS0pQRFVFcGEzaWFTUFYw?=
 =?utf-8?B?TXUvTStTTldvanFMU1JET2swOUE1UG9Kc3RpYU91MG0wMndoaHBMbWs1UW8r?=
 =?utf-8?B?L2p3ZzlxZTdFazRrc0xFbWpFbmpvM012WWg0L3FuTTJPUGRlN2JpQWMybTMx?=
 =?utf-8?B?SFVJMjhJd2hBckFNbytxUkpZYXloOVptcmRVUjdWWmhCT0tKUzRLOXFrOHF1?=
 =?utf-8?B?V1EzWlVjY3FIOGZGQ1RHNi94U242c0M2RkcybkxuUmZRei9iRktWQVBtSVIw?=
 =?utf-8?B?TlVYem5ySE9xYlFyNEM1eU9lUm1CM1lNU3MwZU1sRUpmd3V4Sk1FTjM3S2ov?=
 =?utf-8?B?eFlmYndMM2ZrWXRPbWQ5OC91Y1A3V000Y1hTN1VwK2pzVmVwMHg2bnJQVTEw?=
 =?utf-8?B?NlI5dkV0WGwyU0pUcU9DaFhIUlN5c3ptYUtPZjFPSFYyV3Q4VU5CWU1YR09n?=
 =?utf-8?B?Qm9wOUJWNmllUnFiaVVnTWhXNjNnSWpYNjlKU0NYNGs0dzZ6Mm9zK2doNDZX?=
 =?utf-8?B?bFcwZHpkRUJ4dHBobXB3WWw5QzN6QUpUMXdoVDhpUUZLSjRKZ2phY1FoSEhL?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0201c07-ca6d-4fe2-16b5-08dcc7608766
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 12:54:18.3290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbyAahZ+Mu9UciWcosUs+HBA6wjH/RxFvJoBOlq7erX17lscWl2GJFD7rGZXJ4MNddCsSCU9+Lm7zahUe8XITg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
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

Quoting Tejas Upadhyay (2024-08-28 05:40:16-03:00)
>Wa_15016589081 applies to xe2_hpg renderCS
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index 0d1a4a9f4e11..07b41ecf19b7 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -105,6 +105,7 @@
>=20
> #define CHICKEN_RASTER_1                        XE_REG_MCR(0x6204, XE_REG=
_OPTION_MASKED)
> #define   DIS_SF_ROUND_NEAREST_EVEN                REG_BIT(8)
>+#define   CLIP_NEGATIVE_BOUNDING_BOX                REG_BIT(6)
>=20
> #define CHICKEN_RASTER_2                        XE_REG_MCR(0x6208, XE_REG=
_OPTION_MASKED)
> #define   TBIMR_FAST_CLIP                        REG_BIT(5)
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 28b7f95b6c2f..f437b8649637 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -733,6 +733,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>                              DIS_PARTIAL_AUTOSTRIP |
>                              DIS_AUTOSTRIP))
>         },
>+        { XE_RTP_NAME("15016589081"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>+          XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, CLIP_NEGATIVE_BOUNDING_BOX=
))

I would use DIS_CLIP_NEGATIVE_BOUNDING_BOX for the name of the field to
indicate that setting it means "disabling" instead of "enabling". With
that,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+        },
>=20
>         {}
> };
>--=20
>2.25.1
>
