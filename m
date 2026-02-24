Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC436EEC2B7
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 01:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410010E0A9;
	Tue, 24 Feb 2026 01:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxaPRfcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AA210E0A9
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 01:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771895980; x=1803431980;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4JW9DCr0Q4/zUS9lLAk4J5bQ5MZKysQZwLb5HB2VgOE=;
 b=cxaPRfcTxNBAieukWDM2/eZkeFW7ZZA12oXy6JBqRECkM7lkx+sZ6HwA
 xi1iYhJamS1zo7ezTrODT/rVmEXncSChWelBLH2nqqTJoPs6caEXYlMok
 zxlfqZ6/DqyCKuw5pioiyJ/BimDdl2p7lNoqKeUNcmt4+O+ER2hLfZ9Fg
 fyXvzYAicBc9ZUXaJBg1SlikZ8qToeRUpAtCctF1B3gDZuXaJVcaJas1y
 uDFZsyvIWIZBtia/nGui8fVsgeB/GLxMiHB5c4vIVX1MsF/nC60jiesgM
 P3x5RDoFEsG3H8puDlKLV2KSrrb+l/xwBSGqdAshsjpr8nW93EeAbRAgF g==;
X-CSE-ConnectionGUID: 90UKaCRKSmCfhV4cnX2tWg==
X-CSE-MsgGUID: P5JpcPBUQTKh3rTJENP/ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95520821"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="95520821"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 17:19:39 -0800
X-CSE-ConnectionGUID: dU56EpVrRb6vb7TIp84xZA==
X-CSE-MsgGUID: BrukIZwZQFG3H6wYGa9myw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215758392"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 17:19:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 17:19:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 17:19:38 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 17:19:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EriviKKW4I6EojGmuiL5B6P4DwHTlK5kzxomrT1LFTWkdqRuXiWldYXe95MFQi1fvEfXT5LaJX5eUhmizSGa2IkvtvQG+1WS3ukp7bRFEiG6wGoJPONVdtUc32NXR9gYYj3CfZU2n5xu6Ku5dc74XvTBnuGySSOHvri+WVGvtPwkuGqWCCNhvMXAcnf/StnfHb7ZUhnpEXUxQE8gKZY3ndHhBPl813lw0mdOMqxczd3+5romM6JPCux5T61bAv8pz9k4IuFqdmAap4HIbKK8PoTdpOdwulgF9nAYheJI3syTvfWWcLY9i7zyuajZwlhaBf2VEaOg7ne9XsKwRqbHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JW9DCr0Q4/zUS9lLAk4J5bQ5MZKysQZwLb5HB2VgOE=;
 b=GrKLlVZfl6lsobUwx56LsKV3kjIjiUAg/8ws2uB5k00Eq2DC1gHQer5fCy6T2CVuKY2F+2MDNGNVI6niEcpHjGq7E6GcKtDhv1ND8wAnCBsHnr0DyfdxigNwBByyOeqRNdpFNj+Aydk/ZkTahGOylFdDI42UQ2twQhBz50f2oYKCymzw5YdQKjhzYcIYBScTybzF7V3GDxY3XKxJcqjuB/vgHVNrGMK/b6nGfAsEGQwA58kYv/V/sSPnULsdqGTNayCiEYVWQFv9+eQXlZ4KjEANIX3my1VffIH25yNG5ikHN8fysYpb369QlKrf9VrlFn0Xqe7QcWPMKHtaonlIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:19:36 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:19:36 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/2] drm/xe: Consolidate workaround entries for
 Wa_18041344222
Thread-Topic: [PATCH v3 1/2] drm/xe: Consolidate workaround entries for
 Wa_18041344222
Thread-Index: AQHcpSI21i4tpK96U0Krx77it7x4xrWRDEsQ
Date: Tue, 24 Feb 2026 01:19:35 +0000
Message-ID: <DM4PR11MB5456D780AC5F7B1FBBFE8011EA74A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
 <20260223-forupstream-wa_cleanup-v3-1-7f201eb2f172@intel.com>
