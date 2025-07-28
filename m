Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E86C87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 07:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142DC10E0E1;
	Mon, 28 Jul 2025 07:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dN4jQU7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A28D10E0E1
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753688935; x=1785224935;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=prPpwovZDVCwjiTToFbmfaH6zM9QmLXLwT2PBp/p6YI=;
 b=dN4jQU7bXEsawVOi55pV8pHIRAlZTgR5/TaY83LWI+X/GG75EIw916XW
 l+e2FeEBLdsTRLxl2IZWexUigxsi6IJd5jwN1anA20hYVKUmT7KCFAFpY
 K28KmQGi5FvfiSnA2FWAHoFTYASiNI+jjkDOK20HaWKRAQu39MSt5hbRH
 iRz1GqavOucUVooIYMLoLrVpmFIdxOblbxElHhzOtgBSE51DgKWR2A0z4
 97azLFiCfRGPhR4FGmfOMtj5bl0z1SF2QWNLCcgwPW7HwEoIbd5Q0uqdU
 eSUEO1zi6rH81+FXTZcNdBndM1ccyDBTMSc07Uq0PjgcuTp/ogLp4oh4M A==;
X-CSE-ConnectionGUID: JlsHT7k3TMSI/x2GkFDYqw==
X-CSE-MsgGUID: AB7jtOYCSQOr0njOiqgfDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55139314"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55139314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:48:54 -0700
X-CSE-ConnectionGUID: Ba6FuytDSWeP8FfQOO8tNg==
X-CSE-MsgGUID: s6DA/qtlRSi7g+VIBWOwQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162062104"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:48:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:48:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 00:48:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 00:48:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjKr8/ni0VAHcXJDdVd2kIQVA6BduInAzQt7vLcL463VhwpIBD4Y/dd1zWmDQmXrOiMNB65WO5e1miRCbnAfNsuhLVTmQxBZ+cozkt3q21klVOoiXLu/NZcAZYaZlbz43FBDC7gucmOmqVjnh2VRDc6fY4tDZsHcGwwJlvqi2vVghWnBqju6cCsO3zeuVtqd6phnGgjWcoWEHdU49Hs5+/+HQvxuJ9/+6uHLt1zFFpVEuFtfKxcdYeqweKXrw3RSVbckGPnvIO7w2lb6/dx7I0nCLZBI6Ai0YG1xrWZ7WRgvKodpy1l4XAG0DboGpiJhsaKxEyWZFjlRxmaqewbruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt2O7OBXT25B8Lyl3/zX7VW+t32uNj5N+dbrC4iie+E=;
 b=QpP85dg5jC6xZURzpX8lsrdiKr8sqFkAqj9Dqx3V28RTLyTFtirCAzEP1GPPcnQ2saNrdRks7GIl4vvZfzH9ju2Y/EP3ogV3XQnwbO2DMmKQry1HIJV3Vv7tHDCdxst4KzqVxJSIwW8fzDIMAInltQM4JW1AhsW375wINQMQ6hJtcOfVwvPK35EaYQ4ZKf0HOhCQtjHCU3WemPEoj8Bhh0Y2AWh71SGVd6dkrDCwns0yNHnw1oihk65IMVQmZU7YpYS0OtqozWfxp/Byh8p8Py3V3xe31U/Z8l2mkJ00aQRik8SQ6X1ATqMpEvPNsrB16Nceds+N+Wu/ChKt7yslGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA3PR11MB9423.namprd11.prod.outlook.com (2603:10b6:208:582::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Mon, 28 Jul
 2025 07:48:51 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.8964.024; Mon, 28 Jul 2025
 07:48:51 +0000
Date: Mon, 28 Jul 2025 00:50:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
Message-ID: <aIcrz1E451pCQU+4@lstrano-desk.jf.intel.com>
References: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
 <aIcn426bvQsqEUor@lstrano-desk.jf.intel.com>
 <LV3PR11MB8695EF712CA3683DCDD589B7F95AA@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV3PR11MB8695EF712CA3683DCDD589B7F95AA@LV3PR11MB8695.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:a03:117::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA3PR11MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6bbd2e-e793-40eb-1dd0-08ddcdab315f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDloT3BZSk5CNmxNK0p4dmo1L01aSTlWckdRdkQ3OGtuY2FiZ3ZTNlMvTDhz?=
 =?utf-8?B?NktqaEl4citZWC9leFlOdzJZVjRFL3lSWno1U3o4bThpbC9zdzBIRWpqdTls?=
 =?utf-8?B?cGlZZ2VMMEJtdjBhRHUwYzFmbFhYVGV0OEoyR0hkcVNBUUhnN2ZXNi83Z2Rp?=
 =?utf-8?B?d25zSnpzWUtjSDhCMUZXY0U1QXI3V3AvUVNYMWl2V2N3bFZzaWtPUWsrTkZw?=
 =?utf-8?B?NzYrM21GV2o2TEpxRkM3Z0lTMkU2MW5GR0dVWkJpU0hNcm4vQ1lJRENvcEtm?=
 =?utf-8?B?eHI5UXRUc1Q1eW5CcGlaWEcwUjE4MnNsanFMMjhTbE5yTzdxK1dLVTJXckpi?=
 =?utf-8?B?UVVnS0ZCUGRvTDI4ZkIzQ3FsdWJsakNId3FWZVZlMkNvQ2tHYjdXUGdaQVZh?=
 =?utf-8?B?TWRFb3VnTW8vKzFISHFzTEtySXVHYWtrQ0ZqK3RQZ3luczJQWEhleWpXOXZX?=
 =?utf-8?B?c3NhNXptWHJFUkg1QVVrQUZjZzZNT1hUY2VrUzFsSzBwdmtYN09LSVVLbDMz?=
 =?utf-8?B?M2hEVEQrUzVXWTltcHRKRkZPamhWeU5PNEhJU1cwSko5ZmdLRHdkOUl0Ym94?=
 =?utf-8?B?Y3NMWXNIQk42czc2YTFlNCsxUTgzM0ZwT0JRcHl4bFV3dWZ3RlBTRVg0TmNj?=
 =?utf-8?B?MUp3a09yR09IdXRwTUhKaEFreHZGdzhRZC9oQ1ViWERNZzFWR0UrTFowQW9o?=
 =?utf-8?B?SUcyaExKNWhjTjNiQ3ZMMnNEdEc0OElSM0loYVdYcTMzcFlRSDA4SHVjV3p4?=
 =?utf-8?B?endpR3hjbmVNT1JJY0c4YWdVS2hTNlU5eXRLeThkNnFOOGI0bWxFWkd4aGFa?=
 =?utf-8?B?dE5oRXFGMzBoc3M4YWFRcWU0Q2xwdE9jRzg5M2FtemFRbVNxNVhiaDBlcjdB?=
 =?utf-8?B?cEpoWHBNaWNOQ0lYNWFTREdZengwWGVGVWJYUGVvKzVCSFk5a25uemhmcmVl?=
 =?utf-8?B?OStYQVRUSklDTlgwNlNSNlJhdFYwUHBRQ1hJdnFNczBhUkFVNmNPY21iSkg5?=
 =?utf-8?B?UlNZL2NYVjZUbnBIZUx3N3V2Q2xxV2d5Rk94WE9QYTM0YnJGNGRobVR2MXdn?=
 =?utf-8?B?QVoyVXN1U0MxSEE0QnFEb1RRWkEybW5DRzJyQnJoOWRDcjh4dlNXOHY5SUhL?=
 =?utf-8?B?c1kxUFN4dEtEOEZMK2dZOVBVdHk5QVlzakhnKzllWCtsbWZwTlo3b3NsRUQ2?=
 =?utf-8?B?NkRzVGZUY29zSzFhR3hjdExPb090NFhXNS9aV3c0bkYxVVJjTmVid0VyUGhC?=
 =?utf-8?B?RTY0cEFQQUNENVQzRXJvWlo5WXVTWlZONjNoeWcrcnRHeXR2VGk2Y0JENXo1?=
 =?utf-8?B?OHhpRUJRKy96cFNWVlVFVXRzWWhuVERKRTJoMnVabFVvWDhPdSs3RTN5dlBK?=
 =?utf-8?B?N0ZCN3g0d0RibTNBVkdlWUx5dXJkRWFPajh0Q2tIOGd5UkgzN2FkemxBeU4v?=
 =?utf-8?B?cituRSs2WnBrbWNkQXpxMWRyME5OUDdYZkhJeHlNOUhrWFBzb0tqYXE0em1t?=
 =?utf-8?B?WFB2cituYmV4Qk50TjZiVFBmTnNpa3lEdDY0dG5XRGJ5MnpZMkJlOVhjdEhy?=
 =?utf-8?B?ZnhEL0k5a2N1bUlJMU9iRldJYmZGSnNsZXNWWW44eUFmMWt4eDZCTUZOaXVX?=
 =?utf-8?B?UU80VEFtWjZCU0tBcEtPRGNLSzNvbDdXdG41MGdzMkxJdXRvcVpQMkJJNEgw?=
 =?utf-8?B?c3V0aGlXa1pTd2J3dXhOSUxLKzB2THJVK3JEcmN4eXA0THh3U2RMci9XdEI4?=
 =?utf-8?B?Q0ZaeWJQVHBPQ0Q0WjFOQzVLSmh2OUh2RTRQUnJOYTNYQzg4NVBBdG1xOGdU?=
 =?utf-8?B?Sk80T3VqNlFPMnY5bzVDbmhlQ24zWENSd0JRUnp5cEhQRnJCV2pqTkhjKzNk?=
 =?utf-8?B?L1J3TVdFMlAwVXdpKy84REF3ai9CVmgweWhsWDlicnVVVmtxZXpvb1N0MkZl?=
 =?utf-8?Q?G2arxtJH8NU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3NaUVBOdXllQVFyem4yK0U0eHVTMXdSZ3pNdy9lSU9ZaStlSWNiRVZNcVM3?=
 =?utf-8?B?Zm00Y0l5YmZISVNRVWt2MTJTc1V2TDZ5bzAxeXlmbjluRUFKZnczekRETnZt?=
 =?utf-8?B?MXI3a0kvVTZPMTlNeUxTZW1EUkx2Y1FEbU44RE02dk5sNDZoQ2k4UmE5RWJX?=
 =?utf-8?B?SjJOYnNoMHFwSk1tNk1VS0xtZUNwdFhIR0pCakExS01FRml0aGhkcTBZKzZU?=
 =?utf-8?B?OFNPSlA2WWM2WTlQUWQ2S1NRb3d3L0VWSjZNZWxCTjFyTDdvVnc0WGczZWJk?=
 =?utf-8?B?UkpuUUE1VDV3RkFVd2RCV2xpN21UclQwSEpvbEU3aVowRmFnVkNsK0RJRTdL?=
 =?utf-8?B?aW94WVZrOERTbW81bE1FNnhLSXNFMHpDcENycUJMZFkxUUtpbUVIeVFYRm1w?=
 =?utf-8?B?MXlTK0pnbDFBem9KbXJqb0V6NjhMdEhmdFo0VzFIRExnSm5UL3Jsekl1aUN3?=
 =?utf-8?B?T3k1RHBxZmpGT3JrV0gvUHlBTjVoa1V3OS9vVzVYZ3BYTVhXY0NOd211WXlC?=
 =?utf-8?B?Ym5JblUvMjZxVDVkNzM2OWxxTVhqcXhiYWxjTUs5b2R0djZuc1dITCtpZVVt?=
 =?utf-8?B?Ry9oZHFTUCtyVExXUmpZdVJUZWZuTEl4TXZ2VTczYjcvcXI0TGo5bWZkMTR3?=
 =?utf-8?B?Rm1FRHhIM29LMUpBVU1waWI0aDc4a1RMY29xd0RQVlBRMXRoSGJPSVJJamNo?=
 =?utf-8?B?cXUxZi9tRENCdkZJbEUxU0lZc2loTnRoVFA0Y3V3M2xZK2ZVVlpsRE1Ud1Rq?=
 =?utf-8?B?N2JENmpGcjBuSXIxUStucU95YUs2ZVdWSTdkMjBwZnhob1lVcktHZWRmMnZv?=
 =?utf-8?B?d1ovWjhLb2RGSkpFTGwwY1ZlY3NpcGpFeUFsMHVIVEdWbFBDdzBncTIyRDYw?=
 =?utf-8?B?dUJTZEpnNHBTRis5VDVUajdadFlIMFFCOGVGVjB4RmpIVUtiZjE1R0Rya0Np?=
 =?utf-8?B?eHVjek5saFVpY1FRSVFPcGUwOTRpSEJMTFZ5ODNEeTFLcmRLR2RLRVprY2RP?=
 =?utf-8?B?RVo2MnNreGJFVkJGLzNPM0QwUlBMN1FlYUJkdU1GemtnUm5pNHhWemZZdFY2?=
 =?utf-8?B?TG1uWmJYRWQreE10OVltSWNEdW90MW1JNSs3bUNDUVVVc1pYa05GMEdhYmI2?=
 =?utf-8?B?RGVETzU5bFU5d3NzdEFZM202YWl2Ykp0RmpZT1FrWWZDS3pveDUwaG1sNVUy?=
 =?utf-8?B?d2FqeEdqZUVvNi9BeHNnNWNuQ0VFYlJ0T2IrajNaRlhhbHgwSXdZcUpkNXNP?=
 =?utf-8?B?di94THlTWU9TZGtacmtCVUw2ZlIyTXNlQy93U3V1L0lGSjBNZ2NHbEJSVy9z?=
 =?utf-8?B?cld3bDJ0S1VRS1BoWUpwUXBpTWhyTUVlREtjRGtQUnJud1VVQzJzSEo5U1h2?=
 =?utf-8?B?ZHM2NVJyQ1IrSnhsdStWSGtGaXptU1A0YTNyd2Rnb1ltRHd2SDVHcDZPUkhz?=
 =?utf-8?B?bGNYdk1TNTE5c3kxUFpHcFUrODlRUXRqdmNvbVlHU0VxUUhiSDdyQ201Tmxy?=
 =?utf-8?B?Q1dQSnJrNkxyOVBYTEtiVUlEMzVTYXRmRmJ4QVZpbnAvZU1tYlRYc2xOelZP?=
 =?utf-8?B?cWNBVGN0OXN0bVppZmRFaG9qbkE1MmY1M3NzbTVaS1F1ZkJNM0lsc3h5aWcw?=
 =?utf-8?B?TVpycW1ZSjNnVG9SSFAvNHl3NHhJak1mejk1RVVxTzZXWkxjR1lxOTM2QnpC?=
 =?utf-8?B?bWwwY0xxWnRBaXZEMHFhTU1aMTdFdWc2a29tNUV5V2VNL2ZBNmN3TVA5Qm5z?=
 =?utf-8?B?cVBUM2t1VTdLOGJ1NFYvMk5RZEoyYkdTUXVmWmtWRjlKSExYeGhhQ2tjYm5D?=
 =?utf-8?B?dlFVSTQvNWVUbjU2MWt2eEJpdVJ0RkZybXVWelRpVVZZcy9qRGVjMm9OYXJp?=
 =?utf-8?B?MGplVU5nNFJKZTNPb1dseHEveHQ1N3F1VnF1TERuZUFtU29US21nU3JFVm16?=
 =?utf-8?B?V2tmU2N0YWh4R1lXa1daZWNML1dqay85TnhHdVJqbys5OHhJdzFtRFZ1Mmk3?=
 =?utf-8?B?eXRzTE04MERNc1V2RG8wOHJUUkp2QVdkQzNsMURCTXp1ajF3N0pqOERldWdw?=
 =?utf-8?B?NHV4ejNUSkVRRDl6dUhFdCttc1NldXdUbktqQ0s5VDBPZTVUZ0lEaUNpeFhh?=
 =?utf-8?B?YTZXZ05kUnBoUExnS1UrMDFiWUI2WTQ4ODBGRUNVMTR0NjlVTHQwbk9iTTJG?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6bbd2e-e793-40eb-1dd0-08ddcdab315f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:48:51.1757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjbMbbGIu5wbtxgY7Df2YUIMD9lT+gioARyWeONNE2zdV18wOhNhnfJ58Y1gRMYufT4GwFIHGjJzJCkhMWGdnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9423
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

On Mon, Jul 28, 2025 at 01:39:38AM -0600, K V P, Satyanarayana wrote:
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Monday, July 28, 2025 1:04 PM
> > To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> > Piorkowski, Piotr <piotr.piorkowski@intel.com>
> > Subject: Re: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
> > 
> > On Mon, Jul 28, 2025 at 12:10:02PM +0530, Satyanarayana K V P wrote:
> > > The VF CCS save/restore series (patchwork #149108) has a dependency
> > > on the migration framework. A recent migration update in commit
> > > d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> > > caused a VM crash during XE driver release for iGPU devices.
> > >
> > 
> > My strong view a revert, restructure to use single xe_migrate object
> > that initialized on driver load, but provides queues for the VF
> > migration needs.
> > 
> > Matt
> Hi Matt,
>  We had agreed to use multiple migration contexts earlier during the review of CCS save restore series.

Yes, I initially pushed back but eventually relented—that was my
mistake.

xe_migrate is a heavyweight kernel object and should be allocated in
exactly one place, not multiple. This series highlights how fragile it
becomes when that principle is violated.

More importantly, I was assured this series had been tested before I
merged it—it had not. That makes me reconsider letting my concerns
slide, and I don't believe a quick fix is appropriate here. Please
revert and properly address my original feedback.

Matt

> We can take this activity as an improvement (if needed in future), but do not think we need to revert 
> The whole series just for this new change (The series was approved with multiple contexts).
> 
> It is a new change which separated xe_migrate_alloc() and xe_migrate_init(). Now we are adopting the 
> CCS save restore series to the new changes. 
> 
> -Satya.
> > 
> > > Oops: general protection fault, probably for non-canonical address
> > 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> > > xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT
> > communication channel enabled
> > > CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W
> > 6.16.0-xe+ #4 PREEMPT(voluntary)
> > > xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1
> > negotiated ABI version 1.0
> > > Tainted: [U]=USER, [W]=WARN
> > > Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5
> > T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
> > > RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> > > xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF
> > ABI 1.0
> > > Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> > 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74
> > 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
> > > RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
> > > RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX:
> > ffff88811a028c40
> > > RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
> > > RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
> > > xe 0000:00:02.1: [drm] GT0: reset done
> > > R10: 0000000000000000 R11: 0000000000000000 R12:
> > ffff88811a029c40
> > > R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
> > > FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000)
> > knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00005af31328c000 CR3: 0000000114534004 CR4:
> > 0000000000f72ef0
> > > PKRU: 55555554
> > > Call Trace:
> > >  <TASK>
> > >  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
> > >  devm_action_release+0x12/0x30
> > >  release_nodes+0x3a/0x120
> > >  devres_release_all+0x96/0xd0
> > >  device_unbind_cleanup+0x12/0x80
> > >  device_release_driver_internal+0x23a/0x280
> > >  device_release_driver+0x12/0x20
> > >  pci_stop_bus_device+0x69/0x90
> > >  pci_stop_and_remove_bus_device+0x12/0x30
> > >  pci_iov_remove_virtfn+0xbd/0x130
> > >  sriov_disable+0x42/0x100
> > >  pci_disable_sriov+0x34/0x50
> > >  xe_pci_sriov_configure+0xf71/0x1020 [xe]
> > >  ? sriov_numvfs_store+0x78/0x160
> > >  ? _parse_integer+0xe/0x20
> > >  ? _kstrtoull+0x3a/0xa0
> > >  sriov_numvfs_store+0x10c/0x160
> > >  dev_attr_store+0x14/0x40
> > >  sysfs_kf_write+0x4a/0x80
> > >  kernfs_fop_write_iter+0x166/0x220
> > >  vfs_write+0x284/0x550
> > >  ksys_write+0x6f/0xf0
> > >  __x64_sys_write+0x19/0x30
> > >  x64_sys_call+0x2bf/0x2660
> > >  do_syscall_64+0x93/0x1320
> > >  ? ksys_dup3+0xba/0x170
> > >  ? __x64_sys_dup2+0x2e/0x1f0
> > >  ? do_syscall_64+0x1a2/0x1320
> > >  ? __rseq_handle_notify_resume+0x447/0x5e0
> > >  ? trace_hardirqs_off+0x5a/0xd0
> > >  ? irqentry_exit_to_user_mode+0xdf/0x2f0
> > >  ? irqentry_exit+0x77/0xb0
> > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > RIP: 0033:0x7e030351c574
> > > Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f
> > 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77
> > 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> > > RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX:
> > 0000000000000001
> > > RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
> > > RDX: 0000000000000002 RSI: 00005af318d7da30 RDI:
> > 0000000000000001
> > > RBP: 00007ffd34a107c0 R08: 0000000000000073 R09:
> > 0000000000000000
> > > R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
> > > R13: 00005af318d7da30 R14: 00007e03036045c0 R15:
> > 00007e0303601ee0
> > >  </TASK>
> > >
> > > Update the VF CCS migration initialization sequence to align with the new
> > > migration framework changes, resolving the release-time crash.
> > >
> > > Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > >
> > > ---
> > > V1 -> V2:
> > > - Updated xe_migrate_init() input arguments and return type (Michal
> > Wajdeczko)
> > > - Fixed review comments.
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c           |  6 ++----
> > >  drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++-----------
> > >  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
> > >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++++-
> > >  4 files changed, 20 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index c8eda36546d3..5a79c6e3208b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt
> > *gt)
> > >  	if (xe_gt_is_main_type(gt)) {
> > >  		struct xe_tile *tile = gt_to_tile(gt);
> > >
> > > -		tile->migrate = xe_migrate_init(tile);
> > > -		if (IS_ERR(tile->migrate)) {
> > > -			err = PTR_ERR(tile->migrate);
> > > +		err = xe_migrate_init(tile->migrate);
> > > +		if (err)
> > >  			goto err_force_wake;
> > > -		}
> > >  	}
> > >
> > >  	err = xe_uc_load_hw(&gt->uc);
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 90065d7d29ff..7e295ca00763 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile
> > *tile)
> > >
> > >  /**
> > >   * xe_migrate_init() - Initialize a migrate context
> > > - * @tile: Back-pointer to the tile we're initializing for.
> > > + * @m: The migration context
> > >   *
> > > - * Return: Pointer to a migrate context on success. Error pointer on error.
> > > + * Return: 0 if successful, negative error code on failure
> > >   */
> > > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > > +int xe_migrate_init(struct xe_migrate *m)
> > >  {
> > > -	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct xe_tile *tile = m->tile;
> > >  	struct xe_gt *primary_gt = tile->primary_gt;
> > > -	struct xe_migrate *m = tile->migrate;
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > >  	struct xe_vm *vm;
> > >  	int err;
> > >
> > > @@ -412,14 +412,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> > *tile)
> > >  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
> > >  			  XE_VM_FLAG_SET_TILE_ID(tile));
> > >  	if (IS_ERR(vm))
> > > -		return ERR_CAST(vm);
> > > +		return PTR_ERR(vm);
> > >
> > >  	xe_vm_lock(vm, false);
> > >  	err = xe_migrate_prepare_vm(tile, m, vm);
> > >  	xe_vm_unlock(vm);
> > >  	if (err) {
> > >  		xe_vm_close_and_put(vm);
> > > -		return ERR_PTR(err);
> > > +		return err;
> > >  	}
> > >
> > >  	if (xe->info.has_usm) {
> > > @@ -430,7 +430,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> > *tile)
> > >  		u32 logical_mask =
> > xe_migrate_usm_logical_mask(primary_gt);
> > >
> > >  		if (!hwe || !logical_mask)
> > > -			return ERR_PTR(-EINVAL);
> > > +			return -EINVAL;
> > >
> > >  		/*
> > >  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> > > @@ -450,7 +450,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> > *tile)
> > >  	}
> > >  	if (IS_ERR(m->q)) {
> > >  		xe_vm_close_and_put(vm);
> > > -		return ERR_CAST(m->q);
> > > +		return PTR_ERR(m->q);
> > >  	}
> > >
> > >  	mutex_init(&m->job_mutex);
> > > @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> > *tile)
> > >
> > >  	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
> > >  	if (err)
> > > -		return ERR_PTR(err);
> > > +		return err;
> > >
> > >  	if (IS_DGFX(xe)) {
> > >  		if (xe_migrate_needs_ccs_emit(xe))
> > > @@ -475,7 +475,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile
> > *tile)
> > >  			(unsigned long long)m->min_chunk_size);
> > >  	}
> > >
> > > -	return m;
> > > +	return err;
> > >  }
> > >
> > >  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > > index 3758f9615484..e81ea6b27fb5 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
> > >  };
> > >
> > >  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> > > -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> > > +int xe_migrate_init(struct xe_migrate *m);
> > >
> > >  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> > >  				     unsigned long npages,
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > index af43e04179aa..bf9fa1238462 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> > >  		ctx = &tile->sriov.vf.ccs[ctx_id];
> > >  		ctx->ctx_id = ctx_id;
> > >
> > > -		migrate = xe_migrate_init(tile);
> > > +		migrate = xe_migrate_alloc(tile);
> > >  		if (IS_ERR(migrate)) {
> > >  			err = PTR_ERR(migrate);
> > >  			goto err_ret;
> > >  		}
> > > +
> > > +		err = xe_migrate_init(migrate);
> > > +		if (err)
> > > +			goto err_ret;
> > > +
> > >  		ctx->migrate = migrate;
> > >
> > >  		err = alloc_bb_pool(tile, ctx);
> > > --
> > > 2.43.0
> > >