In-Reply-To: <20260223-forupstream-wa_cleanup-v3-1-7f201eb2f172@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|LV8PR11MB8699:EE_
x-ms-office365-filtering-correlation-id: 4f8aae31-53b8-486d-634e-08de7342c5ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Njl0eXV0SDlLeHd0MHN1RlR2SFlTejEyemJ1U2p4Uk5XVjJkZ2J5YWlKcjNm?=
 =?utf-8?B?ZzdHVHRycEsrKzZmeGlCY09mOVM2THdyd3R1TWM2MnRpdkNLUGYzak1kMmhC?=
 =?utf-8?B?eUNyZnhOdVpCbEM5bjU0MW8zbGFnTGU5NGhiTWxFZmVwV1VYakpiTktKVEgw?=
 =?utf-8?B?WjZ6bkUxRmdXUUMwbkV3eGF5RjJGdEYzV01RM0pFeExsYlZLd3FEL1FRN2p6?=
 =?utf-8?B?TGQvNHZMWWQrb1lDL0JuY2N2Y2RCajRjd0E0Vy9nYjNRZ1FtS0RLVElwT1pr?=
 =?utf-8?B?UERDVmVvN0s2TzV0TyswRzc4YjJobGFzOFFydm1jaXh1TXdrUGRKdFlKQmd1?=
 =?utf-8?B?UHNwWloyTFRnT0xtbUVYYm5rQllPMjFFMDBGUXJwQ0NSOU9UT3RzM1JGR0Zo?=
 =?utf-8?B?T1c4ellTZFpnZFphWWtwZVIwWll3RXNHaXlFbXBpaC9TdUZhL1ViRDR2SmdI?=
 =?utf-8?B?dGdsMU15cWoyVU8zWVJhcjQ2bFphOHhvVnRMTVRXaythK3dyd3JGZzYyZVZW?=
 =?utf-8?B?NVdwUkVDa2pSaGpFenpkRTloL3Y5ZnBWYVRBNFVVd3pmSktoUGlKeVVTWlpI?=
 =?utf-8?B?Mmp6Z3ByWGNsTU9pYzRaWGo1YTBzUjEvL2pJOUtjYndKTWRLRXF4OVRQaWdp?=
 =?utf-8?B?QlJoNDl4em9jdjAwNkROUVZSeGRWNzZsaVJDcGIzOVR4WXZoS1JxTThtZ1M4?=
 =?utf-8?B?d2tmTnRDV0pIYjRGa2VuR1gyZU9iVFJTb1c5V0lVVGRHbStITXdaZmZrNkJG?=
 =?utf-8?B?M3U4Rm83Si9hdXJYMHJEWlZZVXJJTGVEaFpvTlk2Q2hLWVRZVVNmbVpkVFlG?=
 =?utf-8?B?NzZRMGczSm13bXBmejl6TnNPUEhrakh4QVFZRTZJYWRjcHp3RWFFMEtMZVJl?=
 =?utf-8?B?RTVNWW5zSFJxMllod2RWUWNDaWN3djNMeUxLUUFNRmJoblc1aTgxc3RVdjQr?=
 =?utf-8?B?TmFTSHZyZ1ZJL3NsQktGT3kyOVZ3bHJENVdJdnQyc2ZaOU5HTlFVUHBxU1Zq?=
 =?utf-8?B?ZlgzRHpZenBlaitUMVE0MW9KU3pZNXkvTHRXSks3Ymlkc0NGbVkvS295K3lk?=
 =?utf-8?B?dDcrbWRwaDZMamNTU3hSNDRDNllFSFlxS0tlUGNRWjhiRnhOcXVQNFNiZHRC?=
 =?utf-8?B?SCtZaFFwK1RxemFzbWFMRkhWbFlMc24zRTBnQzlvaW1vNlo5Uk5BbCtKOXdy?=
 =?utf-8?B?Q3p0dzlXOXUrckc2ZDhmRVpQak8xR2E5Yms4L2lTTmFtNFN2VnF3S1RsL2Vo?=
 =?utf-8?B?eE1LNWY1RFhBaDJrYk9PUFYvNE1ISGhQY1liYXE2SU9mc2VwV204Rmp0c1VJ?=
 =?utf-8?B?RDV2Zk9oTm1mMU11TnFxdlZxckxiQVNoRmpoeDZLZjZEM0VLK2tPSzZTRzhE?=
 =?utf-8?B?Vm84U05lQ0tJWW1odC91QVZrUUErMEtUWWx0K1ZscE01YWx4MSs3TUhiWHhO?=
 =?utf-8?B?QUIvL3E5S0tsTDFtQzRHYVRVZFN5eCs0TTNnT0dMTDRHU2FUakZKOC9jQ24y?=
 =?utf-8?B?Vjl2SThRbWZKTnA5bTZ3KzFzbkgyREEyaVlhU0cwYTJ5ZUp0TVg3NE5KemND?=
 =?utf-8?B?SDVNemJacjVJUlZMUVlGWGNKTjNiSlJ1R3hEWkd1RVBLMHQrNHlIUnFyYVFl?=
 =?utf-8?B?U0dLVmJDOWZBN2hvNmR3bXUwcWdFYlRxUDJPZmw0YmNxQUdoQU5PNVg1cjlW?=
 =?utf-8?B?cTZneG5TUWFDM202YWhsaXZnRkhOWDZJMHpqWlpNZFFZaUwzUWh6dXVhNjVZ?=
 =?utf-8?B?ZDRCUmtoQVI5MVJPTzB1UmozdFRtN21oRmZRMm83YnlTT3BBN1JSRWQwc0pH?=
 =?utf-8?B?UDY4T2RBRXBrbHdnRENwb3RCYWRvQVFPdXREMGlGMGJ2NHFjSmRoamwwYnhS?=
 =?utf-8?B?MERHOXdYSEZmM3VISXNjQ3NyWS8xZ2Z2eUxHcFg4UVhqS3pFaG5BZXNZV0Nx?=
 =?utf-8?B?M1E2RjJjVkEvcGpSNFJZTkxsdXNMRXZ2VkFZSnlycVJzcHBtSDlUZHVXVjVn?=
 =?utf-8?B?bjNiL3dRYlRhaGVJRXNLK00wNWtTb2tIbjhEY3ZpYzV5djUzYjBrbmtqa2s4?=
 =?utf-8?B?bDdjYTFYUnZxK1BLSXVaaEdjU2RDcURNL2xFZWozczJqV0M2Qm9QcHBXaEhH?=
 =?utf-8?B?dExGZWhDWmRtc0FJbEFYVUd3T0crbldXbWRiNUdBUmlFaXJEc1RpUVAvZVIy?=
 =?utf-8?Q?BJzPhJu91ayBX91XUjCEnAM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW4rWGRLVHUrRTNwbWhSbFhDcTJNYzZORXJQT0xXaExSM05WR3pGcXRoTk1P?=
 =?utf-8?B?U0g1cmNqenRDYVlFSjlNVmZ5RlFXUXkvcWJNSHRvZEtLWjRYeUVGNG9NeGhZ?=
 =?utf-8?B?MzB6aUVPV0FHRDNBYUl6eEx6Q2liWGc5MHJ3SnBtMUNkVHBiVFRuY09nUi9m?=
 =?utf-8?B?aSsrOTNKWFNMZVk2RFZ4MmZXeVRlRlV5QmFTVEQ5UWcxSWNCWWpTMncycVls?=
 =?utf-8?B?NTl0bitiSkU0Q0NPOCt4czhZaE5iMWJ6VG12RGg0RmMyWnlUdEY0V0lxQ3VM?=
 =?utf-8?B?TWNpNjN0dHhid3hBRWQ4bmJKVkFjWVNmMlFVYVpFMDZ2UmQzb0NDWjV2RG9L?=
 =?utf-8?B?VVhQb1pQaGM0My9hQWhnUklvUVRMaDdLYkdGQm5XSmphVktKdmdpL0RQZk9K?=
 =?utf-8?B?eGJ0Rnd0VWNhenkzaVozeExQZ2xxM3hNa1lGVVRwSUZoYmpZTGpFbWg0dEk4?=
 =?utf-8?B?c0l6ZUpOeTFpQTdwNUFDQ2llLzFLRzZtMG5wUThJaGZWUlZMdnF2MGxKZDRj?=
 =?utf-8?B?Tlh0WWlBdnUxK0Zld2ZVK1lDQVZLYlJaOUtDeEhkRjFSaGpIYmdQNWEzYmhO?=
 =?utf-8?B?Rlkvc3NrQWp0MEpMbndaZEc1dUlUSXhpb1NsZzEyTFgvTTY4dGZIYmtHVXN4?=
 =?utf-8?B?NnhnY3hyV2svQ3U2MDJaQnppdTZ6c1h0N1VleFhyTTlYZ25QMHYzUGdFeWMw?=
 =?utf-8?B?ME9Ea0ptL1I0cUdTTkV4V055VTBlOWNjNTczazl4dVppMHB3TDJzN0dEV3RQ?=
 =?utf-8?B?QXNCZm8vdDhTVW0zS3hjMDJsR0tMRnlib1gxRXEwZ1YvWFBDUHkxK2JlQXJD?=
 =?utf-8?B?SkFwTWh5cnBQWWJGNDVUMk05OGhSSjZrcE0xS2wzVHRtZFZ3US9vcWx5QjRl?=
 =?utf-8?B?cHF2dU1CSlozTjlqT0R1NUtBcU5iYzJiYk5zOEc4R2IzVjBOOXpZWXovRExV?=
 =?utf-8?B?OGpHU3RoekJ1aXF0YTQwL1BtdDBNdGdydnhYdTRxSTA4U3ZSakhST005akpi?=
 =?utf-8?B?REswMU5DR3pZRmJkdlhyMUVLYWxEN1JFY0Q2QmNSem11TTNNWkdQd0laUzJv?=
 =?utf-8?B?cDUwbk9kSDhESnlPaW9PVWtnT3VGNkVHV3hMbUJqSDVzTlE2ZXVHS3MyMytO?=
 =?utf-8?B?Y09OK1MvZktoTDJxY2dMZ3BQY2xDNWdvT1R4MnJwWGgzb2k3eWl1a0lwMWJH?=
 =?utf-8?B?THdqdm1YdmltMVUxb3VZZkJIQWkyZjNSc1Flc1dqdE14YjkrVzZmNFhvV3gy?=
 =?utf-8?B?cER5ZU5RS1F4TmdNZGVXS1dNRTJwZCtkYzk3SlAvWXlFc3hpOGZGMk5aT1RI?=
 =?utf-8?B?RFQzbWViSXVpbTcrVkZLRE5rYndFVlhqcER3NzZqSWRhZ3FBRTZ4RWk0WDdQ?=
 =?utf-8?B?OEcvOFJ2Um1heEtUVk5mVmQ5QW85U2JjQmtuUUhpcjZnaURkMXN6d0VmZXdm?=
 =?utf-8?B?NG9ZdzBuTnp5dmVreFYvOUxsYnRYaEdRS1lHVytDWlpueHVVd0dIMzNsN3Mv?=
 =?utf-8?B?SWN4Q3ZTNEpDblVFOGljZ0NzMk4wQitFVjBNRzNJelhRSFFETG1UajhVb21h?=
 =?utf-8?B?N3NQSTNaSkRVVmNwU1Vkc3BRUElNWXZlUVFyZ1pQSllRSGhBZ2UrMmlJanBj?=
 =?utf-8?B?QkxxeHJLaWRvSjlCd1JjOW8wSmlPOGRFcGFBOWg4c0tRL1hPTVlOeTRxYWt0?=
 =?utf-8?B?NzMrMGdKdDJTSThEYXM3VDlJNjFNZDBUWmpJenFCODY4SU0xV245SFhxUlhr?=
 =?utf-8?B?K0NzaG1kZjN2aURvNVM0YTlqTm5kbDAvSnN6Zjdvcm9jSE9NbUZENlpQK2l5?=
 =?utf-8?B?b200NVBzQ3BlWWFkS2JZRFBhSFJ6L0RHUDRBMDkrTTJqb0tBWVZqOG9YUHZo?=
 =?utf-8?B?YXFlTWJoQ2x6aUgzckhzRDhoWTdBWEN6d1lTRFcrOUVVc2J5L2VuUHJoakJL?=
 =?utf-8?B?a1RaVVlZdGJzem1GR3pMeXZNVjhjdC81ZzVnS0tKNnBVZzVIRlcrUHZ0VzNS?=
 =?utf-8?B?UjBpVUVMOXFSQ1M5aStrd2daM3lRcnJWSVhnS3pRMERXNU5KM1VxYkYrQUdB?=
 =?utf-8?B?SktiNnFwTGVhZWs3SWUwNlREYXgwWCs3d1l2Unl3bVZNc1UvcmlvamVxeGZ2?=
 =?utf-8?B?d0V3NEdwbzJ0TXRSdWJ6YXNRNzY4K3NtanZPaDM1K204bXV6cE1IWnBWcXRZ?=
 =?utf-8?B?ejBhbVA5T200ajhLN0psNllEVGFNRHB5UHNlNkFYajNaenA4ZHREZUMyZW50?=
 =?utf-8?B?MWxRQmF5M1B6enV3NTlKNGhMOXV1SDZDUXBjQUVvb0FWUTBRK294SEF3VS9S?=
 =?utf-8?B?UjJRMGlyVWhXUmpJWmY5NlBnaGlBb2Q1SXo1dU4zMEJjTVo2aFMwSkhmWTZR?=
 =?utf-8?Q?YxuoWEBIlLgobtKOKXfEefrp+86YIH1vCZss4FfGk4HXj?=
x-ms-exchange-antispam-messagedata-1: fDRRRBbqetKe/w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8aae31-53b8-486d-634e-08de7342c5ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 01:19:36.0013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xTgLn/+hrfxmEhKts4wrqwDB/dXfDhpBNqulHa+tbpmRipNbU+YFxIMPoHxFaRkEgqgg7af0ROnlwefkZ4WOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8699
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

T24gTW9uLCBGZWIgMjMsIDIwMjYgNDoxMiBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xODA0
MTM0NDIyMiBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMzAuMDANCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IHYyOg0KPiAgLSBEcm9wIHRoZSBG
VU5DKHhlX3J0cF9tYXRjaF9ub3Rfc3Jpb3ZfdmYpIHRvIGFsaWduIHdpdGggY29tbWl0DQo+ICAg
IGE4MDBiOTVjMjQ5OCAoImRybS94ZS94ZTJocGc6IFJlbW92ZSBTUklPViBWRiBjaGVjayBmb3IN
Cj4gICAgV2FfMTgwNDEzNDQyMjIiKSBhbmQgY29tbWl0IDBmZmU5ZGNmMjYwYiAoImRybS94ZS94
ZTM6IFJlbW92ZQ0KPiBTUklPVg0KPiAgICBWRiBjaGVjayBmb3IgV2FfMTgwNDEzNDQyMjIiKSB3
aGljaCBqdXN0IGxhbmRlZC4gIChTaHVpY2hlbmcpDQo+IA0KPiBDYzogU2h1aWNoZW5nIExpbiA8
c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTogU2h1aWNoZW5n
IExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfd2EuYyB8IDI0ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
YyBpbmRleA0KPiBlYzg1YTJiYmU1ODE2MTIzMDJmODA4N2EzYTBhY2IzM2FjMjhkMzkzLi5lZWU1
NmIwMDBiMTRiNTllYTY2Yg0KPiBmMjI3OTA1YWY3Yjg0ODU4ZDlkOSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3dhLmMNCj4gQEAgLTM4NSw2ICszODUsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBf
ZW50cnlfc3IgZW5naW5lX3dhc1tdID0gew0KPiAgCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hf
Zmlyc3RfcmVuZGVyX29yX2NvbXB1dGUpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChURExf
VFNMX0NISUNLRU4sIFJFU19DSEtfU1BSX0RJUykpDQo+ICAJfSwNCj4gKwl7IFhFX1JUUF9OQU1F
KCIxODA0MTM0NDIyMiIpLA0KPiArCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFO
R0UoMjAwMSwgMzAwMCksDQo+ICsJCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5k
ZXJfb3JfY29tcHV0ZSksDQo+ICsJCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9ndF9oYXNfZGlz
Y29udGlndW91c19kc3NfZ3JvdXBzKSksDQo+ICsJICBYRV9SVFBfQUNUSU9OUyhTRVQoVERMX0NI
SUNLRU4sDQo+IEVVU1RBTExfUEVSRl9TQU1QTElOR19ESVNBQkxFKSkNCj4gKwl9LA0KPiANCj4g
IAkvKiBUR0wgKi8NCj4gDQo+IEBAIC01MzEsMTIgKzUzNyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgeGVfcnRwX2VudHJ5X3NyIGVuZ2luZV93YXNbXSA9IHsNCj4gIAkgIFhFX1JUUF9SVUxFUyhH
UkFQSElDU19WRVJTSU9OKDIwMDQpLA0KPiBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJf
b3JfY29tcHV0ZSkpLA0KPiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9UU0xfQ0hJQ0tFTiwg
U0xNX1dNVFBfUkVTVE9SRSkpDQo+ICAJfSwNCj4gLQl7IFhFX1JUUF9OQU1FKCIxODA0MTM0NDIy
MiIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT04oMjAwNCksDQo+IC0JCSAg
ICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29tcHV0ZSksDQo+IC0JCSAg
ICAgICBGVU5DKHhlX3J0cF9tYXRjaF9ndF9oYXNfZGlzY29udGlndW91c19kc3NfZ3JvdXBzKSks
DQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQoVERMX0NISUNLRU4sDQo+IEVVU1RBTExfUEVSRl9T
QU1QTElOR19ESVNBQkxFKSkNCj4gLQl9LA0KPiANCj4gIAkvKiBYZTJfSFBHICovDQo+IA0KPiBA
QCAtNTU1LDEyICs1NTUsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBl
bmdpbmVfd2FzW10gPSB7DQo+ICAJCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5k
ZXJfb3JfY29tcHV0ZSkpLA0KPiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9UU0xfQ0hJQ0tF
TiwgU1RLX0lEX1JFU1RSSUNUKSkNCj4gIAl9LA0KPiAtCXsgWEVfUlRQX05BTUUoIjE4MDQxMzQ0
MjIyIiksDQo+IC0JICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAy
MDAyKSwNCj4gLQkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRlcl9vcl9jb21w
dXRlKSwNCj4gLQkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2d0X2hhc19kaXNjb250aWd1b3Vz
X2Rzc19ncm91cHMpKSwNCj4gLQkgIFhFX1JUUF9BQ1RJT05TKFNFVChURExfQ0hJQ0tFTiwNCj4g
RVVTVEFMTF9QRVJGX1NBTVBMSU5HX0RJU0FCTEUpKQ0KPiAtCX0sDQo+IA0KPiAgCS8qIFhlM19M
UEcgKi8NCj4gDQo+IEBAIC01ODYsMTIgKzU4MCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVf
cnRwX2VudHJ5X3NyIGVuZ2luZV93YXNbXSA9IHsNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChS
SU5HX1BTTUlfQ1RMKDApLA0KPiBSQ19TRU1BX0lETEVfTVNHX0RJU0FCTEUsDQo+ICAJCQkgICAg
IFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiAgCX0sDQo+IC0JeyBYRV9SVFBf
TkFNRSgiMTgwNDEzNDQyMjIiKSwNCj4gLQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9O
KDMwMDApLA0KPiAtCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVuZGVyX29yX2Nv
bXB1dGUpLA0KPiAtCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZ3RfaGFzX2Rpc2NvbnRpZ3Vv
dXNfZHNzX2dyb3VwcykpLA0KPiAtCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9DSElDS0VOLA0K
PiBFVVNUQUxMX1BFUkZfU0FNUExJTkdfRElTQUJMRSkpDQo+IC0JfSwNCj4gDQo+ICAJLyogWGUz
cF9MUEcqLw0KPiANCj4gDQo+IC0tDQo+IDIuNTMuMA0KDQo=
